import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/string_utils.dart';
import 'package:provider/provider.dart';
import '../models/pokeapi/pokemon.dart';
import '../services/pokemon_api_provider.dart';
import 'type_pill.dart';
import '../screens/pokemon_details_screen.dart';

class PokemonListItem extends StatefulWidget {
  final int pokemonId;
  final Function(bool) onCheckboxChanged;

  const PokemonListItem({
    super.key,
    required this.pokemonId,
    required this.onCheckboxChanged,
  });

  @override
  _PokemonListItemState createState() => _PokemonListItemState();
}

class _PokemonListItemState extends State<PokemonListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Pokemon? pokemon = context.watch<PokemonApiProvider>().allPokemon[widget.pokemonId];
    final isCaught =
        context.watch<PokemonApiProvider>().allPokemon[widget.pokemonId]?.isCaught ??
            false;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left half (details screen navigation)
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PokemonDetailsScreen(pokemonId: widget.pokemonId),
                  ),
                );
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        '#${widget.pokemonId.toString().padLeft(3, '0')}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Hero(
                      tag:
                      "${widget.pokemonId}-${pokemon?.imageUrl}",
                      child: CachedNetworkImage(
                        imageUrl: pokemon!.imageUrl,
                        fadeInDuration: Duration.zero,
                        placeholder: (context, url) => SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Icon(
                            Icons.catching_pokemon,
                            size: 50,
                            color: Colors.grey),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            capitalizeFirstLetter(pokemon.name),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          pokemon.details == null
                              ? Text('')
                              : Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: pokemon.details!.types!
                                .map((type) => TypePill(
                                type: type.type!.name ?? "none"))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Right half (Pokeball toggle)
          GestureDetector(
            onTap: () {
              Provider.of<PokemonApiProvider>(context, listen: false)
                  .isCaught(widget.pokemonId, !isCaught);
              widget.onCheckboxChanged(!isCaught);
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ColorFiltered(
                colorFilter: isCaught
                    ? ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.multiply,
                ) // No filter when caught
                    : ColorFilter.matrix(
                  <double>[
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0,      0,      0,      1, 0,
                  ],
                ), // Greyscale filter when not caught
                child: Image.asset(
                  'assets/images/pokeball.png',
                  width: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}