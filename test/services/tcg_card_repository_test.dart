import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/tcg_card_repository.dart';
import 'package:pokedex_app/services/tcg_service.dart';

import '../support/isar_test_harness.dart';

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
  late TcgCardRepository repository;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('isar_tcg_repo_test_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
    repository = DefaultTcgCardRepository(_UnusedTcgService(), localService);
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  Future<int> newProfile(String name) =>
      localService.saveProfile(Profile(name: name));

  group('TcgCardRepository.cacheCards', () {
    test('write-through caches full card data for later lookup', () async {
      await repository.cacheCards([
        TcgCard(id: 'repo-cache-1', name: 'Charizard', nationalPokedexNumbers: [6]),
      ]);

      final cached =
          await localService.getCachedTcgCardsByIds(['repo-cache-1']);
      expect(cached.single.name, 'Charizard');
    });
  });

  group('TcgCardRepository.getCaughtCardsForProfile', () {
    test('joins this profile\'s caught cards with their cached display data',
        () async {
      final profile = await newProfile('repo-join');
      await repository.cacheCards([
        TcgCard(id: 'repo-join-1', name: 'Pikachu V', nationalPokedexNumbers: [25]),
        TcgCard(id: 'repo-join-2', name: 'Pikachu VMAX', nationalPokedexNumbers: [25]),
      ]);
      await repository.saveCaughtStatus(profile, 'repo-join-1', true);

      final caught = await repository.getCaughtCardsForProfile(profile);

      expect(caught.map((c) => c.id), ['repo-join-1']);
      expect(caught.single.name, 'Pikachu V');
      expect(caught.single.isCaught, isTrue);
    });

    test('a card marked uncaught is excluded even if its data is cached',
        () async {
      final profile = await newProfile('repo-join-uncaught');
      await repository.cacheCards([
        TcgCard(id: 'repo-join-3', name: 'Bulbasaur', nationalPokedexNumbers: [1]),
      ]);
      await repository.saveCaughtStatus(profile, 'repo-join-3', true);
      await repository.saveCaughtStatus(profile, 'repo-join-3', false);

      final caught = await repository.getCaughtCardsForProfile(profile);

      expect(caught, isEmpty);
    });

    test('a caught card id with no cached TcgCard data is simply omitted '
        '(the binder treats this id as still-owned via the raw caught set, '
        'not through this joined list)', () async {
      final profile = await newProfile('repo-join-nodata');
      await repository.saveCaughtStatus(profile, 'repo-join-missing', true);

      final caught = await repository.getCaughtCardsForProfile(profile);

      expect(caught, isEmpty);
    });

    test('AC14: only the given profile\'s caught cards are returned',
        () async {
      final profileA = await newProfile('repo-join-iso-a');
      final profileB = await newProfile('repo-join-iso-b');
      await repository.cacheCards([
        TcgCard(id: 'repo-join-iso', name: 'Squirtle', nationalPokedexNumbers: [7]),
      ]);
      await repository.saveCaughtStatus(profileA, 'repo-join-iso', true);

      expect(await repository.getCaughtCardsForProfile(profileB), isEmpty);
      expect(await repository.getCaughtCardsForProfile(profileA), isNotEmpty);
    });
  });
}
