import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/pokemon_api_provider.dart';
import '../services/ui_state_provider.dart';
import '../utils/pokemon_sort.dart';
import '../utils/search_query_parser.dart';
import 'filter_modal.dart';

/// Label shown in the sort menu for each [PokemonSort] value, in the fixed
/// order the menu lists them. See docs/features/list-sorting.md.
const Map<PokemonSort, String> _sortLabels = {
  PokemonSort.nameAscending: 'Name A-Z',
  PokemonSort.nameDescending: 'Name Z-A',
  PokemonSort.dexAscending: 'Dex # (low to high)',
  PokemonSort.dexDescending: 'Dex # (high to low)',
};

class PokemonSearchBar extends StatefulWidget {
  final ScrollController scrollController;

  const PokemonSearchBar({super.key, required this.scrollController});

  @override
  _PokemonSearchBarState createState() => _PokemonSearchBarState();
}

class _PokemonSearchBarState extends State<PokemonSearchBar> {
  late final TextEditingController _searchController; // Use late
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(); // Initialize in initState
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.removeListener(_onSearchChanged); // Remove listener
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      _filterPokemon(context.read<PokemonApiProvider>().currentFilters);
    });
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
    final parsed = parseSearchQuery(_searchController.text);
    pokemonData.filterPokemon(parsed.fuzzyTerm, filters, stages: parsed.stages);
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
                hintText: 'type, move, ability… or stage:1',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _debounce?.cancel();
                    _searchController.clear();
                    _resetScrollPosition();
                    _filterPokemon({}); // Clear filters as well
                  },
                ),
              ),
            ),
          ),
          Text("${context.watch<PokemonApiProvider>().filteredPokemonCount}"),
          PopupMenuButton<PokemonSort>(
            icon: const Icon(Icons.sort),
            tooltip: 'Sort Pokemon list',
            onSelected: (sort) {
              context.read<UiStateProvider>().setSort(sort);
              context.read<PokemonApiProvider>().updateSort(sort);
            },
            itemBuilder: (context) {
              final current = context.read<UiStateProvider>().sort;
              return _sortLabels.entries
                  .map((entry) => CheckedPopupMenuItem<PokemonSort>(
                        value: entry.key,
                        checked: entry.key == current,
                        child: Text(entry.value),
                      ))
                  .toList();
            },
          ),
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