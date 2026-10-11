import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/screens/card_binder_screen.dart';
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
import 'package:provider/provider.dart';

import '../../support/fakes.dart';
import '../../support/isar_test_harness.dart';

/// Serves 10 Pokemon (ids 1-10, spanning a page boundary at 9/10) and
/// nothing else - unrelated lookups fall through to noSuchMethod, which
/// PokemonApiProvider.fetchData tolerates (each bulk fetch is guarded).
class _TenPokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => List.generate(
      10, (i) => Pokemon(id: i + 1, name: 'pokemon-${i + 1}', url: ''));

  @override
  Future<List<int>> getVersionGroupIds() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in this test');
}

class _StubTcgService implements TcgService {
  final Map<int, List<TcgCard>> cardsByPokemonId;

  _StubTcgService([this.cardsByPokemonId = const {}]);

  @override
  Future<TcgCard?> getCard(String cardId) =>
      throw UnimplementedError('not exercised in this test');

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async =>
      cardsByPokemonId[nationalDexId] ?? [];
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('binder_screen_test_');
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

  // Pockets render CachedNetworkImage for sprites/card art, whose
  // placeholder is an indeterminate CircularProgressIndicator that keeps
  // scheduling frames forever when there's no real network to resolve it
  // (true in this sandboxed test run) - pumpAndSettle would hang waiting for
  // that to stop. A bounded number of pumps is enough to flush the actual
  // in-memory Futures (provider loads, the modal's getPokemonCards) without
  // waiting on real image I/O.
  // Deliberately *not* tester.pumpAndSettle(): a pocket's owned-indicator/
  // sleeve art is a CachedNetworkImage, whose placeholder is an
  // indeterminate CircularProgressIndicator that keeps scheduling frames
  // forever with no real network to resolve it in this sandboxed run -
  // pumpAndSettle would hang waiting for that to stop. A bounded run of
  // plain pumps still flushes real work (Isar FFI calls resolve through the
  // normal Dart event loop, so each pump's microtask flush carries them
  // forward) without waiting on that image.
  //
  // Also deliberately *not* tester.runAsync() around a tap: letting
  // flutter_cache_manager's image cache genuinely initialize here hits its
  // own sqflite backend, which isn't set up in this test binary
  // (`databaseFactory not initialized`) - a background error that
  // surfaces *after* the test completes and corrupts later tests in the
  // same run. Bounded fake-time pumps never give it the chance to run.
  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 60; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  Future<void> tapAndWaitForRealWork(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    await settle(tester);
  }

  // For a tap whose handler does genuine *new* Isar I/O (confirming a
  // selection writes one) - bounded fake pumps alone never let that finish
  // (see the note on `settle` above), so this actually waits in real time.
  Future<void> tapAndAwaitRealWrite(WidgetTester tester, Finder finder) async {
    await tester.runAsync(() async {
      await tester.tap(finder);
      await Future<void>.delayed(const Duration(milliseconds: 300));
    });
    await settle(tester);
  }

  Future<void> pumpBinder(WidgetTester tester, {int? scrollToPokemonId}) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonApiProvider>.value(value: pokemonProvider),
        ChangeNotifierProvider<TcgApiProvider>.value(value: tcgProvider),
        ChangeNotifierProvider<CardBinderProvider>.value(value: binderProvider),
      ],
      child: MaterialApp(
        home: CardBinderScreen(scrollToPokemonId: scrollToPokemonId),
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
    await profiles.createProfile('binder-screen-$stamp');

    scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();

    final service = _TenPokemonService();
    pokemonProvider = PokemonApiProvider(
      service,
      localService,
      profiles,
      scopes,
      GameCatalog(service),
    );
    await pokemonProvider.fetchData();

    final cardForOne = TcgCard(
        id: 'binder-screen-card-1', name: 'Bulbasaur Card', nationalPokedexNumbers: const [1]);
    final cardForThree = TcgCard(
        id: 'binder-screen-card-3', name: 'Venusaur Card', nationalPokedexNumbers: const [3]);
    tcgProvider = TcgApiProvider(
      _StubTcgService({1: [cardForOne], 3: [cardForThree]}),
      localService,
      profiles,
    );
    // Pre-fetched (but left uncaught) so opening pocket 2's modal hits
    // TcgApiProvider's in-memory cache instead of racing a fresh Isar
    // write-through cache against the tap that opens it.
    await tcgProvider.getPokemonCards(2);

    binderProvider = CardBinderProvider(
      LocalServiceBinderRepository(
          localService, DefaultTcgCardRepository(_StubTcgService(), localService)),
      profiles,
    );
    await binderProvider.load();

    // Pocket 3 starts already *selected* (state 1, not state 2) - this
    // stub card has no `images`, so the sleeve falls back to its
    // named-but-imageless text rendering instead of a CachedNetworkImage.
    // Deliberately not OwnedPocket (which *does* render one via the Pokemon
    // sprite, see catchPokemon1Card below): combining a real image fetch
    // with the real Isar write a confirm-selection tap needs (see
    // tapAndAwaitRealWrite) makes flutter_cache_manager genuinely
    // initialize here, which fails on this test binary's unconfigured
    // sqflite backend - a test-infrastructure gap, not a behavior to work
    // around in the app code.
    final loadedThree = (await tcgProvider.getPokemonCards(3))!;
    await tcgProvider.setCaught(loadedThree.single);
    await binderProvider.selectCard(3, cardForThree);
  });

  // Only called by the one test that actually needs pocket 1 in the owned
  // (sprite-rendering) state - see the note above on why that state and
  // tapAndAwaitRealWrite don't mix within the same test. Called before any
  // widget is pumped, so there's no on-screen image yet for runAsync to
  // collide with here - but it still needs runAsync: testWidgets() itself
  // (not just pumping a widget) already runs the whole test body inside
  // flutter_test's fake-async zone, so a real Isar write started directly in
  // the test body needs it too, same as one started from a tap.
  Future<void> catchPokemon1Card(WidgetTester tester) async {
    await tester.runAsync(() async {
      final loaded = (await tcgProvider.getPokemonCards(1))!;
      await tcgProvider.setCaught(loaded.single);
      // CardBinderProvider is a long-lived singleton in the real app and
      // doesn't know this catch happened - CardBinderScreen also reloads it
      // on open (see its initState), but that reload is itself deferred and
      // real-I/O-bound; doing it here too, before any image is on screen,
      // guarantees the pumped screen already has fresh data to render.
      await binderProvider.load();
    });
  }

  testWidgets('AC2: shows one pocket per Pokemon, in dex order, 9 per page',
      (tester) async {
    await pumpBinder(tester);

    // Page 0 (the initial right page) holds dex ids 1-9.
    for (var id = 1; id <= 9; id++) {
      expect(find.byKey(Key('binder-pocket-$id')), findsOneWidget);
    }
    expect(find.byKey(const Key('binder-pocket-10')), findsNothing);
  });

  testWidgets('AC4: Pokemon #1 (owned, unselected) shows the owned-indicator '
      'state, not bare card art or the + state', (tester) async {
    await catchPokemon1Card(tester);
    await pumpBinder(tester);

    // The owned indicator renders Pokemon #1's own sprite, not the card.
    expect(find.byKey(const Key('binder-pocket-1')), findsOneWidget);
    expect(
        find.descendant(
          of: find.byKey(const Key('binder-pocket-1')),
          matching: find.byIcon(Icons.add_circle_outline),
        ),
        findsNothing);
  });

  testWidgets('AC5: a Pokemon with nothing owned shows the + state, and '
      'tapping it opens the browse view directly (AC8)', (tester) async {
    await pumpBinder(tester);

    expect(
        find.descendant(
          of: find.byKey(const Key('binder-pocket-2')),
          matching: find.byIcon(Icons.add_circle_outline),
        ),
        findsOneWidget);

    await tapAndWaitForRealWork(tester, find.byKey(const Key('binder-pocket-2')));

    expect(find.text('All cards - tap to catch'), findsOneWidget);
    // No cycle controls, since there's nothing to cycle through yet.
    expect(find.byKey(const Key('binder-confirm-selection')), findsNothing);
  });

  testWidgets(
      'AC7+AC10: tapping an owned pocket opens the cycle picker, and '
      'confirming a selection persists it and updates the pocket', (tester) async {
    await pumpBinder(tester);

    await tapAndWaitForRealWork(tester, find.byKey(const Key('binder-pocket-3')));

    // The cycle picker, not the full browse grid.
    expect(find.text('Choose which card to display'), findsOneWidget);
    expect(find.text('All cards - tap to catch'), findsNothing);

    await tapAndAwaitRealWrite(tester, find.byKey(const Key('binder-confirm-selection')));

    // The modal closed and the pocket is still showing a selected card.
    expect(find.text('Choose which card to display'), findsNothing);
    expect(binderProvider.pocketFor(3).runtimeType.toString(), 'SelectedPocket');
  });

  testWidgets('AC1: scrollToPokemonId opens already turned to that Pokemon\'s page',
      (tester) async {
    await pumpBinder(tester, scrollToPokemonId: 10);

    // Dex #10 is on page 1, the last page with only 10 Pokemon - it's shown
    // as the right page, with page 0 (dex #1-9) still visible as its left
    // facing page, exactly like a real open book.
    expect(find.byKey(const Key('binder-pocket-10')), findsOneWidget);
    expect(find.byKey(const Key('binder-pocket-1')), findsOneWidget);
  });

  testWidgets(
      'AC11: tapping the next-page control turns exactly one page',
      (tester) async {
    await pumpBinder(tester);
    // Starting spread: no left page yet, right page is dex #1-9.
    expect(find.byKey(const Key('binder-pocket-1')), findsOneWidget);
    expect(find.byKey(const Key('binder-pocket-10')), findsNothing);

    await tester.tap(find.byKey(const Key('binder-next-page')));
    await settle(tester);

    // Turned exactly one page: the spread is now (page 0 | page 1), so dex
    // #1 (page 0) is still visible as the new left page, and dex #10 (page
    // 1) has newly appeared as the right page.
    expect(find.byKey(const Key('binder-pocket-1')), findsOneWidget);
    expect(find.byKey(const Key('binder-pocket-10')), findsOneWidget);
  });
}
