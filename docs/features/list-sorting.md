# List sorting

Status: **Draft** (2026-10-10). Design only - no code yet.

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

## Traceability (filled in once accepted and tests exist)

| AC | Test |
|---|---|
| 1 | TBD |
| 2 | TBD |
| 3 | TBD |
| 4 | TBD |
| 5 | TBD |
| 6 | TBD |

## Open questions

None blocking. A possible fifth order ("caught first") wasn't asked for -
left out per YAGNI; easy to add the same way if wanted later.
