import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex_app/screens/pokemon_details_screen.dart';
import 'package:pokedex_app/utils/string_utils.dart';
import 'package:provider/provider.dart';

import '../../models/pokeapi/pokemon.dart';
import '../../services/pokemon_api_provider.dart';

class EvolutionChainWidget extends StatelessWidget {
  final Pokemon? pokemon;

  const EvolutionChainWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return _buildEvolutionChain(pokemon?.evolutionChain?.chain, context);
  }

  Widget _buildEvolutionChain(ChainLink? chainLink, BuildContext context) {
    if (chainLink == null) {
      return Text('');
    }

    bool hasBranchingEvolution =
        chainLink.evolvesTo != null && chainLink.evolvesTo!.length > 1;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 25.0,
      ),
      child: Row(
        mainAxisAlignment: hasBranchingEvolution
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPokemonLink(
              context
                  .read<PokemonApiProvider>()
                  .allPokemon[chainLink.species?.id]!,
              context),
          if (chainLink.evolvesTo != null && chainLink.evolvesTo!.isNotEmpty)
            // Remove Flexible and wrap in Expanded if needed
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    _buildBranchingEvolutions(chainLink.evolvesTo!, context),
              ),
            )
        ],
      ),
    );
  }

  List<Widget> _buildBranchingEvolutions(
      List<ChainLink> evolvesTo, BuildContext context) {
    if (evolvesTo.length == 1) {
      return [
        _buildEvolutionRow(evolvesTo.first, context),
      ];
    } else {
      return [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          // Indent branching evolutions
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: evolvesTo
                .map((evo) => _buildEvolutionRow(evo, context))
                .toList(),
          ),
        ),
      ];
    }
  }

  Widget _buildEvolutionRow(ChainLink nextChainLink, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Icon(Icons.arrow_forward),
                  if (nextChainLink.evolutionDetails != null &&
                      nextChainLink.evolutionDetails!.isNotEmpty)
                    ...nextChainLink.evolutionDetails!
                        .map((detail) => _buildEvolutionDetail(detail, context)),
                ],
              ),
              SizedBox(width: 16),
              _buildPokemonLink(
                context
                    .read<PokemonApiProvider>()
                    .allPokemon[nextChainLink.species?.id]!,
                context,
              ),
              if (nextChainLink.evolvesTo != null &&
                  nextChainLink.evolvesTo!.isNotEmpty)
                ..._buildBranchingEvolutions(nextChainLink.evolvesTo!, context),
            ],
          ),
        ));
  }

  Widget _buildEvolutionDetail(EvolutionDetail detail, BuildContext context) {
    String detailText = '';
    String? imageAssetPath = ''; // Path for the image asset

    switch (detail.trigger?.name) {
      case 'level-up':
        if (detail.minLevel != null) {
          detailText = 'Lv. ${detail.minLevel}';
          // imageAssetPath =
          // 'assets/images/level.png'; // Replace with your level-up image
        } else if (detail.minHappiness != null) {
          detailText = 'High friendship';
          imageAssetPath =
          'assets/images/friendship.png'; // Replace with your friendship image
        }
        break;
      case 'trade':
        detailText = 'Trade';
        imageAssetPath =
        'assets/images/trade.png'; // Replace with your trade image
        if (detail.heldItem != null) {
          detailText += ' holding ${detail.heldItem!.name}';
        }
        break;
      case 'use-item':
        detailText = 'Use ${detail.item!.name}';
        imageAssetPath = context.read<PokemonApiProvider>().allItems[detail.item?.id]?.sprites?.defaultSprite;
        // 'assets/images/use_item.png'; // Replace with your use-item image
        break;
      default:
        detailText = detail.trigger?.name ?? '';
    }

    if ((imageAssetPath??'').isNotEmpty) {
      return Tooltip(
        message: detailText,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          // CachedNetworkImage (not Image.network) so this item sprite is
          // cached to disk like every other image in the app, instead of
          // only the in-memory cache Image.network gets - that would have
          // re-downloaded it on every app restart.
          child: imageAssetPath!.startsWith('http')
              ? CachedNetworkImage(
            imageUrl: imageAssetPath,
            width: 30,
            height: 30,
            placeholder: (context, url) => const SizedBox(width: 30, height: 30),
            errorWidget: (context, url, error) => const Icon(Icons.error, size: 30),
          )
              : Image.asset(
            imageAssetPath,
            width: 30,
            height: 30,
          ),
        ),
      );
    } else {
      return Text(detailText);
    }
  }

  Widget _buildPokemonLink(Pokemon pokemon, BuildContext context) {
    return InkWell(
      onTap: () {
        if (pokemon.id != this.pokemon?.id) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetailsScreen(
                pokemonId: pokemon.id,
              ),
            ),
          );
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxImageWidth = MediaQuery.of(context).size.width * 0.2;
          if (maxImageWidth > 150) {
            maxImageWidth = 150;
          }
          return Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: maxImageWidth,
                  maxHeight: maxImageWidth,
                ),
                child: CachedNetworkImage(
                  imageUrl: pokemon.imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(capitalizeFirstLetter(pokemon.name)),
            ],
          );
        },
      ),
    );
  }
}
