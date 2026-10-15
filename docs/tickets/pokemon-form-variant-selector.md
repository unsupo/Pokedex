# Ticket: Let users pick a Pokémon's alternate forms/varieties on the details screen

## Background

Earlier this session, the main Pokémon list was fixed to source from PokeAPI's
`/pokemon-species` endpoint (1025 clean entries, one per species) instead of `/pokemon` (which
listed every variety separately — e.g. all ~14 Minior color/meteor forms as their own rows). That
fix was scoped to "stop polluting the main list with non-default variants," and deliberately did
not attempt to surface those variants anywhere — this ticket is the follow-up: some species
*should* let the user pick among their forms from the details screen, since those forms are real,
distinct-looking Pokémon (different sprites, sometimes different types/stats) that the current
UI has no way to reach at all.

Confirmed via PokeAPI during that investigation - `pokemon-species/{name}` returns a `varieties`
array, each entry `{is_default: bool, pokemon: {name, url}}`:

- **Minior** (species 774): 14 varieties — 7 "meteor" forms (`minior-red-meteor` through
  `minior-violet-meteor`) and 7 "core" forms (`minior-red` through `minior-violet`), one shell
  color each. Default variety is `minior-red-meteor`.
- **Mimikyu** (species 778): 4 varieties — `mimikyu-disguised` (default, its normal appearance),
  `mimikyu-busted` (post-damage), plus totem versions of both.
- This pattern repeats for every Pokémon with megas, regional forms, formes (Deoxys, Rotom,
  Wormadam, Giratina, Shaymin, Arceus, Genesect, Vivillon, Flabébé line, Oricorio, Lycanroc,
  Necrozma, ...), and battle-only forms — a large fraction of the Pokédex, not an edge case.

## What's being asked

On the Pokémon details screen, show small selectable form icons alongside/on the main portrait,
so tapping one switches the displayed sprite (and presumably stats/types/moves, since some forms
genuinely differ - e.g. Wormadam's forms have different types) to that variety, without leaving
the details screen or losing the "this is still logically the same species" context (name,
Pokédex number, evolution chain position, etc. shouldn't change).

## Open design questions (resolve before implementing)

- **Which data changes per form, and which stays pinned to the species?** Sprites and types
  likely change per-variety (each variety has its own `/pokemon/{id}` with its own `sprites`/
  `types`/`stats`). Evolution chain, Pokédex number, breeding info, flavor text are
  species-level and should probably stay constant across form selection. This needs to be
  mapped out per-section of the existing Game Details tab (which sections come from
  `pokemon.details` vs `pokemon.species` matters here — see `_buildGameDetailsTab`,
  `lib/screens/pokemon_details_screen.dart`).
- **Where do the small form icons go?** The request specifically says "smaller form icons on the
  big icon" — i.e. overlaid on/near the main portrait in the collapsing header
  (`flexibleSpace.background`, same file), rather than a separate row/section. Needs a concrete
  layout (e.g. a horizontal strip of small tappable sprites below or beside the big one).
- **Does switching forms affect caught-status tracking?** Right now `UserData`/caught status is
  keyed by the species' national dex id — does catching count once per species regardless of
  which form was viewed, or does this interact with the profile/per-game-tracking epic
  (`docs/epics/profiles-and-per-game-tracking/`)? Likely "no change" (forms are cosmetic/stat
  variants of the same catch, not separate catches) but worth confirming rather than assuming.
- **Not every species has forms worth surfacing.** Most species have exactly one variety (no
  selector needed at all). The UI should only show the form-picker when
  `pokemon-species.varieties.length > 1`.

## Data already available

`PokemonSpecies` (`lib/models/pokeapi/pokemon_species.dart`) is already fetched per-Pokémon
(`pokemon.species`) - check whether it already models `varieties`, or whether that field needs to
be added to the model and its `fromJson`. Fetching each variety's own `PokemonDetails` (for its
sprite/types/stats) would go through the existing `PokemonService.getPokemonDetails(id)` — no new
service-layer plumbing needed, just calling it with the variety's own id instead of the species'
default id.

## Scope

- `lib/models/pokeapi/pokemon_species.dart` (add `varieties` if not already modeled)
- `lib/screens/pokemon_details_screen.dart` (form picker UI + state for "which variety is
  currently displayed")
- Possibly `lib/models/pokeapi/pokemon.dart` / `PokemonApiProvider` if caching per-variety details
  needs a home beyond the currently-displayed one

## Acceptance criteria

- Species with more than one variety (Minior, Mimikyu, and the mega/regional/forme cases) show a
  row of small tappable form icons near the main portrait.
- Species with exactly one variety show no form picker at all (unchanged from today).
- Tapping a form icon updates the displayed sprite (and types/stats, where the form actually
  differs) without navigating away from the details screen or changing which species/Pokédex
  entry is being viewed.
