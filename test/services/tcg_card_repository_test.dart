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

/// Serves [cardsById] from [getCard]; any id in [failingIds] throws instead,
/// simulating a bad/retired card id without aborting the rest of a backfill.
/// Tracks every id it was asked for, so a test can assert fetches actually
/// happened (or didn't, when nothing should need fetching).
class _FakeGetCardService implements TcgService {
  final Map<String, TcgCard> cardsById;
  final Set<String> failingIds;
  final List<String> requestedIds = [];

  _FakeGetCardService(this.cardsById, {this.failingIds = const {}});

  @override
  Future<TcgCard?> getCard(String cardId) async {
    requestedIds.add(cardId);
    if (failingIds.contains(cardId)) {
      throw Exception('simulated fetch failure for $cardId');
    }
    return cardsById[cardId];
  }

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) =>
      throw UnimplementedError('not exercised in these tests');
}

/// Serves [cardsByPokemonId] from [getCardsByNationalDexId]; [getCard] is
/// unused by these tests.
class _FakeListTcgService implements TcgService {
  final Map<int, List<TcgCard>> cardsByPokemonId;

  _FakeListTcgService(this.cardsByPokemonId);

  @override
  Future<TcgCard?> getCard(String cardId) =>
      throw UnimplementedError('not exercised in these tests');

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async =>
      cardsByPokemonId[nationalDexId] ?? [];
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
        TcgCard(
            id: 'repo-cache-1', name: 'Charizard', nationalPokedexNumbers: [6]),
      ]);

      final cached =
          await localService.getCachedTcgCardsByIds(['repo-cache-1']);
      expect(cached.single.name, 'Charizard');
    });
  });

  group('TcgCardRepository.getCardsByNationalDexId', () {
    test(
        'always fetches the full list from the network, even when this '
        "Pokemon already has *some* cards cached via an unrelated path - "
        'see "Seventeenth round" in docs/features/card-binder.md', () async {
      // Simulates a card that arrived in the cache via a *different* path
      // than this method - e.g. the binder's backfillUncachedCaughtCards,
      // fetching one caught card by id - not via this Pokemon's full list
      // ever actually being fetched.
      await repository.cacheCards([
        TcgCard(
            id: 'charizard-one-owned',
            name: 'Charizard (owned)',
            nationalPokedexNumbers: const [6]),
      ]);

      final fullList = [
        TcgCard(
            id: 'charizard-one-owned',
            name: 'Charizard (owned)',
            nationalPokedexNumbers: const [6]),
        TcgCard(
            id: 'charizard-other',
            name: 'Charizard (other printing)',
            nationalPokedexNumbers: const [6]),
      ];
      final repo = DefaultTcgCardRepository(
          _FakeListTcgService({6: fullList}), localService);

      final result = await repo.getCardsByNationalDexId(6);

      // A cache-first short-circuit here would have returned just the one
      // card already sitting in the cache from the unrelated path above -
      // reported live: "i opened charizard tcg details and it only shows
      // the card i selected it should show both there."
      expect(result.map((c) => c.id), containsAll(fullList.map((c) => c.id)));
      expect(result, hasLength(2));
    });
  });

  group('TcgCardRepository.getCaughtCardsForProfile', () {
    test('joins this profile\'s caught cards with their cached display data',
        () async {
      final profile = await newProfile('repo-join');
      await repository.cacheCards([
        TcgCard(
            id: 'repo-join-1', name: 'Pikachu V', nationalPokedexNumbers: [25]),
        TcgCard(
            id: 'repo-join-2',
            name: 'Pikachu VMAX',
            nationalPokedexNumbers: [25]),
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
        TcgCard(
            id: 'repo-join-3', name: 'Bulbasaur', nationalPokedexNumbers: [1]),
      ]);
      await repository.saveCaughtStatus(profile, 'repo-join-3', true);
      await repository.saveCaughtStatus(profile, 'repo-join-3', false);

      final caught = await repository.getCaughtCardsForProfile(profile);

      expect(caught, isEmpty);
    });

    test(
        'a caught card id with no cached TcgCard data is simply omitted '
        '(the binder treats this id as still-owned via the raw caught set, '
        'not through this joined list)', () async {
      final profile = await newProfile('repo-join-nodata');
      await repository.saveCaughtStatus(profile, 'repo-join-missing', true);

      final caught = await repository.getCaughtCardsForProfile(profile);

      expect(caught, isEmpty);
    });

    test('AC14: only the given profile\'s caught cards are returned', () async {
      final profileA = await newProfile('repo-join-iso-a');
      final profileB = await newProfile('repo-join-iso-b');
      await repository.cacheCards([
        TcgCard(
            id: 'repo-join-iso', name: 'Squirtle', nationalPokedexNumbers: [7]),
      ]);
      await repository.saveCaughtStatus(profileA, 'repo-join-iso', true);

      expect(await repository.getCaughtCardsForProfile(profileB), isEmpty);
      expect(await repository.getCaughtCardsForProfile(profileA), isNotEmpty);
    });
  });

  group('TcgCardRepository.backfillUncachedCaughtCards', () {
    // Each test builds its own repository (a fresh _FakeGetCardService, same
    // shared Isar localService) rather than reusing the suite-wide
    // `repository` above, which is deliberately wired to a service that
    // throws on getCard - these tests need one that can actually serve it.

    test(
        'AC28: fetches and caches display data for a caught card with none yet',
        () async {
      final profile = await newProfile('backfill-basic');
      final service = _FakeGetCardService({
        'backfill-1': TcgCard(
            id: 'backfill-1', name: 'Mewtwo', nationalPokedexNumbers: [150]),
      });
      final repo = DefaultTcgCardRepository(service, localService);
      await repo.saveCaughtStatus(profile, 'backfill-1', true);
      // Not cached yet - getCaughtCardsForProfile would omit it entirely.
      expect(await repo.getCaughtCardsForProfile(profile), isEmpty);

      await repo.backfillUncachedCaughtCards(profile);

      final caught = await repo.getCaughtCardsForProfile(profile);
      expect(caught.single.id, 'backfill-1');
      expect(caught.single.name, 'Mewtwo');
      expect(caught.single.isCaught, isTrue);
    });

    test(
        'AC29: one card failing to fetch does not prevent the rest of the '
        'backfill from completing', () async {
      final profile = await newProfile('backfill-partial-failure');
      final service = _FakeGetCardService(
        {
          'backfill-ok': TcgCard(
              id: 'backfill-ok', name: 'Mew', nationalPokedexNumbers: [151]),
        },
        failingIds: {'backfill-bad'},
      );
      final repo = DefaultTcgCardRepository(service, localService);
      await repo.saveCaughtStatus(profile, 'backfill-ok', true);
      await repo.saveCaughtStatus(profile, 'backfill-bad', true);

      await repo.backfillUncachedCaughtCards(profile);

      final caught = await repo.getCaughtCardsForProfile(profile);
      expect(caught.map((c) => c.id), ['backfill-ok']);
    });

    test(
        'AC30: does nothing when every caught card is already cached - no '
        'getCard calls at all', () async {
      final profile = await newProfile('backfill-nothing-missing');
      final service = _FakeGetCardService({});
      final repo = DefaultTcgCardRepository(service, localService);
      await repo.cacheCards([
        TcgCard(
            id: 'backfill-cached',
            name: 'Lugia',
            nationalPokedexNumbers: [249]),
      ]);
      await repo.saveCaughtStatus(profile, 'backfill-cached', true);

      await repo.backfillUncachedCaughtCards(profile);

      expect(service.requestedIds, isEmpty);
    });

    test('does nothing for a profile with nothing caught at all', () async {
      final profile = await newProfile('backfill-nothing-caught');
      final service = _FakeGetCardService({});
      final repo = DefaultTcgCardRepository(service, localService);

      await repo.backfillUncachedCaughtCards(profile);

      expect(service.requestedIds, isEmpty);
    });
  });

  group('TcgCardRepository.clearCache', () {
    test(
        'forces a stale cached card to be re-fetched on the next backfill, '
        'without losing which cards are actually caught - see "Fifteenth '
        'round" in docs/features/card-binder.md', () async {
      final profile = await newProfile('clear-cache-stale');
      final staleService = _FakeGetCardService({});
      final staleRepo = DefaultTcgCardRepository(staleService, localService);
      // Simulates a card cached under an old, buggy parse (e.g. the
      // TCGPlayer price-shape bug) - present in the cache, but with wrong
      // data (here, simplified to just a different name).
      await staleRepo.cacheCards([
        TcgCard(id: 'clear-cache-1', name: 'STALE', nationalPokedexNumbers: [1])
      ]);
      await staleRepo.saveCaughtStatus(profile, 'clear-cache-1', true);
      // Confirms the backfill does NOT touch an already-cached id - this
      // is the actual staleness bug this feature works around, not
      // something clearCache itself needs to fix.
      await staleRepo.backfillUncachedCaughtCards(profile);
      expect(staleService.requestedIds, isEmpty);
      expect((await staleRepo.getCaughtCardsForProfile(profile)).single.name,
          'STALE');

      await staleRepo.clearCache();

      // Now missing from the cache entirely, so the backfill re-fetches it
      // - this time from a service standing in for the *fixed* parsing.
      final freshService = _FakeGetCardService({
        'clear-cache-1': TcgCard(
            id: 'clear-cache-1', name: 'FRESH', nationalPokedexNumbers: [1]),
      });
      final freshRepo = DefaultTcgCardRepository(freshService, localService);
      await freshRepo.backfillUncachedCaughtCards(profile);

      final caught = await freshRepo.getCaughtCardsForProfile(profile);
      expect(caught.single.name, 'FRESH');
      // The caught *status* itself survived the cache clear untouched.
      expect(caught.single.isCaught, isTrue);
    });
  });
}
