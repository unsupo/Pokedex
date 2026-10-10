import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/widgets/pokemon_list.dart';
import 'package:provider/provider.dart';

import '../support/fakes.dart';

/// Serves a handful of Pokemon and nothing else - version-group lookups are
/// left empty so GameCatalog.loadGames() (triggered elsewhere in the app)
/// has nothing to do.
class _FewPokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        for (var id = 1; id <= 20; id++)
          Pokemon(id: id, name: 'pokemon-$id', url: 'https://pokeapi.co/api/v2/pokemon/$id/'),
      ];

  @override
  Future<List<int>> getVersionGroupIds() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in this test');
}

/// PokemonApiProvider only reads caught records through this one method
/// outside of its guarded background fetches (see fetchData()); everything
/// else a fetch touches is allowed to throw and be swallowed by that guard.
class _FakeLocalService implements LocalService {
  @override
  Future<List<CaughtPokemon>> getCaughtPokemonForProfile(int profileId) async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in this test');
}

void main() {
  late PokemonApiProvider provider;

  setUp(() async {
    final profiles = ProfileProvider(
      InMemoryProfileRepository(['tester']),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();

    final scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();

    final service = _FewPokemonService();
    provider = PokemonApiProvider(
      service,
      _FakeLocalService(),
      profiles,
      scopes,
      GameCatalog(service),
    );
    await provider.fetchData();
  });

  Future<void> pump(WidgetTester tester, ScrollController controller) {
    return tester.pumpWidget(
      ChangeNotifierProvider<PokemonApiProvider>.value(
        value: provider,
        child: MaterialApp(
          home: Scaffold(
            body: PokemonList(
              pokemonList: provider.filteredPokemon,
              scrollController: controller,
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('attaches the given ScrollController to the list', (tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);

    await pump(tester, controller);
    await tester.pump();

    final listView = tester.widget<ListView>(find.byType(ListView));
    expect(listView.controller, same(controller),
        reason: 'the controller PokedexScreen creates must actually be '
            'attached, or calls like animateTo() on it are silent no-ops');
  });

  testWidgets('uses a fixed itemExtent matching PokemonList.itemExtent', (tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);

    await pump(tester, controller);
    await tester.pump();

    final listView = tester.widget<ListView>(find.byType(ListView));
    expect(listView.itemExtent, PokemonList.itemExtent);
  });

  testWidgets('a jump on the passed-in controller actually moves the list',
      (tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);

    await pump(tester, controller);
    await tester.pump();
    expect(controller.hasClients, isTrue,
        reason: 'regression check for the dead-wire bug: previously this '
            'controller had no attached Scrollable at all');

    controller.jumpTo(PokemonList.itemExtent * 3);
    await tester.pump();

    expect(controller.offset, PokemonList.itemExtent * 3);
  });
}
