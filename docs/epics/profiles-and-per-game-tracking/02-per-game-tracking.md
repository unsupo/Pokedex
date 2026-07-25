# Phase 2: Per-Game Tracking

Part of [Multi-Profile & Per-Game Tracking](./README.md). Depends on
[Phase 1: Profile System](./01-profile-system.md) being implemented first — this phase widens
the composite key Phase 1 introduces rather than inventing a new one.

## Summary

Within a profile, let "caught" be tracked per specific game version (e.g. caught in Scarlet vs.
caught in Violet), instead of one caught bit per profile. The data this app already fetches
supports this directly: `Version`/`VersionGroup` (`lib/models/pokeapi/games.dart`,
`PokemonService.getVersion`/`getVersionGroup`/`LocalService.getVersion`) are PokeAPI resources
already being cached — this phase is mostly about *using* data that's already flowing through
the app, plus the UX to go with it.

## The open product question (resolve before implementing)

This is the part worth deciding deliberately, not defaulting into: **when a Pokémon is caught in
one game but not another, what does the main Pokédex list show?**

- **Option A — "caught in any tracked game" (union).** The list's caught indicator is true if
  caught in *any* game the profile has marked as played. Simple, matches how most people
  informally think about "have I caught this," but loses the per-game distinction on the main
  screen (you'd need to drill into a Pokémon's detail view to see the per-game breakdown).
- **Option B — "caught in the currently active game" (scoped).** The profile has a "current
  game" selector (like the active-profile selector from Phase 1), and the whole list/UI scopes
  to it, the same way profile-switching works. More precise, but adds a second selector
  concept stacked on top of profile-switching, and needs its own re-fetch/re-apply-on-switch
  handling exactly like Phase 1's profile switch does.

Recommendation: **Option B**, reusing the exact mechanism Phase 1 builds for profile-switching
(an "active X" pointer + a re-fetch-on-switch flow), rather than inventing a parallel union-based
display mode. Two similar-but-different state-scoping mechanisms in the same app (one additive/
union, one exclusive/switched) is a harder mental model to keep consistent than one mechanism
applied twice. This is a recommendation, not a decision — confirm before building.

## Schema changes

Widen Phase 1's composite index rather than adding a new dimension elsewhere:

```dart
@collection
class UserData {
  final Id isarId = Isar.autoIncrement;
  late int profileId;
  late int? versionId; // null = not scoped to a specific game (see migration note below)
  late int pokemonId;
  late bool isCaught;

  // Composite unique index on (profileId, versionId, pokemonId).
}
```

Same treatment for `CaughtTcgCard` if TCG cards should also be game-scoped — worth confirming
whether that's actually wanted, since TCG cards aren't tied to a video game version the way
Pokémon-caught status is; it may make more sense for TCG caught-status to stay profile-scoped
only (Phase 1) and skip this dimension entirely. Decide during Phase 2 planning, not by default.

## Migration from Phase 1

Phase 1 data has `profileId` but no `versionId`. Rather than forcing a backfill decision
(which game were those catches "in"?) that the app has no way to know, treat `versionId: null`
as its own valid state — "caught, game unspecified" — and don't retroactively assign it to a
game. This also gives a natural default for anyone who never engages with the per-game feature
at all: everything just stays `versionId: null`, functionally identical to Phase 1 behavior.

## Service and UI changes

- **"Active game" selector**, mirroring Phase 1's active-profile mechanism: likely per-profile
  (each profile remembers its own last-selected game), stored the same way (`shared_preferences`
  or wherever Phase 1 lands the active-profile pointer).
- **Game picker UI**: needs a list of `VersionGroup`/`Version` to choose from — this data already
  exists in the app (`PokemonService.getVersionGroup`), so this is primarily a new picker screen/
  widget, not new data-fetching plumbing.
- **`PokemonApiProvider`/`TcgApiProvider`**: extend the Phase 1 scoped get/save calls with the
  active version id; extend the re-fetch-on-switch logic to also trigger on game switch.
- **CSV export/import**: decide whether export includes the version dimension (e.g. a `version`
  column in the CSV) or continues to export only the currently-active game's caught set. Given
  Phase 1 already scopes export to "the active profile," the more consistent answer is scoping
  to "the active profile's active game" too — but note it as a decision point, since the CSV
  codec (`lib/services/io/caught_pokemon_csv_codec.dart`) would need a schema-compatible way to
  add a column without breaking round-trip compatibility with Phase-1-only export files.

## Acceptance criteria

- Marking a Pokémon caught while "Scarlet" is the active game does not mark it caught while
  "Violet" is active, for the same profile.
- A profile that never touches the per-game feature behaves identically to Phase 1 (everything
  resolves to `versionId: null`, no forced game selection).
- The chosen display option (A or B above) is implemented consistently across the main list,
  filter ("caught status" filter in `FilterModal`), and the details/catch screens.
