import '../models/pokeapi/evolution_chain.dart';

/// The 1-based depth of [pokemonId] within [chain]: the root `ChainLink` is
/// stage 1 (so a Pokemon that never evolves is also stage 1), and each
/// `evolvesTo` entry is one stage deeper.
///
/// Returns null if [pokemonId] isn't present anywhere in [chain] - this
/// shouldn't happen for a Pokemon's own evolution chain, but degrades to
/// "doesn't match" rather than throwing.
int? stageOfPokemonInChain(EvolutionChain chain, int pokemonId) {
  return _stageOf(chain.chain, pokemonId, 1);
}

int? _stageOf(ChainLink link, int pokemonId, int depth) {
  final url = link.species?.url;
  if (url != null) {
    final segments = url.split('/');
    final id = segments.length >= 2
        ? int.tryParse(segments[segments.length - 2])
        : null;
    if (id == pokemonId) return depth;
  }

  for (final next in link.evolvesTo ?? const <ChainLink>[]) {
    final found = _stageOf(next, pokemonId, depth + 1);
    if (found != null) return found;
  }

  return null;
}
