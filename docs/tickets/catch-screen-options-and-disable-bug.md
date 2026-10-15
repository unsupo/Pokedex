# Ticket: Catch screen disables "Attempt Catch" on the exact statuses meant to help, and offers too few balls/statuses

## Bug: Attempt Catch is disabled for Paralyzed/Sleep

`lib/screens/catch_screen.dart` (`build()`, ~line 175-176):

```dart
bool isButtonDisabled =
    _selectedStatus == 'Paralyzed' || _selectedStatus == 'Sleep';
```

This disables the "Attempt Catch" button (~line 316, `onPressed: isButtonDisabled ? null : ...`)
and greys it out (~line 352) *specifically* when the player selects Paralyzed or Sleep — the two
statuses that exist in this exact screen precisely because they make catching *easier* in the
real games (see `_statusBonusFor`, ~line 74-77, which already applies a real catch-rate bonus for
them). There's no evident reason for this — it reads like leftover/placeholder logic, possibly
from an early draft where these buttons did something else, that was never revisited once the
real catch-probability calculation was wired up (this session, in a separate fix). The practical
effect: selecting the one thing that's supposed to help you catch the Pokémon disables the
button that lets you try.

**Fix:** remove `isButtonDisabled` (or find and fix whatever it was actually meant to guard
against, if anything) so "Attempt Catch" is always available regardless of selected status.

## Limited options: only 3 balls, only 3 statuses

The screen currently only offers:
- **Balls** (~line 300-302): Poké Ball, Great Ball, Ultra Ball.
- **Status** (~line 250-284): Normal, Paralyzed, Sleep.

`_statusBonusFor` (~line 67-88) already has real handling for Burned/Poisoned (grouped with
Paralyzed at the 1.5x/2.5x tier) and Frozen (grouped with Sleep at the 2.0x/2.5x tier) — the
*calculator* already supports them, the UI just never added buttons for them. Real games have
many more ball types than 3 as well (Master, Safari, Level, Lure, Moon, Friend, Love, Heavy,
Fast, Dive, Nest, Repeat, Timer, Dusk, Quick, Cherish, Park, Dream, Beast Ball, and more
depending on generation), each with its own catch-rate multiplier.

**Fix:**
- Add Burned, Poisoned, and Frozen as selectable status buttons/chips (a `Wrap` instead of a
  fixed `Row` of 3 `ElevatedButton`s might suit more options better than the current layout).
- Expand `_ballBonusFor` (~line 53-64) with the additional ball types the app wants to support,
  and add them to the ball dropdown (~line 296-303). Note `CaptureCalculator`
  (`lib/utils/capture_util.dart`) takes `ballBonus` as a plain multiplier with no built-in concept
  of ball identity, so adding new ball types is purely "what multiplier does this ball apply" -
  no calculator changes needed, just look up the correct multiplier per generation/ball (Master
  Ball is a special "always succeeds" case already partially handled separately, ~line 96-99 -
  keep that special-cased rather than trying to give it a numeric multiplier).
- Decide whether all of this is exposed for every generation uniformly, or only the balls/statuses
  that actually existed in the Pokémon's generation (e.g. Beast Ball didn't exist before Gen 7) -
  worth a product decision, not assumed here.

## Scope

- `lib/screens/catch_screen.dart` (both the bug and the UI expansion)
- Possibly `lib/utils/capture_util.dart` if new ball types need generation-specific multiplier
  rules beyond a flat lookup

## Acceptance criteria

- Selecting Paralyzed or Sleep no longer disables "Attempt Catch."
- Burned, Poisoned, and Frozen are selectable and produce a different (higher) catch probability
  than Normal, consistent with `_statusBonusFor`'s existing multipliers.
- At least a few more ball types beyond Poké/Great/Ultra are selectable, each visibly changing
  the computed catch probability.
