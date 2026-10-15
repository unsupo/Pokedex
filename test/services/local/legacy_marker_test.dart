import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';

import '../../support/isar_test_harness.dart';

/// The upgrade notice is marked before the migration clears the legacy rows.
/// If the app dies in between, the notice is still pending on the next launch.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initIsarCoreForTest();
  });

  test('a database with legacy caught Pokemon triggers the callback before the migration',
      () async {
    final dir = await Directory.systemTemp.createTemp('legacy_marker_');
    await File('test/fixtures/legacy_v1/default.isar')
        .copy('${dir.path}/default.isar');
    PathProviderPlatform.instance = FakePathProviderPlatform(dir.path);

    var calls = 0;
    await IsarService.create(onLegacyCaughtData: () async => calls++);

    expect(calls, 1);
    await dir.delete(recursive: true);
  });
}
