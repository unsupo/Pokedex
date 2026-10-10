import 'dart:ffi';
import 'dart:io';

import 'package:isar_community/isar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// `flutter test` runs as a plain Dart VM process with no bundled native
/// libraries, so Isar's usual lookup (next to the app binary) fails. The
/// exact libisar for the pinned isar_community_flutter_libs version already
/// sits in the pub cache (it's what actually ships to devices) -- point Isar
/// at it directly instead of downloading one.
Future<void> initIsarCoreForTest() async {
  final pubCacheDir = Platform.environment['PUB_CACHE'] ??
      p.join(Platform.environment['HOME']!, '.pub-cache');
  final libDir = Directory(p.join(pubCacheDir, 'hosted', 'pub.dev'));
  final flutterLibsDir = libDir.listSync().whereType<Directory>().firstWhere(
      (d) => p.basename(d.path).startsWith('isar_community_flutter_libs-'));

  final String platformDir;
  final String libraryName;
  if (Platform.isMacOS) {
    platformDir = 'macos';
    libraryName = 'libisar.dylib';
  } else if (Platform.isLinux) {
    platformDir = 'linux';
    libraryName = 'libisar.so';
  } else if (Platform.isWindows) {
    platformDir = 'windows';
    libraryName = 'isar.dll';
  } else {
    throw UnsupportedError(
        'No bundled Isar core library known for ${Platform.operatingSystem}');
  }

  final libraryPath = p.join(flutterLibsDir.path, platformDir, libraryName);
  await Isar.initializeIsarCore(libraries: {Abi.current(): libraryPath});
}

/// Redirects path_provider's getApplicationDocumentsDirectory() to [path], so
/// IsarService.init() opens its database in a temp directory during tests.
class FakePathProviderPlatform extends PathProviderPlatform {
  FakePathProviderPlatform(this.path);

  final String path;

  @override
  Future<String?> getApplicationDocumentsPath() async => path;

  /// cached_network_image's cache manager asks for these as soon as an image
  /// widget is built, so the fake must answer them too.
  @override
  Future<String?> getTemporaryPath() async => path;

  @override
  Future<String?> getApplicationSupportPath() async => path;
}
