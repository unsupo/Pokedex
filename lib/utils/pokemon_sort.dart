import '../models/pokeapi/pokemon.dart';

/// The order the Pokemon list is displayed in, independent of search and
/// filtering (see docs/features/list-sorting.md). [dexAscending] is first and
/// is the default -- it matches the app's original, unsorted order (PokeAPI's
/// list endpoint already returns Pokemon by id), so picking it is a no-op.
enum PokemonSort {
  dexAscending,
  dexDescending,
  nameAscending,
  nameDescending,
}

/// Sorts [pokemon] in place according to [sort]. Names are compared
/// case-insensitively on the raw PokeAPI name -- `capitalizeFirstLetter` only
/// affects display, not ordering, so calling it here would be pointless
/// extra work for the same result.
void sortPokemonBy(List<Pokemon> pokemon, PokemonSort sort) {
  switch (sort) {
    case PokemonSort.dexAscending:
      pokemon.sort((a, b) => a.id.compareTo(b.id));
    case PokemonSort.dexDescending:
      pokemon.sort((a, b) => b.id.compareTo(a.id));
    case PokemonSort.nameAscending:
      pokemon.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    case PokemonSort.nameDescending:
      pokemon.sort(
          (a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
  }
}
