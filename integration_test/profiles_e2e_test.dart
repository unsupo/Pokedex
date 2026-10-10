import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/app_providers.dart';
import 'package:pokedex_app/main.dart';
import 'package:pokedex_app/models/pokeapi/games.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/active_profile_store.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/profiles/scope_store.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/services/tcg_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test/support/isar_test_harness.dart';

/// Serves three Pokemon and one game (version group 1, "red-blue", whose
/// Pokedex is Bulbasaur and Pikachu). Every other PokeAPI call throws, which
/// the providers' own error guards absorb, so the app runs offline.
class _StubPokemonService implements PokemonService {
  @override
  Future<List<int>> getVersionGroupIds() async => [1];

  @override
  Future<VersionGroup> getVersionGroup(int id) async => VersionGroup(
        id: id,
        name: 'red-blue',
        pokedexes: [NamedApiResource(url: 'https://pokeapi.co/api/v2/pokedex/2/')],
      );

  @override
  Future<Pokedex> getPokedex(int id) async => Pokedex(id: id, pokemonEntries: [
        PokemonEntry(
            pokemonSpecies: NamedApiResource(
                url: 'https://pokeapi.co/api/v2/pokemon-species/1/')),
        PokemonEntry(
            pokemonSpecies: NamedApiResource(
                url: 'https://pokeapi.co/api/v2/pokemon-species/25/')),
      ]);

  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 1, name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        Pokemon(id: 4, name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/4/'),
        Pokemon(id: 25, name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25/'),
      ];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in e2e');
}

class _StubTcgService implements TcgService {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is offline in e2e');
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Directory dbDir;

  // No initIsarCoreForTest() here: this runs inside the built app, and the
  // isar_community_flutter_libs plugin bundles its own native library. The
  // harness's pub-cache lookup only works for plain `flutter test` runs.
  setUpAll(() async {
    dbDir = await Directory.systemTemp.createTemp('pokedex_e2e_');
    PathProviderPlatform.instance = FakePathProviderPlatform(dbDir.path);
  });

  tearDownAll(() async {
    await dbDir.delete(recursive: true);
  });

  LocalService? localService;

  Future<ProfileProvider> loadProfiles() async {
    final profiles = ProfileProvider(
      LocalServiceProfileRepository(localService!),
      SharedPreferencesActiveProfileStore(),
    );
    await profiles.load();
    return profiles;
  }

  Future<ScopeProvider> loadScopes(ProfileProvider profiles) async {
    final scopes = ScopeProvider(profiles, SharedPreferencesScopeStore());
    await scopes.load();
    return scopes;
  }

  Widget buildApp(ProfileProvider profiles, ScopeProvider scopes) => MultiProvider(
        providers: buildAppProviders(
          localService: localService!,
          pokemonService: _StubPokemonService(),
          tcgService: _StubTcgService(),
          profiles: profiles,
          scopes: scopes,
        ),
        child: MyApp(saveService: localService!),
      );

  PokemonApiProvider pokemonProvider(WidgetTester tester) => Provider.of<PokemonApiProvider>(
      tester.element(find.byType(PokedexScreen)),
      listen: false);

  /// Real time has to pass for Isar and SharedPreferences to finish, so waits
  /// poll rather than relying on pumpAndSettle.
  Future<void> until(WidgetTester tester, bool Function() condition,
      {int polls = 300}) async {
    for (var i = 0; i < polls && !condition(); i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
      await tester.pump();
    }
    expect(condition(), isTrue, reason: 'condition not met in time');
  }

  Future<void> tapToggle(WidgetTester tester, int pokemonId) async {
    final toggle = find.byKey(Key('caught-toggle-$pokemonId'));
    await until(tester, () => toggle.evaluate().isNotEmpty);
    await tester.tap(toggle);
    await tester.pump();
  }

  Future<void> selectScope(WidgetTester tester, String label) async {
    final chip = find.widgetWithText(ChoiceChip, label);
    await tester.ensureVisible(chip);
    await tester.tap(chip);
    await tester.pumpAndSettle();
  }

  Future<void> tapProfileButton(WidgetTester tester) async {
    await tester.tap(find.byKey(const Key('profile-button')));
    await tester.pumpAndSettle();
  }

  Future<void> switchToProfile(WidgetTester tester, String name) async {
    await tapProfileButton(tester);
    await tester.tap(find.widgetWithText(ListTile, name));
    await tester.pumpAndSettle();
  }

  // One database for the file: Isar refuses a second open of the same name.
  // Each test gets a fresh profile instead of a fresh database.
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    localService ??= await IsarService.create();
  });

  testWidgets(
      'caught Pokemon belong to the profile that caught them, and each profile '
      'is restored after a relaunch', (tester) async {
    final profiles = await tester.runAsync(loadProfiles) as ProfileProvider;
    final scopes = await tester.runAsync(() => loadScopes(profiles)) as ScopeProvider;
    await tester.pumpWidget(buildApp(profiles, scopes));
    await until(tester, () => pokemonProvider(tester).allPokemon.length == 3);

    expect(find.text('Trainer 1'), findsOneWidget,
        reason: 'a fresh install starts in the default profile');

    // The first launch shows derived National, which can't be toggled. Pick
    // the profile's own National to mark anything.
    await until(tester, () => find.text('National (manual)').evaluate().isNotEmpty);
    await selectScope(tester, 'National (manual)');

    // Trainer 1 catches Pikachu.
    await tapToggle(tester, 25);
    await until(tester, () => pokemonProvider(tester).allPokemon[25]!.isCaught);

    // A new profile starts with nothing caught, and switches to itself.
    await tapProfileButton(tester);
    await tester.tap(find.text('New profile'));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.descendant(
            of: find.byType(AlertDialog), matching: find.byType(TextField)),
        'Misty');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();
    await until(tester, () => !pokemonProvider(tester).allPokemon[25]!.isCaught);
    expect(find.text('Misty'), findsOneWidget);
    await selectScope(tester, 'National (manual)');

    // Misty catches Bulbasaur, and her caught state is separate from Trainer 1's.
    await tapToggle(tester, 1);
    await until(tester, () => pokemonProvider(tester).allPokemon[1]!.isCaught);

    // Back to Trainer 1: Pikachu caught, Bulbasaur not.
    await switchToProfile(tester, 'Trainer 1');
    await until(tester, () => pokemonProvider(tester).allPokemon[25]!.isCaught);
    expect(pokemonProvider(tester).allPokemon[1]!.isCaught, isFalse);
    expect(find.text('Trainer 1'), findsOneWidget);

    // Relaunch: a new provider graph on the same database. The active profile
    // and its caught state come back.
    await tester.pumpWidget(const SizedBox.shrink());
    final relaunched = await tester.runAsync(loadProfiles) as ProfileProvider;
    final relaunchedScopes = await tester.runAsync(() => loadScopes(relaunched)) as ScopeProvider;
    await tester.pumpWidget(buildApp(relaunched, relaunchedScopes));
    await until(tester, () => pokemonProvider(tester).allPokemon.length == 3);
    await until(tester, () => pokemonProvider(tester).allPokemon[25]!.isCaught);

    expect(find.text('Trainer 1'), findsOneWidget);
    expect(pokemonProvider(tester).allPokemon[1]!.isCaught, isFalse);
  });

  testWidgets(
      'derived National refuses a toggle and says why; a game shows only its own '
      'Pokedex', (tester) async {
    final profiles = await tester.runAsync(() async {
      final loaded = await loadProfiles();
      // A profile nothing has been caught in yet, so derived National is empty.
      await loaded.createProfile('Fresh ${DateTime.now().microsecondsSinceEpoch}');
      return loaded;
    }) as ProfileProvider;
    final scopes = await tester.runAsync(() => loadScopes(profiles)) as ScopeProvider;
    await tester.pumpWidget(buildApp(profiles, scopes));
    await until(tester, () => pokemonProvider(tester).allPokemon.length == 3);
    await until(tester, () => pokemonProvider(tester).games.isNotEmpty);

    // A fresh profile starts on derived National: a toggle is refused with a hint.
    await tapToggle(tester, 25);
    const hint = 'Choose a game or National (manual) to mark this Pokemon.';
    // Offline PokeAPI errors each queue a SnackBar ahead of this one, so wait long enough for it to surface.
    await until(tester, () => find.text(hint).evaluate().isNotEmpty, polls: 3000);
    expect(pokemonProvider(tester).allPokemon[25]!.isCaught, isFalse);

    // In the game, Charmander is not in the Pokedex, so it is not shown at all.
    await selectScope(tester, 'Red / Blue');
    await until(tester, () => pokemonProvider(tester).isVisibleInScope(25));
    expect(find.byKey(const Key('caught-toggle-4')), findsNothing);
    expect(find.byKey(const Key('caught-toggle-25')), findsOneWidget);

    await tapToggle(tester, 25);
    await until(tester, () => pokemonProvider(tester).allPokemon[25]!.isCaught);
    expect(pokemonProvider(tester).caughtInGameNames(25), ['Red / Blue']);
  });
}
