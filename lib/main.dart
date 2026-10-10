import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex_app/app_providers.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/active_profile_store.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';
import 'package:pokedex_app/services/profiles/scope_store.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:pokedex_app/services/backup_notice.dart';
import 'package:pokedex_app/services/pokemon_tcg_api_service.dart';
import 'package:pokedex_app/widgets/backup_notice.dart';
import 'package:pokedex_app/widgets/hamburger_menu.dart';
import 'package:pokedex_app/widgets/profile/profile_menu.dart';
import 'package:pokedex_app/widgets/scope/scope_selector_bar.dart';
import 'services/local/isar_local_service.dart';
import 'services/local/local_service.dart';
import 'services/poke_api_pokemon_service.dart';
import 'utils/scroll_center_math.dart';
import 'widgets/pokemon_list.dart';
import 'package:provider/provider.dart';

import 'widgets/pokemon_search_bar.dart';

/// Observes route pushes/pops so `_PokedexScreenState` can tell when a route
/// (the details screen) is popped back to it, whether via the Home
/// shortcut's `popUntil` or an ordinary back - see
/// docs/features/home-recenter.md. Registered on
/// `MaterialApp.navigatorObservers` below.
final RouteObserver<ModalRoute<void>> pokedexRouteObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // .env is gitignored (see .env.example for the expected keys) - falls back
  // to an empty environment if it's missing rather than crashing, so a fresh
  // clone still runs (just without a TCG API key, which the API tolerates at
  // a lower rate limit - see PokemonTcgApiService).
  await dotenv.load(fileName: '.env', isOptional: true);
  final LocalService localService = await IsarService.create(
      onLegacyCaughtData: BackupNotice.markPending);
  final profiles = ProfileProvider(
    LocalServiceProfileRepository(localService),
    SharedPreferencesActiveProfileStore(),
  );
  await profiles.load();
  final scopes = ScopeProvider(profiles, SharedPreferencesScopeStore());
  await scopes.load();
  runApp(MultiProvider(
    providers: buildAppProviders(
      localService: localService,
      pokemonService: PokeApiPokemonService(localService),
      tcgService: PokemonTcgApiService(localService),
      profiles: profiles,
      scopes: scopes,
    ),
    child: MyApp(saveService: localService),
  ));
  // runApp(MyApp(saveService: await IsarService.create())); // Pass save service to MyApp
}

class MyApp extends StatelessWidget {
  final LocalService saveService;

  const MyApp({super.key, required this.saveService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      navigatorObservers: [pokedexRouteObserver],
      home: PokedexScreen(saveService: saveService),
    );
  }
}

class PokedexScreen extends StatefulWidget {
  final LocalService saveService;

  const PokedexScreen({super.key, required this.saveService});

  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> with RouteAware {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PokemonApiProvider? _pokemonApiProvider;
  String? _lastShownError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _pokemonApiProvider = Provider.of<PokemonApiProvider>(context, listen: false)
        ..addListener(_showErrorIfAny);
      _pokemonApiProvider!.fetchData();
      showBackupNoticeIfPending(context,
          onOpenMenu: () => _scaffoldKey.currentState?.openDrawer());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null) {
      pokedexRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    pokedexRouteObserver.unsubscribe(this);
    _pokemonApiProvider?.removeListener(_showErrorIfAny);
    _scrollController.dispose();
    super.dispose();
  }

  /// Fires when a route pushed on top of this one (the details screen, via
  /// either the Home shortcut's `popUntil` or an ordinary back) is popped
  /// back to here. Re-centers the list on the Pokemon that was just being
  /// viewed - see docs/features/home-recenter.md.
  @override
  void didPopNext() {
    _recenterOnLastViewedPokemon();
  }

  void _recenterOnLastViewedPokemon() {
    final lastViewedId = Provider.of<UiStateProvider>(context, listen: false)
        .lastViewedPokemonId;
    if (lastViewedId == null || !_scrollController.hasClients) return;

    // The row's position in the *current* filtered/search result, not the
    // raw dex id - if it isn't present at all (e.g. a filter excluded it
    // while its details screen was open), there's nothing to center on.
    final filteredPokemon =
        Provider.of<PokemonApiProvider>(context, listen: false).filteredPokemon;
    final index = filteredPokemon.indexWhere((p) => p.id == lastViewedId);
    if (index == -1) return;

    final position = _scrollController.position;
    final targetOffset = centeredScrollOffset(
      index: index,
      itemExtent: PokemonList.itemExtent,
      viewportHeight: position.viewportDimension,
      maxScrollExtent: position.maxScrollExtent,
    );
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// Background fetch failures (a flaky network call for one move/ability/item
  /// out of thousands) only ever set [PokemonApiProvider.error] — nothing
  /// displayed it, so they failed silently. Surface each new one once.
  void _showErrorIfAny() {
    final error = _pokemonApiProvider?.error;
    if (error == null || error == _lastShownError || !mounted) return;
    _lastShownError = error;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pokedex'),
        actions: const [ProfileButton()],
      ),
      drawer: const HamburgerMenu(), // Add the hamburger menu here
      body: Column(
        children: [
          PokemonSearchBar(scrollController: _scrollController,),
          const ScopeSelectorBar(),
          Expanded(
            child: context.watch<PokemonApiProvider>().isLoadingPokemon &&
                    context.watch<PokemonApiProvider>().filteredPokemon.isEmpty
                ? Center(child: CircularProgressIndicator())
                : PokemonList(
                    pokemonList:
                        context.watch<PokemonApiProvider>().filteredPokemon,
                    scrollController: _scrollController,
                  ),
          ),
          if (context.watch<PokemonApiProvider>().isLoadingPokemon &&
              context.watch<PokemonApiProvider>().filteredPokemon.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
