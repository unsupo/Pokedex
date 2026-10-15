# Ticket: CSV export/import for caught TCG cards

**Status:** Done.
**Epic:** [Multi-Profile & Per-Game Tracking](../epics/profiles-and-per-game-tracking/README.md).
**Supersedes:** the "Out of scope" note in
[06-tcg-cards.md](../epics/profiles-and-per-game-tracking/06-tcg-cards.md), which called this a
possible follow-up epic. This ticket is that follow-up, scoped down to a single ticket since it
mirrors existing code closely.

## Problem

CSV export/import only covers caught Pokemon. `CaughtTcgCard` never appears anywhere in the
export/import code path (`CaughtPokemonCsvCodec`, `CaughtPokemonTransferService`,
`HamburgerMenu`). Caught status for cards is tracked per profile in Isar (so switching profiles
already works correctly for cards), but there is no way to back it up, move it to another device,
or share it.

## Decision needed before implementing

**Should card export be its own action, or folded into the existing "Export caught Pokemon"
flow?**

- **Option A — separate action (recommended).** A second pair of hamburger-menu entries, "Export
  caught cards" / "Import caught cards", producing their own CSV file. Pokemon and cards stay on
  independent schedules — exporting one never implies exporting the other, matching how they're
  already independent in storage (separate collections, cards have no scope dimension).
- **Option B — one combined action.** A single "Export" writes one file covering both, or two
  files in one pick. Fewer taps, but conflates two different record shapes in the UX (and the
  scope-choice dialog, which cards have no equivalent of) and couldn't reuse
  `CaughtPokemonCsvCodec`'s format without inventing a multi-section file format.

This ticket assumes **Option A** below, since it reuses the existing architecture directly. Flip
to Option B only if a single-file backup is a real requirement — it's a bigger, riskier change for
a convenience, not a capability.

## Design (mirrors the Pokemon export/import stack exactly)

### Codec — `lib/services/io/caught_tcg_card_csv_codec.dart`

Pure, like `CaughtPokemonCsvCodec`. No scope column — cards have no scope dimension (decision D6
in the epic's `00-decisions.md`).

```
cardId,isCaught
swsh1-1,true
base1-4,false
```

```dart
typedef CaughtTcgCardRow = ({String cardId, bool isCaught});

class CaughtTcgCardCsvCodec {
  static String encode(List<CaughtTcgCardRow> rows);
  static List<CaughtTcgCardRow> decode(String csvContent);
}
```

Same decode rules as the Pokemon codec: case-insensitive headers, tolerant of a trailing blank
line, rejects a row shorter than the header with `FormatException` (the bug fixed in the Pokemon
codec during review — write this one correctly from the start rather than reintroducing it).

### Repository — `lib/services/io/caught_tcg_card_repository.dart`

```dart
abstract class CaughtTcgCardRepository {
  Future<List<CaughtTcgCard>> loadAll(int profileId);
  Future<void> saveAll(List<CaughtTcgCard> rows);
}

class LocalServiceCaughtTcgCardRepository implements CaughtTcgCardRepository {
  // loadAll -> _localService.getCaughtTcgCardsForProfile(profileId) (already exists)
  // saveAll -> needs a new LocalService method, see below
}
```

`LocalService`/`IsarService` need a new batch method, `saveAllCaughtTcgCards(List<CaughtTcgCard>)`
(`putAll`, mirroring `saveAllCaughtPokemon`). Today only a single-row `saveCaughtTcgCard` exists;
looping it per imported row would work but skips the existing batching convention used everywhere
else bulk writes happen in this codebase.

### Transfer service — `lib/services/io/caught_tcg_card_transfer_service.dart`

Same shape as `CaughtPokemonTransferService`: export writes only `isCaught == true` rows for the
profile; import merges (only cards present in the file are touched, matching the Pokemon import's
"importing someone else's export adds to your collection" rule). `ExportResult`/`ImportResult` can
likely be the existing ones (they're not Pokemon-specific), or trivial sibling types if that
reuse turns out to read awkwardly once written.

### Provider — `TcgApiProvider`

```dart
Future<ExportResult> exportCaughtCards(CsvTransport transport);
Future<ImportResult> importCaughtCards(CsvTransport transport);
```

Import needs to update already-loaded cards' `isCaught` the same way `PokemonApiProvider` reloads
after an import — loop `_pokemon.values` and re-run `loadCaughtStatus` for the active profile, or
just call the existing profile-switch reload path.

### UI — `HamburgerMenu`

Two more `ListTile`s, "Export caught cards" / "Import caught cards", following the existing
`_exportCaughtPokemon`/`_importCaughtPokemon` pattern (try/catch, snackbar with the count, close
the drawer).

## Tests to write first

- Codec round trip, empty list, trailing blank line, case-insensitive header, short-row
  `FormatException`, wrong-columns `FormatException` — same list as
  `caught_pokemon_csv_codec_test.dart`.
- Transfer service: closed loop, merge-not-replace, idempotent re-import, cancelled save/load,
  profile isolation (export from profile A doesn't touch B) — same list as
  `caught_pokemon_transfer_service_test.dart`.
- `TcgApiProvider.exportCaughtCards`/`importCaughtCards` against a real Isar instance, following
  `tcg_caught_status_persistence_test.dart`'s pattern.
- Widget test for the two new hamburger-menu entries, if the existing ones have one to match
  (check `test/widgets/` before assuming the pattern needs inventing).

## Acceptance

- [x] Export writes only the active profile's caught cards.
      (`caught_tcg_card_transfer_service_test`, "profile scoping"; `tcg_caught_status_persistence_test`,
      "CSV export/import for cards")
- [x] Import only ever changes cards listed in the file; existing caught cards not mentioned in
      the file are untouched. (`caught_tcg_card_transfer_service_test`, "import merges...")
- [x] Round trip: export from profile A, import into profile B, B's caught set matches A's
      exported cards; A is untouched. (`caught_tcg_card_transfer_service_test`, "closed loop")
- [x] A legacy-less format is fine here — there is no pre-profile card export to stay compatible
      with, unlike the Pokemon CSV. (built without one)

## What was actually built (first pass)

- **Option A was taken**: two new hamburger-menu entries, "Export Caught Cards" / "Import Caught
  Cards", independent of the Pokemon export/import and its scope-choice dialog (cards have no
  scope dimension, so there's nothing to ask).
- **`ExportResult`/`ImportResult` were extracted** to `lib/services/io/transfer_result.dart` so
  both transfer services share one definition instead of the card feature importing the Pokemon
  feature's file (or duplicating two small classes).
  `caught_pokemon_transfer_service.dart` re-exports them, so nothing that already imported it
  needed to change.
- **`LocalService.saveAllCaughtTcgCards`** (`putAll`-batched, mirroring `saveAllCaughtPokemon`)
  was added for the import to batch its writes, rather than looping the existing single-row
  `saveCaughtTcgCard`.

## Superseded: real use said Option A was wrong

After living with four hamburger-menu entries (Export/Import × Pokemon/cards), direct feedback:
*"it should just be one export and one import command and be smart about it."* Option B, which
this ticket had deliberately deferred as "a bigger, riskier change for a convenience," turned out
to be what was actually wanted. See
[combined-csv-export.md](./combined-csv-export.md) for what replaced the two-pairs-of-menu-items
design above. The single-type codecs, repositories, and transfer services built here were **not**
thrown away — the combined format's decoder delegates to them for backward compatibility with
every file this app has ever exported, and they're still independently usable. Only the
`PokemonApiProvider.exportCaughtPokemon`/`importCaughtPokemon` and
`TcgApiProvider.exportCaughtCards`/`importCaughtCards` provider methods became unused by the UI
(kept, not deleted — see that doc's note on the tradeoff).
