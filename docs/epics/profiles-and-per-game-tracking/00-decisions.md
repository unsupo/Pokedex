# Decision Log

Part of [Multi-Profile & Per-Game Tracking](./README.md).

This file records the product decisions that the phase docs depend on. Each entry says what was
decided, why, and what it changes. When a decision changes, edit it here and link the affected doc.

## D1 — Profiles are local and unauthenticated

- **Decided:** Profiles are local labels stored in Isar. No accounts, no sync.
- **Why:** Matches how everything else persists today. Sync would need its own auth and backend
  epic.
- **Affects:** [01-profile-system.md](./01-profile-system.md), README non-goals.

## D2 — Caught state is scoped by a `scopeKey` string, not a nullable `versionId`

- **Decided:** Every `UserData` row carries a required string `scopeKey`. `CaughtTcgCard` does not
  (see D6). Valid values:
  - `"national"` — the profile's own National checkbox (manual National tracking).
  - `"vg:<versionGroupId>"` — caught in a specific game (e.g. `"vg:17"` for Scarlet/Violet).
- **Derived National** is not stored. It is computed as "caught in any row for this profile",
  whatever the `scopeKey`. See [03-scope-model.md](./03-scope-model.md).
- **Why:** The phase 2 draft used a nullable `versionId` with `null` meaning "game unspecified".
  That overloaded `null` and made the manual-National option impossible to express. A string
  key covers all three options (derived National, manual National, per game) with one column
  and one composite index.
- **Affects:** [02-per-game-tracking.md](./02-per-game-tracking.md) (schema section superseded),
  [03-scope-model.md](./03-scope-model.md).

## D3 — Game key is the PokeAPI version group, not the version

- **Decided:** The per-game key is `VersionGroup`. Red and Blue share one version group, and so do
  Scarlet and Violet. Version-level choices are not offered.
- **Why:** Games in the same group share a regional Pokédex, so a separate per-version checkbox
  would duplicate state with no gameplay meaning. The picker still shows the individual titles
  as labels.
- **Affects:** [03-scope-model.md](./03-scope-model.md), [07-ui.md](./07-ui.md).

## D4 — Scope is chosen per profile, with several options

- **Decided:** Each profile has a current scope. The scope selector lists:
  1. **National (derived)** — caught in any game, plus manual National marks. Read-only tally.
  2. **National (manual)** — a single checkbox per Pokémon, ignoring games.
  3. **One entry per game** — a checkbox per Pokémon for that game only.
- The scope selector is always visible in the filter section, next to the existing filters.
- Each profile remembers its last selected scope.
- **Why:** The user asked for more options rather than one fixed model. Derived National gives a
  "have I ever caught this" view for free. Manual National covers people who don't track by game.
- **Affects:** [07-ui.md](./07-ui.md), [03-scope-model.md](./03-scope-model.md).

## D5 — Derived National toggling

- **Decided:** Derived National is read-only. Tapping a Pokémon while it is the active scope shows
  which games it is caught in, and offers to mark it in a game or in manual National.
- **Why:** Writing to a derived view has no single correct target. Forcing the user to pick a
  target keeps the data unambiguous.
- **Affects:** [07-ui.md](./07-ui.md).

## D6 — TCG cards are per profile, not per game

- **Decided:** `CaughtTcgCard` gets `profileId` only. It has no `scopeKey`.
- **Why:** Trading cards are not tied to a video game version. A game dimension would not mean
  anything for cards.
- **Affects:** [06-tcg-cards.md](./06-tcg-cards.md).

## D7 — Existing data becomes `scopeKey: "national"`

- **Decided:** Phase 1 migration sets all pre-existing rows to the default profile with
  `scopeKey: "national"`. No game is guessed.
- **Why:** The app has no record of which game past catches came from. Manual National is the
  honest home for them.
- **Affects:** [04-migration.md](./04-migration.md).

## D8 — CSV export and import include profile and scope columns

- **Decided:** Export writes the active profile's rows for the active scope. Rows for derived
  National are exported as the union of all the profile's rows, marked with their real `scopeKey`.
  Old files with no `scopeKey` column import as `"national"`.
- **Affects:** [05-csv-io.md](./05-csv-io.md).

## D12 — A profile's default scope is manual National, not derived

- **Decided:** A profile that has never chosen a scope starts on **manual National**, not derived
  National. (Resolves O1 below, the other way from the original leaning.)
- **Why:** Reversed after real use: derived National is read-only (D5), so a fresh profile's very
  first tap on the pokeball did nothing but explain why it couldn't, with no indication a working
  mode existed one tap away in the selector. Catching a Pokémon is the app's most basic action and
  must work immediately, with per-game and derived views staying available but opt-in.
- **Affects:** `lib/services/scope_provider.dart` (`ScopeProvider._parseOrDefault`, both the
  in-memory default and the fallback for a corrupted/unparseable stored value).

## Still open

- ~~**O1:** Should manual National be hidden by default~~ — resolved by D12: it's the default,
  not hidden.
- **O2:** Should a profile be deletable if it is the last one? (Leaning: no, a profile always
  exists. The last one can be reset but not deleted.)

## D9 — Caught Pokemon live in a new `CaughtPokemon` collection

- **Decided:** The profile-scoped record is a new collection, `CaughtPokemon`. The legacy `UserData`
  class is kept unchanged and is read only by the migration.
- **Why:** Adding a unique composite index to `UserData` on an existing install would collide on
  every legacy row, because they all read back with the same default values. `replace: true` would
  then overwrite them silently. A new collection avoids that and keeps the legacy rows readable.
- **Affects:** [01-profile-system.md](./01-profile-system.md), [04-migration.md](./04-migration.md).

## D10 — A column missing from an old row reads back as `Isar.minId`

- **Verified:** Opening a real pre-profile database with the new schema returned `profileId`
  as `Isar.minId` (-9223372036854775808), not 0. Rows that predate `profileId` are therefore
  "unowned" when `profileId < 1`. Real profile ids start at 1.
- **Affects:** `lib/services/local/profile_migration.dart`, [04-migration.md](./04-migration.md).

## D11 — `clearCache()` does not clear profiles or caught records

- **Decided:** `clearCache()` leaves `Profile` and `CaughtPokemon` alone. They are user data, as
  `UserData` already was. `CaughtTcgCard` is still cleared there, as it was before this epic.
- **Why:** Clearing the API cache must not wipe a user's progress. This is a deliberate deviation
  from step 2 of [09-implementation-plan.md](./09-implementation-plan.md).
