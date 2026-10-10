import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';

import '../../support/isar_test_harness.dart';

/// Exercises the real IsarService. One database is opened for the whole file
/// (Isar can't reopen the same name while it is open, and IsarService exposes
/// no close()). Each test uses its own profiles, so state doesn't leak.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('profile_isolation_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  Future<int> newProfile(String name) =>
      localService.saveProfile(Profile(name: name));

  group('a fresh install', () {
    test('creates one default profile', () async {
      final profiles = await localService.getAllProfiles();

      expect(profiles.where((p) => p.name == 'Trainer 1'), hasLength(1));
    });
  });

  group('caught Pokemon are scoped to a profile', () {
    test('a Pokemon caught in one profile is not caught in another', () async {
      final ash = await newProfile('iso-ash-pokemon');
      final misty = await newProfile('iso-misty-pokemon');

      await localService.saveAllCaughtPokemon([
        CaughtPokemon(profileId: ash, pokemonId: 25, isCaught: true),
      ]);

      expect(await localService.getCaughtPokemonForProfile(ash), hasLength(1));
      expect(await localService.getCaughtPokemonForProfile(misty), isEmpty);
    });

    test('saving the same profile, scope and Pokemon again upserts one row',
        () async {
      final profile = await newProfile('iso-upsert');

      await localService.saveAllCaughtPokemon([
        CaughtPokemon(profileId: profile, pokemonId: 4, isCaught: true),
      ]);
      await localService.saveAllCaughtPokemon([
        CaughtPokemon(profileId: profile, pokemonId: 4, isCaught: false),
      ]);

      final rows = await localService.getCaughtPokemonForProfile(profile);
      expect(rows, hasLength(1));
      expect(rows.single.isCaught, isFalse);
    });

    test('the same Pokemon in two profiles holds two independent rows',
        () async {
      final a = await newProfile('iso-both-a');
      final b = await newProfile('iso-both-b');

      await localService.saveAllCaughtPokemon([
        CaughtPokemon(profileId: a, pokemonId: 1, isCaught: true),
        CaughtPokemon(profileId: b, pokemonId: 1, isCaught: false),
      ]);

      expect(
          (await localService.getCaughtPokemonForProfile(a)).single.isCaught,
          isTrue);
      expect(
          (await localService.getCaughtPokemonForProfile(b)).single.isCaught,
          isFalse);
    });
  });

  group('caught TCG cards are scoped to a profile', () {
    test('a card caught in one profile is not caught in another', () async {
      final ash = await newProfile('iso-card-ash');
      final misty = await newProfile('iso-card-misty');

      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: ash, cardId: 'swsh1-1', isCaught: true),
      );

      expect((await localService.getCaughtTcgCard(ash, 'swsh1-1'))!.isCaught,
          isTrue);
      expect(await localService.getCaughtTcgCard(misty, 'swsh1-1'), isNull);
    });

    test('the same card id in two profiles holds two rows', () async {
      final a = await newProfile('iso-cardtwo-a');
      final b = await newProfile('iso-cardtwo-b');

      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: a, cardId: 'base1-4', isCaught: true),
      );
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: b, cardId: 'base1-4', isCaught: false),
      );

      expect(await localService.getCaughtTcgCardsForProfile(a), hasLength(1));
      expect(await localService.getCaughtTcgCardsForProfile(b), hasLength(1));
    });
  });

  group('saveAllCaughtTcgCards batches an import the same way the single-row save does', () {
    test('upserts several cards for a profile in one call', () async {
      final profile = await newProfile('iso-batch-cards');

      await localService.saveAllCaughtTcgCards([
        CaughtTcgCard(profileId: profile, cardId: 'swsh1-1', isCaught: true),
        CaughtTcgCard(profileId: profile, cardId: 'base1-4', isCaught: false),
      ]);

      final rows = await localService.getCaughtTcgCardsForProfile(profile);
      expect(rows, hasLength(2));
    });

    test('saving the same card again in a batch upserts instead of duplicating',
        () async {
      final profile = await newProfile('iso-batch-upsert');

      await localService.saveAllCaughtTcgCards([
        CaughtTcgCard(profileId: profile, cardId: 'swsh1-1', isCaught: true),
      ]);
      await localService.saveAllCaughtTcgCards([
        CaughtTcgCard(profileId: profile, cardId: 'swsh1-1', isCaught: false),
      ]);

      final rows = await localService.getCaughtTcgCardsForProfile(profile);
      expect(rows, hasLength(1));
      expect(rows.single.isCaught, isFalse);
    });
  });

  group('resetCaughtDataForProfile', () {
    test('clears the given profile\'s Pokemon and cards and nothing else',
        () async {
      final doomed = await newProfile('iso-reset-doomed');
      final kept = await newProfile('iso-reset-kept');

      await localService.saveAllCaughtPokemon([
        CaughtPokemon(profileId: doomed, pokemonId: 7, isCaught: true),
        CaughtPokemon(profileId: kept, pokemonId: 7, isCaught: true),
      ]);
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: doomed, cardId: 'reset-1', isCaught: true),
      );
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(profileId: kept, cardId: 'reset-1', isCaught: true),
      );

      await localService.resetCaughtDataForProfile(doomed);

      expect(await localService.getCaughtPokemonForProfile(doomed), isEmpty);
      expect(await localService.getCaughtTcgCardsForProfile(doomed), isEmpty);
      expect(await localService.getCaughtPokemonForProfile(kept), hasLength(1));
      expect(await localService.getCaughtTcgCardsForProfile(kept), hasLength(1));
    });
  });
}
