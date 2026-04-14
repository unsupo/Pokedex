import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/pokemon_api_provider.dart';
import 'filter_modal.dart';

class PokemonSearchBar extends StatefulWidget {
  final ScrollController scrollController;

  const PokemonSearchBar({super.key, required this.scrollController});

  @override
  _PokemonSearchBarState createState() => _PokemonSearchBarState();
}

class _PokemonSearchBarState extends State<PokemonSearchBar> {
  late final TextEditingController _searchController; // Use late

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(); // Initialize in initState
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged); // Remove listener
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _filterPokemon(context.read<PokemonApiProvider>().currentFilters);
  }
  void _resetScrollPosition(){
    // Reset the scroll position
    if (widget.scrollController.hasClients) {
      widget.scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _filterPokemon(Map<Filters, dynamic> filters) {
    final pokemonData = Provider.of<PokemonApiProvider>(context, listen: false);
    pokemonData.filterPokemon(_searchController.text, filters);
    _resetScrollPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Pokemon',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _resetScrollPosition();
                    _filterPokemon({}); // Clear filters as well
                  },
                ),
              ),
            ),
          ),
          Text("${context.watch<PokemonApiProvider>().filteredPokemonCount}"),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => FilterModal(
                  onFilterSelected: _filterPokemon,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}