import 'dart:ffi';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/tcg_service.dart';

/// `flutter test` runs as a plain Dart VM process with no bundled native
/// libraries, so Isar's usual lookup (next to the app binary) fails. The
/// exact libisar.dylib for the pinned isar_community_flutter_libs version
/// already sits in the pub cache (it's what actually ships to devices) --
/// point Isar at it directly instead of hitting the network to download one.
Future<void> _initIsarCoreForTest() async {
  final pubCacheDir = Platform.environment['PUB_CACHE'] ??
      p.join(Platform.environment['HOME']!, '.pub-cache');
  final libDir = Directory(
    p.join(pubCacheDir, 'hosted', 'pub.dev'),
  );
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

/// Redirects path_provider's getApplicationDocumentsDirectory() to a fresh
/// temp directory, so IsarService.init() can open a real (short-lived) Isar
/// instance during tests without touching a real device path.
class _FakePathProviderPlatform extends PathProviderPlatform {
  _FakePathProviderPlatform(this.path);

  final String path;

  @override
  Future<String?> getApplicationDocumentsPath() async => path;
}

/// TcgService's HTTP calls are never exercised in these tests, but
/// TcgApiProvider requires one to construct. TcgService being a pluggable
/// interface (rather than a concrete class making real HTTP calls) is what
/// makes this a trivial no-op instead of a subclass carrying real network
/// plumbing it never uses.
class _UnusedTcgService implements TcgService {
  @override
  Future<TcgCard?> getCard(String cardId) =>
      throw UnimplementedError('not exercised in these tests');

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) =>
      throw UnimplementedError('not exercised in these tests');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  // A single Isar instance is opened once for the whole file (rather than
  // per-test) because Isar refuses to re-open a second instance under the
  // same name while one is still open, and this LocalService/IsarService
  // pairing exposes no close()/dispose(). Each test below uses its own
  // card id, so sharing the instance doesn't leak state between them.
  setUpAll(() async {
    await _initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('isar_tcg_test_');
    PathProviderPlatform.instance = _FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  group('CaughtTcgCard persistence (LocalService)', () {
    test('save then get round-trips caught status for a TCG card id', () async {
      expect(await localService.getCaughtTcgCard('swsh1-1'), isNull);

      await localService.saveCaughtTcgCard(
        CaughtTcgCard(cardId: 'swsh1-1', isCaught: true),
      );

      final reloaded = await localService.getCaughtTcgCard('swsh1-1');
      expect(reloaded, isNotNull);
      expect(reloaded!.isCaught, isTrue);
    });

    test('saving the same cardId again upserts instead of duplicating',
        () async {
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(cardId: 'base1-4', isCaught: true),
      );
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(cardId: 'base1-4', isCaught: false),
      );

      final all = await localService.getAllCaughtTcgCards();
      expect(all.where((c) => c.cardId == 'base1-4').length, 1);
      expect((await localService.getCaughtTcgCard('base1-4'))!.isCaught,
          isFalse);
    });

    test(
        'caught status for a TCG card whose id string looks like a Pokemon '
        'dex id does not corrupt unrelated dex ids (kept in a separate '
        'collection from UserData)', () async {
      // A card id that happens to render as "25" would, under the old
      // (buggy) design, have been stored as UserData(id: 25, ...) --
      // colliding with Pikachu's caught-Pokemon record. Proving this saves
      // under its own collection, keyed by the string, is the regression
      // check for that landmine.
      await localService.saveCaughtTcgCard(
        CaughtTcgCard(cardId: '25', isCaught: true),
      );

      final pokemonUserData = await localService.getAllUserData();
      expect(pokemonUserData, isEmpty);

      final caughtTcgCard = await localService.getCaughtTcgCard('25');
      expect(caughtTcgCard!.isCaught, isTrue);
    });
  });

  group('TcgApiProvider.setCaught', () {
    test('persists caught status so it survives a reload of the card list',
        () async {
      final provider = TcgApiProvider(_UnusedTcgService(), localService);
      final card = TcgCard(id: 'swsh1-1', name: 'Pikachu V');
      expect(card.userData?.isCaught ?? false, isFalse);

      await provider.setCaught(card);
      expect(card.userData?.isCaught, isTrue);

      // Simulate a fresh app session: a brand-new TcgCard instance for the
      // same card id, as would come back from a fresh API fetch after
      // restart, should have its caught status loaded from disk.
      final reloadedCard = TcgCard(id: 'swsh1-1', name: 'Pikachu V');
      final freshProvider =
          TcgApiProvider(_UnusedTcgService(), localService);
      await freshProvider.loadCaughtStatus([reloadedCard]);

      expect(reloadedCard.userData?.isCaught, isTrue);
    });
  });
}
