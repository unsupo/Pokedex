import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart' hide Icons;
import 'package:pokedex_app/models/pokeapi/pokemon_species.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/widgets/pokemon_search_bar.dart';
import 'package:provider/provider.dart';

import '../support/fakes.dart';
import '../support/isar_test_harness.dart';

/// A 3-stage chain: Bulbasaur(1) -> Ivysaur(2) -> Venusaur(3), with no fields
/// that overlap each other's names, so a `stage:` query narrows the visible
/// list unambiguously.
class _ThreeStagePokemonService implements PokemonService {
  final Map<int, PokemonDetails> _details = {
    1: PokemonDetails(id: 1, isDefault: true, types: [], abilities: [], moves: []),
    2: PokemonDetails(id: 2, isDefault: true, types: [], abilities: [], moves: []),
    3: PokemonDetails(id: 3, isDefault: true, types: [], abilities: [], moves: []),
  };

  Species _species(int id) => Species(
        name: 'species-$id',
        url: 'https://pokeapi.co/api/v2/pokemon-species/$id/',
      );

  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 1, name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        Pokemon(id: 2, name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
        Pokemon(id: 3, name: 'venusaur', url: 'https://pokeapi.co/api/v2/pokemon/3/'),
      ];

  @override
  Future<PokemonDetails> getPokemonDetails(int id, {bool priority = false}) async =>
      _details[id]!;

  @override
  Future<List<EvolutionChainUrl?>> getAllEvolutionChainUrls() async =>
      [EvolutionChainUrl(url: 'https://pokeapi.co/api/v2/evolution-chain/1/')];

  @override
  Future<EvolutionChain?> getEvolutionChain(int id, {bool? batch, bool priority = false}) async =>
      EvolutionChain(
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
      );

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in this test');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;
  late PokemonApiProvider provider;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('pokemon_search_bar_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  setUp(() async {
    final profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    final name = 'search-bar-${DateTime.now().microsecondsSinceEpoch}';
    await profiles.createProfile(name);

    final scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();

    final service = _ThreeStagePokemonService();
    provider = PokemonApiProvider(
      service,
      localService,
      profiles,
      scopes,
      GameCatalog(service),
    );
    await provider.fetchData();
  });

  Future<void> pumpSearchBar(WidgetTester tester) {
    return tester.pumpWidget(
      ChangeNotifierProvider<PokemonApiProvider>.value(
        value: provider,
        child: MaterialApp(
          home: Scaffold(
            body: PokemonSearchBar(scrollController: ScrollController()),
          ),
        ),
      ),
    );
  }

  testWidgets('the search field hints at stage: discoverability', (tester) async {
    await pumpSearchBar(tester);

    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.decoration?.hintText, contains('stage:1'));
    expect(field.decoration?.labelText, 'Search Pokemon');
  });

  testWidgets('typing a stage: query narrows the list to that stage', (tester) async {
    await pumpSearchBar(tester);
    expect(provider.filteredPokemonCount, 3);

    await tester.enterText(find.byType(TextField), 'stage:3');
    await tester.pump(const Duration(milliseconds: 350)); // past the 300ms debounce

    expect(provider.filteredPokemonCount, 1);
    expect(provider.filteredPokemon.single.id, 3);
  });

  testWidgets('clearing the field also clears a stage: filter', (tester) async {
    await pumpSearchBar(tester);

    await tester.enterText(find.byType(TextField), 'stage:3');
    await tester.pump(const Duration(milliseconds: 350));
    expect(provider.filteredPokemonCount, 1);

    await tester.tap(find.byIcon(Icons.clear));
    await tester.pump();

    expect(provider.filteredPokemonCount, 3);
  });
}
