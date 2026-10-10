import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_species.dart';
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

Species _species(int id) => Species(
      name: 'species-$id',
      url: 'https://pokeapi.co/api/v2/pokemon-species/$id/',
    );

PokemonDetails _fixtureDetails({
  required int id,
  required String type,
  required String ability,
  required String move,
}) =>
    PokemonDetails(
      id: id,
      isDefault: true,
      types: [PokemonType(slot: 1, type: Species(name: type))],
      abilities: [AbilityName(ability: Species(name: ability))],
      moves: [MoveName(move: Species(name: move))],
    );

/// A fixed dex of 6 Pokemon spanning three evolution chains, used to drive
/// `PokemonApiProvider.filterPokemon`'s fuzzy name/id/type/move/ability
/// search and `stage:` evolution-stage matching end to end:
///  - chain 1 (3-stage): Bulbasaur(1) -> Ivysaur(2) -> Venusaur(3)
///  - chain 10 (2-stage): Pichu(172) -> Pikachu(25)
///  - chain 132 (non-evolving): Ditto(132)
///  - chain 4 (non-evolving): Charmander(4), the only Fire-type/Flamethrower
///    knower, so AC1/AC2 have exactly one expected match.
class _SearchFixturePokemonService implements PokemonService {
  final Map<int, PokemonDetails> _details = {
    1: _fixtureDetails(id: 1, type: 'grass', ability: 'overgrow', move: 'vine-whip'),
    2: _fixtureDetails(id: 2, type: 'grass', ability: 'overgrow', move: 'razor-leaf'),
    3: _fixtureDetails(id: 3, type: 'grass', ability: 'overgrow', move: 'petal-dance'),
    172: _fixtureDetails(id: 172, type: 'electric', ability: 'static', move: 'thunder-shock'),
    25: _fixtureDetails(id: 25, type: 'electric', ability: 'static', move: 'thunderbolt'),
    132: _fixtureDetails(id: 132, type: 'normal', ability: 'limber', move: 'transform'),
    4: _fixtureDetails(id: 4, type: 'fire', ability: 'blaze', move: 'flamethrower'),
  };

  final Map<int, EvolutionChain> _chains = {
    1: EvolutionChain(
      id: 1,
      chain: ChainLink(
        species: _species(1),
        evolvesTo: [
          ChainLink(
            species: _species(2),
            evolvesTo: [ChainLink(species: _species(3))],
          ),
        ],
      ),
    ),
    10: EvolutionChain(
      id: 10,
      chain: ChainLink(
        species: _species(172),
        evolvesTo: [ChainLink(species: _species(25))],
      ),
    ),
    132: EvolutionChain(id: 132, chain: ChainLink(species: _species(132))),
    4: EvolutionChain(id: 4, chain: ChainLink(species: _species(4))),
  };

  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 1, name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        Pokemon(id: 2, name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
        Pokemon(id: 3, name: 'venusaur', url: 'https://pokeapi.co/api/v2/pokemon/3/'),
        Pokemon(id: 4, name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/4/'),
        Pokemon(id: 25, name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25/'),
        Pokemon(id: 132, name: 'ditto', url: 'https://pokeapi.co/api/v2/pokemon/132/'),
        Pokemon(id: 172, name: 'pichu', url: 'https://pokeapi.co/api/v2/pokemon/172/'),
      ];

  @override
  Future<PokemonDetails> getPokemonDetails(int id, {bool priority = false}) async =>
      _details[id]!;

  @override
  Future<List<EvolutionChainUrl?>> getAllEvolutionChainUrls() async => [
        for (final chainId in _chains.keys)
          EvolutionChainUrl(url: 'https://pokeapi.co/api/v2/evolution-chain/$chainId/'),
      ];

  @override
  Future<EvolutionChain?> getEvolutionChain(int id, {bool? batch, bool priority = false}) async =>
      _chains[id];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in this test');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('pokemon_search_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  late PokemonApiProvider provider;

  setUp(() async {
    final profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    final name = 'search-${DateTime.now().microsecondsSinceEpoch}';
    await profiles.createProfile(name);

    final scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();

    final service = _SearchFixturePokemonService();
    provider = PokemonApiProvider(
      service,
      localService,
      profiles,
      scopes,
      GameCatalog(service),
    );
    await provider.fetchData();
  });

  List<int> idsOf(Iterable<Pokemon> pokemon) =>
      pokemon.map((p) => p.id).toList()..sort();

  group('fuzzy plain-text search (AC1-5)', () {
    test('a move name with no prefix finds every Pokemon that knows it (AC1)', () {
      provider.filterPokemon('flamethrower', {});
      expect(idsOf(provider.filteredPokemon), [4]);
    });

    test('a type name with no prefix finds every Pokemon of that type (AC2)', () {
      provider.filterPokemon('fire', {});
      expect(idsOf(provider.filteredPokemon), [4]);
    });

    test('an ability name with no prefix finds every Pokemon with it (AC3)', () {
      provider.filterPokemon('overgrow', {});
      expect(idsOf(provider.filteredPokemon), [1, 2, 3]);
    });

    test('existing name/id substring search still works unchanged (AC4)', () {
      provider.filterPokemon('25', {});
      expect(idsOf(provider.filteredPokemon), [25]);

      provider.filterPokemon('pikachu', {});
      expect(idsOf(provider.filteredPokemon), [25]);
    });

    test(
        'two space-separated words both must match, even against different '
        'fields on the same Pokemon (AC5)', () {
      // "grass" is Bulbasaur's and Ivysaur's type; "vine" is only in
      // Bulbasaur's move (vine-whip). Only Bulbasaur satisfies both.
      provider.filterPokemon('grass vine', {});
      expect(idsOf(provider.filteredPokemon), [1]);
    });
  });

  group('stage: evolution-stage matching (AC6-8)', () {
    test('stage:1 returns only first-stage (base or non-evolving) Pokemon (AC6)', () {
      provider.filterPokemon('', {}, stages: [1]);
      expect(idsOf(provider.filteredPokemon), [1, 4, 132, 172]);
    });

    test('stage:2 returns the correct deeper stage of each chain (AC6)', () {
      provider.filterPokemon('', {}, stages: [2]);
      expect(idsOf(provider.filteredPokemon), [2, 25]);
    });

    test('stage:3 returns only the final stage of the 3-stage chain (AC6)', () {
      provider.filterPokemon('', {}, stages: [3]);
      expect(idsOf(provider.filteredPokemon), [3]);
    });

    test('repeated stage key (stage:1 stage:2) matches either stage (AC7)', () {
      provider.filterPokemon('', {}, stages: [1, 2]);
      expect(idsOf(provider.filteredPokemon), [1, 2, 4, 25, 132, 172]);
    });

    test('a stage-only query with no plain text still returns results (AC8)', () {
      provider.filterPokemon('', {}, stages: [3]);
      expect(provider.filteredPokemon, isNotEmpty);
    });

    test('plain text and stage: combine (AND)', () {
      provider.filterPokemon('grass', {}, stages: [2]);
      expect(idsOf(provider.filteredPokemon), [2]);
    });
  });
}
