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
import 'package:pokedex_app/widgets/binder/card_picker_modal.dart';
import 'package:provider/provider.dart';

import '../../support/fakes.dart';
import '../../support/isar_test_harness.dart';

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

/// Serves Pokemon #25 and #50 (the ones used in these tests) so
/// [toggleCardCaught] (called from the browse view) has a real
/// PokemonApiProvider to mirror a newly-caught card onto.
class _TwoPokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 25, name: 'pikachu', url: ''),
        Pokemon(id: 50, name: 'diglett', url: ''),
      ];

  @override
  Future<List<int>> getVersionGroupIds() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(
      '${invocation.memberName} is offline in this test');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('card_picker_modal_test_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  late ProfileProvider profiles;
  late PokemonApiProvider pokemonProvider;
  late TcgApiProvider tcgProvider;
  late CardBinderProvider binderProvider;

  Future<void> settle(WidgetTester tester) async {
    for (var i = 0; i < 80; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  Future<void> pumpHarness(WidgetTester tester,
      {required int pokemonId, required bool startInBrowse}) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonApiProvider>.value(
            value: pokemonProvider),
        ChangeNotifierProvider<TcgApiProvider>.value(value: tcgProvider),
        ChangeNotifierProvider<CardBinderProvider>.value(value: binderProvider),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              key: const Key('open-modal'),
              onPressed: () => showCardPickerModal(context,
                  pokemonId: pokemonId, startInBrowse: startInBrowse),
              child: const Text('open'),
            );
          }),
        ),
      ),
    ));
    await settle(tester);
    await tester.tap(find.byKey(const Key('open-modal')));
    await settle(tester);
  }

  setUp(() async {
    final stamp = DateTime.now().microsecondsSinceEpoch;
    profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    await profiles.createProfile('picker-modal-$stamp');

    final scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();
    final pokemonService = _TwoPokemonService();
    pokemonProvider = PokemonApiProvider(
      pokemonService,
      localService,
      profiles,
      scopes,
      GameCatalog(pokemonService),
    );
    await pokemonProvider.fetchData();

    final ownedCard = TcgCard(
        id: 'picker-modal-card-1',
        name: 'Pikachu V',
        nationalPokedexNumbers: const [25]);
    final uncaughtCard = TcgCard(
        id: 'picker-modal-card-2',
        name: 'Bulbasaur',
        nationalPokedexNumbers: const [50]);
    tcgProvider = TcgApiProvider(
      _StubTcgService({
        25: [ownedCard],
        50: [uncaughtCard]
      }),
      localService,
      profiles,
    );
    final loaded = (await tcgProvider.getPokemonCards(25))!;
    await tcgProvider.setCaught(loaded.single);
    // Pre-fetched (but left uncaught) so the modal's own getPokemonCards(50)
    // call in AC9 hits TcgApiProvider's in-memory cache instead of doing a
    // fresh Isar write-through cache *during* the tap that opens the modal -
    // avoids a real-I/O-timing race in that one test.
    await tcgProvider.getPokemonCards(50);

    binderProvider = CardBinderProvider(
      LocalServiceBinderRepository(localService,
          DefaultTcgCardRepository(_StubTcgService(), localService)),
      profiles,
    );
    await binderProvider.load();
  });

  testWidgets(
      'AC7: starting in cycle mode shows the picker, not the browse grid',
      (tester) async {
    await pumpHarness(tester, pokemonId: 25, startInBrowse: false);

    expect(find.text('Choose which card to display'), findsOneWidget);
    expect(find.text('All cards - tap to catch'), findsNothing);
  });

  testWidgets('AC8: starting in browse mode skips straight to the full grid',
      (tester) async {
    await pumpHarness(tester, pokemonId: 25, startInBrowse: true);

    expect(find.text('All cards - tap to catch'), findsOneWidget);
    expect(find.text('Choose which card to display'), findsNothing);
  });

  testWidgets(
      'AC10: confirming the cycle picker persists the selection and closes the modal',
      (tester) async {
    await pumpHarness(tester, pokemonId: 25, startInBrowse: false);

    await tester.runAsync(() async {
      await tester.tap(find.byKey(const Key('binder-confirm-selection')));
      await Future<void>.delayed(const Duration(milliseconds: 100));
    });
    await settle(tester);

    expect(find.text('Choose which card to display'), findsNothing);
    expect(
        binderProvider.pocketFor(25).runtimeType.toString(), 'SelectedPocket');
  });

  testWidgets(
      'AC9: catching a card through the browse view\'s + makes it '
      'immediately available in the cycle picker, without closing and '
      'reopening the modal', (tester) async {
    // Pokemon #50 starts with nothing owned (state 3/empty), so the modal
    // opens straight to the browse view - exactly like _onPocketTapped
    // decides for an EmptyPocket.
    await pumpHarness(tester, pokemonId: 50, startInBrowse: true);
    expect(find.text('All cards - tap to catch'), findsOneWidget);

    await tester.runAsync(() async {
      await tester
          .tap(find.byKey(const Key('binder-browse-card-picker-modal-card-2')));
      await Future<void>.delayed(const Duration(milliseconds: 100));
    });
    await settle(tester);

    // Still the same modal session - now able to go back to the cycle view.
    await tester.tap(find.byKey(const Key('binder-browse-back')));
    await settle(tester);

    expect(find.text('Choose which card to display'), findsOneWidget);
    expect(find.byKey(const Key('binder-confirm-selection')), findsOneWidget);
  });

  testWidgets(
      "AC25: catching a Pokemon's first card from the browse view also "
      "makes it the binder's displayed card immediately, without a "
      'separate confirm step', (tester) async {
    // Same starting point as AC9 above - Pokemon #50, nothing owned yet.
    await pumpHarness(tester, pokemonId: 50, startInBrowse: true);

    await tester.runAsync(() async {
      await tester
          .tap(find.byKey(const Key('binder-browse-card-picker-modal-card-2')));
      await Future<void>.delayed(const Duration(milliseconds: 100));
    });
    await settle(tester);

    final view = binderProvider.pocketFor(50);
    expect(view, isA<SelectedPocket>());
    expect((view as SelectedPocket).card.id, 'picker-modal-card-2');
  });
}
