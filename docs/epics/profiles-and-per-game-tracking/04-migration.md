# Migration

Part of [Multi-Profile & Per-Game Tracking](./README.md). Covers existing installs for both
phases, per [D7](./00-decisions.md#d7--existing-data-becomes-scopekey-national).

## Starting state (pre-epic)

- `UserData`: one row per national dex id, `id` = dex id, `isCaught`.
- `CaughtTcgCard`: one row per card, `cardId` unique, `isCaught`.
- No profile concept.

## Target state

- `Profile` collection with at least one row.
- `UserData`: `isarId`, `profileId`, `scopeKey`, `pokemonId`, `isCaught`. Unique on
  `(profileId, scopeKey, pokemonId)`.
- `CaughtTcgCard`: `isarId`, `profileId`, `cardId`, `isCaught`. Unique on `(profileId, cardId)`.
- `AppSettings`-style pointer for the active profile id and each profile's last scope. See the
  storage note in the README (`shared_preferences`).

## Steps

Run once, guarded by a schema version, on `IsarService.init()`:

1. **Detect old shape.** If `UserData` rows exist with no `profileId` field, this is an upgrade.
   On a fresh install, skip to step 3.
2. **Backup safety net.** Before touching rows, the app should prompt the user to export CSV.
   Only a prompt, not a blocker. The migration itself does not rely on the export.
3. **Create the default profile.** Name it "Trainer 1". Set it as active.
4. **Backfill `UserData`.** Each old row becomes `profileId = default`,
   `scopeKey = "national"`, same `pokemonId` and `isCaught`.
5. **Backfill `CaughtTcgCard`.** Each old row gets `profileId = default`.
6. **Record the schema version** so the migration never runs twice.

Migrating in one Isar write transaction keeps it atomic. If it fails, nothing is partly written,
and the next launch retries.

## Ordering across phases

- Phase 1 ships steps 1–6 with `scopeKey` already present, set to `"national"` for every row.
  Shipping `scopeKey` in Phase 1 avoids a second migration in Phase 2.
- Phase 2 adds only the per-game UI and `vg:` rows. It needs no data migration.
- Phase 1 adds `scopeKey` (always `"national"`) rather than leaving it to Phase 2. That way Phase 2
  has nothing to backfill, and the composite index only changes once.

## Tests

- Seed an old-shape database (`UserData` rows with `id` = dex id, no `profileId`). Run the
  migration. Assert:
  - one profile exists and is active,
  - every former row exists with the same `pokemonId` and `isCaught`, and `scopeKey == "national"`,
  - the count of caught rows is unchanged.
- Run the migration twice. Assert nothing changes the second time.
- Fresh install: one profile, no rows, no migration run.
- Failure injection: force an error in step 4. Assert no partial state is left.

## Rollback

There's no downgrade path. The pre-migration CSV export is the rollback. The migration notes this
in the prompt from step 2.
