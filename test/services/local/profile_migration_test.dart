import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/models/user_data.dart';
import 'package:pokedex_app/services/local/profile_migration.dart';

import '../../support/isar_test_harness.dart';

/// Runs the upgrade path against a real Isar file. Each test gets a fresh
/// database, seeded the way an app built before profiles would have left it:
/// legacy [UserData] rows keyed by dex id, and [CaughtTcgCard] rows with no
/// profile (profileId 0, the value an absent int field reads back as).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Isar isar;

  setUpAll(() async {
    await initIsarCoreForTest();
  });

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('profile_migration_');
    isar = await Isar.open(
      [ProfileSchema, UserDataSchema, CaughtPokemonSchema, CaughtTcgCardSchema],
      directory: tempDir.path,
      name: 'migration_${DateTime.now().microsecondsSinceEpoch}',
    );
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
    await tempDir.delete(recursive: true);
  });

  Future<void> seedLegacyPokemon(List<UserData> rows) async {
    await isar.writeTxn(() => isar.userDatas.putAll(rows));
  }

  Future<void> seedLegacyCards(List<CaughtTcgCard> rows) async {
    await isar.writeTxn(() => isar.caughtTcgCards.putAll(rows));
  }

  group('profile creation', () {
    test('a fresh database gets exactly one default profile', () async {
      await migrateCaughtDataToProfiles(isar);

      final profiles = await isar.profiles.where().findAll();
      expect(profiles.map((p) => p.name), ['Trainer 1']);
    });

    test('an existing profile is reused rather than a second one being added',
        () async {
      await isar.writeTxn(() => isar.profiles.put(Profile(name: 'Ash')));

      await migrateCaughtDataToProfiles(isar);

      final profiles = await isar.profiles.where().findAll();
      expect(profiles.map((p) => p.name), ['Ash']);
    });
  });

  group('legacy caught Pokemon', () {
    test('every legacy row is kept, attributed to the default profile and the '
        'national scope', () async {
      await seedLegacyPokemon([
        UserData(id: 25, isCaught: true),
        UserData(id: 4, isCaught: false),
        UserData(id: 150, isCaught: true),
      ]);

      await migrateCaughtDataToProfiles(isar);

      final profile = (await isar.profiles.where().findAll()).single;
      final rows = await isar.caughtPokemons.where().findAll();
      expect(rows, hasLength(3));
      expect(rows.every((r) => r.profileId == profile.id), isTrue);
      expect(rows.every((r) => r.scopeKey == nationalScopeKey), isTrue);
      expect(
        {for (final r in rows) r.pokemonId: r.isCaught},
        {25: true, 4: false, 150: true},
      );
    });

    test('caught count is unchanged by the upgrade', () async {
      await seedLegacyPokemon([
        UserData(id: 1, isCaught: true),
        UserData(id: 2, isCaught: true),
        UserData(id: 3, isCaught: false),
      ]);

      await migrateCaughtDataToProfiles(isar);

      final caught = await isar.caughtPokemons.filter().isCaughtEqualTo(true).count();
      expect(caught, 2);
    });

    test('legacy rows are removed once they have been copied, so they cannot be '
        'counted twice', () async {
      await seedLegacyPokemon([UserData(id: 25, isCaught: true)]);

      await migrateCaughtDataToProfiles(isar);

      expect(await isar.userDatas.count(), 0);
    });
  });

  group('legacy caught TCG cards', () {
    test('cards written before profileId existed are attributed to the default profile, '
        'even though Isar reads the missing column as Isar.minId', () async {
      // Verified against a real legacy file: a column the row never had reads
      // back as Isar.minId, not 0.
      await seedLegacyCards([
        CaughtTcgCard(profileId: Isar.minId, cardId: 'swsh1-2', isCaught: true),
      ]);

      await migrateCaughtDataToProfiles(isar);

      final profile = (await isar.profiles.where().findAll()).single;
      final card = await isar.caughtTcgCards.filter().cardIdEqualTo('swsh1-2').findFirst();
      expect(card!.profileId, profile.id);
    });

    test('cards with no profile are attributed to the default profile', () async {
      await seedLegacyCards([
        CaughtTcgCard(profileId: 0, cardId: 'swsh1-1', isCaught: true),
      ]);

      await migrateCaughtDataToProfiles(isar);

      final profile = (await isar.profiles.where().findAll()).single;
      final card = await isar.caughtTcgCards.filter().cardIdEqualTo('swsh1-1').findFirst();
      expect(card!.profileId, profile.id);
      expect(card.isCaught, isTrue);
    });
  });

  group('reporting', () {
    test('returns how many legacy Pokemon rows it moved', () async {
      await seedLegacyPokemon([
        UserData(id: 25, isCaught: true),
        UserData(id: 4, isCaught: false),
      ]);

      expect(await migrateCaughtDataToProfiles(isar), 2);
    });

    test('returns zero on a fresh install', () async {
      expect(await migrateCaughtDataToProfiles(isar), 0);
    });

    test('returns zero when run a second time', () async {
      await seedLegacyPokemon([UserData(id: 25, isCaught: true)]);
      await migrateCaughtDataToProfiles(isar);

      expect(await migrateCaughtDataToProfiles(isar), 0);
    });
  });

  group('idempotence', () {
    test('running the migration twice changes nothing the second time', () async {
      await seedLegacyPokemon([UserData(id: 25, isCaught: true)]);
      await seedLegacyCards([
        CaughtTcgCard(profileId: 0, cardId: 'base1-4', isCaught: true),
      ]);

      await migrateCaughtDataToProfiles(isar);
      await migrateCaughtDataToProfiles(isar);

      expect(await isar.profiles.count(), 1);
      expect(await isar.caughtPokemons.count(), 1);
      expect(await isar.caughtTcgCards.count(), 1);
    });
  });
}
