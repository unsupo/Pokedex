# Testing

Part of [Multi-Profile & Per-Game Tracking](./README.md).

The codebase has no real test suite yet (`test/widget_test.dart` is the Flutter template). The
existing tests that matter here:

- `test/services/io/caught_pokemon_csv_codec_test.dart` — codec round trip.
- `test/services/io/caught_pokemon_transfer_service_test.dart` — export/import with in-memory fakes.
- `tcg_caught_status_persistence_test.dart` — card caught isolation (referenced in Phase 1).

## Unit tests

| Area | Cases |
|---|---|
| `Scope` | `key` for each kind; `GameScope(17).key == "vg:17"`. |
| Derived National | Caught in one game → true. Caught in none → false. Un-catch in one, still caught in another → true. |
| Codec | Legacy `id,isCaught` decodes to `scopeKey = "national"`. New format round trips. Unknown header fails clearly. |
| Transfer service | Export current scope writes only that scope. Import merges and never removes rows. Two profiles, export one, the other is untouched. |
| Migration | Old-shape seed → one profile, all rows `national`, counts unchanged. Re-run is a no-op. Injected failure leaves no partial state. |

## Integration tests

| Flow | Expected |
|---|---|
| Fresh install | One profile, no migration, caught toggles work in manual National. |
| Upgrade | Existing caught Pokémon appear as caught in manual National, in the default profile. |
| Two profiles | Mark Pokémon caught in A. Switch to B. It is not caught in B. Switch back. It is caught again. |
| Per game | Mark caught in game X. Switch to game Y. Not caught. Derived National shows caught. |
| TCG isolation | Caught card in A is not caught in B. |

## Manual checks

Run on at least one mobile target and one desktop target before merging each phase:

- Switching profile and scope with a long list scrolled. Indicators update without stale tiles.
- Importing a legacy CSV from a pre-epic export.
- The derived National chip rejects a direct tap and shows the hint.

## Commands

```bash
flutter test
flutter analyze
dart run build_runner build --delete-conflicting-outputs   # after every @collection change
```
