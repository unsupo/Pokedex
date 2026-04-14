import 'package:flutter/material.dart';

import '../data/type_chart.dart';
import 'string_utils.dart';

double getTypeEffectiveness(String attackingType, String defendingType) {
  final typeData = TYPE_EFFECTIVENESS_DATA.firstWhere(
        (data) =>
    data['name'].toString().toLowerCase() == attackingType.toLowerCase(),
    orElse: () => {}, // Return empty map if not found
  );

  if (typeData.isEmpty) return 1.0; // Default to 1.0 if type not found
  defendingType = capitalizeFirstLetter(defendingType);

  double effectiveness;
  if (typeData['immunes']!.contains(defendingType)) {
    effectiveness = 0.0;
  } else if (typeData['weaknesses']!.contains(defendingType)) {
    effectiveness = 0.5;
  } else if (typeData['strengths']!.contains(defendingType)) {
    effectiveness = 2.0;
  } else {
    effectiveness = 1.0;
  }

  return effectiveness;
}

List<String> getRelevantTypes(List<String?> pokemonTypes, bool isWonderGuard) {
  Set<String> relevantTypes = {};
  final allTypes = [
    'Normal',
    'Fire',
    'Water',
    'Electric',
    'Grass',
    'Ice',
    'Fighting',
    'Poison',
    'Ground',
    'Flying',
    'Psychic',
    'Bug',
    'Rock',
    'Ghost',
    'Dragon',
    'Dark',
    'Steel',
    'Fairy'
  ];

  for (final attackingType in allTypes) {
    double netEffectiveness = 1.0; // Start with neutral effectiveness
    for (final defendingType in pokemonTypes) {
      if (defendingType == null) {
        throw Exception("Type is null");
      }
      netEffectiveness *= getTypeEffectiveness(attackingType, defendingType);
    }
    if(isWonderGuard && netEffectiveness <= 1){
      netEffectiveness = 0;
    }
    // Only add to relevantTypes if the net effectiveness is not neutral
    if (netEffectiveness != 1.0) {
      relevantTypes.add(attackingType);
    }
  }
  return relevantTypes.toList();
}

String getTypeEffectivenessString(
    List<String?> pokemonTypes, String attackingType, bool isWonderGuard) {
  double totalEffectiveness = 1.0;
  for (final type in pokemonTypes) {
    if (type == null) {
      throw Exception("Type is null");
    }
    totalEffectiveness *= getTypeEffectiveness(attackingType, type);
  }
  if(isWonderGuard && totalEffectiveness <= 1){
    totalEffectiveness = 0;
  }

  if (totalEffectiveness == 0) {
    return '0';
  } else if (totalEffectiveness == 0.5) {
    return '½';
  } else if (totalEffectiveness == 0.25) {
    return '¼';
  } else if (totalEffectiveness == 1) {
    return '1';
  } else if (totalEffectiveness == 2) {
    return '2';
  } else if (totalEffectiveness == 4) {
    return '4';
  } else {
    return '';
  }
}

Color getEffectivenessColor(String attackingType, List<String?> types, bool isWonderGuard) {
  String typesEffectiveness = getTypeEffectivenessString(types, attackingType, isWonderGuard);
  return getEffectivenessColorDbl(typesEffectiveness);
}

Color getEffectivenessColorDbl(String effectiveness) {
  if (effectiveness == '0') {
    return Colors.black; // Immune
  } else if (effectiveness == '¼') {
    return Colors
        .red[900]!; // Super Not Very Effective (1/4) - Darker Red (Maroon)
  } else if (effectiveness == '½') {
    return Colors.red; // Not Very Effective (1/2) - Regular Red
  } else if (effectiveness == '2') {
    return Colors.green; // Super Effective (2x) - Regular Green
  } else if (effectiveness == '4') {
    return Colors.green[300]!; // Super Super Effective (4x) - Lighter Green
  } else {
    return Colors.transparent; // Neutral (1x) - No color
  }
}

Color getTypeColor(String type) {
  switch (type.toLowerCase()) {
    case 'normal':
      return Color(0xFFA8A77A);
    case 'fire':
      return Color(0xFFEE8130);
    case 'water':
      return Color(0xFF6390F0);
    case 'electric':
      return Color(0xFFF7D02C);
    case 'grass':
      return Color(0xFF7AC74C);
    case 'ice':
      return Color(0xFF96D9D6);
    case 'fighting':
      return Color(0xFFC22E28);
    case 'poison':
      return Color(0xFFA33EA1);
    case 'ground':
      return Color(0xFFE2BF65);
    case 'flying':
      return Color(0xFFA98FF3);
    case 'psychic':
      return Color(0xFFF95587);
    case 'bug':
      return Color(0xFFA6B91A);
    case 'rock':
      return Color(0xFFB6A136);
    case 'ghost':
      return Color(0xFF735797);
    case 'dragon':
      return Color(0xFF6F35FC);
    case 'dark':
      return Color(0xFF705746);
    case 'steel':
      return Color(0xFFB7B7CE);
    case 'fairy':
      return Color(0xFFD685AD);
    default:
      return Colors.grey;
  }
}

// In type_utils.dart (or similar)
String? getCategoryIconPath(String? category) {
  switch (category?.toLowerCase()) {
    case 'physical':
      return 'assets/images/physical.svg';
    case 'special':
      return 'assets/images/special.svg';
    case 'status':
      return 'assets/images/status.svg';
    default:
      return null;
  }
}