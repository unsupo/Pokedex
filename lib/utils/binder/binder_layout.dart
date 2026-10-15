/// Pure dex-order -> page/pocket layout math for the card binder. See the
/// "Pocket model" section of docs/features/card-binder.md: page 0 is dex
/// #1-9, page 1 is dex #10-18, and so on, 9 pockets per page.
const int binderPocketsPerPage = 9;

/// Which page (0-indexed) a national dex id falls on.
int binderPageIndexForPokemonId(int pokemonId) =>
    (pokemonId - 1) ~/ binderPocketsPerPage;

/// The national dex ids shown on [pageIndex], in order. [sortedPokemonIds]
/// is every known id, ascending (not assumed to start at 1 or be gap-free).
List<int> binderPokemonIdsForPage(List<int> sortedPokemonIds, int pageIndex) {
  final start = pageIndex * binderPocketsPerPage;
  if (start >= sortedPokemonIds.length) return const [];
  final end = (start + binderPocketsPerPage).clamp(0, sortedPokemonIds.length);
  return sortedPokemonIds.sublist(start, end);
}

/// Total number of pages needed to show every id in [sortedPokemonIds].
int binderPageCount(List<int> sortedPokemonIds) => sortedPokemonIds.isEmpty
    ? 0
    : (sortedPokemonIds.length / binderPocketsPerPage).ceil();

/// A human-facing "Page N of M" / "Pages N-M of M" label for the spread
/// currently showing [rightPageIndex] (0-indexed, as `BinderPageTurner`
/// tracks it) of [pageCount] total page-groups - 1-indexed for display,
/// since nobody describes a book as being on "page 0". See "Fourteenth
/// round" in docs/features/card-binder.md.
///
/// A spread normally shows two page-groups (left = rightPageIndex - 1,
/// right = rightPageIndex - see "Twelfth round"), but the very first
/// spread has no left page (just the inside cover), and the very last
/// spread may have no right page if [pageCount] doesn't pair evenly - both
/// collapse to a single "Page N" rather than a nonsensical range.
String binderPageLabel({required int rightPageIndex, required int pageCount}) {
  final leftPageIndex = rightPageIndex - 1;
  final hasLeft = leftPageIndex >= 0;
  final hasRight = rightPageIndex < pageCount;
  if (hasLeft && hasRight) {
    return 'Pages ${leftPageIndex + 1}-${rightPageIndex + 1} of $pageCount';
  }
  if (hasRight) return 'Page ${rightPageIndex + 1} of $pageCount';
  if (hasLeft) return 'Page ${leftPageIndex + 1} of $pageCount';
  return 'Page 1 of $pageCount'; // pageCount == 0: not normally reachable -
  // CardBinderScreen shows a loading spinner instead of the nav controls
  // until there's at least one Pokemon - but a sane fallback beats a
  // crash or a blank label if that guard is ever bypassed.
}
