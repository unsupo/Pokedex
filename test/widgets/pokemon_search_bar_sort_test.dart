import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart' hide Icons;
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:pokedex_app/utils/pokemon_sort.dart';
import 'package:pokedex_app/widgets/pokemon_search_bar.dart';
import 'package:provider/provider.dart';

import '../support/fakes.dart';
import '../support/isar_test_harness.dart';

/// Two Pokemon whose dex order and alphabetical order disagree, so a sort
/// change is visibly different from the default.
class _TwoPokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 41, name: 'zubat', url: 'https://pokeapi.co/api/v2/pokemon/41/'),
        Pokemon(id: 63, name: 'abra', url: 'https://pokeapi.co/api/v2/pokemon/63/'),
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
    tempDir = await Directory.systemTemp.createTemp('pokemon_search_bar_sort_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  late PokemonApiProvider pokemonApi;
  late UiStateProvider uiState;

  setUp(() async {
    final profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    final stamp = DateTime.now().microsecondsSinceEpoch;
    await profiles.createProfile('sb-sort-$stamp');

    final scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();
    await scopes.setScope(const ManualNationalScope());

    final service = _TwoPokemonService();
    pokemonApi = PokemonApiProvider(
        service, localService, profiles, scopes, GameCatalog(service));
    await pokemonApi.fetchData();
    for (final pokemon in pokemonApi.allPokemon.values) {
      pokemon.details = PokemonDetails(id: pokemon.id);
    }
    pokemonApi.filterPokemon('', {});

    uiState = UiStateProvider(localService);
  });

  Future<void> pump(WidgetTester tester) {
    return tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonApiProvider>.value(value: pokemonApi),
        ChangeNotifierProvider<UiStateProvider>.value(value: uiState),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: PokemonSearchBar(scrollController: ScrollController()),
        ),
      ),
    ));
  }

  testWidgets('shows a sort control next to the filter button', (tester) async {
    await pump(tester);

    expect(find.byIcon(Icons.sort), findsOneWidget);
    expect(find.byIcon(Icons.filter_list), findsOneWidget);
  });

  testWidgets('opens a menu of the four sort orders, dex-ascending checked by default',
      (tester) async {
    await pump(tester);

    await tester.tap(find.byIcon(Icons.sort));
    await tester.pumpAndSettle();

    expect(find.text('Name A-Z'), findsOneWidget);
    expect(find.text('Name Z-A'), findsOneWidget);
    expect(find.text('Dex # (low to high)'), findsOneWidget);
    expect(find.text('Dex # (high to low)'), findsOneWidget);

    final defaultItem = tester.widget<CheckedPopupMenuItem<PokemonSort>>(
        find.widgetWithText(CheckedPopupMenuItem<PokemonSort>, 'Dex # (low to high)'));
    expect(defaultItem.checked, isTrue);
    final otherItem = tester.widget<CheckedPopupMenuItem<PokemonSort>>(
        find.widgetWithText(CheckedPopupMenuItem<PokemonSort>, 'Name A-Z'));
    expect(otherItem.checked, isFalse);
  });

  testWidgets('selecting Name A-Z re-sorts the list and updates the stored choice',
      (tester) async {
    await pump(tester);
    expect(pokemonApi.filteredPokemon.map((p) => p.name), ['zubat', 'abra']);

    await tester.tap(find.byIcon(Icons.sort));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(
        CheckedPopupMenuItem<PokemonSort>, 'Name A-Z'));
    await tester.pumpAndSettle();

    expect(uiState.sort, PokemonSort.nameAscending);
    expect(pokemonApi.filteredPokemon.map((p) => p.name), ['abra', 'zubat']);
  });

  testWidgets('the sort icon has a tooltip for screen readers', (tester) async {
    await pump(tester);

    final button = tester.widget<PopupMenuButton<PokemonSort>>(
        find.byType(PopupMenuButton<PokemonSort>));
    expect(button.tooltip, isNotNull);
    expect(button.tooltip, isNotEmpty);
  });
}
