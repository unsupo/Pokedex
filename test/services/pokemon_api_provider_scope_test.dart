import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/games.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/scope_provider.dart';

import '../support/fakes.dart';
import '../support/isar_test_harness.dart';

/// Three Pokemon are listed. One game, version group 1, has a regional Pokedex
/// of Bulbasaur (1) and Pikachu (25). Charmander (4) is in no game.
class _GamesPokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 1, name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        Pokemon(id: 4, name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/4/'),
        Pokemon(id: 25, name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25/'),
      ];

  @override
  Future<List<int>> getVersionGroupIds() async => [1];

  @override
  Future<VersionGroup> getVersionGroup(int id) async => VersionGroup(
        id: id,
        name: 'red-blue',
        pokedexes: [NamedApiResource(url: 'https://pokeapi.co/api/v2/pokedex/2/')],
      );

  @override
  Future<Pokedex> getPokedex(int id) async => Pokedex(id: id, pokemonEntries: [
        PokemonEntry(
            pokemonSpecies: NamedApiResource(
                url: 'https://pokeapi.co/api/v2/pokemon-species/1/')),
        PokemonEntry(
            pokemonSpecies: NamedApiResource(
                url: 'https://pokeapi.co/api/v2/pokemon-species/25/')),
      ]);

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in this test');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;
  final game = const GameScope(1);
  final manual = const ManualNationalScope();
  final derived = const DerivedNationalScope();

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('pokemon_scope_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  late ProfileProvider profiles;
  late ScopeProvider scopes;
  late PokemonApiProvider provider;

  setUp(() async {
    profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    final name = 'scope-${DateTime.now().microsecondsSinceEpoch}';
    await profiles.createProfile(name);

    scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();
    await scopes.setScope(manual);

    final service = _GamesPokemonService();
    provider = PokemonApiProvider(
      service,
      localService,
      profiles,
      scopes,
      GameCatalog(service),
    );
    await provider.fetchData();
  });

  group('a scope keeps its own caught set', () {
    test('National and a game are independent for the same Pokemon', () async {
      await provider.setCaught(25, true); // National (manual)

      await scopes.setScope(game);
      await waitUntil(() => !provider.allPokemon[25]!.isCaught);
      await provider.setCaught(25, true); // the game

      await provider.setCaught(25, false); // un-catch in the game only
      await scopes.setScope(manual);
      await waitUntil(() => provider.allPokemon[25]!.isCaught);
    });
  });

  group('derived National', () {
    test('is caught when caught in any game or manually', () async {
      await provider.setCaught(4, true); // manual
      await scopes.setScope(game);
      await provider.setCaught(25, true); // game only

      await scopes.setScope(derived);

      // Wait for the whole derived view, not one flag: setCaught marks 25 at once,
      // before the derived reload has run.
      await waitUntil(() =>
          provider.allPokemon[25]!.isCaught && provider.allPokemon[4]!.isCaught);
      expect(provider.allPokemon[4]!.isCaught, isTrue);
      expect(provider.allPokemon[1]!.isCaught, isFalse);
    });

    test('refuses a direct toggle, so no record is written for it', () async {
      await scopes.setScope(derived);

      await provider.setCaught(1, true);

      expect(provider.allPokemon[1]!.isCaught, isFalse);
      final rows = await localService.getCaughtPokemonForProfile(profiles.activeProfileId);
      expect(rows.where((r) => r.pokemonId == 1), isEmpty);
    });
  });

  group('game scope membership', () {
    test('a game shows only Pokemon in its regional Pokedex', () async {
      await scopes.setScope(game);
      await waitUntil(() => provider.isVisibleInScope(25));

      expect(provider.isVisibleInScope(1), isTrue);
      expect(provider.isVisibleInScope(25), isTrue);
      expect(provider.isVisibleInScope(4), isFalse,
          reason: 'Charmander is in no game in this fixture');
    });

    test('National shows every Pokemon', () async {
      expect(provider.isVisibleInScope(4), isTrue);
    });
  });

  group('CSV export follows the scope choice', () {
    test('exporting the current scope writes only that scope', () async {
      await provider.setCaught(4, true); // National (manual)
      await scopes.setScope(game);
      await provider.setCaught(25, true); // game
      await scopes.setScope(manual);

      final transport = InMemoryCsvTransport();
      final result = await provider.exportCaughtPokemon(transport,
          currentScopeOnly: true);

      expect(result.exportedCount, 1);
      expect(transport.storedCsv, contains('national,4,true'));
      expect(transport.storedCsv, isNot(contains('vg:1')));
    });

    test('exporting all scopes writes everything caught in the profile', () async {
      await provider.setCaught(4, true);
      await scopes.setScope(game);
      await provider.setCaught(25, true);

      final transport = InMemoryCsvTransport();
      final result = await provider.exportCaughtPokemon(transport,
          currentScopeOnly: false);

      expect(result.exportedCount, 2);
    });

    test('derived National as the current scope exports everything', () async {
      await provider.setCaught(4, true);
      await scopes.setScope(game);
      await provider.setCaught(25, true);
      await scopes.setScope(derived);

      final result = await provider.exportCaughtPokemon(InMemoryCsvTransport(),
          currentScopeOnly: true);

      expect(result.exportedCount, 2,
          reason: 'derived National has no rows of its own, so it is the union');
    });
  });

  group('progress for the selector', () {
    test('counts caught and total for a scope', () async {
      await provider.setCaught(25, true);
      await provider.setCaught(4, true);
      await scopes.setScope(game);
      await waitUntil(() => provider.isVisibleInScope(25));

      expect(provider.caughtCountFor(manual), 2);
      expect(provider.totalCountFor(game), 2);
    });
  });
}
