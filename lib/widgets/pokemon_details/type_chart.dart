import 'package:flutter/material.dart';
import '../../models/pokeapi/pokemon_details.dart';
import '../../utils/string_utils.dart';
import '../../utils/type_utils.dart';

class TypeChart extends StatelessWidget {
  final List<PokemonType> types;

  final bool? isWonderGuard;

  const TypeChart({super.key, required this.types, this.isWonderGuard});

  @override
  Widget build(BuildContext context) {
    final pokemonTypes = types.map((type) => type.type?.name).toList();
    final relevantTypes = getRelevantTypes(pokemonTypes, isWonderGuard ?? false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type Effectiveness',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Wrap( // Use Wrap instead of Row for wrapping
          spacing: 8.0, // Spacing between items
          runSpacing: 8.0, // Spacing between lines
          children: [
            for (final type in relevantTypes)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tooltip(
                      message: capitalizeFirstLetter(type),
                      child: Container(
                        width: 56, // Increased width
                        height: 32, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: getTypeColor(type),
                          borderRadius: BorderRadius.circular(4), // Rounded corners
                        ),
                        child: Center(
                          child: Text(
                            type.substring(0, 3).toUpperCase(), // 3-letter abbreviation
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 4),
                    Tooltip(
                      message: getTypeEffectivenessString(pokemonTypes, type, isWonderGuard??false),
                      child: Container(
                        width: 56, // Increased width
                        height: 32, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: getEffectivenessColor(type, pokemonTypes, isWonderGuard??false), // Use total effectiveness
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            getTypeEffectivenessString(pokemonTypes, type, isWonderGuard??false),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}