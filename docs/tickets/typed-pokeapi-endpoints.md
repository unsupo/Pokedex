# Ticket: Replace hand-typed PokeAPI path strings with typed endpoint builders

## Problem

`PokeApiPokemonService` (`lib/services/poke_api_pokemon_service.dart`) and
`PokemonTcgApiService` (`lib/services/pokemon_tcg_api_service.dart`) build every request URL by
hand-interpolating raw strings — e.g. `path: 'pokemon-species/$id'`, `path: 'berry/$id'`,
`path: 'move-damage-class/$id'`, plus bespoke bulk-list URLs like
`'$_baseUrl/pokemon-species?limit=100000&offset=0'` typed out separately in
`getPokemonList()`/`getAllMoveUrls()`/`getAllAbilityUrls()`/`getAllItemUrls()`. There are ~40
of these across the file, each a free-floating string literal with no shared source of truth for
the API's actual URL shape.

Concretely, this cost real debugging time already this session: the main Pokémon list was
originally sourced from `/pokemon` (which lists every variety separately, e.g. all ~14 Minior
color/meteor forms as distinct entries) instead of `/pokemon-species` (one clean entry per
species) — a plain string typo/wrong-endpoint-choice class of bug that a typed builder would
have made structurally harder to get wrong, and easier to grep/audit for "which resources does
this app actually call."

## Goal

Introduce a small typed layer for building PokeAPI request paths, so call sites never hand-type
a path segment. Something in the shape of:

```dart
abstract final class PokeApiPaths {
  static String pokemon(int id) => 'pokemon/$id';
  static String pokemonSpecies(int id) => 'pokemon-species/$id';
  static String evolutionChain(int id) => 'evolution-chain/$id';
  static String berry(int id) => 'berry/$id';
  // ...one method per resource type, matching the ~40 getX(id) methods
  // already in PokeApiPokemonService.

  static String pokemonSpeciesList() => 'pokemon-species?limit=100000&offset=0';
  static String moveList() => 'move?limit=100000&offset=0';
  static String abilityList() => 'ability?limit=100000&offset=0';
  static String itemList() => 'item?limit=100000&offset=0';
}
```

(Exact shape — static methods on a class, an enum with a path-building method, extension
methods, etc. — is an implementation detail to decide during the work, not committed here.)

Each `getX(id)` call in `PokeApiPokemonService` would call `PokeApiPaths.x(id)` instead of typing
`'x/$id'` directly, and the bulk-list fetches would call the corresponding list method instead of
typing the `?limit=100000&offset=0` URL by hand each time.

## Non-goals

- **Not a caching/fetch-logic change.** This doesn't touch `_fetchCached`, the semaphore/priority
  lanes, or how responses get parsed/saved — purely how the request *path* gets built.
- **Not necessarily a full typed API client** (with typed response models, generated from
  PokeAPI's OpenAPI spec or similar) — that's a much bigger undertaking. This ticket is scoped to
  "stop hand-typing path strings," not "replace the whole HTTP layer."

## Why this is worth doing

- A typo in a hand-typed path (`'pokemon-speceis/$id'`) fails silently at runtime as a 404,
  caught only by whoever happens to exercise that code path — a typed builder makes the typo a
  compile error or at least a single, greppable definition to check instead of ~40 independent
  literals.
- Grepping "every PokeAPI endpoint this app calls" currently means reading the whole service file
  end to end; a typed builder class becomes that list for free.
- Matches the direction already taken this session for `PokemonService`/`TcgService` (splitting
  interface from implementation) and for `CsvTransport`/`CaughtPokemonRepository` — narrow,
  explicit, typed seams instead of implicit string-based contracts.

## Scope

- `lib/services/poke_api_pokemon_service.dart` (~40 call sites)
- `lib/services/pokemon_tcg_api_service.dart` (2 call sites: `getCard`, `getCardsByNationalDexId`)
- New file, e.g. `lib/services/poke_api_paths.dart` (and a TCG equivalent if warranted, though with
  only 2 endpoints there it may not need its own builder class)

## Acceptance criteria

- No `path:`/URL argument in either service file is a raw string literal built by hand at the
  call site — each goes through a named builder method.
- `flutter analyze`/`flutter test` stay clean; behavior is unchanged (this is a pure refactor,
  not a functional change).
