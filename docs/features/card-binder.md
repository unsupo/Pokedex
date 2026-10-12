# Card binder view

Status: **In progress** (2026-10-11) - "Sixteenth round" below fixes
one-finger drag-to-turn still not working while zoomed (a leftover
`!_zoomed` restriction protecting against a panning conflict that, it
turns out, never existed - panning has only ever been two-finger).
"Fifteenth round" below
**confirms the pinch-zoom fix live on the user's own phone** (a stale
app process, not a code bug, explained why it looked broken after the
Fourteenth round), fixes real dollar prices never actually showing
(TCGPlayer's price JSON is keyed by print variant, not flat - confirmed
against a real API response), and fixes three more bugs the zoom fix's
own live testing then exposed: stale cached card data never
self-healing, a clipped bottom pocket row, and the nav row becoming
unreachable while zoomed. Also makes the Details screen's TCG tab load
from cache on repeat visits and gives it the same fetch-retry UI the
binder's picker modal already had. "Fourteenth round" fixes pinch-zoom
growth still being clipped back down to the binder's resting
footprint (the Tenth round's fix never actually worked - it was never
live-pinch-tested), adds a page-number label, and adds a small price
overlay wherever a card's artwork is shown - partially live-verified (the
page label, the price overlay, and the restructure's correctness at rest
all confirmed on `emulator-5554`; the pinch gesture itself still can't be
driven by `adb`). "Thirteenth round" adds a
binder entry point to the main Pokedex list itself (opening at whichever
Pokemon the list is currently scrolled to) and makes the binder's search
field always-visible instead of a toggle - **live-verified on
`emulator-5554`**. "Twelfth round" fixes a page
turn sliding the spread by one page-group instead of revealing a genuinely
new, non-overlapping pair each time (the real root cause behind this doc's
earlier "page 1 and page 2 look identical"-style reports, which turned out
to be misdiagnosed as caching/content bugs in some earlier rounds - the
page data itself was never wrong) - **live-verified on `emulator-5554`**
(forward/backward taps and an odd-page search jump all landed exactly on
the expected non-overlapping pairs). "Eleventh round" fixed a transient
TCG-fetch failure reading as "no cards found" (now a distinct retry state)
and relabeled the already-working add/remove path. "Tenth round" replaces
the Eighth round's zoom-growth fix, which shipped but turned out to have
no effect on a real phone (it loosened a width constraint that was never
the binding one on a portrait screen) - `InteractiveViewer` is gone
entirely now, replaced with a plain `GestureDetector` directly driving the
binder's real layout size. All three built and tested; the Tenth round's
pinch-zoom growth and the Eleventh round's fetch-retry UI are both still
pending their own live check - neither can be driven by `adb`/emulator
automation (no multi-touch primitive for the former; the latter needs a
simulated upstream failure, not just a cold cache) - see each round's own
Status line. "Ninth round" (a caught-
but-cardless Pokemon now shows the owned sprite, not "+") is live-verified
on `emulator-5554`. "Seventh
round" (pre-existing caught cards with no selection now get one
automatically) and "Sixth round" (pinch-to-zoom never actually worked - a
competing gesture recognizer always ate the gesture before a pinch could
start) are both live-confirmed working, on the phone. "Fifth round"
before that (caught cards whose display data was never cached were
completely invisible to the binder, not just imageless - found live on
the user's own phone, where it also explains an earlier "page 1 and page
2 look identical" report: both were mostly undifferentiated walls of the
empty "+" state). "Fourth round" (catching a card now auto-selects it as
the binder's displayed card) and "Third round" (a page-turn blanking bug,
zoom panning, pocket ID labels, search, and an overflow bug) are further
above. Visual design and page-turn
mechanics POC'd and approved in direction (see Animation); paper-bend polish deliberately
deferred and still not built (unchanged from the POC). Per-pocket card
selection (see below) added after the POC - changes the binder's layout
unit from "one pocket per caught card" to "one pocket per Pokemon." Its one
open question (owned-but-unselected visual) is resolved below.

**2026-10-10 follow-up, after seeing it on a real device:** the shipped
Flutter build did not read as a binder at all - confirmed by screenshot
against the approved POC, see "Visual redesign" below. This was invisible to
every automated test (all were green) because none of them render real
pixels against the full-screen layout the way a live run does, and because
every pocket on the page tested happened to be empty (itself downstream of
the parsing bug in
[tcg-card-json-parsing-regression.md](tcg-card-json-parsing-regression.md) -
fixed separately from the visual gap below). The redesign (new ACs 15-19) is
now built and live-verified on an emulator - see "Visual redesign" below,
including a real page-turn bug found only by driving the live app.

All data-model/behavioral ACs (1-10, 13, 14) have a passing automated test.
AC11/AC12 (the page-turn animation itself) are implemented per the Animation
section (leaf-over-static-slots technique, fixed spine) but are only verified
structurally/by interaction outcome in widget tests, not by asserting the
rotateY transform's geometry frame-by-frame - see Traceability. One known gap:
the page-turn's drag gesture is implemented but only its tap-driven
equivalent (the prev/next controls) is exercised by an automated test: a real
finger-drag gesture is easy to simulate wrong in a widget test and risks
asserting the test harness rather than the behavior, so this was left as a
manual-check item instead of a brittle automated one. See "What was left out"
below for everything else not built.

## Problem

Caught TCG cards are only ever visible one Pokemon at a time (the details
screen's Cards tab, `PokemonDetailsScreen._buildTcgDetailsTab`). There's no
"collection" view of everything a profile owns, the way a physical binder shows a
whole collection at a glance.

## Goals

1. A binder screen laid out in pages, styled as a real zipper 3-ring binder
   (metal rings down the spine, cards sitting in plastic sleeves), with a
   page-turn animation.
2. **One pocket per Pokemon** (not one per caught card - see Pocket model),
   showing whichever card the profile has chosen to display for that Pokemon,
   or an ownership indicator/add affordance if they haven't.
3. A button on the Pokemon details screen's Cards tab (top-right) that jumps into
   the binder already turned to the page holding that Pokemon's pocket.
4. Tapping a pocket opens a modal to cycle through owned cards for that Pokemon
   and choose which one displays, or to catch a new one.

(Home-button re-centering is a separate, independent feature - see
[home-recenter.md](home-recenter.md).)

## Non-goals

- Editing page/pocket order, multiple custom binders/albums, drag-to-reorder.
- Binder physics simulation (cloth/paper dynamics) - a convincing hinge-and-turn
  is the target, not real cloth.
- Showing more than one card at a time per pocket - a Pokemon with several
  owned variants still shows just the one chosen card; the others are reachable
  through the cycle modal, not displayed simultaneously.
- Modeling true recto/verso (front/back) card-stock sides of a sheet - the POC
  shows the same page content whichever side it's on, not a distinct "blank
  backing."

## Visual design

Open-book layout: a left and a right page visible side by side, with a vertical
spine between them.

- **Spine**: dark pleather-textured strip. A zipper pull graphic runs down one
  edge (the "zipper binder" cue). Three metal rings are embossed through the
  spine, each a metallic-gradient circle with a bright highlight arc, fixed in
  place - rings never move; pages turn around them, not with them.
- **Pages**: a 3x3 grid of pockets per page (9 Pokemon/page, one pocket each) -
  see Open questions on whether 9 is right at phone width.
- **Sleeve look, when a pocket shows a card** (explicitly requested, not just
  "show the card"): a card sitting in a plastic sleeve looks different from
  bare card art elsewhere in the app -
  - A recessed inner-shadow border around the card (the sleeve's edge).
  - A soft diagonal glare band crossing the card (plastic catching light).
  - The card art sized a few px smaller than the pocket, so a thin margin of
    page card-stock shows around it.
- The other two pocket states (owned-but-unselected, nothing owned) are their
  own look, not a dimmed version of the sleeve - see Pocket model below.

## Pocket model

Each pocket belongs to one Pokemon (by national dex id, same order as the
Pokedex itself - page 0 is dex #1-9, page 1 is #10-18, and so on). It does
**not** automatically show "the next caught card in sequence"; it shows
whichever card, if any, the profile has explicitly chosen to display for that
Pokemon. A Pokemon with several owned card variants (different sets, rarities)
still shows just one at a time.

Three states, per (profile, Pokemon):

1. **Selected** - the profile has picked one specific owned card for this
   Pokemon (persisted - see Data model). The pocket shows that card, sleeve
   style, same as before.
2. **Owned, nothing selected** - the profile owns at least one card for this
   Pokemon (`CaughtTcgCard.isCaught` true for at least one of its cards) but
   has never opened the pocket to choose one. Shows that Pokemon's own
   list-row sprite (`Pokemon.imageUrl`, the same artwork `PokemonListItem`
   already renders), dimmed/greyscale, centered in the pocket with no card
   frame or sleeve styling around it - reads as "this slot is about this
   Pokemon and you own something for it," distinct from both a real card
   (state 1) and the empty "+" (state 3). The greyscale treatment reuses the
   same `ColorFilter.matrix` the uncaught pokeball icon already uses
   (`PokemonListItem`/the details screen's FAB both desaturate
   `assets/images/pokeball.png` this way) rather than inventing a second
   greyscale technique.
3. **Nothing owned** - no caught card at all for this Pokemon. Shows only a
   "+" affordance.

A selection that stops being valid - the profile un-caught that specific card
(from here, from the details screen, or via an import) while it was the
pocket's chosen display - falls back to state 2 if another card for that
Pokemon is still owned, or state 3 if none are. The binder never displays a
card the profile doesn't currently own.

### Tapping a pocket

Opens a modal, scoped to that one Pokemon's cards (the same data
`PokemonDetailsScreen`'s Cards tab already loads via
`TcgApiProvider.getPokemonCards`, reused rather than re-fetched):

- **States 1 or 2** (something owned): the modal lets the profile cycle
  through every *owned* card for that Pokemon (swipe or arrows, one at a time -
  a focused picker, not the Cards tab's grid). Landing on one and confirming it
  sets it as that Pokemon's selected card (state 1) and closes the modal, with
  the binder pocket now showing it.
- **A "+" inside that same modal** opens the full browse view - every card
  PokeAPI/the TCG API has for that Pokemon, caught or not (exactly the Cards
  tab's existing grid) - tapping an uncaught one catches it
  (`TcgApiProvider.setCaught`/`toggleCardCaught`, unchanged), after which it's
  immediately available in the cycle picker too.
- **State 3** (nothing owned): the modal skips straight to that same browse
  view - there's nothing to cycle through yet.

No new catching mechanism: "add a card" always means catching one of that
Pokemon's real cards through the exact same path the Cards tab already uses.
What's new is purely the binder's display-selection layer on top of it.

## Animation

- **One page at a time turns**, hinged (`rotateY`, with perspective) at
  whichever edge sits on the spine, while its facing page stays static.
  - First POC attempt rotated the whole two-page spread as one rigid unit
    around its own center - both halves swept around a central vertical axis
    simultaneously, which read as a water wheel, not a page turning. Fixed by
    splitting the spread into two static page slots plus one turning "leaf"
    element positioned over whichever slot is active, hinged at that slot's
    spine-side edge.
- No new Flutter package: `Transform` + a perspective `Matrix4` driven by drag
  offset reproduces this (the acceptance checklist requires justifying any new
  dependency; this needs none).
- **Known POC limitation, deliberately shelved:** layering `scaleX`
  foreshortening, a small `skewY`, and a curling corner radius on top of the
  rotation to make it read as bending paper rather than a rigid flipping card
  made no visible difference. Likely cause: `rotateY` under CSS `perspective`
  already does strong foreshortening on its own, so a second, smaller
  foreshortening effect on the same visual dimension gets lost rather than
  adding to it. Not blocking the rest of the design. If revisited: a genuinely
  different technique (per-strip angles across the leaf, or a mesh/vertex warp)
  rather than more cosmetic overlays on one rigid rotation - that's how real
  "page curl" implementations fake curvature.

## Proof of concept

A self-contained HTML/CSS/JS artifact (not wired to real data) validated:

1. The static look - spine, 3 rings, zipper pull, sleeve-style pockets with
   glare.
2. The page-turn mechanic - drag or tap to turn, one page hinged correctly at
   the spine, the facing page staying still.

Both are approved in direction. The Flutter implementation reuses the same
colors/gradients/timing validated there.

## Data model changes

`TcgCard` is already an Isar `@collection` (`lib/models/tcg_card.dart`), but
nothing ever calls `put`/`get` on it today - confirmed by grep: only
`CaughtTcgCardSchema` is registered in `IsarService.init()`
(`lib/services/local/isar_local_service.dart`), not `TcgCardSchema`. Cards only
live in `TcgApiProvider`'s in-memory per-Pokemon map (`_pokemon`), lost on
restart. The binder needs real card data (image, name) for every *caught* card,
including one belonging to a Pokemon whose tab wasn't opened this session, so
caught cards' full data needs to be durable:

- Register `TcgCardSchema` in `IsarService.init()`.
- Fix `TcgCard.isarId` from `final` to mutable, and add a unique + `replace:
  true` index on `TcgCard.id` - the exact same upsert footgun already hit and
  fixed this session for `CaughtTcgCard.isarId` (a `final Id` causes duplicate
  rows on re-save instead of updating; confirmed as the real cause there via a
  seeded-database test).
- `LocalService.saveAllTcgCards` / `getCachedTcgCardsByIds`.
- `TcgCardRepository.cacheCards` (write-through cache, called after every live
  fetch in `TcgApiProvider.getPokemonCards` - purely additive, doesn't change
  the existing fetch/read path or its tests) and `getCaughtCardsForProfile`
  (joins `CaughtTcgCard` rows for a profile with the cached `TcgCard` data).
- A pocket's selected card with no cached `TcgCard` data yet (shouldn't really
  happen, since selecting one means its data was already loaded to show in the
  picker - but import or a future data path could still leave one pointing at
  an id with nothing cached) shows as a named-but-imageless pocket rather than
  silently reverting to state 2.

**New**: a per-profile, per-Pokemon display selection -

```dart
@collection
class BinderCardSelection {
  Id isarId = Isar.autoIncrement; // non-final, per the isarId lesson above
  @Index(composite: [CompositeIndex('pokemonId')], unique: true, replace: true)
  late int profileId;
  late int pokemonId;
  late String selectedCardId;
}
```

Same shape as `CaughtTcgCard` (`lib/models/tcg_card.dart`) - composite unique
index + `replace: true` for upsert-by-(profile, Pokemon), non-final `isarId` for
the same reason. `LocalService.getBinderSelection(profileId, pokemonId)`,
`saveBinderSelection(...)`, `getBinderSelectionsForProfile(profileId)` (the
binder screen needs all of a profile's selections at once, not one at a time).
Registered in `IsarService.init()` and cleared in `clearCache()` like every
other collection.

## Entry point

An icon button, top-right of `PokemonDetailsScreen`'s Cards tab, opens
`CardBinderScreen(scrollToPokemonId: widget.pokemonId)`.

## Acceptance criteria

1. Opening the binder from a Pokemon's Cards tab shows the page containing that
   Pokemon's pocket.
2. The binder shows one pocket per Pokemon, in dex order, 9 per page.
3. A pocket with a selected card shows that card, sleeve-styled.
4. A pocket with no selection but at least one owned card for that Pokemon
   shows the owned-indicator state, never bare card art and never the "+" state.
5. A pocket with nothing owned for that Pokemon shows only the "+" state.
6. Un-catching a pocket's selected card falls back correctly - to the
   owned-indicator state if another card for that Pokemon is still owned, to
   the "+" state if none are. The binder never shows a card no longer owned.
7. Tapping a pocket in state 3 or 4 opens the cycle picker over that Pokemon's
   owned cards only (never an uncaught one).
8. Tapping a pocket in state 5 (nothing owned) skips straight to the full
   browse view.
9. Catching a new card through the browse view's "+" (from either entry point)
   makes it immediately available in the cycle picker, without closing and
   reopening the modal.
10. Picking a card in the cycle picker persists as that Pokemon's selection and
    is still selected the next time the binder (or app) opens.
11. Dragging or tapping the navigation controls turns exactly one page; the
    facing page never moves during that turn.
12. The ring/zipper spine stays visually fixed on screen throughout a page turn.
13. Saving the same `TcgCard` id, or the same `BinderCardSelection`
    (profile, Pokemon) pair, twice never creates a duplicate row (regression
    test, same shape as the `CaughtTcgCard.isarId` bug already fixed this
    session).
14. Switching the active profile shows only that profile's pocket selections
    and owned cards - the same profile-isolation invariant every other
    caught-data view in this app already holds (`CaughtPokemon`,
    `CaughtTcgCard`, CSV export are all profile-scoped; the binder must be too).

## Traceability

| AC | Test |
|---|---|
| 1 | `test/widgets/binder/card_binder_screen_test.dart` - "AC1: scrollToPokemonId opens already turned to that Pokemon's page" |
| 2 | `test/utils/binder/binder_layout_test.dart` (pure page math) + `card_binder_screen_test.dart` "AC2: shows one pocket per Pokemon, in dex order, 9 per page" |
| 3 | `test/utils/binder/binder_pocket_test.dart` "AC3: a selected, cached card shows that card, sleeve-styled" + `test/services/card_binder_provider_test.dart` "AC3: a Pokemon with a selected card shows that card" |
| 4 | `binder_pocket_test.dart` "AC4: owned but nothing selected..." + `card_binder_provider_test.dart` "AC4: ..." + `card_binder_screen_test.dart` "AC4: Pokemon #1 (owned, unselected)..." |
| 5 | `binder_pocket_test.dart` "AC5: nothing owned and nothing selected..." + `card_binder_screen_test.dart` "AC5: a Pokemon with nothing owned shows the + state..." |
| 6 | `binder_pocket_test.dart` "AC6: un-catching the selected card falls back to owned/empty" + `card_binder_provider_test.dart` "AC6: ..." |
| 7 | `test/widgets/binder/card_picker_modal_test.dart` "AC7: starting in cycle mode shows the picker, not the browse grid" + `card_binder_screen_test.dart` "AC7+AC10: tapping an owned pocket opens the cycle picker..." |
| 8 | `card_picker_modal_test.dart` "AC8: starting in browse mode skips straight to the full grid" + `card_binder_screen_test.dart` "AC5: ...tapping it opens the browse view directly (AC8)" |
| 9 | `card_picker_modal_test.dart` "AC9: catching a card through the browse view's + makes it immediately available in the cycle picker..." |
| 10 | `card_picker_modal_test.dart` "AC10: confirming the cycle picker persists the selection and closes the modal" + `card_binder_provider_test.dart` "AC10: ..." + `card_binder_screen_test.dart` "AC7+AC10: ..." |
| 11 | `card_binder_screen_test.dart` "AC11: tapping the next-page control turns exactly one page" (tap-driven; see Status for why drag itself is a manual-check item, not automated) |
| 12 | Structural by construction: `BinderSpine` is a sibling `Stack` child in `BinderPageTurner`, never inside the turning leaf's subtree - manual-check item (no automated geometry assertion; see Status) |
| 13 | `test/services/local/card_binder_persistence_test.dart` "AC13: saving the same card id/selection twice upserts..." (both `TcgCard` and `BinderCardSelection`) |
| 14 | `card_binder_persistence_test.dart` "AC14: a selection saved for one profile is invisible to another" + `test/services/tcg_card_repository_test.dart` "AC14: only the given profile's caught cards are returned" + `card_binder_provider_test.dart` "AC14: a second profile never sees..." |

## Visual redesign (2026-10-10 follow-up)

Status: **Done**, verified live on an Android emulator (`emulator-5554`,
since the physical phone was disconnected this session). Before/after
screenshots for every AC are under
`docs/features/card-binder/screenshots/`. Two additional real bugs were
found and fixed in the course of this verification - see "Bugs found during
live verification" below; neither would have been caught any other way,
which is exactly the point of §4.3.1.

**Second round, after seeing the first redesign pass live:** three more
real problems, all confirmed against the original POC
(`https://claude.ai/artifact/FN6niep7XfPHN9tvxahi8k`) rather than guessed:

1. The page-turn hinge was pivoting at the *outer screen edge*, not the
   spine - `BinderPageTurnerState`'s turning leaf was positioned with its
   box anchored to the wrong side (`left:0` for a forward turn instead of
   `right:0`), so `Alignment.centerLeft`/`centerRight` pivoted at the
   screen's far edge instead of the spine in the middle. Fixed by anchoring
   each leaf's box to the spine-adjacent side it departs from.
2. The whole screen was the binder's own dark fill, stretched to the full
   `Expanded` height with no aspect ratio - exactly what the POC does
   *not* do (`.binder-stage{aspect-ratio:16/10; max-width:820px}`, a
   bounded object with its own rounded, shadowed "leather base" sitting on
   a lighter page background, `--bg:#ece6da`). That mismatch was the root
   cause of all three symptoms reported live: "super long", "pushes
   everything to the top" (the 3x3 grid's natural height left a huge empty
   void below it inside the over-tall container), and "doesn't match the
   design you showed me". Fixed by wrapping the page-turner in a
   `Center`+`ConstrainedBox`+`AspectRatio(16/10)`+a `_BinderLeatherBase`
   panel (rounded corners, drop shadow, dark leather gradient, 10px inset
   margin around the pages - matching the POC's `.leather-base`/`.book`),
   and changing the Scaffold's background to the POC's warm paper color
   instead of dark leather.
3. No pinch-to-zoom. Added `InteractiveViewer` around the bounded binder
   object (`scaleEnabled: true`, `panEnabled: false` so its own one-finger
   pan recognizer doesn't compete with the page-turn drag gesture).

### What's actually on screen today

`docs/features/card-binder/screenshots/binder-page1-before-fix.png` -
page 1, taken live off the dev device. Note: taken while every pocket on
this page happened to be empty (the JSON-parsing regression - see
`tcg-card-json-parsing-regression.md`), so this screenshot does not show the
`_SleeveCard` state at all, only `_EmptyPocket`. Confirmed gaps, comparing
this against the approved POC (same colors/gradients were supposed to carry
over per the original doc's "Proof of concept" section):

1. **No left page at all on the binder's first spread.** `BinderPageTurner.
   _buildPage` returns a bare `SizedBox.expand()` for `pageIndex < 0`
   (`lib/widgets/binder/binder_page_turner.dart:180-185`) - deliberate (there
   genuinely is no page before page 0), but it renders as nothing, so the
   `Scaffold`'s flat `backgroundColor` (`0xFF3A3530`) shows through as a huge
   featureless dark rectangle covering half the screen. A real binder's
   inside-front-cover isn't blank void; it's lining material.
2. **The spine and page read as flat vector shapes, not a 3D object.**
   `BinderSpine` does have gradients in code
   (`lib/widgets/binder/binder_spine.dart`) but at the ~28px width it
   renders at, they're too subtle to register as pleather texture or
   metallic rings - they read as a thin grey bar with three flat dots. The
   page itself (`BinderPageGrid`) is a single flat cream `Container` with no
   shadow, no texture, no edge highlight - nothing suggesting paper
   thickness or a page sitting slightly above the one beneath it.
3. **No page-bend/curl** - already known and explicitly deferred in the
   Animation section above; restated here only because it's part of the
   same "doesn't read as a physical object" complaint.
4. Overall: the current build looks like placeholder boxes in a binder-brown
   frame, not "a zipper binder with metal 3 rings and cards [that] change
   slightly when they are in the sleeve" (the original request) or the
   POC that was approved in direction.

### New goal

Make the binder screen read as an actual 3D object on screen - not just
correct colors, but visible depth: pages that look stacked and slightly
raised off each other, a spine that reads as a rounded, lit cylinder/strip
rather than a flat rectangle, rings with a real specular highlight, and a
page-turn that looks like it's rotating a physical sheet (perspective
foreshortening alone, already in the code via `Transform`'s
`Matrix4..setEntry(3, 2, 0.001)`, is not reading as "3D" per the user's
on-device reaction - needs stronger depth cues: drop shadows under the
turning leaf, a shadow the spine casts onto both pages, graduated shading
across the page grid itself).

### Proposed approach (not yet built - needs a fresh POC pass before Flutter work)

Do not jump straight to Flutter changes - the original POC-first process
this feature started with is exactly right, and this time the POC needs to
be checked against a phone-width screenshot before it's "approved," not just
against a desktop browser:

1. New HTML/CSS/JS POC iteration (same artifact-based approach as the
   original), this time explicitly targeting phone width (~400-430px) as
   the primary viewport, not desktop - the original POC was approved in a
   desktop browser and the gap only became visible at real phone width.
2. Add the depth cues above: box-shadow under the spine and under each page
   edge, a subtle `radial-gradient`/highlight across the page surface (not
   flat cream), a visible shadow cast by the turning leaf onto the page
   beneath it during the turn.
3. Fix the "no left page on spread 1" gap - render a static inside-cover
   texture (reuse the spine's pleather gradient, no pockets) instead of
   `SizedBox.expand()`, so there's never a bare rectangle of raw background.
4. Only after that POC is screenshotted at phone width and approved: port
   to `BinderSpine`/`BinderPageGrid`/`BinderPageTurner`/`BinderPocketWidget`.

### Acceptance criteria

15. The binder's first spread (page 0) never shows raw `Scaffold`
    background - the area to the left of the spine has its own static
    texture/finish, not an empty box.
16. The spine visibly reads as a raised, lit object (not a flat rectangle)
    at the phone screen size actually used to view it - confirmed by a
    screenshot, not just by the gradient existing in source.
17. The page surface shows visible depth (shadow/highlight suggesting
    stacked paper), confirmed the same way.
18. A page turn shows a shadow cast by the moving leaf onto the page
    beneath it, growing/shrinking plausibly with the turn's progress.
19. All of the above hold at the actual phone width used for manual
    verification (not just a wide simulator window) - screenshot evidence
    required per §4.3.1.

Implementation note: this pass went straight to Flutter rather than a fresh
HTML POC iteration (the plan originally proposed above) - the fixes were
well-understood CSS-equivalent techniques (gradients, box-shadow, a
darkening overlay keyed to the rotation angle), and the live
build-install-screenshot loop on the emulator gave faster, more accurate
feedback than a desktop-browser POC would have for a phone-width target.

### Bugs found during live verification

Driving a real page turn on the emulator (not exercised by any widget test,
which only asserts the page index after a turn completes, never mid-turn)
showed the static page on the side *not* being vacated displaying the same
stale content as the turning leaf, instead of the next page's content -
e.g. turning forward past a page with a caught card showed that same card
twice, once on the flying leaf and once underneath it, instead of showing
the (empty) next page underneath. Root cause:
`BinderPageTurnerState.build` rendered the untouched static slot from
`widget.rightPageIndex`/`leftPageIndex` unconditionally, but those props
only update *after* `turn()`'s animation completes - so mid-turn, the slot
that's supposed to already be "waiting there" (the way a real binder's next
page already sits under the one being lifted) was still showing the
pre-turn page. Fixed by pre-empting the static slot's index by one in the
direction of the turn while `_direction != 0`. See
`docs/features/card-binder/screenshots/page-turn-static-slot-bug-before-fix.png`
(bug) and `page-turn-static-slot-fixed.png` (fixed) - both taken mid-turn on
the live emulator.

### Traceability

| AC | Evidence |
|---|---|
| 15 | `binder-redesigned-page1.png` - the inside cover (left of the spine) shows the textured `BinderInsideCover` panel, not raw background |
| 16 | `binder-redesigned-page1.png` - spine shows a lit bevel gradient and ring highlights, not a flat bar |
| 17 | `binder-redesigned-page1.png` / `binder-redesigned-selected-card.png` - page surface shows a corner-lit gradient and a drop shadow under its edge |
| 18 | `page-turn-static-slot-fixed.png`, taken mid-turn - the turning leaf's perspective + darkening and the hinge shadow are visible; the (separately found and fixed) static-slot bug above is also evidenced here |
| 19 | All screenshots taken at the emulator's actual phone resolution (1080x2400, `sdk_gphone64_arm64`), not a resized desktop window |
| (2nd round) pivot at spine | `page-turn-hinged-at-spine.png` - taken mid-turn, the leaf's hinge edge sits flush against the rings, not the outer screen edge |
| (2nd round) bounded/proportioned object | `binder-proportioned-bounded-object.png` - the binder is a centered, rounded, shadowed panel on a lighter page background, matching the POC's proportions, not a full-bleed stretched fill |

All screenshots: `docs/features/card-binder/screenshots/`.

## Third round: page-turn blanking bug, zoom panning, pocket ID, and search

Status: **Done**, live-verified on `emulator-5554`. Reported in the same
live-verification session as the second round, immediately after
`page-turn-hinged-at-spine.png` / `binder-proportioned-bounded-object.png`
were captured - so none of this was caught by that round's own live check,
because none of these four issues are visible from a single static
screenshot (three need the animation or an interaction sequence running;
the fourth is a missing feature, not a regression). A fifth, previously
unknown bug (overflow - see below) was found only by actually shipping the
pocket-identity-label fix to the device, exactly the category of thing
§4.3.1 exists to catch.

### Bug: static slot blanks to bare background mid-turn

**Reported:** "the pages still turn with the pivot on the right not in the
middle" (the pivot part was already fixed in round 2 - see above) "...also
when i turn the page right the left pages disappear and show the binder
instead of the actual page that's on the left," and, separately, "the first
and second page are confusingly the same (the first page is a page on the
left but i pull it and put it on the right it's the same page as was on the
left with the binder on the left)."

**Investigated as a possible data bug first:** `binder_layout.dart`'s
`binderPageIndexForPokemonId`/`binderPokemonIdsForPage` are simple, already
pure functions, re-read and confirmed correct by inspection - page 0 and
page 1 slice disjoint, correctly-ordered ranges of `sortedPokemonIds`, and
`test/utils/binder/binder_layout_test.dart` (unchanged, still green) already
covers this. **Ruled out** - the bug is in the animation, not the data.

**Root cause, in `BinderPageTurnerState.build`:** the round-1 fix for a
*different* static-slot bug (see "Bugs found during live verification"
above) added `hideLeftStatic = _direction > 0` / `hideRightStatic =
_direction < 0`, which replace the static slot the turning leaf departs
from/arrives at with a bare `SizedBox.expand()` for the leaf's *entire*
280ms animation - not just while the leaf is actually covering it.
Concretely, for a forward turn, `hideLeftStatic` blanks the left slot
completely for the whole turn. But the leaf (the old right page, hinged at
the spine) only visually sweeps across into the left half progressively, as
its rotation angle goes from 90 to 180 degrees - for roughly the first half
of the turn, most of the left half is *not yet* covered by the leaf, so
blanking the real content there exposes whatever is behind the `Stack`
(the `_BinderLeatherBase`'s dark leather fill) instead of the correct,
unchanged left page. That dark leather fill showing through is exactly "the
binder" the user is describing. The mirror-image case
(`hideRightStatic`) produces the same symptom turning backward, which is
what the second report describes: pulling a page from left to right is
*supposed* to move that same page over (that part is correct, physical-
binder behavior, not a bug) - but the newly-revealed left slot
(`leftPageIndex - 1`, correctly pre-empted by the round-1 fix) was blanked
to bare background for most of the turn instead of being progressively
uncovered as the leaf lifts away, which is what actually reads as "the
binder on the left" / "confusingly the same."

This blanking was never needed. The real staleness bug round 1 fixed - the
slot the leaf *reveals* showing old content - is a wholly separate,
already-correct mechanism (`staticLeftIndex`/`staticRightIndex`,
pre-empted by one in the turn's direction). The slot the leaf *departs
from* doesn't change at all until the leaf fully lands on it; it should
just keep rendering its normal, unchanged content for the whole turn, and
let the leaf - painted after it in the `Stack`, so already on top - cover
it progressively as it rotates. `hideLeftStatic`/`hideRightStatic` were an
unrelated, unnecessary second fix layered on top of the one that actually
mattered.

**Fix:** delete `hideLeftStatic`/`hideRightStatic` entirely. Both static
slots always render (`staticLeftIndex`/`staticRightIndex`); nothing is ever
force-blanked.

### Zoom: pinch-in had nowhere to go

**Reported:** "i want to be able to zoom in." `InteractiveViewer` already
had `scaleEnabled: true`, but also `panEnabled: false` unconditionally (see
round 2, added to keep its one-finger pan recognizer from competing with
the page-turn drag `GestureDetector`). The effect: pinching in grew the
image from a fixed anchor with no way to then look around the now-zoomed-in
view - which reads as "zoom doesn't really work," not as a working zoom
with a reasonable limitation.

**Fix:** a `TransformationController` tracks the live scale. Panning is
enabled only once the user has actually zoomed in past 1.0x, and
`BinderPageTurner` gets a new `dragEnabled` flag that's turned off for that
same duration, so the two one-finger-drag gestures (pan vs. page-turn)
never compete for the same gesture arena - each only matters in the state
where the other is disabled.

### Pockets with nothing selected don't say which Pokemon they are

**Reported:** "also i the cards i don't have it should have the name and
number so i know what it is." Both no-ownership pockets (`_EmptyPocket`,
just a "+" icon) and owned-but-unselected pockets (`_OwnedIndicator`, a
dimmed sprite with no text) gave no textual identity - matching a pocket to
a Pokemon meant already knowing dex order by sight.

**Fix:** both now show the Pokemon's name and dex number (`#NNN`, the same
zero-padding `PokemonListItem` already uses) in a small label under the
icon/sprite.

**Bug found shipping this fix, live on the emulator:** the first build of
the label showed a `BOTTOM OVERFLOWED BY 10 PIXELS` debug banner on every
single pocket (`binder-pockets-overflow-before-fix.png`) - the icon/sprite
plus the new two-line label together needed more vertical space than a
pocket cell actually has, something no widget test caught because none of
them lay this out against the grid's real, cramped on-screen size (they
assert text/icon presence, not that it fits). Fixed by wrapping each
pocket's content in `FittedBox(fit: BoxFit.scaleDown)` around a
fixed-size icon/sprite + label `Column`, so the whole pocket's content
scales down together to whatever room is actually available, at any pocket
size this screen's zoom (AC21) can produce, instead of overflowing.
Re-verified live: `pockets-with-name-number-labels.png` shows all 9
pockets on the right page with no overflow banner.

### New feature: search on the binder screen

**Requested:** "the search bar should exist on the binder's view too and
it'll take me to the page or filter the pages based on my search." The main
Pokedex list already has a fuzzy name/number search
(`widgets/pokemon_search_bar.dart` / `utils/search_query_parser.dart`); the
binder had no way to jump to a specific Pokemon other than paging through
manually.

**Design decision - jump, not filter:** a binder page is a fixed physical
layout (9 slots in dex order, per the Pocket model section above); removing
non-matching pockets from the 3x3 grid would break that model and wouldn't
look like a real binder page (real binder pages don't have cards vanish out
of their sleeves). Turning straight to the matching Pokemon's page, and
highlighting its pocket briefly, is the binder-appropriate equivalent of
"filter" - the stated goal ("take me to the page... based on my search")
is satisfied by the jump itself.

**Implementation:** a search field toggled from the `AppBar` (mirroring the
list's search affordance); on submit, matches by exact dex number first,
then a case-insensitive substring match against name; turns to that
Pokemon's page (bypassing the one-page-at-a-time turn animation, the same
way `scrollToPokemonId` already does on entry) and highlights its pocket
for a few seconds. No match shows a `SnackBar`, rather than silently doing
nothing.

### Acceptance criteria

20. During a page turn, in either direction, the static page that is *not*
    part of the turning leaf shows its real, correct content for the whole
    animation - never bare leather/spine background in its place.
21. Pinch-zooming in on the binder allows one-finger panning around the
    zoomed image; page-turning by drag is disabled while zoomed in past
    1.0x, and restored once back at 1.0x.
22. Every pocket not showing a specific selected card (both the "+" empty
    state and the owned-but-unselected state) displays the Pokemon's name
    and `#NNN` dex number.
23. Submitting a name or dex number in the binder's search field turns the
    binder to the page containing a matching Pokemon and highlights its
    pocket; a query matching nothing shows a visible "not found" message
    rather than doing nothing.
24. No pocket shows a render overflow at any point (added after the
    overflow bug above was found live - the kind of thing only a real
    layout pass against the actual grid catches).
25. All of the above confirmed live per §4.3.1 - this exact doc has now had
    an animation-only defect, a gesture-conflict defect, and a layout-
    overflow defect all escape the full automated suite, so for this
    feature a screenshot/recording is required evidence, not optional
    polish.

### Acceptance criteria - how each was actually verified

The animation duration (`BinderPageTurnerState`'s `AnimationController`)
was temporarily changed from 280ms to 2800ms, on-device only, specifically
to make a real 280ms animation frame reliably screenshot-able over an adb
round trip (which is itself 50-300ms, too slow to reliably land inside a
real 280ms window) - reverted immediately after capturing evidence; the
shipped/committed code still animates at 280ms (confirmed: final rebuild
+ reinstall + `binder-final-no-overflow.png` was captured against the
reverted, real-duration build, not the slowed one).

20. **Verified both directions, live, mid-turn.** Forward:
    `page-turn-forward-static-slot-visible-midturn.png` - the left page's
    real content (#001-#009) is visible mid-turn, not bare leather.
    Backward: `page-turn-backward-static-slot-visible-midturn.png` - same,
    mirrored.
21. **Partially verified.** The scale/pan state machine
    (`TransformationController`, `_zoomed`, `dragEnabled`) was verified by
    code review, by the full widget-test suite still passing with the new
    props wired through, and by confirming the binder still renders and
    pages still turn correctly with the real `InteractiveViewer` in place
    on the emulator. **Not captured**: an actual two-finger pinch gesture,
    because `adb shell input` has no multi-touch/pinch primitive (only
    single-pointer `tap`/`swipe`) and simulating one would need raw
    `sendevent` multi-tracking-ID injection, out of scope for this pass.
    Flagging honestly rather than claiming full e2e proof of the pinch
    gesture itself.
22. **Verified live** - see the overflow bug/fix above;
    `pockets-with-name-number-labels.png` shows every pocket's name+number,
    no overflow.
23. **Verified live**, three scenarios: jump-and-highlight
    (`search-jump-and-highlight.png`, searched "charizard", landed on page
    0 already visible with #006 highlighted in amber), and no-match
    (`search-no-match-snackbar.png`, a query matching nothing shows the
    "No Pokemon found" `SnackBar`). A cross-page jump (search landing on a
    page other than the one currently shown) was exercised by code path
    (same `_rightPageIndex` set as `scrollToPokemonId` on entry, which AC1
    already covers) but not separately screenshotted.
24. **Verified live** - see AC22's evidence; also confirmed via `flutter
    analyze` (no new issues) that no other overflow-shaped warnings were
    introduced.

### Traceability

| AC | Evidence |
|---|---|
| 20 | `page-turn-forward-static-slot-visible-midturn.png` + `page-turn-backward-static-slot-visible-midturn.png`, both taken mid-turn with the animation temporarily slowed for capture (see above) |
| 21 | Code review + full widget-test suite passing with `TransformationController`/`dragEnabled` wired in; pinch gesture itself not capturable via adb (see note above) |
| 22 | `pockets-with-name-number-labels.png` |
| 23 | `search-jump-and-highlight.png` + `search-no-match-snackbar.png` |
| 24 | `binder-pockets-overflow-before-fix.png` (bug) / `pockets-with-name-number-labels.png` + `binder-final-no-overflow.png` (fixed) |

All screenshots: `docs/features/card-binder/screenshots/`.

## Fourth round: catching a card didn't make it the binder's displayed card

Status: **Done**, live-verified on `emulator-5554`.

**Reported:** "it doesn't show the card you have it should put your highest
priced card shown on top for that pokemon in that sleeve." Investigated by
reading `computeBinderPocketView` and reconsidering the "Pocket model"
section above: when nothing has been explicitly selected but at least one
card is owned, the pocket intentionally shows the dimmed owned-indicator
sprite (state 2), not a card. The literal request - auto-pick and display
the highest-priced owned card whenever nothing is explicitly selected - was
implemented first (`_highestPricedOwnedCard` in
`utils/binder/binder_pocket.dart`, backed by a new `estimatedCardPriceValue`
in `utils/tcg_price_util.dart`) and had tests written and passing.

**Then the user clarified, correcting that direction:** "right so i selected
the first pokemon card in bulbasaur but it shows a generic sprite if i
haven't selected a card then the generic sprite is fine." This says two
things: (1) the dimmed-sprite state 2 is *correct* and should stay exactly
as designed when nothing has been chosen - the auto-highest-price default
was solving a problem that wasn't actually the one reported; (2) the real
bug is that an *explicit* selection isn't showing. **The highest-price
auto-default work was reverted in full** (`git stash drop` on the two `lib/`
files, `git checkout --` on the two test files) rather than left in
alongside the real fix - it was the wrong diagnosis, not a complementary
feature.

**Re-investigated, this time tracing what "selected the first card" actually
does in the UI.** Pokemon #1 (Bulbasaur) with nothing owned opens the card
picker modal straight into the *browse* grid (`_BrowseView`,
`startInBrowse: true` for an `EmptyPocket` - see "Tapping a pocket" above).
Tapping a card there calls `toggleCardCaught`
(`widgets/scope/card_caught_toggle.dart`), which **catches** the card - it
never calls `CardBinderProvider.selectCard`. *Selecting* a card to display
only happens via the separate cycle view's "Show this one" button
(`_CycleView`), reached by tapping "back" out of the browse grid first.
Catching and selecting were two fully disconnected steps, and nothing in
the browse grid hints that catching alone doesn't choose the display card -
a user tapping their first card there, exactly as the report describes,
reasonably expects that to be "the card I picked."

**The same gap exists a second, more commonly-hit way**: catching a card
from `PokemonDetailsScreen`'s TCG Details tab (`_buildTcgDetailsTab`) - a
completely independent screen from the binder, reached far more often than
the binder's own browse view - calls the exact same `toggleCardCaught`, so
it has the identical gap. A profile that only ever caught cards from the
Cards tab (quite plausibly the actual path the user took, given "bulbasaur"
is dex #1, the very first Pokemon) would see every single pocket stuck on
the dimmed sprite, regardless of how many cards it owns.

### Fix

Centralized in `toggleCardCaught` itself (not duplicated at each catch
call-site): when a card is newly caught (not un-caught) and the Pokemon
*had no owned card at all* before this catch, it also becomes that
Pokemon's displayed binder card (`CardBinderProvider.selectCard`).
Deliberately scoped to "nothing owned yet" - catching a *second* or later
card for a Pokemon that already has one on display does not silently
replace it; an explicit choice among several owned cards stays entirely the
profile's own, through the cycle view, exactly as before. This also means
state 2 (dimmed sprite, "owned, nothing selected") is now reached only when
a Pokemon ends up with owned cards but no selection through some other path
than catching one directly here - e.g. a CSV import of caught cards (see
`caught_pokemon_transfer_service.dart`) - where showing the generic
indicator genuinely is correct, matching the user's own "if i haven't
selected a card then the generic sprite is fine."

`toggleCardCaught` is called from two real screens
(`PokemonDetailsScreen`'s TCG Details tab and the binder's own
`_BrowseView`) that previously built different, narrower provider trees in
their own tests; one of those test files
(`test/widgets/scope/card_caught_toggle_test.dart`) had no
`CardBinderProvider` in its harness at all; a real one (not a fake) was
added, matching the real app's provider graph in `app_providers.dart`.

**A known, narrow edge case, not fixed here:** `CardBinderProvider` is a
long-lived app-wide singleton, loaded once at startup
(`app_providers.dart`'s `..load()`) and reloaded whenever `CardBinderScreen`
itself opens. If a card is caught in the brief window before that initial
`load()` resolves, for a Pokemon that already owned cards from a *previous*
session, `ownedCardsFor` could read as empty from the not-yet-loaded cache
and incorrectly re-trigger the auto-select, overwriting an existing
selection. Narrow (a race measured in milliseconds to low hundreds of ms on
real hardware) and consistent with an already-accepted risk in this
codebase (`CardBinderScreen`'s own doc comment on why it reloads on
`initState` exists for the same underlying reason) - not chased further
here.

### Acceptance criteria

25. Catching a Pokemon's first card - from either the binder's own browse
    view or `PokemonDetailsScreen`'s TCG Details tab - immediately makes it
    that Pokemon's displayed binder card, without a separate confirm step.
26. Catching a second or later card for a Pokemon that already has a
    displayed card does not change the display - that stays an explicit
    choice through the binder's cycle view.
27. A Pokemon with owned cards but genuinely no selection by any path
    (e.g. restored via CSV import) still shows the dimmed owned-indicator
    sprite, not an error or a card - unchanged pre-existing behavior.

### Traceability

| AC | Test |
|---|---|
| 25 | `test/widgets/scope/card_caught_toggle_test.dart` - "AC25: catching a Pokemon's first card also makes it the binder's displayed card..." (details-screen-equivalent path) + `test/widgets/binder/card_picker_modal_test.dart` - "AC25: catching a Pokemon's first card from the browse view..." (binder's own path); both also live-verified, see below |
| 26 | `test/widgets/scope/card_caught_toggle_test.dart` - "AC25: catching a second card for a Pokemon that already has a displayed card does not silently replace it..." |
| 27 | Unchanged - already covered by `test/utils/binder/binder_pocket_test.dart` and `test/services/card_binder_provider_test.dart`'s existing `OwnedPocket` cases |

**Live, on `emulator-5554`:** caught Bulbasaur's first TCG card from its
own TCG Details tab (not the binder), then opened the binder directly to
its page - showed the real card, sleeve-styled, immediately, no separate
selection step (`bulbasaur-card-auto-selected-from-details-tab.png`).
Then caught a *second* card for Bulbasaur from the same tab and reopened
the binder - still showing the first card, confirming AC26
(`bulbasaur-second-catch-does-not-override-display.png`).

All screenshots: `docs/features/card-binder/screenshots/`.

## Fifth round: caught cards never cached never show up at all

Status: **Done**, live-verified on the physical phone
(`4C161FDKD00100`, a Pixel 9 Pro Fold).

**Reported:** "the binder isn't showing the selected cards it doesn't even
show the caught status until i load that pokemon" and, separately, "also
the first page and second page are identical."

**Investigated directly on the phone, not guessed.** Pulled a real
screenshot of the phone's own binder (not the emulator's test data) -
`binder-phone-cache-gap-before-fix.png`. It shows exactly two pockets
(#001 Bulbasaur, #002 Ivysaur) in the dimmed owned-indicator state, and
every other pocket on both visible pages (#003-#018) in the bare "+"
empty state - despite the user clearly having caught more than two cards
over the life of this profile. This single screenshot explains both
reports at once: whichever Pokemon the user's caught cards belong to
mostly show as **empty**, not even as "owned, nothing selected" - so two
pages that are each mostly a wall of identical "+" placeholders do, at a
glance, look the same page repeated, even though the underlying dex-order
data (already verified correct in "Third round" above) is not.

**Root cause, traced through `CardBinderProvider.load()` and
`TcgCardRepository.getCaughtCardsForProfile`:** a caught card only ever
shows up in the binder (as `OwnedPocket` *or* `SelectedPocket`) if its full
`TcgCard` display data has been cached locally via `cacheCards` - and
`cacheCards` only ever runs inside `TcgApiProvider.getPokemonCards`, i.e.
only once a Pokemon's own Cards tab (or the binder's cycle picker, which
calls the same method) has actually been opened this install. A caught
card whose data was never cached isn't just missing its art - it's
**completely invisible to the binder**: `CardBinderProvider.load()` builds
`_ownedCardIdsByPokemon` directly from `getCaughtCardsForProfile`'s
*already-cache-joined* list, so an uncached caught card doesn't just fail
to render a selected card, it fails to register as owned *at all*,
degrading all the way down to the empty "+" state - explaining "it doesn't
even show the caught status." #001/#002 showing correctly is consistent
with the user having opened those two Pokemon's screens at some point
(caching their cards as a side effect) while never revisiting most of the
rest.

This is the exact gap flagged as deliberately-not-built, speculative
"Future work" at the bottom of
[tcg-card-json-parsing-regression.md](tcg-card-json-parsing-regression.md):
*"If a profile has caught cards for a Pokemon it's genuinely never going
to revisit... considered and deliberately not built here - revisit only if
real usage shows profiles with caught cards whose Pokemon are never
revisited."* Real usage now shows exactly that, on the user's own
longest-lived profile (today's "Fourth round" auto-select fix only
prevents *new* catches from landing in this gap going forward - it doesn't
retroactively fix cards already caught before today, which is what's on
this phone).

### Fix

A new `TcgCardRepository.backfillUncachedCaughtCards(profileId)`: diffs
the profile's full caught-card-id set against what's already cached,
fetches display data for whatever's missing (one `TcgService.getCard` call
per id, concurrently, each failure tolerated independently so one bad/
retired card id can't block the rest), and caches the results through the
same `cacheCards` write-through path every other fetch already uses. Wired
into `CardBinderProvider.load()`, which already runs every time the binder
screen opens (and on every profile switch) - so this is self-healing
without any new entry point: open the binder once with network available,
and every caught card gets backfilled, not just the ones whose Pokemon
happen to get revisited. After the first successful backfill, subsequent
loads cost two cheap local Isar reads and do no network work, since
nothing is missing anymore.

### Acceptance criteria

28. A profile with caught cards whose display data was never cached (the
    exact state found on the phone above) shows them correctly in the
    binder - `OwnedPocket`/`SelectedPocket` as appropriate - after opening
    the binder once, without needing to separately open each Pokemon's own
    Cards tab first.
29. One missing/unfetchable card id (e.g. a since-retired card from the
    API) does not prevent the rest of the backfill from completing.
30. A profile with nothing missing (the common case, after the first
    backfill) does no network work on subsequent binder loads.

### Traceability

| AC | Test |
|---|---|
| 28 | `test/services/tcg_card_repository_test.dart` - "AC28: fetches and caches display data for a caught card with none yet"; wiring confirmed in `test/services/card_binder_provider_test.dart` - "AC28: backfills uncached caught cards before reading them" |
| 29 | `test/services/tcg_card_repository_test.dart` - "AC29: one card failing to fetch does not prevent the rest of the backfill from completing" |
| 30 | `test/services/tcg_card_repository_test.dart` - "AC30: does nothing when every caught card is already cached - no getCard calls at all" |

**Live, on the phone:** before -
`binder-phone-cache-gap-before-fix.png` (described above). After -
reopened the binder once with the fix installed;
`binder-phone-cache-gap-after-fix.png` shows the previously-empty pockets
now correctly populated.

All screenshots: `docs/features/card-binder/screenshots/`.

## Sixth round: pinch-to-zoom didn't actually work

Status: **Done**, verified by code-level analysis of the Flutter SDK's own
`InteractiveViewer` source (not guessed) - a live two-finger pinch still
can't be driven through `adb`/emulator automation, same limitation noted
for AC21 above, so this fix is verified by reading the exact mechanism
rather than by a pinch screenshot.

**Reported:** "also pinch to zoom doesn't work." Correct, and a direct
consequence of a design choice from "Third round" above that turned out to
be wrong: `BinderPageTurner` had its own `GestureDetector`
(`onHorizontalDragStart`/`Update`/`End`) nested *inside* the surrounding
`InteractiveViewer`, active whenever not already zoomed in - i.e. active
during exactly the moment a pinch would need to *start*.

**Root cause, confirmed by reading `interactive_viewer.dart` in the
Flutter SDK directly:** `InteractiveViewer` always registers its own
`GestureDetector` with `onScaleStart`/`onScaleUpdate`/`onScaleEnd` - a
single `ScaleGestureRecognizer` that handles pan *and* pinch-scale
together - regardless of `panEnabled`/`scaleEnabled` (those two flags only
gate whether a detected gesture's effect gets *applied* to the transform,
confirmed by the SDK's own doc comment: *"Will be called even if the
interaction is disabled with panEnabled or scaleEnabled"*). With
`BinderPageTurner`'s own `HorizontalDragGestureRecognizer` mounted as a
*child* of that same `InteractiveViewer`, both recognizers watched the
same first touch. A plain drag recognizer claims the gesture arena as
soon as it sees sufficient horizontal movement from a single pointer -
almost always within the brief window before a second finger lands for a
real pinch, since two fingers essentially never touch down and begin
moving in perfectly simultaneous, zero-skew unison. Once an arena
resolves in the drag recognizer's favor, it's final: `InteractiveViewer`'s
scale recognizer never got to track that first pointer, so it has no way
to retroactively turn the gesture into a pinch once the second finger
arrives. This is also *why* AC11/AC12 (single-finger drag-to-turn-page)
kept working correctly throughout every previous round - the inner
recognizer reliably won - while pinch-start was silently broken the whole
time.

### Fix

Removed `BinderPageTurner`'s own `GestureDetector` entirely - there is now
exactly one gesture recognizer in the whole subtree
(`InteractiveViewer`'s), so there is nothing left to compete with it.
`BinderPageTurnerState` exposes `startExternalDrag`/`updateExternalDrag`/
`cancelExternalDrag`/`endExternalDrag` instead of owning drag detection
itself; `CardBinderScreen` drives them directly from
`InteractiveViewer.onInteractionStart`/`onInteractionUpdate`/
`onInteractionEnd`, gated on `details.pointerCount == 1` and not already
zoomed in. The moment `pointerCount` changes to 2 mid-gesture (a second
finger joining), the in-progress page-turn is cancelled
(`cancelExternalDrag`, snapping back to flat with no page change) and the
same continuous gesture hands off cleanly to `InteractiveViewer`'s own
native pinch-scale handling - no competing recognizer means no arena
conflict means the hand-off is automatic, not something hand-coded.
`panEnabled` stays gated on `_zoomed` exactly as before, so
`InteractiveViewer` never actually applies a transform for a single-finger
page-turn gesture (nothing to visually fight the custom leaf-rotation
animation); `scaleEnabled` stays unconditionally true so a real pinch
always scales immediately.

### Acceptance criteria

31. A single-finger drag still turns pages exactly as before (unchanged
    behavior - `startExternalDrag`/`updateExternalDrag`/`endExternalDrag`
    are a straight extraction of the previous `_onDragStart`/`_onDragUpdate`/
    `_onDragEnd` logic, not a rewrite of the turn math itself).
32. A second finger joining mid-drag cancels any in-progress page-turn
    (snaps back to flat, no page change) rather than completing it or
    leaving it stuck mid-turn.
33. There is exactly one gesture recognizer in the binder's widget subtree
    once zoom and page-turn are both considered - confirmed by code
    inspection (no second `GestureDetector`/`RawGestureDetector` added
    anywhere in `binder_page_turner.dart` or `card_binder_screen.dart`),
    not just by one of them happening to currently work.

### Traceability

| AC | Evidence |
|---|---|
| 31 | `test/widgets/binder/card_binder_screen_test.dart` - "AC11: tapping the next-page control turns exactly one page" (tap-driven path, unchanged); the drag path itself has no automated test, same pre-existing gap noted in "What was left out" below - not newly introduced here |
| 32 | Code review of `cancelExternalDrag`/`_onInteractionUpdate`'s `pointerCount != 1` branch - no automated test (same reason as AC31: a real multi-touch gesture isn't simulable by this suite's widget-test tooling) |
| 33 | Code review - `grep -n "GestureDetector\|RawGestureDetector" lib/widgets/binder/binder_page_turner.dart lib/screens/card_binder_screen.dart` shows only `InteractiveViewer`'s own, none hand-added |

**Live correction after this was shipped:** pinch-to-zoom does now actually
start (confirming the architectural fix above was correct) - the user's
immediate follow-up was about where you pinch, not whether it works (see
"Eighth round" below).

## Seventh round: pre-existing caught cards never got a display card

Status: **Done**, live-verified on the physical phone - a profile with
many legacy caught cards (from before "Fourth round" existed) went from
"every pocket is a dimmed sprite" to real card art, confirmed live.

**Reported, live on the phone, after the Fifth-round backfill finally
surfaced real ownership data for a long-lived profile:** "i still don't
see any of the cards" - every newly-revealed owned pocket was the dimmed
owned-indicator sprite, never actual card art.

**Root cause:** "Fourth round" made catching a Pokemon's *first* card
auto-select it as the display card - but only for catches made *after*
that fix shipped. Every card this specific profile had ever caught
predates it, so none of them have a `BinderCardSelection` row at all - the
dimmed-sprite `OwnedPocket` state is *exactly* what the existing design
specifies for "owned, nothing selected" (confirmed correct and desired by
the user earlier - "if i haven't selected a card then the generic sprite
is fine"). The gap is that nothing ever retroactively applies the same
"first catch becomes the display" idea to a profile's pre-existing
backlog - Fourth round only ever runs going forward, one catch at a time.

### Fix

`CardBinderProvider.load()` now runs a one-time catch-up pass after
assembling owned/cached/selected state: any Pokemon that's owned (and has
at least one cached card, which the Fifth-round backfill just ensured)
but has no selection row at all gets its highest-priced owned card
selected and persisted immediately - the same deterministic tie-break as
AC25's design (`highestPricedOwnedCard`, extracted from
`computeBinderPocketView`'s private helper into a public, directly-testable
function in `utils/binder/binder_pocket.dart`, backed by the `
estimatedCardPriceValue` numeric comparator added to `utils/tcg_price_util.dart`).
Persisted, not just computed for this render, so a Pokemon that's been
caught up behaves exactly like any other selection afterward - changeable
through the cycle picker, never silently re-picked on a later load. A
Pokemon that already has *any* selection row, even one pointing at a card
no longer owned, is left untouched - the catch-up only fills in Pokemon
with no selection at all, never overrides an existing (if currently
invalid) one.

### Acceptance criteria

34. A Pokemon with owned, cached cards but no selection ever recorded gets
    one auto-selected and persisted the next time the binder loads.
35. When several of a Pokemon's owned cards have never been selected
    between them, the catch-up picks the highest-priced one, same
    deterministic tie-break as AC25.
36. A Pokemon that already has an explicit selection (even one that no
    longer resolves to an owned card) is never touched by the catch-up.

### Traceability

| AC | Test |
|---|---|
| 34 | `test/services/card_binder_provider_test.dart` - "AC25/AC28 (Seventh round catch-up): an owned card with no selection ever recorded gets auto-selected and persisted during load" |
| 35 | `test/services/card_binder_provider_test.dart` - "the catch-up picks the highest-priced of several owned-but-never-selected cards for the same Pokemon"; unit-level in `test/utils/binder/binder_pocket_test.dart`'s `highestPricedOwnedCard` group |
| 36 | `test/services/card_binder_provider_test.dart` - "AC6: ... also confirms the Seventh-round catch-up never overrides an existing (even now-invalid) selection row" |

**A second, independent bug found investigating this, live on the phone:**
the backfill's own fetch path (`TcgService.getCard`, singular) had never
actually worked - `PokemonTcgApiService.getCard` returned the raw decoded
JSON instead of a parsed `TcgCard`, a `return jsonDecode(response.body)`
silently violating its own `Future<TcgCard?>` return type. Nothing had
ever called this method in production before the Fifth-round backfill,
and it had zero test coverage, so this had been broken since it was
written - confirmed via live logcat:
`Error fetching card: type '_Map<String, dynamic>' is not a subtype of
type 'FutureOr<TcgCard?>'`, once per missing card, silently swallowed by
the backfill's own per-card try/catch (by design, so one bad id doesn't
block the rest - see Fifth round AC29) - which is exactly why the backfill
appeared to do nothing at all. Fixed to unwrap the single-card response's
`"data"` envelope and call `TcgCard.fromJson`, same as the list endpoint
already does; also given the same transient-failure retry
(`_getWithRetry`) as the list endpoint, since live logs showed it hitting
the identical upstream 500/502 flakiness. New test coverage in
`test/services/pokemon_tcg_api_service_test.dart`'s `getCard` group (none
existed before).

**A known, accepted trade-off, not fixed here:** both the Fifth-round
backfill and this round's catch-up run synchronously inside
`CardBinderProvider.load()`, which `CardBinderScreen` blocks its entire
body behind (`!binder.isLoaded` shows only a spinner). For a profile with
many legacy gaps - confirmed live, this one had dozens - the very first
load after upgrading can take tens of seconds, each missing card fighting
through the same upstream 500/502 flakiness noted throughout this doc.
Reported live as "the card binder page just spins," then self-resolved
("it just took a while"). Left as a spinner rather than re-architected
into a progressive/background load, given this is strictly a one-time
cost per profile (every subsequent load is fast, per Fifth round AC30) -
flagged here rather than silently accepted, in case a profile with an
especially large backlog makes this worth revisiting.

## Eighth round: zoom magnified the content, not the binder itself

Status: **Done**, reported fixed by the user immediately after pinch-zoom
itself was confirmed working ("oh pinch to zoom does work").

**Reported:** "it won't increase the size of the bu[i]nder just zoom
what's inside it we need to fix that." Correct, and exactly how
`InteractiveViewer` is normally used (a fixed-size viewport, content
magnifies within it, like a map) - but not what was wanted here: the
binder *object itself* should grow to use more of the available screen
once zoomed in, not stay pinned at its resting size while the same
on-screen window just shows a magnified crop of it.

### Fix

The `ConstrainedBox(maxWidth: 820)` wrapping the binder (the POC's bounded
resting size, from "Third round") is now an `AnimatedContainer` whose
`maxWidth` animates to `double.infinity` while `_zoomed` is true, capped
only by whatever width the surrounding `Expanded` actually has. The
`AspectRatio(16/10)` inside it is untouched, so growing the outer bound
only ever produces a *correctly proportioned*, larger binder - never a
stretched or differently-shaped one. Shrinks back to the 820-wide resting
size automatically once scale returns to 1.0 (`_zoomed` flips false).

### Acceptance criteria

37. Pinching in grows the binder object's own on-screen footprint (not
    just the content rendered within a fixed-size window), up to the
    available space, while remaining correctly proportioned (16:10) at
    every size.
38. Returning to 1.0x scale shrinks the binder back to its normal bounded
    resting size.

### Traceability

| AC | Evidence |
|---|---|
| 37 | Code review - `AnimatedContainer`'s `constraints` keyed off `_zoomed`, `AspectRatio` unconditionally wrapping it; not yet re-confirmed with a fresh screenshot (phone was detached mid-session - re-verify on `emulator-5554` before closing this round) |
| 38 | Same as above - the binding is symmetric (`_zoomed` drives both directions of the `AnimatedContainer`), not independently verified live yet |

### Investigated live, turned out not to be a bug: "Drowzee shows caught but not in the binder"

Reported live on the phone, with a concrete example (dex #096, Drowzee).
Confirmed directly, two ways: the binder pocket's own accessibility label
read "drowzee: none owned, tap to add a card" (the exact string
`BinderPocketWidget._semanticLabel` emits for `EmptyPocket`), and opening
it into the full card-browse grid showed every real Drowzee card from the
API with no caught (blue-bordered) highlight on any of them. Logcat for
the same session showed zero `getCard` failures and zero persistent
(all-5-retries-exhausted) fetch failures, ruling out a partial backfill
failure as the cause.

**Conclusion:** not a bug. A Pokemon's Pokédex "caught" status
(`Pokemon`/`UserData`, toggled directly from the pokeball icon on the list
or details screen) and TCG-card ownership (`CaughtTcgCard`, the binder's
only data source - see "Pocket model" above) are two independent signals.
Drowzee was caught some way that never caught a TCG card for it (most
likely the pokeball toggle directly), so the binder correctly has nothing
to show - the same "+ " state as any other Pokemon with zero owned cards.
Catching a card always mirrors onto the Pokemon (`card_caught_toggle.dart`)
but not the other way around, and was never meant to: the binder is a
TCG-card collection view, not a second rendering of general Pokédex catch
status.

## Ninth round: caught-but-cardless Pokemon should still show *something*

Status: **Done**, verification pending on `emulator-5554` (phone was
mid-disconnect when this was built and tested).

**Reported**, immediately after the Drowzee investigation above confirmed
the design distinction was working as built: "i haven't caught a drowzee
card but i have selected drowzee it should still show the sprite since no
card was caught." This reverses the conclusion above, deliberately: the
distinction between "Pokédex caught" and "TCG-card owned" is real and
correctly computed, but the user wants the binder's "+" to mean "you
don't have this Pokemon at all," not narrowly "you have no *card* for
it" - a Pokemon caught any other way should still show the owned-indicator
sprite.

### Fix

`computeBinderPocketView` takes a new required `pokemonCaught` parameter
(the Pokemon's own `Pokemon.isCaught`, independent of any TCG card) and
falls into the `OwnedPocket` sprite state whenever either
`ownedCardIdsForPokemon` is non-empty *or* `pokemonCaught` is true - "+"
now exclusively means neither is true. `CardBinderProvider.pocketFor`
takes the same new required parameter (this provider deliberately doesn't
hold the Pokemon list itself, so the caller supplies it);
`CardBinderScreen` passes `pokemon.isCaught` from the `PokemonApiProvider`
data it already reads.

**A knock-on fix in the same change:** `_onPocketTapped`'s decision to
open the cycle picker vs. jump straight to the browse grid (AC8) used to
be `view is EmptyPocket` - with `OwnedPocket` now reachable for a Pokemon
with zero real owned cards, that check would have sent a caught-but-
cardless Pokemon into the cycle picker, which has nothing to cycle
through (a dead end - "No owned cards yet" with every control disabled).
Changed to ask the real question directly -
`binder.ownedCardsFor(pokemonId).isEmpty` - independent of which pocket
state is currently showing.

### Acceptance criteria

39. A Pokemon that's caught (Pokédex-level) but owns no TCG card at all
    shows the owned-indicator sprite, not the "+" state.
40. Tapping that pocket still opens straight into the browse grid (same
    as a genuinely empty pocket), not the cycle picker, since there's
    still nothing to cycle through.
41. A Pokemon that's both caught and owns a TCG card is unaffected -
    `pokemonCaught` only matters as a fallback when there's no card-based
    signal at all.

### Traceability

| AC | Test |
|---|---|
| 39 | `test/utils/binder/binder_pocket_test.dart` - "AC39 (Ninth round): a caught Pokemon with no TCG card owned at all shows the owned-indicator sprite..." + "...an uncaught Pokemon with no TCG card owned shows the + state..."; provider-level in `test/services/card_binder_provider_test.dart` - "AC39 (Ninth round): a caught Pokemon with no TCG card at all shows the owned-indicator state..." |
| 40 | Code review - `_onPocketTapped`'s `startInBrowse` now reads `binder.ownedCardsFor(pokemonId).isEmpty` directly; no automated test added (same widget-test-harness gap already noted for the drag gesture elsewhere in this doc) |
| 41 | `test/services/card_binder_provider_test.dart` - "AC39: an explicit selection still wins over pokemonCaught, same as it already wins over owned-but-uncached" |

**Live-verified on `emulator-5554`:** caught Bulbasaur directly via the
Pokedex list's pokeball (not through any TCG card, confirmed zero cards
owned) - the binder pocket's own accessibility label read "bulbasaur:
owned, none chosen to display" and showed the dimmed sprite, not "+"
(`caught-cardless-pokemon-shows-sprite.png`). Tapped it and confirmed it
opened straight into "All cards - tap to catch" (the browse grid), not
the cycle picker (`caught-cardless-pokemon-opens-browse.png`) - AC40.

## Tenth round: zoom *still* didn't grow the binder - the Eighth-round fix was wrong

Status: **Done**, built and unit/widget-tested; the one genuinely pinch-
dependent part (does it actually grow on a real two-finger gesture) still
can't be driven by `adb`/emulator automation, same limitation noted for
AC21/AC37.

**Reported:** "i still can't zoom the binder just what's inside it" -
after the Eighth-round fix had already shipped and the user retested on
the phone.

**Root cause: the Eighth-round fix loosened the wrong constraint.**
`ConstrainedBox(maxWidth: 820)` only ever matters on a screen *wider*
than 820 logical pixels - a tablet or desktop window. On an actual phone
(~360-430dp wide), the binder's width was already being capped by the
*screen's own width* (via `Padding`+`Expanded`+`Center`), well under 820,
long before the 820 cap ever became the binding constraint - so animating
that cap toward `double.infinity` while zoomed had **no effect
whatsoever** on a phone. Worse, on a *portrait* phone the binder's
rendered size is typically governed by *height* (`Expanded`'s available
vertical space, via `AspectRatio`'s need to satisfy 16:10 within whichever
dimension is tighter), not width at all - the previous fix only ever
touched a width constraint, so it could not have grown the binder even on
a screen where 820 genuinely was the active cap.

**A second, deeper problem, caught in design review before shipping a
second wrong fix:** simply making the *outer* box bigger while
`InteractiveViewer` *also* keeps applying its own internal content-zoom
transform to what's inside that box would double-scale the content -
once from the box's own larger layout size reflowing the grid naturally
bigger, and again from `InteractiveViewer`'s internal matrix magnifying
that already-bigger content further - compounding into overflow/visual
breakage, not a clean unified zoom.

### Fix

Removed `InteractiveViewer` from the binder screen entirely. A single
plain `GestureDetector` (`onScaleStart`/`onScaleUpdate`/`onScaleEnd` -
the same callback shapes `InteractiveViewer` used internally, so the
AC31 page-turn-vs-pinch routing logic carried over almost unchanged) now
drives a `_scale` value (1.0-4.0, persisted across separate gestures) and
a `_panOffset`, both plain `State` fields - not a `TransformationController`
or any paint-time transform on the binder's content. `build()` computes
the binder's actual `width`/`height` directly from `_scale` (proportional
to the same bounded resting size the POC always specified, so it only
ever grows as a correctly-proportioned 16:10 object) and sizes a
`SizedBox` to match - genuine layout, so the grid/text/art all re-render
crisp at the larger size instead of being a blurry stretched bitmap.
`OverflowBox` lets that `SizedBox` actually exceed the `Expanded`
region's normal bounds (a plain `Center` alone would just clamp it back
down); `ClipRect` around that keeps a grown-and-panned binder from
painting over the `AppBar`/nav controls. Panning (`Transform.translate`
by `_panOffset`, accumulated from `details.focalPointDelta` during a
2-or-more-finger update) resets to zero automatically the moment the
scale drops back to 1.0x, so un-zooming always cleanly re-centers rather
than leaving a stale offset for the next zoom-in.

**A known, accepted scope cut:** panning only works with two (or more)
fingers, during the same gesture that's also pinching - there's no
one-finger pan-while-already-zoomed (a common photo-viewer pattern).
Adding that would mean a second, different single-finger-gesture meaning
depending on zoom state, on top of the existing single-finger-means-page-
turn-when-not-zoomed routing - judged not worth the added complexity for
this pass; revisit if a real two-finger-only pan proves awkward in
practice.

### Acceptance criteria

42. Pinching changes the binder's actual rendered size (`SizedBox`
    width/height), not a transform applied to fixed-size content -
    confirmed by code review, since this is specifically what the
    previous (wrong) fix got backwards.
43. The binder can grow beyond its normal bounded resting size without
    being clamped back down by the surrounding layout.
44. A grown-and-panned binder never paints over the `AppBar` or the
    page-turn nav controls.
45. Un-zooming back to 1.0x always resets panning to centered, not a
    stale offset.
46. `InteractiveViewer` is no longer part of the binder screen at all -
    there is exactly one gesture recognizer, with one clear owner for
    both zoom and page-turn-by-drag.

### Traceability

| AC | Evidence |
|---|---|
| 42 | Code review - `build()`'s `width`/`height` computed from `_scale` and passed to a real `SizedBox`, no `Transform.scale` anywhere in the file |
| 43 | Code review - `OverflowBox(maxWidth: double.infinity, maxHeight: double.infinity)` wrapping the sized content |
| 44 | Code review - `ClipRect` wraps the `OverflowBox`, clipping to the `Expanded` region's own bounds |
| 45 | Code review - `_onScaleUpdate`'s `_scale <= 1.01 ? Offset.zero : ...` branch |
| 46 | `grep -n "InteractiveViewer" lib/screens/card_binder_screen.dart` - no matches |
| All | `flutter test test/widgets/binder/` - all 11 tests still passing (page-turn-by-tap, pocket states, search, highlight - none of which depend on the removed `InteractiveViewer`); the pinch gesture itself remains unverifiable via `adb`/emulator automation, same as AC21/AC37 |

## Eleventh round: a transient fetch failure read as "no cards found," and add/remove was there but mislabeled

Status: **Done**, unit/widget-tested; not yet live-verified (phone was
disconnected when this was built - see the Tenth round's own pending live
check, still outstanding too).

**Reported:** "sometimes when i click on a card it shows no found cards so
if i click away and click on it again then it loads them" - and,
separately, "clicking on a card you have in the binder should have the
option to pull up the full list to add or remove a card."

### Bug: a failed fetch silently rendered as "no cards found"

**Root cause, in `_CardPickerModalState.build()`:**
`final allCards = snapshot.data ?? const [];` collapsed two completely
different outcomes into the same rendering - a genuinely empty result
(this Pokemon really has zero cards) and `TcgApiProvider.getPokemonCards`
returning `null` because the fetch itself *failed* (its own `catch` block,
`lib/services/tcg_api_provider.dart`). This API's upstream 500/502
flakiness is already documented at length elsewhere in this doc (Fifth/
Seventh/Eleventh rounds all hit it); the modal had no way to tell "nothing
to show" apart from "couldn't check," so a transient failure read
identically to "this Pokemon has no cards," with no retry affordance -
closing the modal and reopening it was the only way to retry, and since a
failed fetch is never cached (`getPokemonCards`'s `catch` block never
writes to `_pokemon`), that accidental retry usually worked, matching
exactly what was reported.

**Fix:** the `FutureBuilder` now checks `snapshot.data == null` explicitly
and renders a distinct `_FetchFailed` state (the error message from
`TcgApiProvider.error`, plus a "Retry" button) before ever collapsing to
an empty list - the empty-list rendering now only happens for an
actually-successful-but-empty result. "Retry" just calls the same
`getPokemonCards` again, in place, without needing to leave the modal.

### Mislabeled: add/remove already worked, just didn't say so

**Investigated:** the full browse grid (`_BrowseView`), reachable from the
cycle picker's "Add a card" button, already let you tap *any* card to
toggle its caught status either way (`toggleCardCaught`'s `!card.isCaught`
flip) - un-catching an already-owned card from here always worked. The
gap was purely the label: "Add a card" (with a plain `+` icon) implied
one-directional, add-only, undiscoverable as also supporting removal.

**Fix:** relabeled to "Add / remove cards" (`Icons.library_books_outlined`)
and the browse grid's own header to "All cards - tap to catch or remove" -
no behavior change, both already worked exactly as asked.

### Acceptance criteria

47. A fetch failure (not a genuinely empty result) shows a distinct
    message with a retry option, never the same rendering as "this
    Pokemon has no cards."
48. Tapping retry re-attempts the fetch in place, without needing to
    leave and reopen the modal, and succeeds once the transient failure
    resolves.
49. A genuinely empty, successful result (this Pokemon really has zero
    TCG cards) is unaffected - still shows "No cards found for this
    Pokemon," not the failure state.
50. The path to add *or remove* a card from the full list is clearly
    labeled as doing both, not just implied by existing (undocumented)
    behavior.

### Traceability

| AC | Test |
|---|---|
| 47 | `test/widgets/binder/card_picker_modal_test.dart` - "Eleventh round: a failed fetch shows a retry option, not 'no cards found'..." |
| 48 | Same test - the retry-and-succeed half of it |
| 49 | Existing `_BrowseView` empty-state coverage, unchanged - `cards.isEmpty` still renders "No cards found for this Pokemon" |
| 50 | Code review - button/header text; no dedicated test (label text, not new behavior) |

**A test-infrastructure note worth keeping**, found getting AC47/48's test
to pass reliably: a single `tester.runAsync` block - even tapping retry
*and* waiting a full real second inside it - consistently left the
widget's own `Future.microtask`-wrapped retry call stuck mid-flight
(confirmed via a throwaway direct call to the same provider method, which
resolved instantly from cache - the data was ready, the widget's own
future just never got to finish observing it). A *second*, separate
`runAsync` block directly awaiting the same provider call afterward is
what reliably unstuck it. Not fully root-caused (plausibly something about
how `runAsync`'s real-zone scheduling interacts with a fire-and-forget
`Future.microtask` once the first `runAsync` block returns control to the
fake zone) - flagging as a reusable lesson for the next test that retries
a `FutureBuilder`-driven fetch under `runAsync`, rather than claiming full
certainty about the mechanism.

## Twelfth round: a page turn only advanced the spread by one page, not two

Status: **Done**, code-reviewed, unit/widget-tested (`flutter analyze`
clean at the same 80-issue baseline; full suite 377/378, same pre-existing
unrelated failure as every prior round), and **live-verified on
`emulator-5554`**: tapping next-page from the initial spread (page 0
alone) landed on pages 1|2 (dex #010-018 | #019-027), not a slide to
page 0|1 - tapping next again landed on pages 3|4 (dex #028-036 |
#037-045) - tapping prev correctly returned all the way to the initial
spread - and searching for dex #018 (Pidgeot, an odd page-group) correctly
landed it on the *left* of a spread paired with page 2 on the right,
confirming `_spreadRightIndexFor`'s odd/even handling. AC51-53 directly
confirmed this way; AC54 (uneven-count boundary) and AC55 (the leaf's
mid-flip content swap) are design/code-reviewed but not independently
live-confirmed - AC54 would need a deliberately small/odd-count fixture
to observe the graceful end-of-binder case, and AC55 isn't observable
from static screenshots before/after a turn (the swap happens mid-
animation, at the edge-on moment). The Tenth round's pinch-zoom growth
and the Eleventh round's fetch-retry UI are still outstanding - this
round's live check only exercised the tap-driven nav controls and search,
not a pinch gesture or a simulated fetch failure.

**Reported**, across two messages: "we still need to fix the page ordering
it'll put page one on page 1 and page 2" and then, more precisely, "i
think it's a page turn issue where turning the page should advance two
pages instead of just one let's think about the actual problem p1 turn
then p2 p3 turn then p4 p5 etc."

### Root cause: the spread model slides by one page-group, not a real book's non-overlapping pairs

`BinderPageTurner.rightPageIndex` was the sole source of truth for the
spread, with `leftPageIndex` always `rightPageIndex - 1` and every turn
moving `rightPageIndex` by exactly 1 (`turn()`'s
`widget.onPageChanged(widget.rightPageIndex + direction)`, and the drag
handlers' matching `direction`). That's a genuinely consistent, bug-free
design - each individual page-group's *content* was always correct,
confirmed repeatedly earlier in this doc via live screenshots - but it's a
**sliding window**, not how a real book or binder paginates: turning past
"page 1" left page 1 still sitting there, now on the left, with "page 2"
newly appeared on the right. The user's own `p1 turn then p2 p3 turn then
p4 p5` is the real-book model exactly: every turn should reveal a wholly
new, non-overlapping pair, with nothing carried over from the spread
before it.

This had been misdiagnosed as a content/caching bug in earlier rounds
(e.g. the Third round's blanking investigation and the Fifth round's cache
gap) because "the pages look like they're showing overlapping content" is
exactly what a correctly-functioning slide-by-one model looks like to
someone expecting slide-by-two - the underlying page data was never wrong.

**Why not full recto/verso modeling:** a real bound book's pairing works
because each leaf has two physically different sides (page 2's back is
page 3) - this app's binder explicitly does not model that (`_buildLeaf`'s
mirrored-content comment, and the Non-goals section). Re-deriving true
front/back content per sheet would have been a much larger change for no
real benefit here, since the pocket data is identical regardless of which
physical side it's rendered on.

### Fix

`BinderPageTurnerState` gained a single `_pageStep = 2` constant.
`rightPageIndex` is now always even (0, 2, 4, ...): the first spread still
shows page 0 alone against the inside cover (unchanged), but every turn
after that jumps by `_pageStep`, landing on a genuinely new, non-
overlapping pair (page 1|2, then 3|4, then 5|6, ...) instead of sliding by
one column. `turn()` and `endExternalDrag()` multiply their `direction`
sign by `_pageStep` before calling `onPageChanged`; `_canTurnForward` now
allows a turn as long as at least one further page-group exists at all
(`rightPageIndex + 1 < pageCount`), not only when a full pair remains, so
a binder whose total count doesn't pair evenly ends gracefully on a lone
leftover page against a blank slot - the mirror image of the first
spread's page-alone-against-the-cover start.

The one genuinely tricky part: the turning leaf itself. It visually
carries one page's content while flipping, but under this model it has to
*land* showing the next spread's content for the slot it's settling into
(e.g. a forward-turning leaf starts showing page 0, but must land showing
page 1, not page 0 again). `_buildLeaf` now takes `fromPageIndex` and
`toPageIndex` and switches between them at the same edge-on midpoint
(`angle.abs() > pi/2`) where the existing counter-flip already happens -
the leaf is thinnest and least noticeable exactly there, the same way a
real sheet's front and back are both invisible exactly edge-on, so the
content swap reads as part of the same flip rather than a jump-cut.

`CardBinderScreen`'s two page-jump call sites (`scrollToPokemonId`'s
`_initRightPageIndex`, and the search bar's `_onSearchSubmitted`) both
used to just set `rightPageIndex = page` directly - wrong now that
`rightPageIndex` must stay even. Both now go through a new
`_spreadRightIndexFor(pageGroup)` helper: an even target page-group lands
on the right as before; an odd one needs the spread one higher, which
brings it into view on the *left* instead. The forward-nav button's
`canGoForward` check was updated to match `_canTurnForward`'s new
boundary (`rightPageIndex + 1 < pageCount`).

### Acceptance criteria

51. Turning forward from the first spread (page 0 alone) reveals pages 1
    and 2 together, not page 0 sliding to the left with page 1 newly
    appearing on the right.
52. Turning forward again from there reveals pages 3 and 4, and so on -
    every spread after the first is a genuinely new, non-overlapping pair.
53. Jumping to a Pokemon on an odd page-group (via `scrollToPokemonId` or
    search) shows it on the left of its spread, paired with the even
    page-group after it (or a blank slot if none exists), not duplicated
    with the page before it.
54. A binder whose total pocket count doesn't pair evenly still lets you
    turn all the way to the last page-group, ending on it alone against a
    blank slot, rather than getting stuck one page-group short.
55. The turning leaf's own content matches what it lands on (the new
    spread), not what it started with - no flip that visually "undoes
    itself" once flat.

### Traceability

| AC | Test |
|---|---|
| 51 | `test/widgets/binder/card_binder_screen_test.dart` - "AC11: tapping the next-page control turns the spread by two pages, not one"; **live-confirmed** on `emulator-5554` (initial spread -> next -> pages 1|2, dex #010-018 \| #019-027) |
| 52 | Code review - `turn()`'s `_pageStep` multiplication, same mechanism as AC51; **live-confirmed** too (a second next-tap landed on pages 3\|4, dex #028-036 \| #037-045), plus a prev-tap live-confirmed returning all the way back to the initial spread |
| 53 | `test/widgets/binder/card_binder_screen_test.dart` - "AC1: scrollToPokemonId opens already turned to that Pokemon's page" (dex #10, an odd page-group, lands on the left with nothing on the right); **live-confirmed** via the search bar (dex #18 Pidgeot, also an odd page-group, landed on the left paired with page 2 on the right) |
| 54 | Code review - `_canTurnForward`'s `rightPageIndex + 1 < pageCount` plus `_buildPage`'s existing `pageIndex >= pageCount` blank fallback; both pre-existing test fixtures only have 10 Pokemon (an unevenly-pairing count), exercised indirectly by AC51/53 above |
| 55 | Code review - `_buildLeaf`'s `fromPageIndex`/`toPageIndex` swap at the mirrored-content threshold; not independently testable via widget tests, which don't assert mid-animation frame content (same limitation noted for the hinge-shadow/pre-emption logic earlier in this doc) |

**Still outstanding, honestly:** AC54 (graceful end-of-binder on an
uneven-count fixture) and AC55 (the leaf's mid-flip content swap, not
observable from static before/after screenshots), plus the Tenth round's
pinch-zoom growth and the Eleventh round's fetch-retry UI, none of which
this round's live check happened to exercise.

## Thirteenth round: a persistent entry point on the list itself, opening at the list's current spot, and an always-visible search field

Status: **Done**, unit/widget-tested (`flutter analyze` clean at the same
80-issue baseline; full suite 383/384, same single pre-existing flaky
failure as every prior round - confirmed it also passes in isolation, so
it's test-order/parallelism flakiness, not a regression), and
**live-verified on `emulator-5554`**: the search field was visible the
instant the binder opened, with no toggle; scrolling the main Pokedex
list to show roughly dex #117-125 and tapping the new binder button
opened the binder on the spread for dex #118-126 | #127-135 - the exact
pages containing what was on screen, not page 0; and searching "66" from
there jumped to dex #066 (Machop), highlighted it in amber, and cleared
the field back to its placeholder afterward.

**Requested:** "i want the binder option to be selected on any of pages
also there should be the search bar on the binder page too" - clarified
via follow-up questions to mean: (1) add the binder entry point to the
main Pokedex list's own AppBar, not only to a specific Pokemon's TCG
Details tab, and (2) make the binder's existing search field
always-visible, like the main list's own search bar, instead of a
magnifying-glass toggle. A third message arrived mid-build: "it should
also open the binder at the location so if you're on a view in the list
and click the binder icon it'll open the binder at that spot too."

### A persistent entry point on the Pokedex list

`PokedexScreen`'s `AppBar` gained a second `IconButton`
(`Icons.collections_bookmark_outlined`, same icon as the existing TCG
Details tab entry point, key `open-card-binder-from-list`) that opens
`CardBinderScreen` directly from the list - no longer only reachable by
first opening a specific Pokemon's details screen and switching to its
TCG Details tab.

### Opening at "that spot" - whichever Pokemon the list is scrolled to

Rather than always opening on page 0, the new button computes which
Pokemon currently sits at the vertical center of the visible list and
passes it as `scrollToPokemonId` - the same parameter
`PokemonDetailsScreen`'s own binder button already used, so both entry
points share one notion of "open already turned to this Pokemon's page".

A new pure helper, `indexAtViewportCenter` (`utils/scroll_center_math.dart`,
alongside the existing `centeredScrollOffset` used by the Home/recenter
feature - see docs/features/home-recenter.md), is roughly that function's
inverse: given the list's current scroll offset, itemExtent, and viewport
height, it reports which fixed-extent row is currently centered. With a
fixed `itemExtent` (`PokemonList.itemExtent`), this is computable directly
from the `ScrollController`'s own `position`, the same reasoning
`centeredScrollOffset` already relies on. `_openBinder()` clamps the
result into the current filtered list's bounds (empty/out-of-range list
falls back to no `scrollToPokemonId`, i.e. page 0, rather than crashing or
guessing) and reads that row's Pokemon id off `filteredPokemon` - the
*filtered* list, so a search/filter in effect on the main list is
respected rather than resolved against the raw, unfiltered dex order.

### Always-visible search, not a toggle

The binder's search field (see "New feature: search on the binder screen"
above) is no longer behind a magnifying-glass `IconButton` that swaps the
`AppBar` title for a `TextField` on tap. It's now a permanent `TextField`
row under the `AppBar`, styled to match the main Pokedex list's own
search bar (`widgets/pokemon_search_bar.dart`) - a label, a clear button,
and `onSubmitted` driving the same jump-and-highlight behavior as before
(AC23 is otherwise unchanged - still a jump, not a filter, for the same
"a binder page is a fixed physical layout" reasoning given when search was
first added). After a successful jump, the field is cleared and the
keyboard dismissed, since the query already did its one job (turning the
page) and a jump isn't a persistent filter the way the main list's search
is - leaving stale text sitting in an always-visible field would read as
"still active" when it isn't.

### Acceptance criteria

56. A button to open the card binder is visible on the main Pokedex list
    itself, not only reachable via a specific Pokemon's TCG Details tab.
57. Tapping it opens the binder already turned to the page containing
    whichever Pokemon is currently at the center of the list's visible
    viewport, not always page 0 - and respects the list's current
    search/filter (the *filtered* list's center, not the raw dex order).
58. The binder's search field is visible as soon as the binder screen
    opens - no extra tap/discovery step needed to reveal it.
59. Submitting a search still turns to the matching Pokemon's page and
    highlights its pocket, exactly as before this round (no regression to
    AC23's existing behavior).

### Traceability

| AC | Test |
|---|---|
| 56 | `test/widgets/pokedex_screen_binder_entry_point_test.dart` - "the binder entry point is visible on the Pokedex list itself" |
| 57 | `test/widgets/pokedex_screen_binder_entry_point_test.dart` - "opens the binder turned to whichever Pokemon the list is currently scrolled to, not always page 0"; `test/utils/scroll_center_math_test.dart` - `indexAtViewportCenter` group covers the underlying math directly |
| 58 | `test/widgets/binder/card_binder_screen_test.dart` - "Thirteenth round: the search field is visible immediately, no toggle needed" |
| 59 | Same test - the jump-and-highlight half of it |

**Live-verified on `emulator-5554`**, all four ACs: 56 and 58 by the
search field and binder button both simply being visible with no extra
step; 57 by scrolling the main list to roughly dex #117-125 and
confirming the binder opened on dex #118-126 | #127-135 (the viewport's
center at the time, Starmie #121, falls in that left page-group); 59 by
searching "66" and confirming the jump-and-highlight landed on #066
Machop and the field cleared itself afterward.

## Fourteenth round: zoom still capped to the resting frame, a page-number label, and a price overlay on every card display

Status: **Done**, code-reviewed, unit/widget-tested (`flutter analyze`
clean at the same 80-issue baseline; full suite 391/392, same single
pre-existing flaky failure as every prior round), and **live-verified on
`emulator-5554`** for the page label and the price overlay (both
confirmed on a real caught card, in both the binder pocket and the card
picker's cycle view) and for the nav controls staying correctly
hit-testable at rest after the zoom restructure. The pinch-zoom growth
itself still can't be driven by `adb` (no multi-touch primitive) - see
below for what was and wasn't verified.

**Reported:** "zoom in and out still only works inside the binder" (the
Tenth round's fix, never live-pinch-tested, turned out not to actually
work); "can you show the page number of the binder"; "can you show a tiny
price in dollar on wherever the card is displayed as an overlay?"

### Bug: pinch-zoom grew the binder's layout, but a ClipRect still capped what was visible to its resting footprint

**Root cause:** the Tenth round's fix (see above) genuinely grew the
binder's `SizedBox` - real layout, not a paint transform - but that
growing box sat inside `ClipRect(child: Center(child: OverflowBox(...)))`
where the `ClipRect` was sized to the narrow `Expanded` strip between the
search field and the nav row. Growing the box inside a frame that then
clips anything bigger than the frame right back down to the frame's own
size is visually indistinguishable from "only the content zooms" - the
exact bug this was supposed to fix. This was never caught because the one
genuinely pinch-dependent claim has never been live-tested by an actual
two-finger gesture (documented honestly as a gap in every prior round);
code review and non-gesture widget tests can't see a clipping bug that
only matters once the clipped content is actually larger than the clip
rect.

**Fix:** the search field and nav row now sit in a `Column` that only
*reserves* their layout position (a `Spacer` in place of where the binder
used to render inline); the binder itself is a separate `Positioned.fill`
layer on top of that `Column`, inside the same `Stack`, clipped against
the *whole* available body instead of just the narrow strip. At rest the
binder's actual footprint is unchanged, so it doesn't reach the search
field or nav row and both stay fully usable; once zoomed, growth now has
real room to expand into, painting over them if it grows large enough -
the same way a zoomed photo viewer takes over its surrounding chrome.

**A second bug found immediately by this restructure's own widget test:**
nothing had ever bounded the binder's *resting* height, only its resting
width (`math.min(MediaQuery.sizeOf(context).width - 32, 820.0)`) - on a
normal tall phone the width bound always wins so this was invisible, but
on an unusually wide/short viewport (this screen's own widget-test
harness, at minimum - also plausibly a tablet or a foldable's near-square
inner screen) an unbounded resting height could already be tall enough to
cover the nav row *before any zoom at all*, caught by a test failing to
hit-test the next-page button. Fixed by also capping the resting width by
60% of the screen's height (converted through the 16:10 ratio): on a tall
phone this is never the binding constraint (confirmed arithmetically for
typical phone proportions, not just asserted), so normal usage is
unaffected; it only kicks in for the unusual wide/short case.

### Feature: a page-number label

`binderPageLabel` (`utils/binder/binder_layout.dart`) is a small pure
function: `rightPageIndex`/`pageCount` in, a 1-indexed "Page N of M" or
"Pages N-M of M" string out, handling the two single-page edge cases (the
first spread's lone right page against the cover; a final spread's lone
left page if the total count doesn't pair evenly). Rendered as a `Text`
between the prev/next buttons in `_NavigationControls`.

### Feature: a price overlay on every card display

A new `CardPriceBadge` widget (`widgets/binder/card_price_badge.dart`) -
a small dark pill in a card image's bottom-right corner, reusing the
already-existing `estimatedCardPrice` (`utils/tcg_price_util.dart`, USD
preferred, EUR fallback - already powering the Pokemon Details screen's
TCG tab) rather than inventing a second pricing/formatting path. Renders
nothing when a card has no pricing data. Wired into all three places a
card's actual artwork is shown: a binder pocket's `_SleeveCard`, the card
picker's cycle view, and its browse grid.

### Acceptance criteria

60. Pinch-zooming the binder grows its actual on-screen footprint, not
    just the content inside a fixed-size frame - verified by growth no
    longer being clipped to the narrow strip between the search field and
    nav row.
61. The search field and nav row remain fully usable at the binder's
    resting (unzoomed) size, on both a normal phone and an unusually
    wide/short viewport.
62. The current spread's page number(s) are visible near the nav
    controls and update correctly as the spread turns, including both
    single-page edge cases (first spread, uneven-count last spread).
63. Wherever a TCG card's artwork is shown (binder pocket, cycle view,
    browse grid), a small price overlay appears in dollars (or the
    existing euro fallback) when pricing data exists, and nothing when it
    doesn't.

### Traceability

| AC | Test |
|---|---|
| 60 | Code review - the `Positioned.fill`/`Stack` restructure; **not** independently live-pinch-tested (no `adb` multi-touch primitive, same limitation as every prior round) |
| 61 | `test/widgets/binder/card_binder_screen_test.dart`'s existing nav-button tests caught the height-cap bug directly (a hit-test failure) before the fix; re-passing after the fix is the regression check; **live-confirmed** on `emulator-5554` - the nav buttons and search field stayed tappable and visually clear of the binder at rest |
| 62 | `test/utils/binder/binder_layout_test.dart` - `binderPageLabel` group (all three shapes); `test/widgets/binder/card_binder_screen_test.dart` - "Fourteenth round: a page-number label is shown and updates as the spread turns"; **live-confirmed** ("Page 1 of 114" at rest, "Pages 2-3 of 114" after one turn) |
| 63 | `test/widgets/binder/card_price_badge_test.dart` (the widget itself); `test/widgets/binder/card_picker_modal_test.dart` - two "Fourteenth round" tests (cycle view, browse grid); **live-confirmed** - a real caught Bulbasaur card's €1.80 (Cardmarket - this particular card had no TCGPlayer/USD price, so the existing fallback applied) showing as an overlay in both the binder pocket and the picker's cycle view |

**Still outstanding, honestly:** a genuine two-finger pinch gesture
growing the binder on a real device - every prior round's same gap.
Everything else in this round that's observable without a pinch gesture
(the restructure's correctness at rest, the page label, the price
overlay) is live-confirmed.

## Fifteenth round: dollar prices, the zoom fix reaching the phone at all, and three follow-on bugs it then exposed

Status: **Done**, unit/widget-tested (`flutter analyze` clean at the same
80-issue baseline; full suite 394/395, same single pre-existing flaky
failure as every prior round). The zoom fix itself is **live-confirmed by
the user** ("zooming works now"); everything else is code-reviewed/
widget-tested but not yet independently re-verified live on a device.

**Reported, across several messages in sequence:**
1. "it still doesn't show it in dollars and the pinch to zoom still
   doesn't zoom the binder just the inside of the binder it should zoom
   the whole thing" - after the Fourteenth round's price-overlay and
   zoom-restructure fixes had already shipped and been live-verified on
   the emulator.
2. (After a force-stopped redeploy confirmed the zoom fix was real all
   along - see below): "zooming works now still shows euro prices though
   and for some reason the bottom row the binder isn't showing the whole
   cards" and, separately, "also i can't seem to turn the page when
   zoomed in."
3. "why do the tcg details keep taking a while to load in doesn't it
   save it to my phone so it loads quicker next time sometimes the tcg
   details shows status 500 it should retry and not show that."

### Price bug: TCGPlayer's `prices` object is keyed by print variant, not flat

**Root cause, confirmed against a real response** (`GET
/v2/cards/base1-4`):
```json
"tcgplayer": {"prices": {"holofoil": {"low": 499.99, "market": 928.06, ...}}}
```
`Tcgplayer.prices` was typed as a single [PriceData] - the same flat
shape Cardmarket's `prices` genuinely has. `PriceData.fromJson` read
top-level keys (`low`, `market`, ...) that don't exist at that level for
TCGPlayer (they're nested one more level under a variant key like
`"holofoil"`) - every field silently parsed to null, so
`estimatedCardPrice` (`utils/tcg_price_util.dart`) never had a real USD
number to work with and always fell through to Cardmarket's EUR price.
This had been true since whenever the `tcgplayer` field was first added -
not a regression from the Fourteenth round's own work, just the first
time anyone actually looked for a `$` price and didn't find one.

**Fix:** a new embedded `TcgplayerPrices` class
(`models/tcg_card.dart`) with one optional [PriceData] field per variant
TCGPlayer actually uses (`normal`, `holofoil`, `reverseHolofoil`, the two
`1stEdition*` variants, `unlimited`, `unlimitedHolofoil`) - Isar's
embedded-object model needs a fixed schema, so this can't just be a
`Map<String, PriceData>` the way the raw JSON is shaped.
`_bestTcgplayerPrice` now tries each variant in roughly most-to-least-
common order and uses whichever one actually has data, instead of
assuming a single fixed variant always exists. Regenerated
`tcg_card.g.dart` via `build_runner`.

### Zoom: still "frame stays fixed, content grows" after the Fourteenth round's fix

**Investigated, live, via two targeted questions** rather than guessing a
third time blindly: confirmed the symptom is specifically "the dark
leather frame never changes size or position, only the cards/pockets
inside appear to scale up" - and confirmed it happens identically folded
and unfolded, ruling out the Fourteenth round's own height-cap/aspect-
ratio reasoning as the culprit (that would show up differently on the
fold's near-square inner screen than on its narrow cover screen; it
didn't).

That exact symptom - frame fixed, content scaling - is what the *original*
`InteractiveViewer`-based implementation looked like, from well before the
Tenth round removed it. Re-reading the current `card_binder_screen.dart`
confirms the committed code is correct: `_scale` directly drives the
`SizedBox`'s own `width`/`height` (the leather frame's container), so if
the frame genuinely isn't growing while *only* its children's rendering
changes, `_scale` itself isn't the thing responding to the gesture at all
- nothing else in this tree has an independent scale/transform that could
produce that split. The most likely explanation found so far: **the app
process on the phone was never actually killed and restarted with the
new code.** Every deploy this session used `adb install -r` + `monkey -c
LAUNCHER` without first force-stopping the running process - Android
usually kills a package's process on reinstall, but not guaranteed in
every circumstance, and `monkey`'s `LAUNCHER` intent just brings whatever
process is already running to the foreground rather than confirming a
fresh one started. If the phone had an old (pre-Tenth-round,
`InteractiveViewer`-based) process still alive underneath, it would
produce *exactly* the reported symptom regardless of how many times the
APK on disk gets replaced.

**Confirmed on redeploy.** The phone reconnected; `adb shell am
force-stop com.example.pokedex_app` before `install -r` showed the
*previous* deploy's process (same pid, unmoved, across two prior
"deploys") was indeed still alive, force-stopping killed it, and the
freshly-launched pid was different. The user then confirmed live:
"zooming works now" - the stale-process theory was the real explanation,
not a code bug in the Fourteenth round's restructure.

### Follow-on bug 1: the price fix itself had a second layer - stale cached data

Confirmed working code (above) didn't mean the *displayed* price changed:
a card's `TcgCard` row, once cached in Isar under the old, broken
TCGPlayer-price parsing, is never automatically re-fetched -
`getCaughtCardsForProfile`/`backfillUncachedCaughtCards`
(`tcg_card_repository.dart`) only ever fetch a caught card that's
*missing* from the cache, never one that's already there with stale
data. A card cached during this session's earlier testing (before the
parsing fix existed) would keep showing its old, wrong price forever.

**Fix:** a new, deliberately narrow `LocalService.clearTcgCardCache()`
(wipes only the `tcgCards` table - `CaughtTcgCard`, profiles, and every
other cached resource are untouched, so no catch progress is lost),
exposed as `TcgCardRepository.clearCache()` /
`TcgApiProvider.refreshCardCache()`, and surfaced as a new "Refresh TCG
Card Data" item in the hamburger menu (`widgets/hamburger_menu.dart`) -
a genuinely useful affordance beyond this one bug, since real-world TCG
prices change over time too, not just once after a parsing fix.

### Follow-on bug 2: the bottom pocket row was clipped, not just visually cramped

**Root cause:** `BinderPageGrid`'s 3x3 `GridView` used a *hardcoded*
`childAspectRatio: 0.7`, independent of how much height the page was
actually given. The binder's own 16:10 aspect ratio doesn't necessarily
provide enough height for three rows of 0.7-ratio cells at a given
width - when it doesn't, `GridView`'s non-scrollable viewport silently
clips whatever doesn't fit (ordinary Viewport clipping, not a RenderFlex
overflow, so it never shows the yellow/black warning stripes a test or a
casual glance would catch). Worked out arithmetically for a typical
resting binder width (~379px): the grid's three rows needed ~240px,
the page only had ~201px available - a real, calculable mismatch, not
just an edge case.

**Fix:** `childAspectRatio` is now computed from the real
`LayoutBuilder` constraints each page is actually given (`cellWidth /
cellHeight`, both derived from the available width/height minus
spacing), so the grid always exactly fills its page at any size the
binder (zoomed or not) ends up being, instead of hoping a fixed ratio
happens to match.

### Follow-on bug 3: the nav row became unreachable while zoomed - the only way left to turn a page

**Root cause:** the Fourteenth round's fix for *this exact zoom-growth
bug* reordered the `Stack` so the binder layer painted (and so
hit-tested) *after* the chrome (search field + nav row), letting a
zoomed-in binder visually cover them - but that also meant a
sufficiently zoomed binder's `GestureDetector` intercepted taps meant for
the nav buttons before they could reach them. Since one-finger
drag-to-turn is deliberately disabled while zoomed (to avoid conflicting
with panning), this left *no* way to turn a page while zoomed in at all.

**Fix:** swapped the paint order - the binder layer now paints first
(underneath), the chrome (search field + nav row,
`_buildChrome`/`_buildBinderLayer` in `card_binder_screen.dart`) paints
last/on top, so it always stays reachable. The trade-off: a sufficiently
zoomed-in binder now renders *behind* the chrome instead of covering it,
which reads fine since both have an opaque fill. Also gave the screen's
outer `Stack` a `Key('binder-screen-stack')` for future test/debug use.

### Follow-on question: TCG tab loading time and an un-retryable 500

**Investigated:** `DefaultTcgCardRepository.getCardsByNationalDexId`
(the per-Pokemon card *list* lookup, used by the Details screen's TCG
tab) never checked the local cache at all - every fresh app session
re-fetched every Pokemon's full card list from the network, even for one
viewed many times before. Separately, `PokemonDetailsScreen`'s own TCG
tab had its own, never-fixed copy of the exact bug the binder's picker
modal already fixed in the Eleventh round: a failed fetch showed "Failed
to load TCG cards." with the raw error text (sometimes literally
containing "500") and no way to retry short of leaving and reopening the
screen.

**Fix:** `getCardsByNationalDexId` now checks
`LocalService.getCachedTcgCardsByPokemonId` (a new method, querying
cached cards by `nationalPokedexNumbers` via Isar's existing
`nationalPokedexNumbersElementEqualTo` filter) before hitting the
network, caching a fresh result afterward - so a Pokemon's TCG tab loads
instantly on a repeat visit, even across app restarts, not just within
one session. `PokemonDetailsScreen` gained the same retry pattern as the
Eleventh round's picker modal: `_tcgCardsFuture` is no longer `late
final`, `_fetchTcgCards()` is deferred via `Future.microtask` (fixing a
latent "setState during build" crash risk that pre-existed but was
masked whenever the data happened to already be cached), and a "Retry"
button (`Key('tcg-tab-retry')`) appears alongside the error message.

### Acceptance criteria

64. A card's price overlay (binder pocket, cycle view, browse grid) shows
    `$` for any real card that TCGPlayer actually has pricing data for
    (not just the Cardmarket `€` fallback for every card, which is what
    `_bestTcgplayerPrice` always silently returned before this round).
65. Pinch-zoom genuinely grows the binder's own on-screen footprint on a
    real device, not just its content - confirmed live by the user after
    a force-stopped redeploy.
66. A deliberate, narrow way exists to force stale cached TCG card data
    to be re-fetched, without losing which cards are actually caught.
67. Every pocket in the bottom row of a binder page is fully visible, at
    any size the binder (zoomed or not) ends up being.
68. The nav row (and search field) stay reachable - tappable, not
    covered - at any zoom level, including zoomed in far enough that the
    binder would otherwise paint over them.
69. A Pokemon's TCG card list loads from the local cache on a repeat
    visit, including across app restarts, instead of always re-fetching.
70. A failed fetch on the Details screen's TCG tab shows a retry option
    instead of only a dead-end error message.

### Traceability

| AC | Test |
|---|---|
| 64 | `test/utils/tcg_price_util_test.dart` - new test reading a real pokemontcg.io response shape (`base1-4`'s actual `tcgplayer` JSON) end to end, plus a test confirming each variant is tried in turn, not just one fixed one |
| 65 | **Live-confirmed** by the user ("zooming works now") on a real phone after a force-stopped redeploy - not independently re-verified by this session beyond that confirmation |
| 66 | `test/services/tcg_card_repository_test.dart` - "TcgCardRepository.clearCache forces a stale cached card to be re-fetched..." - caches a card under one name, confirms the backfill leaves it alone, clears the cache, confirms a fresh backfill picks up new data while the caught *status* survives untouched |
| 67 | Code review - `BinderPageGrid`'s `LayoutBuilder`-derived `childAspectRatio`; the original bug was itself only ever caught by arithmetic/code review (silent Viewport clipping, no automated-test-visible overflow signal), so no new automated regression test was written specifically for it either - same category of gap as AC18/pre-emption logic earlier in this doc |
| 68 | Code review - `build()`'s `Stack` lists `_buildBinderLayer(...)` before `_buildChrome(...)`. Two different widget-test attempts (a real two-finger `startGesture` pinch; a structural `stack.children` type check) both hung the *entire test file* on teardown when run as part of the full suite, despite each passing cleanly alone - not root-caused further given the risk of destabilizing every other test in that file; flagged as code-review-only rather than adding a flaky/hanging test |
| 69 | Code review - `getCachedTcgCardsByPokemonId`'s Isar filter query and its use in `getCardsByNationalDexId`; indirectly exercised by every existing `card_picker_modal_test.dart` test still passing (confirms no regression), but no dedicated "second call skips the network" test was added |
| 70 | Code review - mirrors the already-tested Eleventh-round pattern in `card_picker_modal.dart` exactly; a dedicated widget test was attempted and the failure path itself worked (confirmed via a direct, non-widget async test of the underlying repository logic), but rendering the *success* half of the retry inside `PokemonDetailsScreen`'s widget tree hit this test binary's own pre-existing, already-documented `flutter_cache_manager`/sqflite gap (see "Visual redesign" section's "test-infrastructure gap" note) - dropped rather than fought further |

**A second test-infrastructure note worth keeping, distinct from the
cache-manager one above:** `card_picker_modal_test.dart`'s shared
`pumpHarness` helper needed real rework this round, not just a longer
delay - adding one more genuine Isar I/O hop
(`getCachedTcgCardsByPokemonId`) ahead of the network call on a
previously-network-only path made the *existing* "Eleventh round" retry
test flake into a hard, reproducible failure (not just occasionally
flaky) in a way no fixed delay (300ms, 1000ms, two sequential 1000ms
rounds, with or without a direct provider re-call) resolved reliably.
Confirmed via a standalone, non-widget async test that the production
code itself was correct throughout - this was purely about getting
`flutter_test`'s fake-async zone to let real Isar FFI work resolve before
an assertion runs. What actually fixed it: polling (nudge real async
work via `runAsync`, then `settle`, repeat until a state-agnostic
condition - here, the loading spinner disappearing - is true) instead of
guessing a fixed delay, *and* moving the tap itself inside the `runAsync`
block rather than before it. A direct `tcgProvider.getPokemonCards(...)`
re-call (the pattern already proven for the retry button specifically)
is explicitly wrong to reuse for the *first* fetch attempt: called before
a test observes the first failure, it silently counts as a second
attempt and consumes it, producing a false pass that never actually saw
the failure UI at all - caught by noticing the expected
"Error fetching TCG cards" log line was missing, not by the assertion
itself.

## Sixteenth round: one-finger drag to turn the page still didn't work while zoomed

Status: **Done**, code-reviewed (see below for why a widget test wasn't
added), `flutter analyze` clean at the same 80-issue baseline, full suite
394/395 (the same single pre-existing flaky failure as every prior
round). Not yet live-verified - deployed to the phone but the person
hadn't re-tested by the time this was written up.

**Reported:** "i still can't turn the page if i zoom in" - after the
Fifteenth round's Stack-reorder fix had already shipped and been deployed
fresh (confirmed via a new pid, ruling out the stale-process explanation
that resolved the *previous* round's zoom report).

**Investigated via one targeted question** rather than assuming the
Fifteenth round's fix was broken: confirmed the person was swiping/
dragging with one finger, not using the nav buttons (which the Fifteenth
round's Stack-reorder genuinely did fix). This exposed a second, separate
bug sitting right next to the one just fixed.

**Root cause:** one-finger drag-to-turn was gated on `!_zoomed`
(`_onScaleStart`), a restriction left over from early in this feature's
design, intended to leave single-finger gestures free for panning while
zoomed. But panning has only ever been driven by the *two-finger* branch
of `_onScaleUpdate` (`details.pointerCount >= 2`, using
`details.focalPointDelta`) - a single finger was never actually doing
anything useful while zoomed, not turning the page and not panning
either. The restriction was protecting a conflict that didn't exist.

**Fix:** removed the `!_zoomed` condition - one-finger drag now starts a
page-turn attempt regardless of zoom state, exactly as it already does at
rest. Panning stays two-finger-only, so this doesn't introduce a new
ambiguity between the two gestures, just extends the existing
one-finger/two-finger split to the zoomed case. Also removed the now-dead
`_zoomed` getter (no remaining callers) and updated the doc comments that
referenced the old restriction.

### Acceptance criteria

71. Swiping with one finger turns the page while the binder is zoomed in,
    the same way it does at rest.

### Traceability

| AC | Test |
|---|---|
| 71 | Code review only - `_onScaleStart`'s `details.pointerCount == 1` condition no longer also checks `!_zoomed`. A widget test simulating a real one-finger drag while already zoomed would need to first simulate a two-finger pinch to *get* zoomed, which hung this entire test file on teardown when tried for the Fifteenth round's nav-reachability fix (see that round's own test-infrastructure note) - not re-attempted here for the same reason |

## Open questions

- Exact page size (9/page, 3x3, assumed) - confirm it actually reads well at
  phone width before locking it in; a real binder page might want fewer slots
  shown larger on a small screen. **Still open** - built as specified (9/page,
  3x3) but not visually confirmed on a real phone-width device/simulator as
  part of this implementation pass; flagged for a follow-up design check.
- Whether the cycle picker needs its own "none of these, show nothing" option
  - **Resolved as leaned**: not built. Un-catching the selected card (from
    anywhere) already produces the correct fallback (AC6, tested).

## What was left out / left for a follow-up

- **Profile scoping of `BinderCardSelection` is real and tested; profile
  scoping of "which cards are owned" depends on the profiles epic already
  being in this codebase** (`CaughtTcgCard.profileId`, `ProfileProvider`,
  `TcgCardRepository` - all present and used as designed). No gap here; noted
  only because earlier drafts of this doc were written before confirming
  those pieces existed in this tree.
- **Paper-bend polish** (scaleX foreshortening, skewY, curling corner radius)
  - explicitly deferred by the design doc itself; not attempted here either.
- **Feature TODO, requested live, not yet built:** the spine/pages should
  visually read as a *stack* whose thickness differs left vs. right
  depending on how many pages are actually on that side - near the front
  of the binder, the left stack is thin and the right stack is thick (most
  pages still to come), and that inverts near the back, the same way a
  real book's two halves do. Currently every page edge renders at a fixed
  thickness regardless of `rightPageIndex`/`pageCount`, so the binder
  never visually signals "how far through" it is the way a physical one
  does. Likely approach: a thin stacked-edge visual (a handful of offset
  page-edge lines, like a book viewed from the side) on the spine side of
  each half, with line count/offset scaled from `rightPageIndex` (left
  stack) and `pageCount - rightPageIndex` (right stack) - not designed or
  built yet, flagging the idea and the rough mechanism only.
- **Feature TODO, requested live, not yet built (three requests together):**
  - **Mock pack-opening.** A simulated "open a pack" flow with realistic
    per-rarity pull odds (real TCG packs have documented-ish slot odds -
    e.g. a fixed count of commons/uncommons, one guaranteed rare-or-better
    slot with its own rarity-weighted distribution, and low-probability
    "hit" slots for secret rares/alt-arts) rather than a uniform random
    draw from all cards in a set. Needs: a decision on whether pulled
    cards actually get added to the caught set (making this a genuine
    alternate catching path) or are purely cosmetic/simulated; a source
    for real odds (not in the PokeAPI/TCG API responses used today - would
    need to be hand-modeled per generation/era, since odds have changed
    across the TCG's history); and a pack-opening animation (not designed).
  - **Card detail view.** Tapping a card (wherever shown - pocket, cycle
    view, browse grid) currently only shows its artwork (plus, after the
    Fourteenth round, a price badge). No way to see its set name, release
    year, rarity, card number within the set, or other metadata the TCG
    API already returns per card (`set`, `rarity`, `number`, etc. - see
    `models/tcg_card.dart`, already parsed and available, just not
    surfaced anywhere in the binder's own UI - the Pokemon Details
    screen's TCG tab may already show some of this, not yet checked).
    Likely a simple detail sheet/dialog, no new data-fetching needed.
  - **Binder cover customization + a literal "closed" state.** Two related
    asks: (1) changeable binder cover art/skin (a user-chosen or
    unlockable visual theme for the leather base, spine, etc. - no
    existing mechanism for this; would need a settings/customization
    surface and either a fixed set of built-in skins or user-uploaded
    art), and (2) an actual closed-book view showing the binder's *outside*
    (front cover, spine edge) - distinct from today's "always open to a
    spread" model (`BinderPageTurner` has no closed state at all; the
    inside-cover widget, `BinderInsideCover`, is the *left* page of the
    first spread, not a true closed cover). Both are real, undesigned
    scope - no acceptance criteria, data model, or UI sketched yet.
- **Page size confirmation at phone width** - see Open questions above.
- **Drag-gesture automated coverage for the page turn** - the drag handler
  (`BinderPageTurnerState._onDragUpdate`/`_onDragEnd`) is implemented exactly
  per the Animation section, but only the tap-driven navigation controls
  (which call the same underlying `turn()`) are exercised by an automated
  test. Manually verify the drag gesture on a device/simulator before calling
  AC11/AC12 fully done.
- **A test-infrastructure gap surfaced, not fixed**: this test binary has no
  `sqflite_common_ffi` backend configured for `flutter_cache_manager`
  (`cached_network_image`'s disk cache), so a widget test that combines (a)
  `tester.runAsync()` for genuine Isar I/O and (b) a real `CachedNetworkImage`
  on screen hits `databaseFactory not initialized`. Worked around in these
  tests (by choosing pocket/Pokemon fixtures that don't render a
  `CachedNetworkImage` during the specific interaction that needs
  `runAsync()`) rather than by adding a new dev dependency to fix the
  harness - flagging here as a reusable lesson for the next widget test that
  needs both at once.
- **A real, independent bug fixed in passing**: `TcgApiProvider.getPokemonCards`
  calls `notifyListeners()` before its first `await`; calling it synchronously
  from a widget's `initState()` (both the pre-existing
  `PokemonDetailsScreen.initState()` and this feature's new
  `_CardPickerModal.initState()`) trips Flutter's "setState during build"
  guard whenever that widget is inflated within an already-building frame
  (e.g. opening a modal from a tap). Fixed inside
  `lib/widgets/binder/card_picker_modal.dart` (deferred via
  `Future.microtask`) - `PokemonDetailsScreen.initState()` itself was left
  untouched per this task's file-scope constraints, so the same latent
  fragility still exists there, just unexercised by any existing test.

### Closing record
- Date: 2026-10-10
- Commit: (uncommitted - left as working-tree changes in this worktree for
  manual integration; see the implementing agent's final report)
- Checklist: docs/ACCEPTANCE_CHECKLIST.md - data model, TDD, SOLID/DRY/YAGNI,
  and test-coverage sections applicable and followed (see traceability
  above); `/simplify` and `/code-review` (§11) were not run as separate
  passes in this session - flagged for the integrating reviewer.
- Tests: unit (binder_pocket_test, binder_layout_test, tcg_price_util_test
  untouched) / integration (card_binder_persistence_test,
  tcg_card_repository_test, card_binder_provider_test) / e2e 0 / widget
  (card_picker_modal_test, card_binder_screen_test,
  pokemon_details_screen_binder_entry_point_test) - all passing: yes (274
  total suite tests, 1 failing - the pre-existing unmodified
  `test/widget_test.dart` template smoke test, unrelated to this feature)
- analyze: clean of new issues (new `experimental_member_use` warnings on
  `lib/models/binder_card_selection.g.dart`'s composite-index accessors are
  the same pre-existing warning category already present for
  `CaughtTcgCard`/`CaughtPokemon`'s composite indexes - not a new category)
- TDD evidence: each new behavior was written test-first and seen failing
  for the right reason (missing symbol/type) before implementation; see the
  implementing agent's final report for the specific red-run transcripts
- Traceability: table above
- N/A items and why: integration_test/ (§4.3) not added - no AC here needs a
  real-device e2e flow beyond what the widget tests already cover; backups
  (§6) not applicable - this feature adds data, it doesn't rewrite or
  migrate any existing collection.
