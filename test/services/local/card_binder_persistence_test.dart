import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/binder_card_selection.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';

import '../../support/isar_test_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('isar_binder_test_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  Future<int> newProfile(String name) =>
      localService.saveProfile(Profile(name: name));

  group('TcgCard cache (LocalService)', () {
    test('save then get round-trips a cached card by id', () async {
      await localService.saveAllTcgCards([
        TcgCard(id: 'binder-cache-1', name: 'Pikachu V'),
      ]);

      final cards =
          await localService.getCachedTcgCardsByIds(['binder-cache-1']);

      expect(cards, hasLength(1));
      expect(cards.single.name, 'Pikachu V');
    });

    test(
        'AC13: saving the same card id twice upserts instead of duplicating '
        '(regression test, same shape as the CaughtTcgCard.isarId bug)',
        () async {
      await localService.saveAllTcgCards([
        TcgCard(id: 'binder-cache-dup', name: 'Old name'),
      ]);
      await localService.saveAllTcgCards([
        TcgCard(id: 'binder-cache-dup', name: 'New name'),
      ]);

      final cards =
          await localService.getCachedTcgCardsByIds(['binder-cache-dup']);

      expect(cards, hasLength(1));
      expect(cards.single.name, 'New name');
    });

    test('getCachedTcgCardsByIds only returns the requested ids', () async {
      await localService.saveAllTcgCards([
        TcgCard(id: 'binder-cache-a', name: 'A'),
        TcgCard(id: 'binder-cache-b', name: 'B'),
      ]);

      final cards =
          await localService.getCachedTcgCardsByIds(['binder-cache-a']);

      expect(cards.map((c) => c.id), ['binder-cache-a']);
    });

    test('an empty id list returns no cards', () async {
      expect(await localService.getCachedTcgCardsByIds([]), isEmpty);
    });
  });

  group('BinderCardSelection (LocalService)', () {
    test('save then get round-trips a profile\'s selection for a Pokemon',
        () async {
      final profile = await newProfile('binder-roundtrip');
      expect(await localService.getBinderSelection(profile, 25), isNull);

      await localService.saveBinderSelection(BinderCardSelection(
        profileId: profile,
        pokemonId: 25,
        selectedCardId: 'swsh1-1',
      ));

      final reloaded = await localService.getBinderSelection(profile, 25);
      expect(reloaded, isNotNull);
      expect(reloaded!.selectedCardId, 'swsh1-1');
    });

    test(
        'AC13: saving the same (profile, Pokemon) selection twice upserts '
        'instead of duplicating', () async {
      final profile = await newProfile('binder-upsert');
      await localService.saveBinderSelection(BinderCardSelection(
        profileId: profile,
        pokemonId: 25,
        selectedCardId: 'swsh1-1',
      ));
      await localService.saveBinderSelection(BinderCardSelection(
        profileId: profile,
        pokemonId: 25,
        selectedCardId: 'swsh1-2',
      ));

      final all = await localService.getBinderSelectionsForProfile(profile);
      expect(all.where((s) => s.pokemonId == 25), hasLength(1));
      expect((await localService.getBinderSelection(profile, 25))!.selectedCardId,
          'swsh1-2');
    });

    test('getBinderSelectionsForProfile returns every Pokemon selection for '
        'that profile at once', () async {
      final profile = await newProfile('binder-getall');
      await localService.saveBinderSelection(BinderCardSelection(
        profileId: profile,
        pokemonId: 1,
        selectedCardId: 'base1-1',
      ));
      await localService.saveBinderSelection(BinderCardSelection(
        profileId: profile,
        pokemonId: 4,
        selectedCardId: 'base1-4',
      ));

      final all = await localService.getBinderSelectionsForProfile(profile);

      expect(all.map((s) => s.pokemonId).toSet(), {1, 4});
    });

    test(
        'AC14: a selection saved for one profile is invisible to another '
        'profile', () async {
      final profileA = await newProfile('binder-iso-a');
      final profileB = await newProfile('binder-iso-b');
      await localService.saveBinderSelection(BinderCardSelection(
        profileId: profileA,
        pokemonId: 150,
        selectedCardId: 'base1-150',
      ));

      expect(await localService.getBinderSelection(profileB, 150), isNull);
      expect(
          (await localService.getBinderSelectionsForProfile(profileB))
              .where((s) => s.pokemonId == 150),
          isEmpty);
    });
  });
}
