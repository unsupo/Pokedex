import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/tcg_card.dart';
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
import 'package:pokedex_app/utils/binder/binder_pocket.dart';
import 'package:pokedex_app/widgets/scope/card_caught_toggle.dart';
import 'package:provider/provider.dart';

import '../../support/fakes.dart';
import '../../support/isar_test_harness.dart';

/// Serves one Pokemon (Pikachu, 25) and nothing else - version-group/game
/// lookups are left to noSuchMethod, which PokemonApiProvider.fetchData
/// tolerates (it wraps each bulk fetch in a guard).
class _OnePokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(
            id: 25,
            name: 'pikachu',
            url: 'https://pokeapi.co/api/v2/pokemon/25/')
      ];

  @override
  Future<List<int>> getVersionGroupIds() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(
      '${invocation.memberName} is offline in this test');
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
    tempDir = await Directory.systemTemp.createTemp('card_catch_sync_');
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

  setUp(() async {
    profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    await profiles
        .createProfile('card-sync-${DateTime.now().microsecondsSinceEpoch}');

    scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load(); // defaults to manual National, which is toggleable

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

    // toggleCardCaught now also updates the binder's displayed card (see
    // card_caught_toggle.dart) - a real CardBinderProvider, same as the
    // real app's provider graph (app_providers.dart), not a fake, so
    // selectCard's actual Isar write path is exercised too.
    binderProvider = CardBinderProvider(
      LocalServiceBinderRepository(localService,
          DefaultTcgCardRepository(_StubTcgService(), localService)),
      profiles,
    );
    await binderProvider.load();
  });

  // Captures a BuildContext under both providers, without a button - the
  // test awaits toggleCardCaught directly, rather than firing it from a
  // VoidCallback (which can't be awaited) and guessing how long pumping
  // takes to cover a real, un-faked Isar write.
  Future<BuildContext> pumpContext(WidgetTester tester) async {
    late BuildContext captured;
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonApiProvider>.value(
            value: pokemonProvider),
        ChangeNotifierProvider<TcgApiProvider>.value(value: tcgProvider),
        ChangeNotifierProvider<CardBinderProvider>.value(value: binderProvider),
      ],
      child: MaterialApp(
        home: Builder(
          builder: (context) {
            captured = context;
            return const Scaffold(body: SizedBox());
          },
        ),
      ),
    ));
    return captured;
  }

  // testWidgets runs its body in flutter_test's fake-async zone, which fakes
  // Timer/Duration so tester.pump(duration) can simulate elapsed time. Isar's
  // real FFI calls never resolve inside that zone (nothing ever pumps them),
  // so any genuine Isar I/O inside a testWidgets body must run via
  // tester.runAsync, which steps outside the fake zone into real async time.
  testWidgets('catching a card also marks its Pokemon caught', (tester) async {
    final context = await pumpContext(tester);
    final card = TcgCard(id: 'sync-1', name: 'Pikachu V');

    await tester.runAsync(
        () => toggleCardCaught(context, card, 25, pokemonAlreadyCaught: false));

    expect(card.isCaught, isTrue);
    expect(pokemonProvider.allPokemon[25]!.isCaught, isTrue);
  });

  testWidgets(
      "AC25: catching a Pokemon's first card also makes it the binder's "
      'displayed card for that Pokemon, immediately', (tester) async {
    final context = await pumpContext(tester);
    final card = TcgCard(
        id: 'sync-first',
        name: 'Pikachu V',
        nationalPokedexNumbers: const [25]);

    await tester.runAsync(
        () => toggleCardCaught(context, card, 25, pokemonAlreadyCaught: false));

    final view = binderProvider.pocketFor(25, pokemonCaught: false);
    expect(view, isA<SelectedPocket>());
    expect((view as SelectedPocket).card.id, 'sync-first');
  });

  testWidgets(
      'AC25: catching a second card for a Pokemon that already has a '
      "displayed card does not silently replace it - that stays the "
      "profile's deliberate choice", (tester) async {
    final context = await pumpContext(tester);
    final first = TcgCard(
        id: 'sync-first',
        name: 'Pikachu V',
        nationalPokedexNumbers: const [25]);
    final second = TcgCard(
        id: 'sync-second',
        name: 'Pikachu VMAX',
        nationalPokedexNumbers: const [25]);

    await tester.runAsync(() async {
      await toggleCardCaught(context, first, 25, pokemonAlreadyCaught: false);
      await toggleCardCaught(context, second, 25, pokemonAlreadyCaught: true);
    });

    final view = binderProvider.pocketFor(25, pokemonCaught: false);
    expect(view, isA<SelectedPocket>());
    expect((view as SelectedPocket).card.id, 'sync-first',
        reason: 'the first catch is still the displayed card');
  });

  testWidgets('un-catching a card does not un-catch its Pokemon',
      (tester) async {
    final context = await pumpContext(tester);
    final card = TcgCard(id: 'sync-2', name: 'Pikachu V');
    await tester.runAsync(
        () => toggleCardCaught(context, card, 25, pokemonAlreadyCaught: false));
    expect(pokemonProvider.allPokemon[25]!.isCaught, isTrue);

    await tester.runAsync(
        () => toggleCardCaught(context, card, 25, pokemonAlreadyCaught: true));

    expect(card.isCaught, isFalse);
    expect(pokemonProvider.allPokemon[25]!.isCaught, isTrue,
        reason: 'owning fewer cards does not mean the Pokemon was un-caught');
  });

  testWidgets(
      'catching another card for an already-caught Pokemon does not re-show the scope hint',
      (tester) async {
    await tester.runAsync(() => pokemonProvider.setCaught(25, true));
    final context = await pumpContext(tester);
    final card = TcgCard(id: 'sync-3', name: 'Pikachu VMAX');

    await tester.runAsync(
        () => toggleCardCaught(context, card, 25, pokemonAlreadyCaught: true));
    await tester.pump();

    expect(find.byType(SnackBar), findsNothing);
  });
}
