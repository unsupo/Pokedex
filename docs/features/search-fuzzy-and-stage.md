# Fuzzy multi-field search + evolution stage

Status: **Draft** (2026-10-10). Design only - no code yet.

## Problem

Finding "every Fire-type that knows Flamethrower" or "every first-stage
Pokemon" today means opening the filter modal (which already has
Types/Abilities/Moves/Generations/Caught), slower than just typing in the
search bar, which today only matches name/id.

## Correction from an earlier draft of this doc

An earlier version of this doc described bare-number search ("1" matching dex
id) as a *new* change, framing today's behavior as an exact-only match. That
was wrong, caught on review:

`Pokemon.toString()` returns `'$id $name'`
(`lib/models/pokeapi/pokemon.dart:69`), and
`PokemonApiProvider.filterPokemon`'s `matchesName` is
`pokemon.toString().contains(searchQuery.toLowerCase())` - already a substring
match against the *combined* id+name string. So `1` already matches Bulbasaur
**and** every id containing "1" (#010-019, #021, #031, ...) today, through
`matchesName` - id is always the leading token of `toString()`, so any
substring match on it is also a substring match on the combined string. The
separate `matchesId = pokemon.id.toString() == searchQuery` exact check is
therefore redundant whenever `matchesName` would already be true for the same
term, which is always. No behavior change is needed for numbers; see Future
work for the resulting small cleanup.

## Goals

1. Plain text in the search bar fuzzy-matches name, id, type, move, *and*
   ability all at once, with no prefix needed - typing "flamethrower" finds
   every Pokemon that knows it, extending today's name/id-only match.
2. One typed modifier, `stage:`, for the one thing with no natural free-text
   form: evolution stage (`stage:1` = first-stage/never-evolves, `stage:2`,
   `stage:3`).

(List sorting is a separate, independent feature - see
[list-sorting.md](list-sorting.md).)

## Non-goals

- Typo-tolerant ("fuzzy" in the edit-distance sense) matching - see Future
  work. "Fuzzy" in this doc means case-insensitive substring matching only,
  the same sense today's name search already uses.
- `type:`/`move:`/`ability:`/`gen:`/`caught:` as modifier keys - plain text
  already covers type/move/ability (Goal 1), and gen/caught are one tap away
  in the filter modal already.
- Changing what the filter modal looks like or does.

## Design

### Plain text: fuzzy across name, id, type, move, ability

Every token that isn't a `stage:` modifier is free text, matched as a
case-insensitive substring against all of:

- `Pokemon.name` and `Pokemon.id` (today's existing match, via `toString()`,
  unchanged)
- `Pokemon.types`
- `PokemonDetails.moves[].move.name`
- `PokemonDetails.abilities[].ability.name`

A Pokemon matches if *any* of those fields contains the term - one unified box,
no prefix. `fire` finds Fire-types *and* anything with "fire" in its name, a
move, or an ability (e.g. Flash Fire). Multiple space-separated words all
narrow the match (AND), possibly across different fields on the same Pokemon.

This extends today's `matchesName` (already name+id combined) to also cover
type/move/ability; `matchesType`/`matchesAbility`/`matchesMove` (the
filter-modal-driven predicates in the same `where` clause) are untouched and
stay ANDed with it exactly as today.

### `stage:` - the one typed modifier

`stage:1` means first-stage - a Pokemon that's either the base of its
evolution line or never evolves at all; `stage:2`/`stage:3` are later stages.
Repeating the key ORs it (`stage:1 stage:2` = stage 1 or 2); a
comma-separated form (`stage:1,2`) is accepted too.

No key besides `stage` is a modifier. A `key:value`-shaped token with any other
key (`foo:bar`) is folded back into the plain-text term and fuzzy-matched like
any other word, colon included - never dropped, never an error.

### Evolution stage computation (new)

Not derivable from a single field today - needs the Pokemon's position in its
`EvolutionChain` (`lib/models/pokeapi/evolution_chain.dart`), which is already
bulk-loaded for the whole dex (`PokemonApiProvider._fetchEvolutionChains`, one
of `fetchData()`'s parallel bulk fetches) - no new network calls.

- `chain.chain` is the root `ChainLink` (stage 1); each `ChainLink.evolvesTo`
  entry is one stage deeper. Depth is 1-based: a never-evolving Pokemon and
  every first-stage Pokemon are both `stage:1`.
- New pure function, `lib/utils/evolution_stage.dart`:
  `int? stageOfPokemonInChain(EvolutionChain chain, int pokemonId)` - walks the
  tree matching each link's `species.url` id, returns the 1-based depth, or
  `null` if the id isn't in the chain (shouldn't happen for a Pokemon's own
  chain, but degrades to "doesn't match" rather than throwing).
- While a Pokemon's `evolutionChain` is still loading, it just doesn't match
  `stage:` yet - same "degrade gracefully" rule the filter block's existing
  `try`/`catch` already follows for every other predicate.

### Where parsing happens

New pure module, `lib/utils/search_query_parser.dart`:

```dart
class ParsedSearchQuery {
  final String fuzzyTerm; // joined plain-text tokens, lowercased
  final List<int> stages; // from stage: tokens, empty if none typed
}

ParsedSearchQuery parseSearchQuery(String input);
```

Pure, no Flutter/Provider import - unit-testable like `utils/pokeapi_url.dart`
and `utils/string_utils.dart` already are.

Called from `PokemonSearchBar`'s debounced `_onSearchChanged` →
`_filterPokemon` (`lib/widgets/pokemon_search_bar.dart` - there's no literal
`onChanged` callback; it's a `TextEditingController` listener debounced by a
300ms `Timer`). `fuzzyTerm` replaces the raw search string passed into
`filterPokemon`; `stages` becomes a new `matchesStage` predicate ANDed
alongside the existing ones in `PokemonApiProvider.filterPokemon`'s `where`
clause - it doesn't touch `Filters`/the filter modal, since `stage:` has no
modal equivalent to stay in sync with.

## UI

Discoverability: the search field currently sets `InputDecoration(labelText:
'Search Pokemon', ...)` - a floating label, not inline placeholder text.
`stage:` discoverability should go in `hintText` instead (shown inside the
empty field, where an example string like `"type, move, ability… or
stage:1"` actually reads as a hint rather than permanently floating), keeping
`labelText` as the short field name it already is. No separate help
icon/popover needed for one modifier.

## Future work

- **Typo-tolerant matching.** Today's "fuzzy" is substring-only -
  "flamethrowr" (missing the e) won't match "Flamethrower". True typo
  tolerance (edit-distance, e.g. Levenshtein within 1-2 characters) is a real,
  separate feature needing a library or hand-rolled distance function and a
  tolerance threshold (likely scaled to term length). Deliberately deferred,
  not because it's a bad idea - noted here so it isn't lost.
- `stage:final` as an alias for "last stage in its chain" - cheap once
  `stageOfPokemonInChain` exists, since it already computes full depth.
- Deleting the now-confirmed-redundant `matchesId` exact check (see Correction
  above) as a drive-by cleanup - optional, not required for this feature to
  ship, but worth doing once this code is being touched anyway.

## Acceptance criteria

1. Typing a move name (e.g. "flamethrower") with no prefix returns every
   Pokemon that knows it.
2. Typing a type name (e.g. "fire") with no prefix returns every Pokemon of
   that type, plus any whose name/move/ability also contains "fire".
3. Typing an ability name (e.g. "overgrow") with no prefix returns every
   Pokemon with that ability.
4. Existing name/id substring search continues to work unchanged (regression -
   this replaces `matchesName` with a broader predicate and must not narrow
   what already matched).
5. Two space-separated plain-text words both must match (AND), even against
   different fields on the same Pokemon.
6. `stage:1` returns only first-stage (base or non-evolving) Pokemon;
   `stage:2`/`stage:3` return the correct deeper stages - verified against a
   real 3-stage chain, a 2-stage chain, and a non-evolving Pokemon.
7. `stage:1 stage:2` (repeated key) matches either stage.
8. A query with only a `stage:` token and no plain text still returns results.
9. `stageOfPokemonInChain` returns `null`, not a crash, for an id not present
   in the given chain.
10. An unrecognized `key:value`-shaped token (anything but `stage:`) is
    treated as ordinary plain text, not dropped and not an error.

## Traceability (filled in once accepted and tests exist)

| AC | Test |
|---|---|
| 1 | TBD |
| 2 | TBD |
| 3 | TBD |
| 4 | TBD |
| 5 | TBD |
| 6 | TBD |
| 7 | TBD |
| 8 | TBD |
| 9 | TBD |
| 10 | TBD |

## Open questions

None blocking.
