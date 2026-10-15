# Implementation Plan

Part of [Multi-Profile & Per-Game Tracking](./README.md). Ordered steps, each with a checkpoint.
Each step ends with `flutter analyze` and `flutter test` passing, and, when a collection changed,
`build_runner` run.

## Phase 1 — Profiles (with `scopeKey` already in place)

1. **Models.** Add `Profile`. Change `UserData` to the composite shape with `scopeKey` (always
   `"national"` for now). Change `CaughtTcgCard` to add `profileId`. Run `build_runner`.
   *Checkpoint: app compiles, models match [03-scope-model.md](./03-scope-model.md).*
2. **Schema registration.** Register `ProfileSchema`. Add `profiles.clear()` to `clearCache()`.
   *Checkpoint: this is the step that is easy to forget. Re-read `clearCache()` after editing.*
3. **Migration.** Implement [04-migration.md](./04-migration.md) steps 1–6, with tests.
   *Checkpoint: old-shape seed test passes.*
4. **Local service.** Add `profileId` (and `scopeKey`) to the `UserData` and `CaughtTcgCard` get/save
   methods, in both `LocalService` and `IsarService`.
5. **Active profile.** Add the active profile pointer (`shared_preferences`) and a profile
   `ChangeNotifier`, or fold it into `UiStateProvider`.
6. **Provider.** Make `PokemonApiProvider` and `TcgApiProvider` read the active map, and re-load on
   profile switch. Remove the `UserData(id: 0)` placeholder in `TcgApiProvider.setCaught`.
   *Checkpoint: switching profile changes indicators in a manual check.*
7. **CSV.** Implement [05-csv-io.md](./05-csv-io.md), with legacy-file tests.
8. **Profile UI.** Profile chip, sheet, and create/rename/reset. Keep the hamburger menu entry as
   a fallback.
9. **Phase 1 acceptance.** Walk the criteria in [01-profile-system.md](./01-profile-system.md).

## Phase 2 — Scopes and games

10. **Scope value object.** Add the `Scope` types from [03-scope-model.md](./03-scope-model.md),
    with unit tests.
11. **Game source.** Load version groups and their regional dexes. Cache them. Add a loader that
    returns a game's Pokémon list with dex numbers.
    *Checkpoint: a game's list length matches its regional dex count.*
12. **Scope in provider.** Read and write by `(profileId, scopeKey)`. Derived National is computed
    in memory.
13. **Scope selector.** Chip row in the filter section. Persist the last scope per profile.
14. **Derived National rules.** Read-only tiles with the "caught in N games" badge and hint.
15. **Details screen.** "Caught in" section. Toggle writes to the active scope.
16. **Game picker.** Shared list widget for the selector.
17. **CSV scope export options.** The three export choices from [05-csv-io.md](./05-csv-io.md).
18. **Phase 2 acceptance.** Walk the criteria in [02-per-game-tracking.md](./02-per-game-tracking.md)
    and [07-ui.md](./07-ui.md).

## Risks

- **Isar composite index syntax** in `isar_community` is unverified in this doc set. Confirm it in
  step 1 with a tiny test before writing the rest.
- **Regional dex data** may differ from what's expected for some games. Verify a few games against
  PokeAPI in step 11 before building the UI.
- **Memory**: the in-memory caught map is one profile's rows, so it's small. Watch it anyway if
  scope count grows.
