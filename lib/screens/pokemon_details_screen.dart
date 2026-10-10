import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokeapi/moves.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart' hide Icons;
import 'package:pokedex_app/screens/ability_screen.dart';
import 'package:pokedex_app/screens/card_binder_screen.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:pokedex_app/widgets/pokemon_details/moves_table.dart';
import 'package:provider/provider.dart';
import '../models/pokeapi/pokemon.dart';

// Hide the Icons class
import '../models/tcg_card.dart';

import '../utils/string_utils.dart';
import '../utils/tcg_price_util.dart';
import '../widgets/pokemon_details/evolution_chain_widget.dart';
import '../widgets/pokemon_details/stat_bar.dart';
import '../widgets/pokemon_details/type_chart.dart';
import '../widgets/scope/card_caught_toggle.dart';
import '../widgets/scope/caught_in_games.dart';
import '../widgets/scope/caught_toggle.dart';
import '../widgets/type_pill.dart';
import 'catch_screen.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final int pokemonId;

  const PokemonDetailsScreen({super.key, required this.pokemonId});

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Pokemon pokemon;
  late final Future<List<TcgCard>?> _tcgCardsFuture;
  Offset? _dragStart;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Keep UiStateProvider.tabIndex in sync with swipe-driven tab changes,
    // not just the TabBar's onTap. Without this, didChangeDependencies below
    // (which restores _tabController.index from UiStateProvider on every
    // rebuild, including ones triggered by unrelated provider updates
    // elsewhere in the app) would snap the view back to whatever tab was
    // last tapped, discarding a swipe the user just made.
    _tabController.addListener(_syncTabIndexListener);
    _tcgCardsFuture = Provider.of<TcgApiProvider>(context, listen: false)
        .getPokemonCards(widget.pokemonId);
    // Jump this Pokemon's own details/species/evolution-chain/moves ahead of
    // the background bulk-sync queue, instead of waiting for their turn
    // behind potentially thousands of unrelated pending requests.
    Provider.of<PokemonApiProvider>(context, listen: false)
        .ensurePriorityDataLoaded(widget.pokemonId);
  }

  void _syncTabIndexListener() {
    if (!_tabController.indexIsChanging) {
      Provider.of<UiStateProvider>(context, listen: false)
          .setTabIndex(_tabController.index);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newIndex = context.watch<UiStateProvider>().tabIndex;
    if (_tabController.index != newIndex) {
      _tabController.removeListener(_syncTabIndexListener);
      _tabController.index = newIndex;
      _tabController.addListener(_syncTabIndexListener);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_syncTabIndexListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final foundPokemon =
        context.watch<PokemonApiProvider>().allPokemon[widget.pokemonId];
    if (foundPokemon == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    pokemon = foundPokemon;
    final isCaught = context
            .watch<PokemonApiProvider>()
            .allPokemon[widget.pokemonId]
            ?.isCaught ??
        false;
    final allPokemon = context.watch<PokemonApiProvider>().allPokemon;
    final previousPokemon =
        widget.pokemonId > 0 ? allPokemon[widget.pokemonId - 1] : null;
    final nextPokemon = widget.pokemonId < allPokemon.length - 1
        ? allPokemon[widget.pokemonId + 1]
        : null;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 60,
        height: 180, // Increased height to accommodate more icons
        child: FloatingActionButton(
          onPressed: () {},
          heroTag: 'pokeballAndHomeBtn',
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded( // Use Expanded to distribute space evenly
                flex: 1, // Optional: Adjust flex for proportional sizing
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return PokemonCatchScreen(pokemonId: pokemon.id);
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: const Center(
                      // This opens the Catch screen, not navigation - it was
                      // copy-pasted from the "go home" button below and never
                      // updated, so both ended up showing Icons.home.
                      child: Icon(Icons.catching_pokemon, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ),
              Expanded( // Use Expanded for the Pokeball
                flex: 1,
                child: GestureDetector(
                  onTap: () => toggleCaught(context, pokemon.id, !pokemon.isCaught),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: ColorFiltered(
                        colorFilter: isCaught
                            ? const ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.multiply,
                        )
                            : const ColorFilter.matrix(
                          <double>[
                            0.2126, 0.7152, 0.0722, 0, 0,
                            0.2126, 0.7152, 0.0722, 0, 0,
                            0.2126, 0.7152, 0.0722, 0, 0,
                            0, 0, 0, 1, 0,
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/pokeball.png',
                          width: 40, // Slightly smaller image
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded( // New Icon 1
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    // Action for icon 1
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(
                      child: Icon(Icons.add, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ),
              Expanded( // New Icon 2
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    // Action for icon 2
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(
                      child: Icon(Icons.settings, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ),
              Expanded( // New Icon 3
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                    ),
                    child: const Center(
                      child: Icon(Icons.home, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // NestedScrollView + a pinned SliverAppBar/FlexibleSpaceBar ties the
      // portrait-shrinks-into-header collapse directly to the scroll offset
      // every frame (via the sliver protocol), instead of the previous
      // approach of flipping a boolean at a fixed scroll threshold and
      // cross-fading two separate image widgets on a fixed 300ms timer -
      // which is what made it feel disconnected from the actual scroll
      // gesture. Each tab below owns its own inner scroll position (via
      // SliverOverlapInjector), which also fixes a latent bug where both
      // tabs previously shared one ScrollController despite TabBarView
      // building both tabs' widgets simultaneously.
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: true,
                expandedHeight: 260,
                centerTitle: true,
                // A plain title (rather than FlexibleSpaceBar.title) always
                // renders in the toolbar row next to leading/actions -
                // SliverAppBar automatically fades it in as the header
                // collapses. FlexibleSpaceBar.title instead repositions
                // itself relative to the *whole* app bar including `bottom`,
                // which put it inside the TabBar's row instead of the
                // toolbar row.
                // A small sprite lives here (in the toolbar row, always
                // visible) as well as large in flexibleSpace.background (the
                // part that shrinks away as you scroll) - that's what makes
                // the portrait actually *become* the header icon instead of
                // just fading out to nothing once collapsed.
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      fadeInDuration: Duration.zero,
                      placeholder: (context, url) => const SizedBox(width: 28),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.catching_pokemon,
                        size: 28,
                        color: Colors.grey,
                      ),
                      width: 28,
                      height: 28,
                      memCacheWidth: 56,
                      memCacheHeight: 56,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '#${pokemon.id} ${capitalizeFirstLetter(pokemon.name)}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                leading: previousPokemon == null
                    ? null
                    : GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonDetailsScreen(
                                  pokemonId: previousPokemon.id),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(
                                '#${previousPokemon.id}',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 4),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: previousPokemon.imageUrl,
                                    fadeInDuration: Duration.zero,
                                    placeholder: (context, url) => SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.catching_pokemon,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    width: 20,
                                    memCacheWidth: 40,
                                    memCacheHeight: 40,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    capitalizeFirstLetter(
                                        sanitizeName(previousPokemon.name)),
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                leadingWidth: previousPokemon != null ? 100 : 56,
                actions: [
                  // Entry point into the card binder (see
                  // docs/features/card-binder.md) - only on the TCG Details
                  // tab, where it opens already turned to this Pokemon's page.
                  if (_tabController.index == 1)
                    IconButton(
                      key: const Key('open-card-binder'),
                      tooltip: 'Open card binder',
                      icon: const Icon(Icons.collections_bookmark_outlined),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardBinderScreen(
                                scrollToPokemonId: widget.pokemonId),
                          ),
                        );
                      },
                    ),
                  if (nextPokemon != null)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PokemonDetailsScreen(pokemonId: nextPokemon.id),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Text(
                              '#${nextPokemon.id}',
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 4),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: nextPokemon.imageUrl,
                                  fadeInDuration: Duration.zero,
                                  placeholder: (context, url) => SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.catching_pokemon,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  width: 20,
                                  memCacheWidth: 40,
                                  memCacheHeight: 40,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  capitalizeFirstLetter(
                                      sanitizeName(nextPokemon.name)),
                                  style: const TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  // background renders behind the pinned toolbar/bottom, from
                  // y=0 down to expandedHeight, shrinking away as you scroll
                  // - it doesn't need to dodge the toolbar row itself, just
                  // needs to comfortably fit within expandedHeight (260) once
                  // the always-present toolbar (56) and TabBar (48) are
                  // accounted for, hence the modest image size here.
                  background: Padding(
                    padding: const EdgeInsets.only(top: kToolbarHeight),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: pokemon.imageUrl,
                        fadeInDuration: Duration.zero,
                        placeholder: (context, url) => SizedBox(
                          width: 130,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.catching_pokemon,
                          size: 130,
                          color: Colors.grey,
                        ),
                        width: 130,
                        memCacheWidth: 260,
                        memCacheHeight: 260,
                      ),
                    ),
                  ),
                ),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Game Details"),
                    Tab(text: "TCG Details"),
                  ],
                  onTap: (index) {
                    Provider.of<UiStateProvider>(context, listen: false)
                        .setTabIndex(index);
                  },
                ),
              ),
            ),
          ];
        },
        // Horizontal swipe now means "go to another Pokemon," not "switch
        // tabs" - switching Game Details/TCG Details is tap-only (via the
        // TabBar above). Swiping right-to-left (leftward) goes to the next
        // (higher #) Pokemon; swiping left-to-right (rightward) goes to the
        // previous (lower #) one - matching the standard "swipe left to
        // advance" convention, independent of which tab is currently active.
        //
        // Listener (not GestureDetector.onHorizontalDragEnd) deliberately -
        // a real finger swipe always has some vertical drift, and a
        // horizontal-drag GestureDetector competes with NestedScrollView's
        // vertical scroll recognizer in the gesture arena, so it can lose
        // that fight on an imperfectly-horizontal real swipe even though a
        // synthetic, perfectly-horizontal test swipe works fine. Listener
        // doesn't participate in the arena - it always sees raw pointer
        // events - so tracking start/end position by hand here is more
        // reliable than depending on which recognizer the arena picks.
        body: Listener(
          onPointerDown: (event) => _dragStart = event.position,
          onPointerUp: (event) {
            final start = _dragStart;
            _dragStart = null;
            if (start == null) return;
            final delta = event.position - start;
            // Require a clearly horizontal, deliberate swipe so an ordinary
            // vertical scroll (or a diagonal flick) doesn't misfire this.
            if (delta.dx.abs() < 60 || delta.dx.abs() < delta.dy.abs() * 1.5) {
              return;
            }
            if (delta.dx < 0 && nextPokemon != null) {
              // Right-to-left (leftward) swipe -> next Pokemon.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PokemonDetailsScreen(pokemonId: nextPokemon.id),
                ),
              );
            } else if (delta.dx > 0 && previousPokemon != null) {
              // Left-to-right (rightward) swipe -> previous Pokemon.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PokemonDetailsScreen(pokemonId: previousPokemon.id),
                ),
              );
            }
          },
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              pokemon.isLoadingDetails
                  ? Center(child: CircularProgressIndicator())
                  : pokemon.details != null
                      ? _buildGameDetailsTab(pokemon)
                      : Center(child: Text("Details not available")),
              _buildTcgDetailsTab(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Wraps [child] with the SliverOverlapInjector NestedScrollView requires
  /// on every scrollable in its body, so this tab's content scrolls in sync
  /// with (and can push under) the pinned, collapsing SliverAppBar above it.
  Widget _buildTabScrollView(Widget child) {
    return Builder(builder: (context) {
      return CustomScrollView(
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverToBoxAdapter(child: child),
        ],
      );
    });
  }

  /// A titled, icon-headed card wrapping one section of the details tab -
  /// gives the whole tab consistent visual rhythm (elevation, rounded
  /// corners, spacing) instead of a flat stack of bare Text widgets.
  Widget _sectionCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  /// A small icon + label + value row, used for the plain facts inside
  /// Pokédex Data/Training/Breeding (previously bare, unstyled Text lines).
  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text('$label: ', style: TextStyle(color: Colors.grey[700])),
          Expanded(
            child: Text(value,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildGameDetailsTab(Pokemon pokemon) {
    final evYieldStat = pokemon.details?.stats?.firstWhere(
      (s) => s.effort != 0,
      orElse: () => StatInfo(),
    );
    final hasEvYield = evYieldStat?.effort != null && evYieldStat!.effort != 0;
    final typeNames = (pokemon.details?.types ?? [])
        .map((t) => t.type?.name)
        .whereType<String>()
        .toList();
    final totalBaseStat =
        pokemon.details?.stats?.fold(0, (sum, stat) => sum + (stat.baseStat ?? 0));

    return _buildTabScrollView(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionCard(
              icon: Icons.auto_awesome,
              title: 'Pokédex Data',
              children: [
                _infoRow(Icons.tag, 'National No', '${pokemon.details?.id}'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.category, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text('Type: ', style: TextStyle(color: Colors.grey[700])),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: typeNames
                            .map((name) => TypePill(type: name))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                _infoRow(
                  Icons.height,
                  'Height',
                  '${(pokemon.details?.height ?? 0) / 10} m (${((pokemon.details?.height ?? 0) / 10 * 3.28084).toStringAsFixed(2)} ft)',
                ),
                _infoRow(
                  Icons.monitor_weight_outlined,
                  'Weight',
                  '${(pokemon.details?.weight ?? 0) / 10} kg (${((pokemon.details?.weight ?? 0) / 10 * 2.20462).toStringAsFixed(2)} lb)',
                ),
                const SizedBox(height: 8),
                _buildAbilitiesWidget(context, pokemon.details?.abilities),
              ],
            ),
            _sectionCard(
              icon: Icons.fitness_center,
              title: 'Training',
              children: [
                if (hasEvYield)
                  _infoRow(Icons.trending_up, 'EV Yield',
                      '${evYieldStat.effort} ${evYieldStat.stat?.name}'),
                _infoRow(Icons.military_tech, 'Base Exp.',
                    '${pokemon.details?.baseExperience}'),
              ],
            ),
            _sectionCard(
              icon: Icons.egg_outlined,
              title: 'Breeding',
              children: [
                _infoRow(Icons.wc, 'Gender Rate',
                    '${pokemon.species?.genderRate}'),
                _infoRow(Icons.timer_outlined, 'Hatch Counter',
                    '${pokemon.species?.hatchCounter}'),
              ],
            ),
            _sectionCard(
              icon: Icons.bar_chart,
              title: 'Base Stats',
              children: [
                for (var stat in pokemon.details?.stats ?? [])
                  StatBar(
                    label: stat.stat.name,
                    value: stat.baseStat,
                  ),
                const SizedBox(height: 8),
                Row(children: [
                  const SizedBox(
                    width: 70,
                    child: Text(
                      "Total",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '$totalBaseStat',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ))
                ]),
              ],
            ),
            _sectionCard(
              icon: Icons.grid_view,
              title: 'Type Chart',
              children: [
                TypeChart(
                  types: pokemon.details!.types ?? [],
                  isWonderGuard: pokemon.details?.abilities?.firstOrNull?.ability
                          ?.name ==
                      'wonder-guard',
                ),
              ],
            ),
            _sectionCard(
              icon: Icons.catching_pokemon,
              title: 'Caught In',
              children: [
                CaughtInGames(
                    gameNames: context
                        .watch<PokemonApiProvider>()
                        .caughtInGameNames(pokemon.id),
                    gamesLoaded:
                        context.watch<PokemonApiProvider>().gamesLoaded),
              ],
            ),
            _sectionCard(
              icon: Icons.change_circle_outlined,
              title: 'Evolution Chain',
              children: [_buildEvolutionChainSection(pokemon)],
            ),
            _sectionCard(
              icon: Icons.list_alt,
              title: 'Level Up Moves',
              children: [_buildMovesSection(pokemon, context)],
            ),
            // TODO location api /pokemon/{id}/encounters
          ],
        ),
      ),
    );
  }

  Widget _buildAbilitiesWidget(
      BuildContext context, List<AbilityName?>? abilities) {
    return Column(children: [
      ListTile(
        title: const Text(
          "Abilities",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: abilities == null || abilities.isEmpty
            ? const Text("No Abilities",
                style: TextStyle(fontStyle: FontStyle.italic))
            : Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: abilities.map((a) {
                  return InkWell(
                      onTap: () {
                        final abilityId = a?.ability?.id;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AbilityScreen(abilityId: abilityId),
                          ),
                        );
                      },
                      child: Chip(
                        label: Text(
                          "${a?.ability?.name ?? ''} ${a?.isHidden ?? false ? '(hidden)' : ''}",
                          style: TextStyle(
                              color: a?.isHidden ?? false
                                  ? Colors.grey[600]
                                  : Colors.blue,
                              fontSize: a?.isHidden ?? false ? 12 : 14),
                        ),
                      ));
                }).toList(),
              ),
      )
    ]);
  }

  // Helper method to build the evolution chain section
  Widget _buildMovesSection(Pokemon pokemon, BuildContext context) {
    Map<int, Move> allMoves = context.watch<PokemonApiProvider>().allMoves;
    bool isLoading = context.watch<PokemonApiProvider>().isLoadingMoves;
    if (pokemon.details == null ||
        pokemon.details?.moves == null ||
        allMoves.isEmpty ||
        isLoading) {
      // Evolution chain is still loading or not fetched yet
      return Center(child: CircularProgressIndicator());
    } else {
      // Pokemon has an evolution chain
      return SizedBox(
          child:
              MovesTable(moves: pokemon.details!.moves!, allMoves: allMoves));
    }
  }

  // Helper method to build the evolution chain section
  Widget _buildEvolutionChainSection(Pokemon pokemon) {
    if (pokemon.evolutionChain == null || pokemon.evolutionChain!.isLoading) {
      // Evolution chain is still loading or not fetched yet
      return Center(child: CircularProgressIndicator());
    } else if (!pokemon.hasEvolutions) {
      // Pokemon has no evolutions
      return SizedBox.shrink();
    } else {
      // Pokemon has an evolution chain
      return SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: EvolutionChainWidget(
            pokemon: pokemon,
          ),
        ),
      );
    }
  }

  Widget _buildTcgDetailsTab(BuildContext context) {
    final isLoading =
        context.watch<TcgApiProvider>().loadingPokemon[widget.pokemonId] ?? false;
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return _buildTabScrollView(
      FutureBuilder<List<TcgCard>?>(
          future: _tcgCardsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              final apiError = context.read<TcgApiProvider>().error;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 48),
                      SizedBox(height: 8),
                      Text(
                        'Failed to load TCG cards.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (apiError != null) ...[
                        SizedBox(height: 4),
                        Text(
                          apiError,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            } else {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                // Disable scrolling within GridView
                shrinkWrap: true,
                // Important when nested in a scrollable
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: snapshot.data!.length,
                // Use the length of your data
                itemBuilder: (context, index) {
                  final card = snapshot.data![index];
                  final isCaught = card.isCaught;
                  final priceEstimate = estimatedCardPrice(card);
                  return Card(
                    color: isCaught ? Colors.blue : Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          // Make the image take up available space
                          child: InkWell(
                            // Use InkWell for tap detection
                            onTap: () {
                              // Owning a card means owning the Pokemon, so
                              // catching one also catches the Pokemon - but
                              // only on the way to caught, and only when it
                              // isn't already (see card_caught_toggle.dart).
                              toggleCardCaught(
                                context,
                                card,
                                widget.pokemonId,
                                pokemonAlreadyCaught: context
                                        .read<PokemonApiProvider>()
                                        .allPokemon[widget.pokemonId]
                                        ?.isCaught ??
                                    false,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // images (and images.small) are nullable on
                              // TcgCard - some cards (promos, certain error
                              // cases) come back from the API without an
                              // images object at all, so this can't be
                              // force-unwrapped without crashing the tab.
                              child: card.images?.small == null
                                  ? const Center(
                                      child: Icon(
                                        Icons.catching_pokemon,
                                        size: 64,
                                        color: Colors.grey,
                                      ),
                                    )
                                  // CachedNetworkImage (not Image.network) so
                                  // card art is cached to disk/memory like
                                  // every other image in the app - previously
                                  // reopening this tab re-downloaded every
                                  // card image from scratch every time.
                                  : CachedNetworkImage(
                                      imageUrl: card.images!.small!,
                                      fit: BoxFit.contain,
                                      // Grid cells are ~150-200 logical px
                                      // wide in this 2-column layout; card
                                      // art is much larger than that.
                                      memCacheWidth: 400,
                                      progressIndicatorBuilder: (context, url,
                                              progress) =>
                                          Center(
                                        child: CircularProgressIndicator(
                                          value: progress.progress,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 6),
                          child: Text(
                            priceEstimate ?? 'Price: N/A',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: isCaught ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
