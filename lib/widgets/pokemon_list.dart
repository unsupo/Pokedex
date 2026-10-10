import 'package:flutter/material.dart';
import '../models/pokeapi/pokemon.dart';
import 'pokemon_list_item.dart';

class PokemonList extends StatefulWidget {
  final List<Pokemon> pokemonList;

  /// Shared with `_PokedexScreenState`, which creates it: without this, a
  /// call like `.animateTo()` on that controller has no attached
  /// `Scrollable` and is silently a no-op (see
  /// docs/features/home-recenter.md).
  final ScrollController scrollController;

  /// Fixed row height. A fixed extent lets the re-center-on-Home logic (see
  /// docs/features/home-recenter.md) compute a target scroll offset
  /// directly (`index * itemExtent`) for a row that may be far outside what
  /// this lazily-built `ListView` currently has on screen, where there is no
  /// `BuildContext` for that row to call `Scrollable.ensureVisible` on.
  static const double itemExtent = 80.0;

  const PokemonList({
    super.key,
    required this.pokemonList,
    required this.scrollController,
  });

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemExtent: PokemonList.itemExtent,
      itemCount: widget.pokemonList.length,
      itemBuilder: (context, index) {
        return PokemonListItem(
          pokemonId: widget.pokemonList[index].id,
        );
      },
    );
  }
}
