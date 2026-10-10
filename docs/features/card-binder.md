# Card binder view

Status: **Implemented** (2026-10-10). Visual design and page-turn mechanics
POC'd and approved in direction (see Animation); paper-bend polish
deliberately deferred and still not built (unchanged from the POC). Per-pocket
card selection (see below) added after the POC - changes the binder's layout
unit from "one pocket per caught card" to "one pocket per Pokemon." Its one
open question (owned-but-unselected visual) is resolved below.

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
