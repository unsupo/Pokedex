# Ticket: One combined export, one combined import

**Status:** Done.
**Epic:** [Multi-Profile & Per-Game Tracking](../epics/profiles-and-per-game-tracking/README.md).
**Supersedes:** the Option A design in
[tcg-card-csv-export.md](./tcg-card-csv-export.md), after direct feedback that four separate
hamburger-menu entries (Export/Import × Pokemon/cards) was the wrong shape:
*"it should just be one export and one import command and be smart about it."*

## What changed

- **The hamburger menu has two entries**, not four: "Export Caught Data" and "Import Caught
  Data". Each covers caught Pokemon and caught TCG cards together — nothing in the UI asks which
  kind, because both kinds always go together.
- **One file, not two.** Export writes a single CSV with a `kind` column
  (`kind,scopeKey,pokemonId,cardId,isCaught`) so Pokemon rows and card rows share one file. The
  Pokemon side still respects the existing scope-choice dialog (current scope vs. all scopes);
  cards have no scope, so they're never filtered.
- **Import is smart about the file it's given.** It sniffs the header and handles, in order:
  the current combined format (`kind` column), the current Pokemon-only format
  (`scopeKey,pokemonId,isCaught`), the oldest pre-profile format (`id,isCaught`), and the
  Pokemon-card-only format from the superseded ticket (`cardId,isCaught`). Every file this app has
  ever exported still imports correctly, with no prompt asking what kind of file it is.

## Design

### `lib/services/io/combined_caught_csv_codec.dart`

Pure, like the single-type codecs. `decode` delegates to `CaughtPokemonCsvCodec`/
`CaughtTcgCardCsvCodec` for every format except its own `kind`-tagged one, so the backward-compat
parsing isn't duplicated — it's reused from the already-tested single-type codecs.

```dart
typedef CombinedCaughtRow = ({
  String kind, // 'pokemon' or 'card'
  String? scopeKey,
  int? pokemonId,
  String? cardId,
  bool isCaught,
});
```

### `lib/services/io/combined_caught_transfer_service.dart`

Takes both `CaughtPokemonRepository` and `CaughtTcgCardRepository` directly (not the per-type
transfer services — those write their own complete file each, which doesn't compose into one
combined file). Import is a merge on both sides independently, matching the existing
import-never-overwrites rule.

### UI

`HamburgerMenu` builds `CombinedCaughtTransferService` from `LocalService`, which is now exposed
through the provider tree (`Provider<LocalService>.value` in `lib/app_providers.dart`) so the
widget doesn't need its own constructor plumbing for it.

- Export still asks the existing scope-choice dialog
  (`lib/widgets/export/export_scope_dialog.dart`) for the Pokemon side. The resolution of "what
  does 'current scope' mean as a filter" moved to a new public
  `PokemonApiProvider.resolvedExportScopeKey(bool)`, extracted from the old
  `exportCaughtPokemon` so both call sites share one answer instead of two copies of the same
  ternary.
- Import reloads both providers' already-loaded state afterward:
  `PokemonApiProvider.reloadCaughtForActiveProfile()` (already public) and a newly-public
  `TcgApiProvider.reloadLoadedCaughtStatus()` (was private, used only by the profile-switch
  listener; now also called directly after a combined import).

## What was deliberately not touched

- **The single-type codecs, repositories, and transfer services from the superseded ticket are
  still there.** They're not dead: the combined codec's decoder calls them directly for backward
  compatibility, and they're each independently tested.
- **`PokemonApiProvider.exportCaughtPokemon`/`importCaughtPokemon` and
  `TcgApiProvider.exportCaughtCards`/`importCaughtCards` are now unused by the UI**, since
  `HamburgerMenu` only calls the combined service. Left in place rather than deleted: removing
  them would mean also deciding the fate of their own transfer services and the tests built for
  them, a bigger and riskier change than what was asked for (the UI shape), for a benefit that's
  purely hygienic. If they stay unused going forward, removing them is a fair follow-up, but it's
  a separate decision from this one.

## Tests

- `test/services/io/combined_caught_csv_codec_test.dart` — round trip, and one test per older
  format the smart decode must still read, plus rejection of an unrecognized format.
- `test/services/io/combined_caught_transfer_service_test.dart` — export covers both kinds in one
  file; the Pokemon scope filter doesn't touch cards; import merges on both sides without
  replacing; profile isolation; idempotent re-import; cancelled save/load; and two tests proving a
  file written by either of the superseded single-type exporters still imports correctly through
  the combined service.

## Acceptance

- [x] Tapping Export asks the scope question once (for Pokemon) and writes one file containing
      both caught Pokemon and caught cards.
- [x] Tapping Import reads one file and needs no further input to route rows correctly.
- [x] A file from the previous (four-menu-item) version of this feature still imports correctly.
- [x] A file from the oldest pre-profile Pokemon export still imports correctly.
- [x] Import never removes a row that isn't mentioned in the file, for either Pokemon or cards.

## Not done

- No widget test for the two menu entries, for the same reason noted in the superseded ticket:
  `HamburgerMenu` needs the full provider graph to pump in a widget test. Covered by the
  transfer-service and codec tests instead; verify the two menu entries manually if that matters
  before relying on them.
