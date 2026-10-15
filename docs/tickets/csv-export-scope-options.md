# Ticket: CSV export scope options

**Status:** Done. Phase 2, plan step 17.
**Epic:** [Multi-Profile & Per-Game Tracking](../epics/profiles-and-per-game-tracking/README.md).
**Doc:** [05-csv-io.md](../epics/profiles-and-per-game-tracking/05-csv-io.md), "Export scope options".

## Current behaviour

Export writes every caught row for the active profile, across all scopes. Each row carries its
`scopeKey`, so the file round-trips. This is the "All scopes" option from the plan. Two of the
three planned options are missing:

- **Current scope** (the planned default): only the rows for the scope on screen.
- **Derived National view**: the union of rows, with each row's real `scopeKey`. This is the same
  data as "All scopes" today, so it doesn't need separate code.

## Goal

Let the export dialog choose "Current scope" or "All scopes", defaulting to "Current scope".

## Acceptance

- [x] Export with "Current scope" writes only rows whose `scopeKey` matches the active scope. (`caught_pokemon_transfer_service_test` "export limited to one scope"; `pokemon_api_provider_scope_test` "CSV export follows the scope choice")
- [x] Export with "All scopes" writes every row for the profile. (`… export with no scope limit`; `… exporting all scopes`)
- [x] Derived National as the current scope exports the union. (`… derived National as the current scope`)
- [x] The chooser returns true for current scope, false for all, null on cancel. (`export_scope_dialog_test`)
- [ ] Round trip of one game into another profile: covered by the transfer round-trip tests in the scope filter, not by a separate test. Not run end to end.
- [ ] One E2E export run: not built, because the native file picker can't be driven in the E2E test.

## Decision made

The default choice is "Current scope", as the plan says. The chooser has no default button, so it doesn't apply silently. Existing users get a choice on each export, and "All scopes" keeps the old behaviour.

## Notes

- The change is a filter in `CaughtPokemonTransferService.exportCaught` plus a choice in the
  hamburger menu. Nothing in the file format changes.
- Changing the default from "All scopes" to "Current scope" changes what existing users get when
  they export. Decide that explicitly before shipping.
