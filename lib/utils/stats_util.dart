// lib/utils/stat_utils.dart

import 'package:pokedex_app/utils/string_utils.dart';

String formatStatName(String statName) {
  switch (statName) {
    case 'hp':
      return 'HP';
    case 'special-attack':
      return 'Sp. Atk';
    case 'special-defense':
      return 'Sp. Def';
    default:
      return capitalizeFirstLetter(statName);
  }
}