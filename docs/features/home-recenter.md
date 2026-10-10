# Home re-centers the Pokedex list

Status: **Draft** (2026-10-10). Design only - no code yet.

## Problem

Viewing a Pokemon's details and pressing the Home shortcut
(`Navigator.popUntil(context, ModalRoute.withName('/'))`, in the FAB's bottom
icon in `PokemonDetailsScreen`) returns to the Pokedex list, but doesn't put the
list back at the Pokemon you were just looking at. Confirmed via grep: nothing
in `PokemonList`/`_PokedexScreenState` tracks "the last Pokemon viewed" today,
and nothing scrolls on return.

This matters whenever the list's current scroll offset no longer corresponds
to that Pokemon by the time you come back - most commonly after reaching it via
search, then changing or clearing the search text while viewing its details, so
the full list reappears scrolled wherever it happened to be, not at that
Pokemon.

A related pre-existing bug, found while investigating this: `PokemonSearchBar`
already clears scroll position after a search via
`widget.scrollController.animateTo(0.0, ...)` on a `ScrollController` that
`_PokedexScreenState` creates and passes in - but that same controller is never
attached to `PokemonList`'s `ListView.builder` (`lib/widgets/pokemon_list.dart`
builds its `ListView` with no `controller:` at all). So `.animateTo` is calling
a method on a controller with no attached scroll view; `hasClients` is false
and the guard around it means the call is silently a no-op. This feature's fix
(attaching a real controller to the list) incidentally fixes that dead wire too.

## Goals

1. Pressing Home after viewing a Pokemon scrolls the Pokedex list so that
   Pokemon is visible, centered in the viewport.

## Non-goals

- Persisting the last-viewed Pokemon across an app restart - session-only,
  consistent with `UiStateProvider`'s other transient fields (`tabIndex`).
- A history/stack of positions (e.g. "go back to where I was 3 Pokemon ago") -
  only the single most recent details-screen visit is tracked.
- Changing search/filter behavior itself - this only changes what happens to
  scroll position on return, not what the list shows.

## Design

- `UiStateProvider` gains `int? lastViewedPokemonId` (today it only has
  `tabIndex` - confirmed by reading the file). Set in
  `PokemonDetailsScreen.initState`, where `widget.pokemonId` is already known.
- `PokedexScreen`/`_PokedexScreenState` becomes `RouteAware`: a
  `RouteObserver<ModalRoute<void>>` (new - confirmed no `RouteObserver`/
  `RouteAware` exists anywhere in `lib/` today) registered on
  `MaterialApp.navigatorObservers` in `main.dart`, subscribed in
  `didChangeDependencies`, unsubscribed in `dispose`.
- `didPopNext()` - which fires exactly when a route is popped back to this one,
  whether by the Home shortcut's `popUntil` or an ordinary back button/gesture -
  triggers the re-center using `UiStateProvider.lastViewedPokemonId`. This means
  the system back button gets the same correct behavior as the custom Home
  button, for free, without a separate code path for each.
- `PokemonList`'s `ListView.builder` gets a fixed `itemExtent` and the
  `ScrollController` that `_PokedexScreenState` already creates (see Problem).
  A fixed extent is needed because the target row may be far outside what the
  lazily-built `ListView` currently has on screen, so there's no `BuildContext`
  to call `Scrollable.ensureVisible` on directly; with a fixed extent, the
  target offset is computable directly (`index * itemExtent`, then shifted and
  clamped to center it in the viewport) and reached with `jumpTo` or
  `animateTo`.
- The index used is the row's position in the *current* `filteredPokemon` list,
  not the raw dex id - if `lastViewedPokemonId` isn't present in the current
  filter/search result at all (e.g. a filter was changed to exclude it while
  viewing it), there's nothing to center on; the list just stays where it is
  rather than erroring.

## Acceptance criteria

1. After viewing a Pokemon's details and pressing Home, the Pokedex list
   scrolls so that Pokemon is visible, centered in the viewport.
2. This works even when the list's current scroll position doesn't already
   contain that Pokemon (e.g. after the search text changed while viewing the
   details screen) - the regression case for the dead-wire bug described above.
3. Re-centering happens once per return to the list, not on every subsequent
   rebuild - it doesn't fight a scroll the user makes afterward.
4. Viewing a second Pokemon and returning Home centers on the second one, not
   the first - the stored position always reflects the most recent visit.
5. Returning via the system/app-bar back button (not just the FAB's Home icon)
   also re-centers correctly, since `didPopNext()` fires on any pop back to
   this route.
6. If the last-viewed Pokemon isn't present in the current filtered list at
   all, the list is left where it is rather than crashing or jumping to a
   wrong index.

## Traceability (filled in once accepted and tests exist)

| AC | Test |
|---|---|
| 1 | TBD |
| 2 | TBD |
| 3 | TBD |
| 4 | TBD |
| 5 | TBD |
| 6 | TBD |

## Open questions

None blocking. `RouteAware` covering both the custom Home button and the
ordinary back button "for free" was the main design risk and is resolved by
construction (both are just pops back to the same route).
