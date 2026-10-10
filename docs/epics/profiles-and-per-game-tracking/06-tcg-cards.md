# TCG Cards

Part of [Multi-Profile & Per-Game Tracking](./README.md). Implements [D6](./00-decisions.md#d6--tcg-cards-are-per-profile-not-per-game).

## Decision

Trading cards are tracked **per profile only**. There is no game dimension for cards.

## Why

- A card is not tied to a single video game version. The same card can exist across several
  sets and formats, so "caught in Scarlet" has no meaning for it.
- Adding a `scopeKey` would create UI for a concept the data doesn't support.

## Schema

```dart
@collection
class CaughtTcgCard {
  Id isarId = Isar.autoIncrement;
  late int profileId;    // new
  late String cardId;
  late bool isCaught;

  // Unique composite index on (profileId, cardId), replace: true.
  // Replaces the current unique index on cardId alone.
}
```

The existing `CaughtTcgCard` shape already uses `isarId` autoIncrement, so this is a small change.

## Behavior

- `TcgApiProvider.loadCaughtStatus` reads rows for the active profile only.
- `TcgApiProvider.setCaught` writes with `profileId`. It no longer creates the placeholder
  `UserData(id: 0, …)` on a card with no `userData`. Instead it writes a `CaughtTcgCard` directly.
  This removes the existing id-0 workaround in `setCaught`, which can't work once UserData keys are
  composite.
- Switching profiles reloads caught status for every loaded card, the same way the Pokémon map is
  reloaded. A card that is caught in profile A and not in B shows the correct state after the switch.

## Out of scope

- ~~A "caught set" export for cards.~~ Done: [tcg-card-csv-export.md](../../tickets/tcg-card-csv-export.md),
  then superseded by [combined-csv-export.md](../../tickets/combined-csv-export.md) (one export,
  one import, covering Pokemon and cards together).
  The CSV format in [05-csv-io.md](./05-csv-io.md) still covers Pokémon only — cards have their
  own, simpler format (`cardId,isCaught`, no scope column) and their own menu entries.

## Acceptance

- Caught card in profile A does not show as caught in profile B.
- Switching profiles updates card caught indicators without restarting.
- Migration sets every existing card row to the default profile (see
  [04-migration.md](./04-migration.md)).
