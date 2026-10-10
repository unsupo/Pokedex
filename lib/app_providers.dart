import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/tcg_service.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// The app's provider graph. `main()` and the end-to-end tests both build the
/// app through this, so the wiring can't drift between them.
///
/// [profiles] and [scopes] must already be loaded. The other providers read
/// the active profile and scope when they are created and listen for changes.
List<SingleChildWidget> buildAppProviders({
  required LocalService localService,
  required PokemonService pokemonService,
  required TcgService tcgService,
  required ProfileProvider profiles,
  required ScopeProvider scopes,
}) {
  return [
    Provider<LocalService>.value(value: localService),
    ChangeNotifierProvider.value(value: profiles),
    ChangeNotifierProvider.value(value: scopes),
    ChangeNotifierProvider(
        create: (context) => TcgApiProvider(
            tcgService, localService, context.read<ProfileProvider>())),
    ChangeNotifierProvider(
        create: (context) => PokemonApiProvider(
            pokemonService,
            localService,
            context.read<ProfileProvider>(),
            context.read<ScopeProvider>(),
            GameCatalog(pokemonService))),
    ChangeNotifierProvider(create: (_) => UiStateProvider(localService)),
  ];
}
