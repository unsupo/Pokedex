import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokeapi/moves.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';
import 'package:pokedex_app/screens/pokemon_details_screen.dart';
import 'package:pokedex_app/utils/string_utils.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../services/pokemon_api_provider.dart';

class MoveScreen extends StatelessWidget {
  final int moveId;

  const MoveScreen({super.key, required this.moveId});

  @override
  Widget build(BuildContext context) {
    final move = context.watch<PokemonApiProvider>().allMoves[moveId];
    final pokemonList = context.watch<PokemonApiProvider>().allPokemon;

    if (move == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Move Details'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(capitalizeFirstLetter(move.name ?? 'N/A')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Effect'),
            _buildEffectText(move),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Description'),
            _buildDescriptionText(move),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Details'),
            _buildDetailsTable(move),
            const SizedBox(height: 20),
            // Wrap the Pokémon list in a StickyHeader
            StickyHeader(
              header: Container(
                child: _buildSectionTitle(
                    context, 'Pokémon that learn ${move.name}'),
              ),
              content: _buildPokemonList(context, move, pokemonList),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildEffectText(Move move) {
    final effectEntry = move.effectEntries?.firstWhere(
      (entry) => entry.language?.name == 'en',
      orElse: () => VerboseEffect(
        effect: 'Effect description not available.',
        shortEffect: '',
      ),
    );

    return Text(effectEntry?.shortEffect ?? '');
  }

  Widget _buildDescriptionText(Move move) {
    final flavorTextEntry = move.flavorTextEntries?.firstWhere(
      (entry) => entry.language?.name == 'en',
      orElse: () => MoveFlavorText(
        flavorText: 'Description not available.',
      ),
    );

    return Text(flavorTextEntry?.flavorText ?? '');
  }

  Widget _buildDetailsTable(Move move) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      children: [
        _buildTableRow('Type', capitalizeFirstLetter(move.type?.name ?? 'N/A')),
        _buildTableRow('Power', move.power?.toString() ?? 'N/A'),
        _buildTableRow('PP', move.pp?.toString() ?? 'N/A'),
        _buildTableRow('Accuracy', '${move.accuracy?.toString() ?? 'N/A'}%'),
        _buildTableRow('Priority', move.priority?.toString() ?? 'N/A'),
        _buildTableRow(
            'Target', capitalizeFirstLetter(move.target?.name ?? 'N/A')),
        _buildTableRow('Damage Class',
            capitalizeFirstLetter(move.damageClass?.name ?? 'N/A')),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text('$label:',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(value),
        ),
      ],
    );
  }

  Widget _buildPokemonList(
      BuildContext context, Move move, Map<int, Pokemon> pokemonList) {
    final filteredPokemonList = pokemonList.values.where((p) {
      return p.details?.moves?.any((m) => m.move?.name == move.name) ?? false;
    }).toList();

    return filteredPokemonList.isEmpty
        ? const Center(child: Text('No Pokémon can learn this move.'))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 10,
              columns: const [
                DataColumn(label: Text('#')),
                DataColumn(label: Text('Name')),
              ],
              rows: filteredPokemonList
                  .map((pokemon) => _buildPokemonRow(context, pokemon))
                  .toList(),
            ),
          );
  }

  DataRow _buildPokemonRow(BuildContext context, Pokemon pokemon) {
    const defaultImageUrl = '';
    String imageUrlToUse = defaultImageUrl;

    if (pokemon.imageUrl.isNotEmpty) {
      if (pokemon.imageUrl.startsWith('http')) {
        imageUrlToUse = pokemon.imageUrl;
      } else {
        imageUrlToUse = 'https:${pokemon.imageUrl}';
      }
    }

    return DataRow(
        cells: [
      DataCell(
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CachedNetworkImage(
                imageUrl: imageUrlToUse,
                fadeInDuration: Duration.zero,
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
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(pokemon.id.toString()),
          ],
        ),
      ),
      DataCell(Text(capitalizeFirstLetter(pokemon.name ?? ''))),
    ].map<DataCell>((cell) {
      return DataCell(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonDetailsScreen(
                  pokemonId: pokemon.id,
                ),
              ),
            );
          },
          child: cell.child, // Access the child widget of the original DataCell
        ),
      );
    }).toList());
  }
}
