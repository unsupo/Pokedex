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

## Resolved: scope options (see D4)

The question below is resolved. The app offers **both** models as selectable scopes rather than
choosing one: derived National (union of games, Option A), manual National, and one scope per
game (Option B). Scope is chosen per profile, and the scope selector is always visible. The
reasoning for keeping one mechanism is still valid, which is why all three share one
`(profileId, scopeKey)` path. See [03-scope-model.md](./03-scope-model.md).

## The original product question (historical)

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

> **Superseded by [D2](./00-decisions.md#d2--caught-state-is-scoped-by-a-scopekey-string-not-a-nullable-versionid)
> and [03-scope-model.md](./03-scope-model.md).** The draft below used a nullable `versionId`.
> The decided shape is a required string `scopeKey` (`"national"` or `"vg:<versionGroupId>"`),
> which also expresses manual National and derived National. Kept here for history.

Widen Phase 1's composite index rather than adding a new dimension elsewhere:

```dart
@collection
class UserData {
  final Id isarId = Isar.autoIncrement;
  late int profileId;
  late int? versionId; // superseded: see scopeKey in 03-scope-model.md
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

## Traceability (acceptance → tests)

| Acceptance criterion | Test(s) |
|---|---|
| A Pokemon caught in one game is not caught in another, same profile | `pokemon_api_provider_scope_test` "National and a game are independent…"; E2E "derived National refuses…" (game toggle) |
| A profile that never uses the feature behaves as Phase 1 | `scope_provider_test` "starts on derived"; manual-National tests in `pokemon_api_provider_profile_test` (unchanged) |
| The chosen display model is consistent across list, filter and details | `pokemon_api_provider_scope_test` "game scope membership", "derived National"; `scope_selector_test`; `caught_in_games_test`; E2E |

## Decisions taken in implementation

- **Option A and Option B both shipped as scopes** (D4). Derived National is read-only (D5).
- **No separate game-picker screen** (plan step 16). The selector chips are the picker.
- **Game membership comes from each game's regional Pokedex.** A Pokemon outside a game's Pokedex
  is hidden in that game's scope and does not count toward its total.
- **The game list loads on first launch** (PokeAPI version groups and Pokedexes, then cached in
  Isar). Only the version-group id list is not cached.
- **`Pokemon.isCaught` is a plain transient flag** set by PokemonApiProvider. The per-profile
  records are held by the provider, not on the shared model.

## Open items

- **Derived National's toggle hint** is covered by the E2E test only, not by a widget test, because
  the list item needs the full provider graph.

## Closing record

- Date: 2026-10-06
- Commit: not yet committed (working tree)
- Checklist: [docs/ACCEPTANCE_CHECKLIST.md](../../ACCEPTANCE_CHECKLIST.md). Unmet items are under Open items.
- Tests: `flutter test` 161 passing, 1 failing (`test/widget_test.dart`, the untouched Flutter counter template, failing before this work). E2E `integration_test/profiles_e2e_test.dart` on macOS: 2 tests passing.
- analyze: 0 errors.
- Fixed during the final pass: the "Caught in" list said "not caught in any game" before the game list had loaded. It now shows "Loading games…" until `PokemonApiProvider.gamesLoaded` is true (`caught_in_games_test`).
- Also fixed in the final pass: a failed game-list load was cached, so an offline first launch left the game list empty until restart. Failed loads are no longer cached (`game_catalog_test`, "a failed load").
- Code review (medium) on the working tree: findings fixed or rejected, recorded in [code-review-phase-2.md](../../tickets/code-review-phase-2.md).
