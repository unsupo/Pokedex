import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/utils/pokemon_sort.dart';

Pokemon _pokemon(int id, String name) =>
    Pokemon(id: id, name: name, url: 'https://pokeapi.co/api/v2/pokemon/$id/');

void main() {
  // Deliberately out of both dex and alphabetical order, and mixed-case, so
  // every comparator below has to do real work to produce its order.
  List<Pokemon> fixture() => [
        _pokemon(25, 'Pikachu'),
        _pokemon(1, 'bulbasaur'),
        _pokemon(133, 'eevee'),
        _pokemon(4, 'charmander'),
      ];

  group('PokemonSort.dexAscending', () {
    test('is the default order', () {
      expect(PokemonSort.values.first, PokemonSort.dexAscending);
    });

    test('sorts by Pokemon id, low to high', () {
      final pokemon = fixture();

      sortPokemonBy(pokemon, PokemonSort.dexAscending);

      expect(pokemon.map((p) => p.id), [1, 4, 25, 133]);
    });
  });

  group('PokemonSort.dexDescending', () {
    test('is the exact reverse of dexAscending', () {
      final ascending = fixture();
      sortPokemonBy(ascending, PokemonSort.dexAscending);

      final descending = fixture();
      sortPokemonBy(descending, PokemonSort.dexDescending);

      expect(descending.map((p) => p.id), ascending.reversed.map((p) => p.id));
    });
  });

  group('PokemonSort.nameAscending', () {
    test('sorts alphabetically by name, case-insensitively', () {
      final pokemon = fixture();

      sortPokemonBy(pokemon, PokemonSort.nameAscending);

      expect(pokemon.map((p) => p.name),
          ['bulbasaur', 'charmander', 'eevee', 'Pikachu']);
    });
  });

  group('PokemonSort.nameDescending', () {
    test('is the exact reverse of nameAscending', () {
      final ascending = fixture();
      sortPokemonBy(ascending, PokemonSort.nameAscending);

      final descending = fixture();
      sortPokemonBy(descending, PokemonSort.nameDescending);

      expect(
          descending.map((p) => p.name), ascending.reversed.map((p) => p.name));
    });
  });
}
