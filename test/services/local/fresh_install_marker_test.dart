import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';

import '../../support/isar_test_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initIsarCoreForTest();
  });

  test('a fresh install never triggers the upgrade notice', () async {
    final dir = await Directory.systemTemp.createTemp('fresh_marker_');
    PathProviderPlatform.instance = FakePathProviderPlatform(dir.path);

    var calls = 0;
    await IsarService.create(onLegacyCaughtData: () async => calls++);

    expect(calls, 0);
    await dir.delete(recursive: true);
  });
}
