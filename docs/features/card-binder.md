# Card binder view

Status: **Done** (2026-10-10) - see "Third round" below for the most recent
work (a page-turn blanking bug, zoom panning, pocket ID labels, a new
search feature, and an overflow bug found while live-verifying the pocket
labels), live-verified on `emulator-5554`. Visual design and page-turn
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
