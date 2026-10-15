# CSV Export and Import

Part of [Multi-Profile & Per-Game Tracking](./README.md). Extends the existing export/import
feature (`lib/services/io/*`) per [D8](./00-decisions.md#d8--csv-export-and-import-include-profile-and-scope-columns).

## Current format

```
id,isCaught
25,true
```

Written by `CaughtPokemonCsvCodec.encode`, read by `decode`. The codec is pure, and
`CaughtPokemonTransferService` drives it through a `CsvTransport` and a `CaughtPokemonRepository`.

## New format

```
scopeKey,pokemonId,isCaught
national,25,true
vg:17,25,true
vg:17,26,false
```

- `scopeKey` replaces the `id` column. A `pokemonId` column replaces `id` for the Pokémon id.
- No `profileId` column. A file always belongs to the profile that imports it. Profile is not
  part of the data, so a file can't accidentally write into another profile.
- Export writes only the active profile's rows for the chosen export scope (see below).

## Export scope options

The export dialog offers:

1. **Current scope** (default) — rows for the active `scopeKey` only.
2. **All scopes** — every row for the active profile.
3. **Derived National view** — the union of all rows, written with each row's real `scopeKey`.
   Derived National has no stored rows of its own, so this exports the underlying rows.

Option 3 is for backing up everything. Option 1 is for sharing a single game's checklist.

## Import rules

- **Merge, never overwrite.** Only rows present in the file are touched. This is the same rule
  as today.
- Rows are upserted on `(profileId, scopeKey, pokemonId)`, the active profile's composite key.
- The file's `scopeKey` decides where each row lands. A game key that isn't known to the device
  is still stored, so the data survives, but it has no picker entry until the app knows the game.
- Unknown `pokemonId` values are skipped and counted in the result.

## Backward compatibility

- **Old files** (`id,isCaught`) import into the active profile under `scopeKey = "national"`.
  The decoder detects the `id` header and maps it.
- **New files** written by an old app version are not supported. Only the import direction matters
  here, so this is acceptable.
- Both formats are covered by tests (see [08-testing.md](./08-testing.md)).

## Codec changes

- `decode` detects header style: `id` → legacy path, `pokemonId` → current path.
- The `UserData` objects carry `scopeKey`. The repository gets `loadAll(profileId)` and
  `saveAll(profileId, rows)`, so the transfer service doesn't need a global profile singleton.

## Acceptance

- Round trip: export the current scope, import into a second profile, and that profile now has
  exactly the same rows for that scope.
- Importing a legacy `id,isCaught` file marks those Pokémon caught in manual National.
- Importing never removes a row that isn't in the file.
