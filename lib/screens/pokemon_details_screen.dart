import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokeapi/moves.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart' hide Icons;
import 'package:pokedex_app/screens/ability_screen.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:pokedex_app/widgets/pokemon_details/moves_table.dart';
import 'package:provider/provider.dart';
import '../models/pokeapi/pokemon.dart';

// Hide the Icons class
import '../models/tcg_card.dart';

import '../utils/string_utils.dart';
import '../widgets/pokemon_details/evolution_chain_widget.dart';
import '../widgets/pokemon_details/stat_bar.dart';
import '../widgets/pokemon_details/type_chart.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController = TabController(length: 2, vsync: this, initialIndex: context.watch<UiStateProvider>().tabIndex);
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TcgApiProvider>(context, listen: false)
          .getPokemonCards(widget.pokemonId);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController.index = context.watch<UiStateProvider>().tabIndex;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    bool shouldShowMainImage = _scrollController.offset < 100  &&
        context.read<UiStateProvider>().tabIndex == 0;
    Provider.of<UiStateProvider>(context, listen: false).setShowMainImage(shouldShowMainImage);
  }

  @override
  Widget build(BuildContext context) {
    pokemon = context.watch<PokemonApiProvider>().allPokemon[widget.pokemonId]!;
    final isCaught = context
            .watch<PokemonApiProvider>()
            .allPokemon[widget.pokemonId]
            ?.isCaught ??
        false;
    final allPokemon = context.watch<PokemonApiProvider>().allPokemon;
    bool showMainImage = context.watch<UiStateProvider>().showMainImage;
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
                      child: Icon(Icons.home, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ),
              Expanded( // Use Expanded for the Pokeball
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<PokemonApiProvider>(context, listen: false)
                        .isCaught(pokemon.id, !pokemon.isCaught);
                  },
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
      appBar: AppBar(
        title: showMainImage
            ? Text(
                '#${pokemon.id} ${capitalizeFirstLetter(pokemon.name)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center the title content
                mainAxisSize: MainAxisSize.min,
                // Make the Row take minimum space
                children: [
                  AnimatedOpacity(
                    opacity: showMainImage ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 300),
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      fadeInDuration: Duration.zero,
                      placeholder: (context, url) => SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.catching_pokemon,
                        size: 20,
                        color: Colors.grey,
                      ),
                      width: 20,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('#${pokemon.id} ${capitalizeFirstLetter(pokemon.name)}'),
                ],
              ),
        centerTitle: true,
        // Center the AppBar title
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (previousPokemon != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokemonDetailsScreen(
                              pokemonId: previousPokemon.id),
                        ),
                      );
                    },
                    child: Row(children: [
                      Text(
                        '#${previousPokemon.id}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: previousPokemon.imageUrl,
                            fadeInDuration: Duration.zero,
                            placeholder: (context, url) => SizedBox(
                              width: 20,
                              height: 20,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.catching_pokemon,
                              // Display Pokeball icon
                              size: 20,
                              color: Colors.grey,
                            ),
                            width: 20,
                          ),
                          SizedBox(height: 4),
                          Text(
                            capitalizeFirstLetter(
                                sanitizeName(previousPokemon.name)),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ])),
              ),
          ],
        ),
        leadingWidth: previousPokemon != null ? 100 : 56,
        // Adjust width based on content
        actions: [
          if (nextPokemon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailsScreen(pokemonId: nextPokemon.id),
                      ),
                    );
                  },
                  child: Row(children: [
                    Text(
                      '#${nextPokemon.id}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: nextPokemon.imageUrl,
                          fadeInDuration: Duration.zero,
                          placeholder: (context, url) => SizedBox(
                            width: 20,
                            height: 20,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.catching_pokemon, // Display Pokeball icon
                            size: 20,
                            color: Colors.grey,
                          ),
                          width: 20,
                        ),
                        SizedBox(height: 4),
                        Text(
                          capitalizeFirstLetter(sanitizeName(nextPokemon.name)),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ])),
            ),
        ],
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: showMainImage ? null : 0,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Center(
                  child: AnimatedOpacity(
                    opacity: showMainImage ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      fadeInDuration: Duration.zero,
                      placeholder: (context, url) => SizedBox(
                        width: 200,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.catching_pokemon, // Display Pokeball icon
                        size: 200,
                        color: Colors.grey,
                      ),
                      width: 200,
                    ),
                  ),
                ),
                // Removed Text widget for large Pokemon name
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Game Details"),
              Tab(text: "TCG Details"),
            ],
            onTap: (index) {
              Provider.of<UiStateProvider>(context, listen: false).setTabIndex(index);
            },
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
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
        ],
      ),
    );
  }

  Widget _buildGameDetailsTab(Pokemon pokemon) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!context.watch<UiStateProvider>().showMainImage)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      fadeInDuration: Duration.zero,
                      placeholder: (context, url) => SizedBox(
                        width: 40,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.catching_pokemon, // Display Pokeball icon
                        size: 40,
                        color: Colors.grey,
                      ),
                      width: 40,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '#${pokemon.id} ${capitalizeFirstLetter(pokemon.name)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            // Pokedex Data Section
            Text("Pokédex Data",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("National No ${pokemon.details?.id}"),
            Text(
                "Type ${pokemon.details?.types?.map((t) => t.type?.name).toString()}"),

            Text(
                "Height ${(pokemon.details?.height ?? 0) / 10} m (${((pokemon.details?.height ?? 0) / 10 * 3.28084).toStringAsFixed(2)} ft)"),
            Text(
                "Weight ${(pokemon.details?.weight ?? 0) / 10} kg (${((pokemon.details?.weight ?? 0) / 10 * 2.20462).toStringAsFixed(2)} lb)"),

            _buildAbilitiesWidget(context, pokemon.details?.abilities),
            SizedBox(height: 24),

            // Training Section
            Text("Training",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            Text(
                "EV yield: ${pokemon.details?.stats?.firstWhere((s) => s.effort != 0).effort} ${pokemon.details?.stats?.firstWhere((s) => s.effort != 0).stat?.name}"),
            // Text('Catch rate: ${details}'), // TODO implement pokemon species
            // Text('Base Friendship: ${details.}'),
            Text("Base Exp.: ${pokemon.details?.baseExperience}"),
            // Text('Growth Rate: ${details.baseExperience}'), // species

            SizedBox(height: 24),

            // Breeding Section
            Text("Breeding",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            // egg groups is in pokemon species
            // gender rates
            Text("Gender Rate ${pokemon.species?.genderRate}"),
            // hatch counter
            Text("Hatch Counter ${pokemon.species?.hatchCounter}"),
            // ... Add breeding data (you might need to fetch this from the species endpoint)

            SizedBox(height: 24),

            // Base Stats Section
            Text("Base Stats",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            for (var stat in pokemon.details?.stats ?? [])
              StatBar(
                label: stat.stat.name,
                value: stat.baseStat,
              ),
            SizedBox(height: 8),
            Row(children: [
              SizedBox(
                width: 70, // Adjust label width as needed
                child: Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  child: Text(
                    '${pokemon.details?.stats?.fold(0, (sum, stat) => sum + (stat.baseStat ?? 0))}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ]),
            SizedBox(height: 24),

            // Type Chart Section
            Text("Type Chart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TypeChart(
              types: pokemon.details!.types ?? [],
              isWonderGuard:
                  pokemon.details?.abilities?.firstOrNull?.ability?.name ==
                      'wonder-guard',
            ),

            SizedBox(height: 24),

            // Evolution Chain Section
            Text("Evolution Chain",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildEvolutionChainSection(pokemon),

            Text("Level Up Moves",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildMovesSection(pokemon, context),
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
    bool? isLoading =
        context.watch<TcgApiProvider>().loadingPokemon[widget.pokemonId];
    if (isLoading == null || isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return FutureBuilder<List<TcgCard>?>(
          future:
              context.read<TcgApiProvider>().getPokemonCards(widget.pokemonId),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                controller: _scrollController,
                child: GridView.builder(
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
                    return Card(
                      color: (snapshot.data == null ? false : snapshot.data![index].userData?.isCaught??false) ? Colors.blue : Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            // Make the image take up available space
                            child: InkWell(
                              // Use InkWell for tap detection
                              onTap: () {
                                Provider.of<TcgApiProvider>(context, listen: false).setCaught(snapshot.data![index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  snapshot.data![index].images!.large ??
                                      'default_image_url',
                                  // Provide a default URL
                                  fit: BoxFit.contain,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return Icon(Icons.error);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          });
    }
  }
}
