# Code review: profiles and per-game scopes (uncommitted working tree)

**Status:** Done. All confirmed findings fixed. One finding rejected as a false positive.
**Review:** `/code-review` at medium, run on the working tree. Findings were checked against the code before any change.
**Epic:** [Multi-Profile & Per-Game Tracking](../epics/profiles-and-per-game-tracking/README.md).

## Findings and outcomes

| # | Finding | Outcome | Test that pins it |
|---|---|---|---|
| 1 | A toggle during a profile switch reused the previous profile's record and wrote to the wrong profile | **Fixed.** Writes wait for an in-flight reload before reading the profile and scope. The race test fails without the fix. | `pokemon_api_provider_profile_test` "a toggle during a profile switch" |
| 2 | A scope load that finished late could overwrite a newer choice | **Fixed.** Loads and writes carry a generation number. A stale load is dropped. | `scope_provider_test` "a choice made while a load is still reading storage" |
| 3 | A CSV row shorter than the header threw `RangeError` instead of `FormatException` | **Fixed.** The codec checks row width. | `caught_pokemon_csv_codec_test` "fewer cells than the header" |
| 4 | "Current scope" export copy was wrong on derived National | **Fixed.** On derived National the dialog says the scope exports everything. | `export_scope_dialog_test` "on derived National" |
| 5 | The upgrade notice was keyed off a count computed after the legacy rows were cleared, so a crash in between lost it | **Fixed.** The notice is marked before the migration runs. | `legacy_marker_test`, `fresh_install_marker_test` |
| 6 | `loadGames` could fetch the catalog several times | **Rejected.** `GameCatalog` caches the in-flight future, so concurrent callers share one load. Only a cheap cached call is repeated. | — |

## Found while fixing (not in the review)

- **Existing tests passed for the wrong reason.** The profile-provider tests never set manual National for the second profile. Its writes were refused on derived National, but it passed because the write happened before the scope finished loading. Setup now gives every profile the manual scope. Ash and Misty tests now check the real behaviour.
- **Derived-view names lagged the toggle by one frame.** `setCaught` now updates the in-memory rows immediately, along with the flag.
- **A reload that finished after dispose notified a dead provider.** Reloads check for disposal before applying results. Test: "a reload still in flight when the provider is disposed".
- **Game catalog failures were cached.** Fixed in the previous pass (`game_catalog_test`, "a failed load").

## Remaining gaps

- The review ran as a single pass on the working tree. It did not run on a commit, so re-run `/code-review` on the commit once it exists.
- The derived-National hint is still covered only by the end-to-end test.
