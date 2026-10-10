import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:pokedex_app/models/pokeapi/moves.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_species.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/screens/card_binder_screen.dart';
import 'package:pokedex_app/screens/pokemon_details_screen.dart';
import 'package:pokedex_app/services/binder_repository.dart';
import 'package:pokedex_app/services/card_binder_provider.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/tcg_card_repository.dart';
import 'package:pokedex_app/services/tcg_service.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:provider/provider.dart';

import '../support/fakes.dart';
import '../support/isar_test_harness.dart';

/// Serves one Pokemon and nothing else - unrelated lookups fall through to
/// noSuchMethod, which every caller in PokemonDetailsScreen/
/// PokemonApiProvider already guards with catchError.
class _OnePokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async =>
      [Pokemon(id: 25, name: 'pikachu', url: '')];

  @override
  Future<List<int>> getVersionGroupIds() async => [];

  // PokemonDetailsScreen.initState() calls
  // PokemonApiProvider.ensurePriorityDataLoaded(), which calls these four
  // directly (each wrapped in .then().catchError(), not a try/catch) - they
  // must actually be `async` (so a throw becomes a *rejected Future* that
  // .catchError() can see) rather than left to noSuchMethod, which throws
  // synchronously and would escape as an unhandled zone error instead.
  @override
  Future<PokemonDetails> getPokemonDetails(int id, {bool priority = false}) async =>
      throw UnimplementedError('getPokemonDetails is offline in this test');

  @override
  Future<PokemonSpecies> getPokemonSpecies(int id,
          {bool force = false, bool priority = false}) async =>
      throw UnimplementedError('getPokemonSpecies is offline in this test');

  @override
  Future<EvolutionChain?> getEvolutionChain(int id,
          {bool? batch, bool priority = false}) async =>
      throw UnimplementedError('getEvolutionChain is offline in this test');

  @override
  Future<Move> getMove(int id, {bool priority = false}) async =>
      throw UnimplementedError('getMove is offline in this test');

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in this test');
}

class _StubTcgService implements TcgService {
  @override
  Future<TcgCard?> getCard(String cardId) =>
      throw UnimplementedError('not exercised in this test');

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async => [];
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('binder_entry_point_test_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  late ProfileProvider profiles;
  late ScopeProvider scopes;
  late PokemonApiProvider pokemonProvider;
  late TcgApiProvider tcgProvider;
  late CardBinderProvider binderProvider;
  late UiStateProvider uiState;

  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  Future<void> pumpDetailsScreen(WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonApiProvider>.value(value: pokemonProvider),
        ChangeNotifierProvider<TcgApiProvider>.value(value: tcgProvider),
        ChangeNotifierProvider<CardBinderProvider>.value(value: binderProvider),
        ChangeNotifierProvider<UiStateProvider>.value(value: uiState),
      ],
      child: const MaterialApp(
        home: PokemonDetailsScreen(pokemonId: 25),
      ),
    ));
    await settle(tester);
  }

  setUp(() async {
    final stamp = DateTime.now().microsecondsSinceEpoch;
    profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    await profiles.createProfile('binder-entry-$stamp');

    scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();

    final service = _OnePokemonService();
    pokemonProvider = PokemonApiProvider(
      service,
      localService,
      profiles,
      scopes,
      GameCatalog(service),
    );
    await pokemonProvider.fetchData();

    tcgProvider = TcgApiProvider(_StubTcgService(), localService, profiles);
    // Pre-fetched so PokemonDetailsScreen.initState()'s own (synchronous,
    // unawaited) call to getPokemonCards(25) hits TcgApiProvider's
    // in-memory cache - its first line calls notifyListeners() before any
    // await, which trips Flutter's "setState during build" guard if it
    // actually has to go fetch (this is pre-existing behavior in
    // TcgApiProvider/PokemonDetailsScreen, both outside this change's
    // scope - sidestepped here rather than touched).
    await tcgProvider.getPokemonCards(25);
    binderProvider = CardBinderProvider(
      LocalServiceBinderRepository(
          localService, DefaultTcgCardRepository(_StubTcgService(), localService)),
      profiles,
    );
    await binderProvider.load();
    uiState = UiStateProvider(localService);
  });

  testWidgets(
      'the binder entry-point button is not shown on the Game Details tab',
      (tester) async {
    await pumpDetailsScreen(tester);

    expect(find.byKey(const Key('open-card-binder')), findsNothing);
  });

  testWidgets(
      'the binder entry-point button appears on the TCG Details tab and '
      'opens the binder turned to this Pokemon\'s page', (tester) async {
    await pumpDetailsScreen(tester);

    await tester.tap(find.text('TCG Details'));
    await settle(tester);

    expect(find.byKey(const Key('open-card-binder')), findsOneWidget);

    await tester.tap(find.byKey(const Key('open-card-binder')));
    await settle(tester);

    expect(find.byType(CardBinderScreen), findsOneWidget);
  });
}
