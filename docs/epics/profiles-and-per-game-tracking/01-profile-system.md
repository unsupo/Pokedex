# Phase 1: Profile System

Part of [Multi-Profile & Per-Game Tracking](./README.md).

## Summary

Introduce a `Profile` entity, an "active profile" selection, and scope existing caught-Pokémon
/ caught-TCG-card tracking to the active profile — without changing anything about *how*
tracking works, just *whose* it is.

## Schema changes

### New: `Profile` collection

A new Isar collection, following the shape of existing simple collections
(`lib/models/user_data.dart` is the closest precedent):

```dart
@collection
class Profile {
  final Id id = Isar.autoIncrement;
  late String name;
  // Optional, if wanted: an avatar sprite/color, createdAt, etc. Keep minimal for v1.
}
```

Registered in `IsarService.init()`'s schema list (`lib/services/local/isar_local_service.dart`)
alongside the other ~39 collections already there, and added to `clearCache()` like every other
collection — this was a real, easy-to-miss bug in this codebase before (`clearCache()` was
missing `berrys.clear()` for a while), worth a deliberate double-check here.

### Changed: `UserData` — profile-scoped

Today `UserData.id` **is** the Pokémon's dex id, used directly as the Isar primary key. That
means the primary key currently encodes "which Pokémon," with no room for "which profile." This
needs to change to a composite lookup, the same pattern already established this session for
`CaughtTcgCard` (`lib/models/tcg_card.dart`) — an opaque autoIncrement primary key, with the
*business* key enforced via a unique index instead of being the primary key itself:

```dart
@collection
class UserData {
  final Id isarId = Isar.autoIncrement;
  late int profileId;
  late int pokemonId; // renamed from `id` for clarity now that isarId is the real Isar id
  late bool isCaught;

  // Composite unique index on (profileId, pokemonId), with replace:true for
  // idempotent upsert-by-composite-key the same way CaughtTcgCard does it today.
  // Confirm exact isar_community composite @Index syntax during implementation -
  // don't take this snippet as verified-correct API usage, just the intended shape.
}
```

### Changed: `CaughtTcgCard` — same treatment

Add `late int profileId;` and widen the existing unique index from `cardId` alone to
`(profileId, cardId)`.

### Migration for existing installs

A one-time step in `IsarService.init()` (or a dedicated migration step run once after opening
the DB): if any `UserData`/`CaughtTcgCard` rows exist with no `profileId` (i.e., this is an
upgrade from a pre-profile version), create a default `Profile` ("Trainer 1" or similar) and
backfill `profileId` onto all existing rows. Needs a concrete test: seed old-shape data, run the
migration, assert nothing is lost and it's attributed to the new default profile.

## Service layer changes

- **`LocalService`/`IsarService`** (`lib/services/local/local_service.dart` /
  `isar_local_service.dart`): every `UserData`/`CaughtTcgCard` get/save method needs a
  `profileId` parameter. Follow the existing pattern of narrow, purpose-built methods rather
  than a generic "pass a filter object" API — that's what `getCaughtTcgCard(String cardId)` /
  `saveCaughtTcgCard(CaughtTcgCard)` already look like, just add the profile parameter.
- **New: an "active profile" service.** Something like a small `ActiveProfileService` wrapping
  `shared_preferences`, with a `ChangeNotifier` (or plugging into `UiStateProvider`,
  `lib/services/ui_state_provider.dart`, which already holds small pieces of cross-cutting UI
  state like `tabIndex`) exposing `activeProfileId` and `setActiveProfile(int id)`.
- **`PokemonApiProvider`/`TcgApiProvider`**: `isCaught()`, `_fetchUserData()`,
  `TcgApiProvider.setCaught()`/`loadCaughtStatus()` all need to read/write scoped to the active
  profile id instead of unconditionally. More importantly: **switching the active profile must
  re-run `_fetchUserData()`/`loadCaughtStatus()` and re-apply results onto the in-memory
  `Pokemon`/`TcgCard` objects**, not just change a filter — today's caught state is cached
  directly on those model objects (`pokemon.userData`, `tcgCard.userData`), so a stale profile's
  caught flags would otherwise linger in memory after switching.
- **`CaughtPokemonTransferService`/CSV export-import** (`lib/services/io/*`): export/import
  should operate on the *active* profile's `UserData` only. `LocalServiceCaughtPokemonRepository`
  needs a `profileId` (likely constructed per-active-profile rather than as an app-lifetime
  singleton, or made to read the active profile id on each call — decide during implementation).
  The existing round-trip test suite (`test/services/io/caught_pokemon_transfer_service_test.dart`)
  is a good base to extend with "two profiles, exporting one doesn't touch the other" cases.

## UI changes

- A profile picker/switcher — minimum viable version is a list in the hamburger menu
  (`lib/widgets/hamburger_menu.dart`) with "add profile" and a way to select the active one; a
  dedicated screen is the nicer version but not required for v1.
- Nothing else in the UI should need to change — the main list, details screen, catch screen,
  etc. all keep reading `pokemon.isCaught`/`pokemon.userData` exactly as they do today; the
  scoping is invisible below the provider layer.

## Acceptance criteria

- A fresh install has exactly one profile (created automatically, e.g. "Trainer 1") and behaves
  identically to today.
- An upgrade from a pre-profile install preserves all existing caught state, attributed to a
  single default profile.
- Creating a second profile and marking Pokémon/cards caught under it does not affect the first
  profile's caught state, and vice versa — verified by an automated test analogous to the
  existing `tcg_caught_status_persistence_test.dart` isolation test.
- Switching the active profile updates the main list's caught indicators and catch-probability
  screen without requiring an app restart.
- CSV export produces only the active profile's caught set; CSV import only affects the active
  profile.
