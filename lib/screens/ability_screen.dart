import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokeapi/abilities.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart' hide Icons;
import 'package:pokedex_app/screens/pokemon_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../models/pokeapi/pokemon.dart';
import '../models/pokeapi/utility.dart';
import '../services/pokemon_api_provider.dart';
import '../utils/string_utils.dart';

class AbilityScreen extends StatelessWidget {
  final int? abilityId;

  const AbilityScreen({super.key, required this.abilityId});

  @override
  Widget build(BuildContext context) {
    final ability = abilityId == null
        ? null
        : context.watch<PokemonApiProvider>().allAbilities[abilityId];
    final pokemonList = context.watch<PokemonApiProvider>().allPokemon;

    if (ability == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ability Details'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(capitalizeFirstLetter(ability.name ?? 'N/A')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Effect'),
            _buildEffectText(ability),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'In-Depth Effect'),
            _buildInDepthEffectText(ability),
            const SizedBox(height: 20),
            StickyHeader(
              header: Container(
                child: _buildSectionTitle(
                    context, 'Pokémon with ${ability.name}'),
              ),
              content: _buildPokemonList(context, ability, pokemonList),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  _buildPokemonList(
      BuildContext context, Ability ability, Map<int, Pokemon> pokemonList) {
    return pokemonList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 10, // Adjust this value as needed
              columns: const [
                DataColumn(label: Text('#')),
                DataColumn(label: Text('Name')),
                // DataColumn(label: Text('2nd Ability')),
                DataColumn(label: Text('Hidden Ability')),
              ],
              rows: pokemonList.values
                  .where((p) {
                    // Check if details or abilities are null
                    if (p.details == null || p.details?.abilities == null) {
                      return false; // Exclude Pokemon without ability details
                    }
                    // If not null, proceed with indexWhere
                    return p.details!.abilities!.indexWhere(
                            (a) => a.ability?.name == ability.name) >=
                        0;
                  })
                  .map((pokemon) => _buildPokemonRow(context, pokemon))
                  .toList(),
            ),
          );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildEffectText(Ability ability) {
    // Assuming English language for the effect description
    final entries = ability.effectEntries;
    final effectEntry = entries == null || entries.isEmpty
        ? null
        : entries.firstWhere(
            (entry) => entry.language?.name == 'en',
            orElse: () => VerboseEffect(
              effect: 'No description available.',
              shortEffect: 'No description available.',
            ),
          );

    return Text(effectEntry?.shortEffect ?? 'No description available.');
  }

  Widget _buildInDepthEffectText(Ability ability) {
    // Assuming English language for the in-depth effect
    final entries = ability.effectEntries;
    final inDepthEffectEntry = entries == null || entries.isEmpty
        ? null
        : entries.firstWhere(
            (entry) => entry.language?.name == 'en',
            orElse: () => VerboseEffect(
              effect: 'No description available.',
              shortEffect: 'No description available.',
            ),
          );

    return Text(inDepthEffectEntry?.effect ?? 'No description available.');
  }

  DataRow _buildPokemonRow(BuildContext context, Pokemon pokemon) {
    // Extract abilities
    String secondAbility = '';
    AbilityName hiddenAbility = AbilityName();

    for (var ability in pokemon.details?.abilities ?? []) {
      if (ability.slot == 2) {
        secondAbility = capitalizeFirstLetter(ability.ability?.name ?? '');
      } else if (ability.isHidden ?? false) {
        hiddenAbility = ability;//capitalizeFirstLetter(ability.ability?.name ?? '');
      }
    }

    // Handle potentially invalid image URLs
    const defaultImageUrl =
        ''; // Replace with a suitable placeholder image URL or use an asset image
    String imageUrlToUse = defaultImageUrl;

    if (pokemon.imageUrl.isNotEmpty) {
      if (pokemon.imageUrl.startsWith('http')) {
        imageUrlToUse = pokemon.imageUrl;
      } else {
        // Assuming missing protocol, try to fix it
        imageUrlToUse = 'https:${pokemon.imageUrl}';
      }
    }

    return DataRow(cells: [
      DataCell(
        Row(
          children: [
            SizedBox(
              // Wrap in SizedBox to constrain the size
              width: 50,
              height: 50,
              child: CachedNetworkImage(
                imageUrl: imageUrlToUse,
                fadeInDuration: Duration.zero,
                // No fade-in for faster display
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.catching_pokemon,
                  size: 50,
                  color: Colors.grey,
                ),
                fit:
                    BoxFit.cover, // Ensure the image covers the available space
              ),
            ),
            const SizedBox(width: 8),
            Text(pokemon.id.toString()),
          ],
        ),
      ),
      DataCell(Text(capitalizeFirstLetter(pokemon.name ?? '')), onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailsScreen(
              pokemonId: pokemon.id,
            ),
          ),
        );
      }),
      // DataCell(Text(secondAbility)),
      DataCell(Text(capitalizeFirstLetter(hiddenAbility.ability?.name ?? '')), onTap: () {
        if(hiddenAbility.ability?.id != null && hiddenAbility.ability?.id != abilityId) {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AbilityScreen(
              abilityId: hiddenAbility.ability?.id,
            ),
          ),
        );
        }
      }),
    ]);
  }
}
