/// The numeric id at the end of a PokeAPI resource url, such as
/// `https://pokeapi.co/api/v2/pokemon-species/25/` -> 25.
int idFromPokeApiUrl(String url) {
  final segments = Uri.parse(url).pathSegments.where((s) => s.isNotEmpty);
  return int.parse(segments.last);
}
