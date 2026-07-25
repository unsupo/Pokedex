import 'package:flutter/material.dart';
import '../models/pokeapi/pokemon.dart';
import 'pokemon_list_item.dart';

class PokemonList extends StatefulWidget {
  final List<Pokemon> pokemonList;

  const PokemonList({super.key, required this.pokemonList});

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.pokemonList.length,
      itemBuilder: (context, index) {
        return PokemonListItem(
          pokemonId: widget.pokemonList[index].id,
        );
      },
    );
  }
}