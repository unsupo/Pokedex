import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart';
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/utils/pokemon_sort.dart';
import 'package:pokedex_app/widgets/filter_modal.dart';

import '../support/fakes.dart';
import '../support/isar_test_harness.dart';

/// Five Pokemon, listed in the order PokeAPI's real list endpoint would
/// return them (ascending by id) -- that is "today's existing order" the
/// dex-ascending regression check (AC 3) has to match. Chikorita is
/// Generation 2, used to prove sort composes with an active filter (AC 5).
class _FivePokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 1, name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        Pokemon(id: 4, name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/4/'),
        Pokemon(id: 25, name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25/'),
        Pokemon(id: 133, name: 'eevee', url: 'https://pokeapi.co/api/v2/pokemon/133/'),
        Pokemon(id: 152, name: 'chikorita', url: 'https://pokeapi.co/api/v2/pokemon/152/'),
      ];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not exercised here');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('pokemon_sort_provider_');
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
    final stamp = DateTime.now().microsecondsSinceEpoch;
    await profiles.createProfile('sort-$stamp');

    final scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();
    await scopes.setScope(const ManualNationalScope());

    final service = _FivePokemonService();
    provider = PokemonApiProvider(
        service, localService, profiles, scopes, GameCatalog(service));
    await provider.fetchData();

    // getPokemonDetails is not exercised by this fake service (it throws,
    // caught by the provider's per-category error guard) -- filterPokemon
    // excludes any Pokemon whose details are still null, so give every
    // Pokemon details directly.
    for (final pokemon in provider.allPokemon.values) {
      pokemon.details = PokemonDetails(id: pokemon.id);
    }
  });

  List<String> namesIn(PokemonApiProvider provider) =>
      provider.filteredPokemon.map((p) => p.name).toList();

  group('AC 3: dex-ascending', () {
    test('matches today\'s existing (unsorted) order exactly -- a no-op',
        () {
      provider.filterPokemon('', {});

      expect(namesIn(provider),
          ['bulbasaur', 'charmander', 'pikachu', 'eevee', 'chikorita']);
    });
  });

  group('AC 4: dex-descending', () {
    test('is the exact reverse of dex-ascending', () {
      provider.updateSort(PokemonSort.dexDescending);
      provider.filterPokemon('', {});

      expect(namesIn(provider),
          ['chikorita', 'eevee', 'pikachu', 'charmander', 'bulbasaur']);
    });
  });

  group('AC 1: name-ascending', () {
    test('sorts the visible list alphabetically, case-insensitively', () {
      provider.updateSort(PokemonSort.nameAscending);
      provider.filterPokemon('', {});

      expect(namesIn(provider),
          ['bulbasaur', 'charmander', 'chikorita', 'eevee', 'pikachu']);
    });
  });

  group('AC 2: name-descending', () {
    test('is the exact reverse of name-ascending', () {
      provider.updateSort(PokemonSort.nameDescending);
      provider.filterPokemon('', {});

      expect(namesIn(provider),
          ['pikachu', 'eevee', 'chikorita', 'charmander', 'bulbasaur']);
    });
  });

  group('AC 5: an active filter under a non-default sort', () {
    test('re-sorts the new (smaller) result set instead of resetting to dex-ascending',
        () {
      provider.updateSort(PokemonSort.nameAscending);

      // Generation 1 only -- excludes chikorita (Generation 2).
      provider.filterPokemon('', {Filters.Generations: [1]});

      expect(
          namesIn(provider), ['bulbasaur', 'charmander', 'eevee', 'pikachu']);
    });
  });

  group('AC 6: a freshly constructed provider', () {
    test('starts on dex-ascending', () {
      // No updateSort call since setUp(): the default must already be
      // dex-ascending, matching a fresh app launch.
      provider.filterPokemon('', {});

      expect(namesIn(provider),
          ['bulbasaur', 'charmander', 'pikachu', 'eevee', 'chikorita']);
    });
  });
}
