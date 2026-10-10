/// Pure dex-order -> page/pocket layout math for the card binder. See the
/// "Pocket model" section of docs/features/card-binder.md: page 0 is dex
/// #1-9, page 1 is dex #10-18, and so on, 9 pockets per page.
const int binderPocketsPerPage = 9;

/// Which page (0-indexed) a national dex id falls on.
int binderPageIndexForPokemonId(int pokemonId) =>
    (pokemonId - 1) ~/ binderPocketsPerPage;

/// The national dex ids shown on [pageIndex], in order. [sortedPokemonIds]
/// is every known id, ascending (not assumed to start at 1 or be gap-free).
List<int> binderPokemonIdsForPage(
    List<int> sortedPokemonIds, int pageIndex) {
  final start = pageIndex * binderPocketsPerPage;
  if (start >= sortedPokemonIds.length) return const [];
  final end = (start + binderPocketsPerPage).clamp(0, sortedPokemonIds.length);
  return sortedPokemonIds.sublist(start, end);
}

/// Total number of pages needed to show every id in [sortedPokemonIds].
int binderPageCount(List<int> sortedPokemonIds) =>
    sortedPokemonIds.isEmpty
        ? 0
        : (sortedPokemonIds.length / binderPocketsPerPage).ceil();
