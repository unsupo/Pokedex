import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/tcg_service.dart';

import '../../support/fakes.dart';
import '../../support/isar_test_harness.dart';

/// TcgService's HTTP calls are never exercised here. Serves a fixed card list
/// for any dex id, so a test can get cards into the provider's cache.
class _StubTcgService implements TcgService {
  _StubTcgService([this.cards = const []]);

  final List<TcgCard> cards;

  @override
  Future<TcgCard?> getCard(String cardId) =>
      throw UnimplementedError('not exercised in these tests');

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async => cards;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('isar_tcg_test_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  Future<int> newProfile(String name) =>
      localService.saveProfile(Profile(name: name));

  group('CaughtTcgCard persistence (LocalService)', () {
    test('save then get round-trips caught status for a card in a profile',
        () async {
      final profile = await newProfile('tcg-roundtrip');
      expect(await localService.getCaughtTcgCard(profile, 'swsh1-1'), isNull);

      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: profile, cardId: 'swsh1-1', isCaught: true),
      );

      final reloaded = await localService.getCaughtTcgCard(profile, 'swsh1-1');
      expect(reloaded, isNotNull);
      expect(reloaded!.isCaught, isTrue);
    });

    test('saving the same card in the same profile again upserts', () async {
      final profile = await newProfile('tcg-upsert');
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: profile, cardId: 'base1-4', isCaught: true),
      );
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: profile, cardId: 'base1-4', isCaught: false),
      );

      final all = await localService.getCaughtTcgCardsForProfile(profile);
      expect(all.where((c) => c.cardId == 'base1-4'), hasLength(1));
      expect((await localService.getCaughtTcgCard(profile, 'base1-4'))!.isCaught,
          isFalse);
    });

    test('a card id that looks like a Pokemon dex id does not touch Pokemon data',
        () async {
      // Card ids live in their own collection, keyed by string, so a card id
      // of "25" cannot collide with Pikachu's caught-Pokemon record.
      final profile = await newProfile('tcg-dexid-collision');
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: profile, cardId: '25', isCaught: true),
      );

      expect(await localService.getCaughtPokemonForProfile(profile), isEmpty);
      expect((await localService.getCaughtTcgCard(profile, '25'))!.isCaught,
          isTrue);
    });
  });

  group('TcgApiProvider CSV export/import for cards', () {
    late ProfileProvider profiles;
    late int ash;
    late int misty;

    setUp(() async {
      final stamp = DateTime.now().microsecondsSinceEpoch;
      profiles = ProfileProvider(
        LocalServiceProfileRepository(localService),
        InMemoryActiveProfileStore(),
      );
      await profiles.load();
      ash = (await profiles.createProfile('tcgcsv-ash-$stamp')).id;
      misty = (await profiles.createProfile('tcgcsv-misty-$stamp')).id;
      await profiles.setActive(ash);
    });

    test('export writes only the active profile\'s caught cards', () async {
      final provider = TcgApiProvider(_StubTcgService(), localService, profiles);
      final ashCard = TcgCard(id: 'csv-export-1', name: 'Pikachu V');
      await provider.setCaught(ashCard);

      await profiles.setActive(misty);
      final mistyCard = TcgCard(id: 'csv-export-2', name: 'Charizard');
      await provider.setCaught(mistyCard);
      await profiles.setActive(ash);

      final transport = InMemoryCsvTransport();
      final result = await provider.exportCaughtCards(transport);

      expect(result.exportedCount, 1);
      expect(transport.storedCsv, contains('csv-export-1,true'));
      expect(transport.storedCsv, isNot(contains('csv-export-2')));
    });

    test('import affects only the active profile', () async {
      final provider = TcgApiProvider(_StubTcgService(), localService, profiles);
      final ashCard = TcgCard(id: 'csv-import-1', name: 'Pikachu V');
      await provider.setCaught(ashCard);
      final transport = InMemoryCsvTransport();
      await provider.exportCaughtCards(transport);

      await profiles.setActive(misty);
      await provider.importCaughtCards(transport);

      final mistyReloaded = TcgCard(id: 'csv-import-1', name: 'Pikachu V');
      await provider.loadCaughtStatus([mistyReloaded]);
      expect(mistyReloaded.isCaught, isTrue);

      await profiles.setActive(ash);
      expect(ashCard.isCaught, isTrue,
          reason: 'Ash\'s own caught card is untouched by the import into Misty');
    });

    test('a cancelled export changes nothing', () async {
      final provider = TcgApiProvider(_StubTcgService(), localService, profiles);
      final transport = InMemoryCsvTransport()..cancelSave = true;

      final result = await provider.exportCaughtCards(transport);

      expect(result.saved, isFalse);
    });
  });

  group('TcgApiProvider per profile', () {
    late ProfileProvider profiles;
    late int ash;
    late int misty;

    setUp(() async {
      final stamp = DateTime.now().microsecondsSinceEpoch;
      profiles = ProfileProvider(
        LocalServiceProfileRepository(localService),
        InMemoryActiveProfileStore(),
      );
      await profiles.load();
      ash = (await profiles.createProfile('tcgp-ash-$stamp')).id;
      misty = (await profiles.createProfile('tcgp-misty-$stamp')).id;
      await profiles.setActive(ash);
    });

    test('caught status survives a fresh provider (an app restart)', () async {
      final provider = TcgApiProvider(_StubTcgService(), localService, profiles);
      final card = TcgCard(id: 'swsh1-1', name: 'Pikachu V');

      await provider.setCaught(card);
      expect(card.isCaught, isTrue);

      final reloadedCard = TcgCard(id: 'swsh1-1', name: 'Pikachu V');
      final freshProvider =
          TcgApiProvider(_StubTcgService(), localService, profiles);
      await freshProvider.loadCaughtStatus([reloadedCard]);

      expect(reloadedCard.isCaught, isTrue);
    });

    test('a card caught in one profile is uncaught in another', () async {
      final provider = TcgApiProvider(_StubTcgService(), localService, profiles);
      final card = TcgCard(id: 'profile-iso-1', name: 'Pikachu V');
      await provider.setCaught(card);

      await profiles.setActive(misty);
      final mistyCard = TcgCard(id: 'profile-iso-1', name: 'Pikachu V');
      await provider.loadCaughtStatus([mistyCard]);

      expect(mistyCard.isCaught, isFalse);
    });

    test('switching profile updates the caught state of cards already loaded',
        () async {
      final card = TcgCard(id: 'profile-switch-1', name: 'Pikachu V');
      final provider = TcgApiProvider(
          _StubTcgService([card]), localService, profiles);
      final loaded = (await provider.getPokemonCards(25))!.single;
      await provider.setCaught(loaded);
      expect(loaded.isCaught, isTrue);

      await profiles.setActive(misty);

      await waitUntil(() => !loaded.isCaught);
      expect(loaded.isCaught, isFalse);
    });

    test('resetting the active profile clears its loaded cards\' caught status',
        () async {
      final card = TcgCard(id: 'profile-reset-1', name: 'Pikachu V');
      final provider = TcgApiProvider(
          _StubTcgService([card]), localService, profiles);
      final loaded = (await provider.getPokemonCards(4))!.single;
      await provider.setCaught(loaded);
      expect(loaded.isCaught, isTrue);

      await profiles.resetProfile(ash);

      await waitUntil(() => !loaded.isCaught);
    });
  });
}
