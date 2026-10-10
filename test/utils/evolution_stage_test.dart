import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart';
import 'package:pokedex_app/utils/evolution_stage.dart';

void main() {
  Species speciesFor(int id) => Species(
        name: 'species-$id',
        url: 'https://pokeapi.co/api/v2/pokemon-species/$id/',
      );

  group('stageOfPokemonInChain', () {
    test('a non-evolving Pokemon is stage 1', () {
      final chain = EvolutionChain(
        id: 1,
        chain: ChainLink(species: speciesFor(132)), // Ditto
      );

      expect(stageOfPokemonInChain(chain, 132), 1);
    });

    test('a 2-stage chain: base is stage 1, its evolution is stage 2', () {
      // e.g. Pichu (172) -> Pikachu (25)
      final chain = EvolutionChain(
        id: 10,
        chain: ChainLink(
          species: speciesFor(172),
          evolvesTo: [ChainLink(species: speciesFor(25))],
        ),
      );

      expect(stageOfPokemonInChain(chain, 172), 1);
      expect(stageOfPokemonInChain(chain, 25), 2);
    });

    test(
        'a 3-stage chain: base, middle, and final each report their own depth',
        () {
      // Bulbasaur (1) -> Ivysaur (2) -> Venusaur (3)
      final chain = EvolutionChain(
        id: 1,
        chain: ChainLink(
          species: speciesFor(1),
          evolvesTo: [
            ChainLink(
              species: speciesFor(2),
              evolvesTo: [ChainLink(species: speciesFor(3))],
            ),
          ],
        ),
      );

      expect(stageOfPokemonInChain(chain, 1), 1);
      expect(stageOfPokemonInChain(chain, 2), 2);
      expect(stageOfPokemonInChain(chain, 3), 3);
    });

    test('a branching chain reports each branch at its own depth', () {
      // Eevee (133) -> Vaporeon (134) or Jolteon (135)
      final chain = EvolutionChain(
        id: 67,
        chain: ChainLink(
          species: speciesFor(133),
          evolvesTo: [
            ChainLink(species: speciesFor(134)),
            ChainLink(species: speciesFor(135)),
          ],
        ),
      );

      expect(stageOfPokemonInChain(chain, 133), 1);
      expect(stageOfPokemonInChain(chain, 134), 2);
      expect(stageOfPokemonInChain(chain, 135), 2);
    });

    test('returns null, not a crash, for an id not present in the chain', () {
      final chain = EvolutionChain(
        id: 1,
        chain: ChainLink(
          species: speciesFor(1),
          evolvesTo: [ChainLink(species: speciesFor(2))],
        ),
      );

      expect(stageOfPokemonInChain(chain, 999), isNull);
    });

    test('returns null for a chain whose root link has no species', () {
      final chain = EvolutionChain(id: 1, chain: ChainLink());

      expect(stageOfPokemonInChain(chain, 1), isNull);
    });
  });
}
