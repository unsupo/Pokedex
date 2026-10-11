# Card binder view

Status: **In progress** (2026-10-11) - "Ninth round" below (a caught-but-
cardless Pokemon now shows the owned sprite, not "+") is live-verified on
`emulator-5554`. "Eighth round" (the binder's own footprint, not just its
content, now grows while zoomed) is built and unit/widget-tested but its
one genuinely pinch-dependent claim (AC37/38) still can't be driven by
`adb`/emulator automation (no multi-touch primitive) - code-reviewed
against the Flutter SDK source only, same limitation as AC21. "Seventh
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
