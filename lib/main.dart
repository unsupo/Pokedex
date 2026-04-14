import 'package:flutter/material.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:pokedex_app/services/tcg_service.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:pokedex_app/widgets/hamburger_menu.dart';
import 'services/local/isar_local_service.dart';
import 'services/local/local_service.dart';
import 'services/pokemon_service.dart';
import 'widgets/pokemon_list.dart';
import 'widgets/filter_section.dart';
import 'package:provider/provider.dart';

import 'widgets/pokemon_search_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final LocalService localService = await IsarService.create();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) =>
              TcgApiProvider(TcgService(localService), localService)),
      ChangeNotifierProvider(
          create: (_) =>
              PokemonApiProvider(PokemonService(localService), localService)),
      ChangeNotifierProvider(create: (_) => UiStateProvider(localService))
    ],
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

class _PokedexScreenState extends State<PokedexScreen> {
  final String _searchQuery = '';
  int? _selectedGeneration;
  final CaughtStatus _caughtStatus = CaughtStatus.all;
  final List<String> _selectedTypes = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PokemonApiProvider>(context, listen: false).fetchData();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // _fetchMorePokemon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      drawer: const HamburgerMenu(), // Add the hamburger menu here
      body: Column(
        children: [
          PokemonSearchBar(scrollController: _scrollController,),
          Expanded(
            child: context.watch<PokemonApiProvider>().isLoadingPokemon &&
                    context.watch<PokemonApiProvider>().filteredPokemon.isEmpty
                ? Center(child: CircularProgressIndicator())
                : PokemonList(
                    pokemonList:
                        context.watch<PokemonApiProvider>().filteredPokemon,
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
