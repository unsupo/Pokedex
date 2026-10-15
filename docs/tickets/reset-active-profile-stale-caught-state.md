# Ticket: Resetting the active profile leaves caught indicators stale

**Status:** Closed — not reproduced. Regression tests added, no production change.
**Found in:** `/simplify` review of the Phase 1 profile changes.
**Epic:** [Multi-Profile & Per-Game Tracking](../epics/profiles-and-per-game-tracking/README.md), Phase 1.

## Report (as first written)

> `ProfileProvider.resetProfile` clears the data and notifies its own listeners, but the Pokémon
> and TCG providers don't reload, so caught indicators stay checked until the next profile switch.

## Investigation

Both providers subscribe to `ProfileProvider` with `addListener`, and that listener fires on every
`notifyListeners()`. `resetProfile` awaits the repository (which deletes the rows) and only then
calls `notifyListeners()`. So each provider re-reads an already-cleared profile. The report was
wrong: the reload path already covers reset.

## Resolution

No production change. Regression tests lock in the behaviour:

| Test | File |
|---|---|
| resetting the active profile clears its caught indicators without a restart | `test/services/pokemon_api_provider_profile_test.dart` |
| resetting leaves the other profile's caught indicators alone | `test/services/pokemon_api_provider_profile_test.dart` |
| resetting the active profile clears its loaded cards' caught status | `test/services/local/tcg_caught_status_persistence_test.dart` |

## Acceptance (checklist)

- [x] Reproduced first with a test. The test passed, so the bug does not exist.
- [x] No behaviour change, so no production diff.
- [x] Regression tests added for both providers.
- [x] Original report corrected here and in the conversation.
