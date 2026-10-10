# Card binder view

Status: **Draft, no blocking questions remaining** (2026-10-10). Visual design
and page-turn mechanics POC'd and approved in direction (see Animation);
paper-bend polish deliberately deferred. Per-pocket card selection (see below)
added after the POC - changes the binder's layout unit from "one pocket per
caught card" to "one pocket per Pokemon." Its one open question
(owned-but-unselected visual) is resolved below. Ready to move into
implementation; no Flutter code written yet.

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

## Traceability (filled in once accepted and tests exist)

| AC | Test |
|---|---|
| 1 | TBD |
| 2 | TBD |
| 3 | TBD |
| 4 | TBD |
| 5 | TBD |
| 6 | TBD |
| 7 | TBD |
| 8 | TBD |
| 9 | TBD |
| 10 | TBD |
| 11 | TBD |
| 12 | TBD |
| 13 | TBD |
| 14 | TBD |

## Open questions

- Exact page size (9/page, 3x3, assumed) - confirm it actually reads well at
  phone width before locking it in; a real binder page might want fewer slots
  shown larger on a small screen.
- Whether the cycle picker needs its own "none of these, show nothing" option
  (un-selecting back to state 4 deliberately) or whether that's only reachable
  by un-catching the card elsewhere - leaning toward not building an explicit
  un-select action unless asked, since un-catching already produces the
  correct fallback (AC6).
