import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';

import '../../support/isar_test_harness.dart';

/// The upgrade test. `test/fixtures/legacy_v1/default.isar` was written by the
/// last committed app (before profiles) with 3 caught-Pokemon rows and 2 TCG
/// card rows. This opens a copy of it with the new code and checks that every
/// record survives, attributed to the default profile.
///
/// Regenerate the fixture from the pre-profile commit (see
/// docs/epics/profiles-and-per-game-tracking/04-migration.md) if the legacy
/// schema ever changes.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('legacy_upgrade_');
    await File('test/fixtures/legacy_v1/default.isar')
        .copy('${tempDir.path}/default.isar');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  test('the upgrade creates one profile and keeps every legacy caught Pokemon',
      () async {
    final profiles = await localService.getAllProfiles();
    expect(profiles.map((p) => p.name), ['Trainer 1']);

    final rows =
        await localService.getCaughtPokemonForProfile(profiles.single.id);
    expect(
      {for (final r in rows) r.pokemonId: r.isCaught},
      {25: true, 4: false, 150: true},
    );
    expect(rows.every((r) => r.scopeKey == 'national'), isTrue);
  });

  test('the upgrade keeps every legacy TCG card, attributed to the default profile',
      () async {
    final profile = (await localService.getAllProfiles()).single;

    final cards = await localService.getCaughtTcgCardsForProfile(profile.id);
    expect(
      {for (final c in cards) c.cardId: c.isCaught},
      {'swsh1-1': true, 'base1-4': false},
    );
  });
}
