# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

A Flutter Pokédex app that mirrors data from [PokeAPI](https://pokeapi.co) (and card data from the
[Pokémon TCG API](https://pokemontcg.io)) into a local Isar database, then layers UI, filtering, catch-tracking,
and Pokémon-mechanics calculators (capture probability, type effectiveness, battle math) on top. Targets
iOS/Android/macOS/Windows/Linux/web from one codebase.

## Commands

```bash
flutter pub get                 # install dependencies

# Isar model code generation — required after editing any @collection class
# (lib/models/**/*.dart) or its @JsonSerializable(). Regenerates the matching *.g.dart.
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs   # regenerate on save

flutter analyze                 # static analysis / lints (flutter_lints via analysis_options.yaml)
flutter test                    # run all tests
flutter test test/widget_test.dart   # run a single test file

flutter run                     # run on a connected device/simulator
flutter run -d chrome           # run in a browser
flutter build apk / ios / macos / web   # platform builds
```

Note: `test/widget_test.dart` is currently the unmodified Flutter template test (a counter smoke test) and does
not exercise this app — there is no real test suite yet.

## Architecture

### Data flow: API → Service → Local cache → Provider → UI

- **`lib/services/pokemon_service.dart`** / **`lib/services/tcg_service.dart`** — raw HTTP clients
  (`pokeapi.co/api/v2/...`, `api.pokemontcg.io/v2/...`). Every `getX(id)` method follows the same
  cache-first pattern: check `LocalService` first, fall back to `http.get`, deserialize with the model's
  `fromJson`, then persist back to `LocalService` (a handful of endpoints, e.g. `getItem`/`getMove`/`getAbility`,
  intentionally skip the per-item save because the caller batches the save instead — see the `_fetchX`/`saveAllX`
  pattern below).
- **`lib/services/local/local_service.dart`** — abstract `LocalService` interface: one get/save pair per PokeAPI
  resource type (~35 of them: berries, contests, encounters, evolution, games, items, locations, machines,
  moves, abilities, characteristics, egg groups, genders, growth rates, natures, pokeathlon stats, stats,
  languages, plus pokémon/species/details/evolution-chain/user-data).
- **`lib/services/local/isar_local_service.dart`** — the only implementation, backed by
  [Isar Community](https://pub.dev/packages/isar_community) (NoSQL, opened in `main.dart` with the full schema
  list). Adding a new cached resource means: add the model with `@collection`, register its `Schema` in
  `IsarService.init()`, add get/save methods to both `LocalService` and `IsarService`, and add its `.clear()` call
  to `clearCache()`.
- **`lib/services/pokemon_api_provider.dart`** — the app's central `ChangeNotifier`. `fetchData()` is the startup
  entry point: loads the pokémon list + user data first, then fires off parallel bulk fetches
  (`_fetchPokemonDetailsAndSpecies`, `_fetchEvolutionChains`, `_fetchMoves`, `_fetchAbilities`, `_fetchItems`).
  Each of these reads what's cached locally, diffs against a known-size threshold (e.g. `allMoves.length < 900`)
  to decide whether to hit the network for the rest, fetches missing entries concurrently via `Future.wait`, and
  batch-saves new entries back to Isar. `filterPokemon()` implements all search/filter logic (name/id, types,
  abilities, moves, caught status, generation) in one pass over `_pokemon.values`.
- **`lib/services/tcg_api_provider.dart`** — same provider pattern for TCG card data.
- **`lib/services/ui_state_provider.dart`** — small transient UI state (selected tab, image toggle), not
  persisted per-pokémon.

All three providers are constructed in `main.dart` via `MultiProvider` and injected with a single shared
`LocalService` (Isar) instance created once at startup (`IsarService.create()`).

### Models (`lib/models/pokeapi/*.dart`)

One file per PokeAPI resource (abilities, berries, characteristics, contests, egg_groups, encounters,
evolution/evolution_chain, games, genders, growth_rates, items, locations, machines, moves, natures,
pokeathlonstat, pokemon/pokemon_details/pokemon_species, stat, utility). Each is annotated with both
`@JsonSerializable()` (for `fromJson`/PokeAPI parsing) and Isar's `@collection` (for local persistence), with
generated `.g.dart` counterparts — regenerate these with `build_runner` after any change. `lib/models/user_data.dart`
is the one locally-owned (non-PokeAPI) model, tracking per-pokémon caught status.

### Pokémon domain logic (`lib/utils/`)

- **`utils/catch/capture_calculator_utils.dart`** and **`utils/capture_util.dart`** both implement generation-aware
  (Gen 1–9) capture-probability formulas (ball/status/badge/catching-charm modifiers, shake checks, Gen IX
  critical captures) sourced from Dragonfly Cave / Bulbapedia mechanics pages — there is also an inline,
  simplified `calculateCatchProbability` in `lib/screens/catch_screen.dart`. These are not currently unified; check
  which one a screen actually calls before assuming a formula change applies everywhere.
- **`utils/battle/mechanics/gen789.dart`** — battle-related mechanics for modern generations.
- **`utils/type_utils.dart`** / **`data/type_chart.dart`** — type effectiveness lookups, used by
  `widgets/pokemon_details/type_chart.dart`.
- **`utils/stats_util.dart`**, **`utils/string_utils.dart`** — stat calculations and formatting helpers.

### UI

`main.dart`'s `PokedexScreen` hosts the search bar, filter section, and scrollable pokémon list, driven by
`context.watch<PokemonApiProvider>()`. Screens (`pokemon_details_screen`, `catch_screen`, `move_screen`,
`ability_screen`) are pushed on top for drill-down views. Filtering UI (`filter_modal.dart`, `filter_section.dart`,
`generation_filter.dart`) writes into `PokemonApiProvider.updateFilters`/`filterPokemon`, keyed by the `Filters`
enum defined in `widgets/filter_section.dart`.

### Caught-pokemon CSV export/import (`lib/services/io/`)

Three layers, each independently testable, wired together by `PokemonApiProvider.exportCaughtPokemon`/
`importCaughtPokemon` and surfaced in `widgets/hamburger_menu.dart`:

- **`caught_pokemon_csv_codec.dart`** — pure `List<UserData>` ⇄ CSV string conversion (via the `csv` package).
  No I/O, no Flutter — this is what's covered by the round-trip unit tests in
  `test/services/io/caught_pokemon_csv_codec_test.dart`.
- **`csv_transport.dart`** — abstract `CsvTransport` (`save`/`load`) for *where* the CSV bytes go.
  `FilePickerCsvTransport` is the only production implementation: it delegates to the OS's native save/open
  dialog (Storage Access Framework on Android, `UIDocumentPickerViewController` on iOS), which already lists
  Google Drive, Dropbox, iCloud etc. as destinations if installed — there is intentionally no bespoke Drive API
  integration (that would need OAuth client credentials this repo doesn't have).
- **`caught_pokemon_repository.dart`** / **`caught_pokemon_transfer_service.dart`** — `CaughtPokemonRepository`
  is a narrow read/write interface (just `UserData`) so tests don't need to fake the full ~35-method
  `LocalService`; `LocalServiceCaughtPokemonRepository` adapts the real one. `CaughtPokemonTransferService`
  orchestrates codec + transport + repository: export filters to `isCaught == true` only, import **merges** by id
  (only ids present in the imported file are touched — importing someone else's export adds to your caught set
  rather than overwriting it). The closed-loop round trip (export → import → caught set restored) is tested in
  `test/services/io/caught_pokemon_transfer_service_test.dart` using in-memory fakes for both the repository and
  the transport.

## Dependencies of note

- Isar ships as **`isar_community`** / **`isar_community_flutter_libs`** / **`isar_community_generator`** from
  pub.dev (imports are still `package:isar_community/isar.dart`). These used to be hosted at a custom
  `pub.isar-community.dev` server (pinned via `hosted:` in `pubspec.yaml`) — that domain has since lapsed and
  now redirects to an unrelated third-party site, so do not reintroduce a `hosted:` pub source for isar; always
  resolve it from pub.dev.
- `provider` for state management, `http` for networking, `cached_network_image` for sprite/art caching,
  `flutter_svg` for the move-category icons in `assets/images/`, `csv` for RFC4180 encode/decode in the
  export/import feature.
- `lib/utils/battle/mechanics/gen789.dart` is ~1700 lines of TypeScript (not Dart) sitting under a `.dart`
  extension, never imported anywhere. It fails `flutter analyze`/`build_runner` on its own but doesn't block
  other targets — leave it alone unless you're specifically asked to port or remove it.
