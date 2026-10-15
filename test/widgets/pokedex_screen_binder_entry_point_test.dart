import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/main.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart' hide Icons;
import 'package:pokedex_app/models/pokeapi/pokemon_species.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/screens/card_binder_screen.dart';
import 'package:pokedex_app/services/card_binder_provider.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/tcg_service.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:pokedex_app/utils/binder/binder_layout.dart';
import 'package:pokedex_app/utils/scroll_center_math.dart';
import 'package:pokedex_app/widgets/pokemon_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../support/fakes.dart';
import '../support/isar_test_harness.dart' show FakePathProviderPlatform;

/// 30 Pokemon, each with minimal-but-non-null details/species (so
/// filterPokemon doesn't exclude them) - spans several binder pages
/// (pageCount = ceil(30/9) = 4) without the cost of a full 1025-entry
/// fixture.
class _ThirtyPokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        for (var id = 1; id <= 30; id++)
          Pokemon(
              id: id,
              name: 'pokemon-$id',
              url: 'https://pokeapi.co/api/v2/pokemon/$id/'),
      ];

  @override
  Future<List<int>> getVersionGroupIds() async => [];

  @override
  Future<PokemonDetails> getPokemonDetails(int id,
          {bool priority = false}) async =>
      PokemonDetails(
          id: id,
          isDefault: true,
          types: const [],
          abilities: const [],
          moves: const []);

  @override
  Future<PokemonSpecies> getPokemonSpecies(int id,
          {bool force = false, bool priority = false}) async =>
      PokemonSpecies(id: id);

  @override
  Future<EvolutionChain?> getEvolutionChain(int id,
          {bool? batch, bool priority = false}) async =>
      null;

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(
      '${invocation.memberName} is offline in this test');
}

/// See the identical fixture in pokedex_screen_recenter_test.dart for why
/// this is a plain in-memory fake rather than a real Isar instance.
class _InMemoryLocalService implements LocalService {
  @override
  Future<List<CaughtPokemon>> getCaughtPokemonForProfile(int profileId) async =>
      [];

  @override
  Future<List<PokemonDetails?>> getAllPokemonDetails() async => [];

  @override
  Future<List<PokemonSpecies?>> getAllPokemonSpecies() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(
      '${invocation.memberName} is offline in this test');
}

class _NoCardsTcgService implements TcgService {
  @override
  Future<TcgCard?> getCard(String cardId) async => null;

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async => [];
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUpAll(() async {
    // See the identical setup in pokedex_screen_recenter_test.dart: sprite
    // images need a path_provider cache directory to resolve at all under
    // flutter_test.
    tempDir = await Directory.systemTemp.createTemp('pokedex_binder_entry_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  late LocalService localService;
  late ProfileProvider profiles;
  late ScopeProvider scopes;
  late PokemonApiProvider pokemonProvider;
  late TcgApiProvider tcgProvider;
  late CardBinderProvider binderProvider;
  late UiStateProvider uiState;

  setUp(() async {
    localService = _InMemoryLocalService();

    profiles = ProfileProvider(
      InMemoryProfileRepository(['tester']),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();

    scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();

    final service = _ThirtyPokemonService();
    pokemonProvider = PokemonApiProvider(
      service,
      localService,
      profiles,
      scopes,
      GameCatalog(service),
    );
    await pokemonProvider.fetchData();

    final tcgService = _NoCardsTcgService();
    tcgProvider = TcgApiProvider(tcgService, localService, profiles);
    binderProvider = CardBinderProvider(InMemoryBinderRepository(), profiles);
    await binderProvider.load();
    uiState = UiStateProvider(localService);
  });

  Future<void> pumpSettled(WidgetTester tester) async {
    // See pokedex_screen_recenter_test.dart's identical helper: sprite
    // placeholders never resolve under flutter_test, so pumpAndSettle would
    // hang - a bounded number of pumps instead.
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<LocalService>.value(value: localService),
        ChangeNotifierProvider<ProfileProvider>.value(value: profiles),
        ChangeNotifierProvider<ScopeProvider>.value(value: scopes),
        ChangeNotifierProvider<PokemonApiProvider>.value(
            value: pokemonProvider),
        ChangeNotifierProvider<TcgApiProvider>.value(value: tcgProvider),
        ChangeNotifierProvider<CardBinderProvider>.value(value: binderProvider),
        ChangeNotifierProvider<UiStateProvider>.value(value: uiState),
      ],
      child: MaterialApp(
        navigatorObservers: [pokedexRouteObserver],
        home: PokedexScreen(saveService: localService),
      ),
    ));
    await pumpSettled(tester);
  }

  ListView listViewUnder(WidgetTester tester) =>
      tester.widget<ListView>(find.byType(ListView));

  // Mirrors CardBinderScreen._spreadRightIndexFor (private to that class) -
  // a spread's right slot is always an even page-group index, so an odd
  // target page-group needs the spread one higher to bring it into view on
  // the left instead. See "Twelfth round" in docs/features/card-binder.md.
  int spreadRightIndexFor(int pageGroup) =>
      pageGroup.isEven ? pageGroup : pageGroup + 1;

  testWidgets('the binder entry point is visible on the Pokedex list itself',
      (tester) async {
    await pumpApp(tester);

    expect(find.byKey(const Key('open-card-binder-from-list')), findsOneWidget);
  });

  testWidgets(
      'opens the binder turned to whichever Pokemon the list is currently '
      'scrolled to, not always page 0', (tester) async {
    await pumpApp(tester);

    // Scroll far enough down that Pokemon 1 (page 0) is nowhere near the
    // viewport - jumpTo + a pump to let the ListView itself settle on the
    // new offset before reading it back.
    final controller = listViewUnder(tester).controller!;
    controller.jumpTo(16 * PokemonList.itemExtent);
    await tester.pump();

    final position = controller.position;
    final centerIndex = indexAtViewportCenter(
      offset: position.pixels,
      itemExtent: PokemonList.itemExtent,
      viewportHeight: position.viewportDimension,
    ).clamp(0, 29);
    final centerPokemonId = centerIndex + 1; // ids are 1..30, sequential
    final expectedPage = binderPageIndexForPokemonId(centerPokemonId);
    final expectedRightIndex = spreadRightIndexFor(expectedPage);
    // Sanity check the fixture actually exercises a non-zero page - a
    // scroll deep enough into a 30-Pokemon list should not land back on
    // page 0, or this test would pass even with the old "always page 0"
    // behavior.
    expect(expectedRightIndex, greaterThan(0));

    await tester.tap(find.byKey(const Key('open-card-binder-from-list')));
    await pumpSettled(tester);

    expect(find.byType(CardBinderScreen), findsOneWidget);
    // The pocket for whichever Pokemon ended up at the viewport's center is
    // visible on the opened spread - the concrete, user-facing proof that
    // "at that spot" actually means something, not just that some page
    // other than 0 happened to open.
    expect(find.byKey(Key('binder-pocket-$centerPokemonId')), findsOneWidget,
        reason: 'expected page $expectedPage (spread right index '
            '$expectedRightIndex) to include Pokemon $centerPokemonId\'s '
            'pocket');
  });
}
