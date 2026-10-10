# Epic: Multi-Profile & Per-Game Tracking

## Problem

All progress tracking in the app today is global and singular:

- `UserData` (`lib/models/user_data.dart`) is `{ final Id id; bool isCaught; }`, where `id`
  **is** the Pokémon's national dex id — it doubles as both the Isar primary key and the
  business key. There is exactly one caught/not-caught bit per Pokémon, device-wide.
- `CaughtTcgCard` (`lib/models/tcg_card.dart`) is `{ isarId (autoIncrement); cardId (unique
  index); isCaught }` — one caught/not-caught bit per TCG card, device-wide.
- Nothing in the schema, the provider layer (`PokemonApiProvider`, `TcgApiProvider`), or the
  CSV export/import feature (`lib/services/io/*`) has any concept of "whose" progress this is,
  or which game it was caught in.

Two people sharing a device, or one person wanting to track "caught in Scarlet" separately from
"caught in Violet," can't be represented at all right now.

## Goals

1. Support multiple local **trainer profiles** on one device, each with its own independent
   caught-Pokémon and caught-TCG-card state.
2. Lay a schema foundation that can later scope tracking **per game version** as well
   (PokeAPI's `Version`/`VersionGroup` resources are already fetched and cached — see
   `lib/models/pokeapi/games.dart`, `PokemonService.getVersion`/`getVersionGroup`) — without
   a second disruptive migration.
3. Keep today's CSV export/import feature working, scoped to whichever profile is active.

## Non-goals (for this epic)

- **No cloud sync or cross-device profile sharing.** Profiles are local to the device, same as
  everything else the app persists today (Isar). If sync becomes a goal later, that's a
  separate epic with its own auth/backend design.
- **No authentication.** A profile is a local label a user picks from a list, not an account.
- **No retroactive per-game backfill of history.** Existing caught data has no record of which
  game it came from; Phase 2 starts per-game tracking going forward, it doesn't try to guess
  the past.

## Phased approach

Doing both dimensions (profile × game) in one migration is the riskier path — it means
committing to the per-game UX (a game picker, "which games count as caught" semantics) before
anyone has used profiles at all. Splitting into two phases lets Phase 1 ship and be lived with
before Phase 2's harder product question gets locked in.

| Phase | Adds | Doc |
|---|---|---|
| 1 | Multiple profiles, each with independently-scoped caught state | [01-profile-system.md](./01-profile-system.md) |
| 2 | Scopes within a profile: derived National, manual National, and one per game | [02-per-game-tracking.md](./02-per-game-tracking.md) |

Phase 2 is designed to layer onto Phase 1's schema rather than replace it. Phase 1 already writes
a `scopeKey` column (always `"national"`), so Phase 2 doesn't need a second migration.

## Supporting docs

| Doc | Purpose |
|---|---|
| [00-decisions.md](./00-decisions.md) | Decision log (D1–D8) and open questions. Read first. |
| [03-scope-model.md](./03-scope-model.md) | The scope concept: derived National, manual National, per game. |
| [04-migration.md](./04-migration.md) | Upgrade path for existing installs, with tests. |
| [05-csv-io.md](./05-csv-io.md) | CSV format, export scope options, legacy import. |
| [06-tcg-cards.md](./06-tcg-cards.md) | Cards per profile, no game dimension. |
| [07-ui.md](./07-ui.md) | Profile switcher, scope selector, details, game picker. |
| [08-testing.md](./08-testing.md) | Unit, integration, and manual test plan. |
| [09-implementation-plan.md](./09-implementation-plan.md) | Ordered steps with checkpoints. |

Where a phase doc and `00-decisions.md` disagree, the decision log wins.

**Before any doc here is closed**, it must pass [docs/ACCEPTANCE_CHECKLIST.md](../../ACCEPTANCE_CHECKLIST.md),
including its closing record. Phase 1 is **Done**. Phase 2 is **Done**. Open items are listed in its closing record.

## Cross-cutting open questions

These affect both phases and are worth deciding before Phase 1 implementation starts:

- **Where does "active profile" live?** `shared_preferences` is already a dependency
  (`pubspec.yaml`) and is the natural, lightweight place for "which profile id is active" —
  cheaper than a dedicated Isar collection for a single scalar value. Isar still holds the
  `Profile` records themselves.
- **What happens to existing installs?** Today's `UserData`/`CaughtTcgCard` rows have no
  profile. Phase 1 needs a one-time migration that creates a default profile and attributes
  all existing rows to it, so nobody's current caught list silently disappears on upgrade.
- **Does switching profiles require reloading in-memory state, not just re-filtering?**
  `Pokemon.userData`/`TcgCard.userData` are cached directly on the in-memory model objects
  (`PokemonApiProvider._pokemon`, `TcgApiProvider._pokemon`). Switching the active profile means
  re-fetching and re-applying `UserData`/`CaughtTcgCard` for the new profile, not just changing
  a filter predicate — flagged in detail in the Phase 1 doc.
