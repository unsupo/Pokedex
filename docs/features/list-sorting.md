# List sorting

Status: **Done** (2026-10-10). Implemented with tests; see Closing record at the
bottom.

## Problem

The Pokedex list (`PokemonList`, driven by
`PokemonApiProvider.filteredPokemon`) only ever shows National dex order.
There's no way to view it alphabetically or reversed.

## Goals

1. A sort control: reorder the currently-filtered list by name or dex number,
   ascending or descending.

(Search syntax is a separate, independent feature - see
[search-fuzzy-and-stage.md](search-fuzzy-and-stage.md).)

## Non-goals

- Persisting sort choice across app restarts - session-only, consistent with
  `UiStateProvider`'s other transient fields (`tabIndex`; confirmed that's
  currently the *only* field on it).
- Sorting by anything other than name/dex (no "by caught status," "by type,"
  etc. unless asked - YAGNI).

## Design

- `enum PokemonSort { dexAscending, dexDescending, nameAscending,
  nameDescending }`, default `dexAscending` (today's existing, unchanged order).
- Lives on `UiStateProvider` as a new field, same home as `tabIndex` - a
  session UI preference, not profile data.
- Applied as the last step of `PokemonApiProvider.filterPokemon`
  (`lib/services/pokemon_api_provider.dart`), sorting `_filteredPokemon` in
  place before `notifyListeners()`. Runs after filtering, not instead of it, so
  sort and search/filter compose automatically - no separate code path needed
  for "sorted and filtered" vs. "just filtered."
- Name comparator: `pokemon.name.toLowerCase()`, compared directly - not the
  capitalized display string (`capitalizeFirstLetter` only uppercases the
  first letter and doesn't affect ordering, so calling it before comparing
  would be pointless extra work for the same result).
- UI: an icon button next to the existing `Icons.filter_list` button in
  `PokemonSearchBar`'s `Row` (`lib/widgets/pokemon_search_bar.dart`) - same
  row, same pattern, opening a short menu of the four orders with the active
  one checked.

## Acceptance criteria

1. "Name A-Z" sorts the visible list alphabetically by Pokemon name,
   case-insensitively.
2. "Name Z-A" is the exact reverse of that order.
3. "Dex #" ascending matches today's existing order exactly (regression check
   - this sort option must be provably a no-op vs. current behavior).
4. "Dex #" descending is the exact reverse of ascending.
5. Changing the search text or an active filter re-sorts the new result set
   under the current sort choice - it doesn't reset to dex-ascending.
6. Sort choice resets to dex-ascending on a fresh app launch (explicit
   non-goal of persistence, verified rather than assumed).

## Traceability

| AC | Test |
|---|---|
| 1 | `test/utils/pokemon_sort_test.dart` → `PokemonSort.nameAscending sorts alphabetically by name, case-insensitively`; `test/services/pokemon_api_provider_sort_test.dart` → `AC 1: name-ascending sorts the visible list alphabetically, case-insensitively` |
| 2 | `test/utils/pokemon_sort_test.dart` → `PokemonSort.nameDescending is the exact reverse of nameAscending`; `test/services/pokemon_api_provider_sort_test.dart` → `AC 2: name-descending is the exact reverse of name-ascending` |
| 3 | `test/utils/pokemon_sort_test.dart` → `PokemonSort.dexAscending sorts by Pokemon id, low to high`; `test/services/pokemon_api_provider_sort_test.dart` → `AC 3: dex-ascending matches today's existing (unsorted) order exactly -- a no-op` |
| 4 | `test/utils/pokemon_sort_test.dart` → `PokemonSort.dexDescending is the exact reverse of dexAscending`; `test/services/pokemon_api_provider_sort_test.dart` → `AC 4: dex-descending is the exact reverse of dex-ascending` |
| 5 | `test/services/pokemon_api_provider_sort_test.dart` → `AC 5: an active filter under a non-default sort re-sorts the new (smaller) result set instead of resetting to dex-ascending` |
| 6 | `test/services/ui_state_provider_sort_test.dart` → `AC 6: a fresh UiStateProvider starts on dex-ascending`; `test/services/pokemon_api_provider_sort_test.dart` → `AC 6: a freshly constructed provider starts on dex-ascending` |

Also covered: `test/widgets/pokemon_search_bar_sort_test.dart` (the UI control
itself -- icon present, menu contents and checked state, selecting an order,
and a screen-reader tooltip).

## Open questions

None blocking. A possible fifth order ("caught first") wasn't asked for -
left out per YAGNI; easy to add the same way if wanted later.

## Implementation notes

- `PokemonSort` and the pure `sortPokemonBy(List<Pokemon>, PokemonSort)`
  comparator live in `lib/utils/pokemon_sort.dart` -- a plain function, not a
  class hierarchy (YAGNI: four cases don't earn a Strategy-pattern class per
  case).
- `UiStateProvider.sort` (+ `setSort`) is the field the UI reads to render the
  checked menu item, added alongside `tabIndex` with the same shape.
- `PokemonApiProvider` keeps its own `_sort` field (default `dexAscending`),
  because it has no reference to `UiStateProvider` and `filterPokemon()` is
  called from places (e.g. the search box's debounce) that don't know the
  current sort choice -- `_sort` lets `filterPokemon()` keep applying
  whatever was last chosen (AC 5) without every caller having to pass it.
  `updateSort(sort)` sets `_sort` and re-sorts `_filteredPokemon` in place
  without re-running search/filtering. `PokemonSearchBar`'s sort menu calls
  both `UiStateProvider.setSort` and `PokemonApiProvider.updateSort` together
  on selection, so the two stay in sync; this mirrors the existing split
  between `FilterModal`'s own transient `selectedFilters` and
  `PokemonApiProvider._currentFilters`.
- UI: `PopupMenuButton<PokemonSort>` with `CheckedPopupMenuItem` entries
  (built-in Material widget for "a short menu with the active one checked" --
  no custom checkmark logic needed), placed in `PokemonSearchBar`'s `Row`
  right before the existing filter `IconButton`. Has a `tooltip` for screen
  readers.

### Closing record
- Date: 2026-10-10
- Commit: (left uncommitted in this worktree for review/integration)
- Checklist: docs/ACCEPTANCE_CHECKLIST.md -- all applicable items ticked.
  N/A: §4.3 (no E2E; this feature is UI + two providers, already covered by
  provider-level integration tests and a widget test), §6 (no schema/Isar
  collection change), §8.3 (no CSV/import involved), §9 (no new DB or file
  I/O).
- Tests: unit 8 (`pokemon_sort_test.dart` + `ui_state_provider_sort_test.dart`)
  / integration 6 (`pokemon_api_provider_sort_test.dart`) / e2e 0 (N/A) /
  widget 4 (`pokemon_search_bar_sort_test.dart`) -- all passing: yes (18/18
  new tests; full `flutter test` run is 243 passed / 1 failed (244 total),
  the one failure being the pre-existing unmodified counter template in
  `test/widget_test.dart`, documented in `CLAUDE.md` as not exercising this
  app and unrelated to this change)
- analyze: clean -- `flutter analyze` reports the same 56 pre-existing
  issues as before this change, none in the files this feature touched or
  added (verified by grepping the analyze output for each touched/new file)
- TDD evidence: each of the four new test files was written and run to a
  confirmed compile-time red (missing `PokemonSort`/`sortPokemonBy`/
  `updateSort`/`setSort`/the sort menu) before the corresponding
  implementation was added; re-run green immediately after
- Traceability: AC → test table above
- N/A items and why: see Checklist line above
