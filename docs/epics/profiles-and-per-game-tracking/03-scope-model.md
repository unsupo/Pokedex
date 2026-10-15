# Scope Model

Part of [Multi-Profile & Per-Game Tracking](./README.md). Implements decisions D2–D5 in
[00-decisions.md](./00-decisions.md).

This doc defines the one shared concept behind profiles and games: a caught row is always
addressed by `(profileId, scopeKey, pokemonId)`, and the UI reads one scope at a time.

## Scope kinds

| Kind | `scopeKey` | Stored? | Read | Write |
|---|---|---|---|---|
| Derived National | (none) | No | Union of all of the profile's rows, by `pokemonId` | Not allowed directly (D5) |
| Manual National | `"national"` | Yes | Rows where `scopeKey == "national"` | Toggle a row |
| Per game | `"vg:<versionGroupId>"` | Yes | Rows where `scopeKey == "vg:<id>"` | Toggle a row |

A `Scope` value object represents the current choice:

```dart
sealed class Scope {
  const Scope();
}

final class DerivedNationalScope extends Scope {
  const DerivedNationalScope();
}

final class ManualNationalScope extends Scope {
  const ManualNationalScope();
  String get key => 'national';
}

final class GameScope extends Scope {
  const GameScope(this.versionGroupId);
  final int versionGroupId;
  String get key => 'vg:$versionGroupId';
}
```

`sealed` is for exhaustiveness in `switch` statements. This is a design sketch, not final code.

## Schema

`UserData` (replacing the Phase 1 shape):

```dart
@collection
class UserData {
  Id isarId = Isar.autoIncrement;
  late int profileId;
  late String scopeKey;   // "national" or "vg:<id>"
  late int pokemonId;
  late bool isCaught;

  // Unique composite index on (profileId, scopeKey, pokemonId), replace: true.
  // Confirm the exact isar_community composite @Index syntax during implementation.
}
```

Phase 1 already introduces `profileId`. Phase 2 adds `scopeKey` and widens the index. Phase 1
rows get `scopeKey: "national"` (see [04-migration.md](./04-migration.md)).

## Queries (what the provider needs)

| Need | Query |
|---|---|
| Caught map for the active scope | rows where `profileId == p` and `scopeKey == s` |
| Caught map for derived National | rows where `profileId == p`, then `isCaught` union by `pokemonId` |
| Games a Pokémon is caught in (detail view) | rows where `profileId == p`, `pokemonId == n`, `isCaught == true`, `scopeKey` starts with `vg:` |
| Per-game progress count | count of caught rows for `(p, s)` |
| Derived National progress | count of distinct `pokemonId` with `isCaught` in any row |

Derived National can't be indexed as a single key, so it is computed in memory from one
profile-scoped read. Profiles are small (at most a few hundred rows), so this is fine. If it
ever isn't, add a materialized cache, not a second source of truth.

## Derived National rule

A Pokémon is **derived-caught** if at least one of the profile's rows for it has
`isCaught == true`, in any `scopeKey`. Un-catching in one game does not clear other games.

## Game list source

- The games come from PokeAPI version groups (`PokemonService.getVersionGroup`, already cached).
- A game's Pokémon list comes from its version group's `pokedexes` (regional dex), with each
  entry's `entry_number` used as the in-game number. Fetched on demand, cached like other
  resources.
- A Pokémon is only shown in a game scope if it appears in that game's regional dex. Any
  Pokémon not in the dex is hidden in that scope and does not count toward progress.

## Provider behavior

`PokemonApiProvider` holds one `Map<int, bool> _caught` for the active `(profileId, scope)`.

- Switching profile or scope: reload the map from one query, then `notifyListeners()`.
- `isCaught(pokemonId)` and `filterPokemon()` read `_caught`.
- Toggling in manual National or a game: update the row (upsert on the composite key), then
  update `_caught` in memory.
- Derived National: `setCaught` is a no-op with a UI hint (D5). The map is computed from all
  rows once, then kept in sync when rows change in other scopes.

## Acceptance

- Two scopes for the same profile hold independent states for the same Pokémon.
- Derived National is true if any game is caught, and false if none are.
- Un-catching in one game leaves another game's catch and derived National intact when another
  game still holds it.
- A profile with only manual National behaves exactly like Phase 1.
