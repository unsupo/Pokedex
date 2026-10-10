# Ticket: Offer a backup before the profile migration

**Status:** Done.
**Epic:** [Multi-Profile & Per-Game Tracking](../epics/profiles-and-per-game-tracking/README.md), Phase 1.
**Doc step:** [04-migration.md](../epics/profiles-and-per-game-tracking/04-migration.md), step 2.

## Problem

The profile migration rewrites existing caught data. The plan says an upgrading user should be
offered a CSV export first. Nothing offers it yet. The migration itself is safe: it runs in one
write transaction, copies before it clears, and is idempotent. The prompt is a safety net, not a
gate.

## Goal

When the migration moves legacy rows, show a one-time notice on the first screen with an
"Export backup" action that runs the existing export.

## Notes for the implementation

- `migrateCaughtDataToProfiles` must report how many legacy rows it moved, so the app knows to show
  the notice. The count must reach the app without the UI reading the migration directly.
- Show it once. Store a flag, for example in `SharedPreferences`, and clear it when shown.
- Reuse `PokemonApiProvider.exportCaughtPokemon` through the existing hamburger export. Don't add a
  second export path.
- The export is for the active profile. The default profile is the one the migration created.

## Acceptance

- [x] Upgrade from a pre-profile database shows the notice once, and not on the next launch. (`backup_notice_test`: "a marked notice is taken once")
- [x] A fresh install shows no notice. (`backup_notice_widget_test`: "shows nothing on a fresh install")
- [x] The action opens the menu, whose existing export covers the migrated profile. (`backup_notice_widget_test`: "the action opens the menu")
- [x] Unit test on the migration count (`profile_migration_test`, "reporting"), widget test on the notice. The E2E run starts on a fresh database, so it does not exercise the upgrade path; the upgrade is covered by `legacy_upgrade_test`.

## Deviation

The action opens the menu rather than exporting directly. This reuses the existing export and avoids a second copy of its save-and-snackbar code.
