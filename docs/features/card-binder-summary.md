# Card binder — feature summary & gotchas

A condensed reference distilled from the full round-by-round log in
[card-binder.md](card-binder.md) (17 rounds as of 2026-10-11/14). Read
that doc for the detailed root-cause writeups, acceptance criteria, and
traceability tables; read this one for "what does the binder actually do"
and "what already bit us, don't repeat it."

## What's built

**Core view.** A 3-ring binder, one pocket per Pokemon (dex order), 9
pockets per page (3x3 grid), laid out as an open two-page spread with a
fixed ring-binder spine between the pages. Each pocket is one of three
states: empty (a "+" affordance), owned-but-nothing-selected (the
Pokemon's own list-row sprite, dimmed), or a specific card selected (the
card's art, in a "plastic sleeve" visual treatment).

**Page turning.** Tap the prev/next nav buttons, or swipe/drag with one
finger (works identically whether zoomed in or not). A turn advances the
spread by two page-groups, not one - real non-overlapping book pages
(page 1 alone against the inside cover, then pages 2-3 together, then
4-5, ...), not a sliding window. A page-number label ("Page N of M" /
"Pages N-M of M") sits between the nav buttons.

**Zoom.** Pinch-to-zoom genuinely grows the binder's own on-screen
footprint (real layout, not a paint-time stretch) - not just the content
inside a fixed frame. Pan around with two fingers once zoomed; one finger
still turns pages at any zoom level. The search field and nav row always
stay on top and reachable, even once a zoomed binder would otherwise
visually cover them.

**Search.** An always-visible field under the AppBar (not a toggle),
matching the main Pokedex list's own search bar. Submitting jumps the
binder to the matching Pokemon's page and briefly highlights its pocket -
a jump, not a filter (a binder page is a fixed physical layout; pockets
don't vanish out of their sleeves the way a filtered list would).

**Entry points.** From a Pokemon's Details screen (TCG Details tab only),
opening already turned to that Pokemon's page; and from the main Pokedex
list's own AppBar, opening at whichever Pokemon is currently centered in
the list's visible scroll position (respecting the list's active
search/filter).

**Card picker (tap a pocket).** A caught Pokemon with owned cards opens a
focused cycle view (prev/next through just the owned ones); an
empty/nothing-owned pocket opens straight to a full browse grid of every
real card for that Pokemon, where tapping any card toggles caught status
either way (catch or un-catch) - labeled "Add / remove cards." Catching a
Pokemon's first card auto-selects it as the binder's display card,
without a separate confirm step.

**Price overlay.** A small "$X.XX" badge in the bottom-right corner of a
card's artwork, wherever it's shown (pocket, cycle view, browse grid) -
USD preferred, EUR (Cardmarket) fallback when a card genuinely has no
TCGPlayer pricing.

**Resilience.** A failed TCG fetch (this API's documented 500/502
flakiness) shows a distinct "Failed to load" message with a Retry button,
in both the binder's card picker and the Pokemon Details screen's TCG
tab - never silently misread as "this Pokemon has no cards."

**Maintenance.** A "Refresh TCG Card Data" hamburger-menu option
re-fetches cached card images/prices without touching which cards are
actually caught - for when cached data goes stale (e.g. after a parsing
fix, or just because real-world prices change).

## Gotchas and root causes (bugs found and fixed)

Grouped by theme, not chronological - see card-binder.md's own round
numbers in parens for the full writeup of any of these.

### Gesture handling

- **`InteractiveViewer` always wins the gesture arena.** It registers its
  own scale/pan recognizer regardless of `panEnabled`/`scaleEnabled`, so a
  sibling `GestureDetector` for page-turn-by-drag never got a chance to
  start - fixed by routing single-finger drag through
  `InteractiveViewer`'s own `onInteractionStart/Update/End` instead
  (Sixth round), later replaced entirely (see below).
- **A `ConstrainedBox` width cap for "zoom growth" was inert on phones.**
  It only binds above 820px width - never true on a phone - and even
  where it would matter, portrait phones are usually height-bound via
  `Expanded`, not width-bound. The fix had zero visible effect (Eighth
  round), not caught until live-tested on a real device.
- **Real zoom growth needed `InteractiveViewer` removed entirely, not
  patched again.** Its own content-only zoom could never satisfy "grow
  the binder itself," and layering a second independent scale transform
  on top would double-scale the content. Replaced with a plain
  `GestureDetector` whose `_scale` directly drives a real `SizedBox`'s
  width/height (Tenth round).
- **Clipping the grown binder to a narrow strip made growth invisible
  again.** The binder's `ClipRect` was sized to just the gap between the
  search field and nav row - growing the box inside that frame and then
  clipping anything bigger right back down to the frame is
  indistinguishable from "only the content zooms," the exact bug it was
  meant to fix (Fourteenth round). Fixed by clipping against the whole
  screen `Stack` instead, with the search/nav chrome as a separate layer.
- **...which then made the nav row paint *under* a zoomed binder,
  untappable.** The chrome needs to paint (and so hit-test) *last*, not
  first, so it stays reachable at any zoom level (Fifteenth round).
- **One-finger drag-to-turn was needlessly disabled while zoomed.** A
  leftover restriction meant to leave single-finger gestures free for
  panning - but panning has only ever been two-finger, so a single finger
  was doing nothing useful while zoomed, not turning the page and not
  panning either (Sixteenth round).
- **A real two-finger pinch can't be simulated in `adb`/emulator
  automation** (no multi-touch primitive) - every zoom-growth claim in
  this feature needed either live-device testing or code review alone.
- **A real two-finger pinch *can* be simulated in `flutter_test`** (two
  simultaneous `tester.startGesture` pointers) - but doing so hung an
  entire test file on teardown in this project's harness, reliably,
  despite passing cleanly in isolation. Not root-caused; flagged as
  code-review-only coverage rather than risking the whole suite.
- **A stale app process surviving `adb install -r` can look exactly like
  an unfixed bug.** Without a preceding `am force-stop`, Android doesn't
  always kill a package's running process on reinstall, and `monkey -c
  LAUNCHER` just foregrounds whatever's already running. A genuinely
  fixed build looked completely broken on a real phone for this reason
  more than once - always force-stop before reinstalling when verifying
  a fix live.

### Page math

- **A turn advanced the spread by one page-group instead of two.** The
  original model slid the spread by one column per turn (old right page
  becomes new left page); a real book/binder's spreads don't overlap -
  turning past page 1 should reveal pages 2-3 together, not keep page 1
  visible. Fixed by making `rightPageIndex` always even and jumping by
  2, with the turning leaf's content swapping to its *landing* page at
  the edge-on midpoint of the flip, not staying on the page it started
  with (Twelfth round).
- **`BinderPageGrid`'s hardcoded `childAspectRatio: 0.7` didn't match the
  binder's actual available height**, silently clipping the bottom
  pocket row - a non-scrollable `GridView` just clips overflow with no
  warning (ordinary Viewport clipping, not a `RenderFlex` overflow, so no
  yellow/black stripes to catch it). Fixed by computing the ratio from
  real `LayoutBuilder` constraints instead of a fixed guess (Fifteenth
  round).

### Data / caching

- **A non-final `isarId` broke all real TCG JSON parsing, silently.**
  Making `isarId` assignable (needed so Isar could set it on read-back)
  turned it from optional to required as far as `json_serializable` was
  concerned, so every real API response hit a `type 'Null' is not a
  subtype of type 'num'` cast - caught per-card and swallowed, surfacing
  only as an empty Cards tab / empty binder with no visible error
  (separate regression doc:
  [tcg-card-json-parsing-regression.md](tcg-card-json-parsing-regression.md)).
- **TCGPlayer's price JSON is keyed by print variant
  (`"holofoil"`/`"normal"`/...), not flat like Cardmarket's.** The model
  read top-level price keys that only exist for Cardmarket - every
  TCGPlayer field silently parsed to null, so a `$` price was *never*
  available and always fell back to `€`. Confirmed against a real
  response before fixing; added a `TcgplayerPrices` embedded class with
  one field per variant (Isar's embedded objects need a fixed schema, so
  this couldn't just be a `Map<String, PriceData>`) (Fifteenth round).
- **Stale cached card data never self-heals.** A card cached under a
  parsing bug (like the one above) keeps showing wrong data forever -
  the backfill path only ever fetches a caught card that's *missing*
  from the cache, never one that's already there but stale. Added a
  narrow `clearTcgCardCache()` (wipes only cached card display data,
  never caught status or profiles) and a hamburger-menu option to trigger
  it (Fifteenth round).
- **A "cache-first" optimization for the per-Pokemon card list was
  unsafe and got reverted.** The idea: skip the network if any cards for
  a Pokemon were already cached, so a repeat visit loads instantly. The
  flaw: that same cache table also gets *partially* populated by an
  unrelated path (catching one card via the binder fetches just that one
  card by id) - a Pokemon whose only cached card arrived that way looked
  indistinguishable from "fully fetched," so its TCG tab silently showed
  an incomplete list forever. Reverted entirely rather than patched
  further; "why does it take a while to load" is genuinely unanswered
  again, flagged honestly rather than risking a second subtly-wrong fix
  (Seventeenth round). A correct version would need a dedicated "this
  Pokemon's list was fetched" marker, not the cache's mere presence as
  that signal.
- **"No cards found" and "fetch failed" were conflated**
  (`snapshot.data ?? const []`) - a transient 500/502 read identically to
  "this Pokemon genuinely has no cards," with no way to retry short of
  leaving and reopening. Fixed with an explicit failure state + Retry
  button, first in the binder's card picker (Eleventh round), later
  found to have a *separate*, never-fixed copy of the same bug in the
  Pokemon Details screen's own TCG tab - which also had a latent
  "setState during build" crash risk, masked whenever the data happened
  to already be cached (Fifteenth round).

### Visual / layout

- **The first Flutter build didn't read as a binder at all** against the
  approved visual POC - invisible to every automated test, since none of
  them render real pixels at full-screen layout, and every pocket tested
  happened to be empty (itself downstream of the `isarId` bug above).
  Fixed in the "Visual redesign" round with a live-screenshot-driven
  pass.
- **A static page slot force-blanked for an entire turn animation**
  instead of only while the turning leaf actually covers it, exposing
  bare background for roughly the first half of every turn - the leaf's
  own paint order already covers that slot exactly when it should; no
  separate blanking logic was needed at all (Third round).
- **A pocket's icon+label overflowed its cell** once a second line of
  text (dex number + name) was added - fixed with `FittedBox(fit:
  scaleDown)` so content shrinks together rather than clipping, at any
  pocket size the zoom feature can produce.

### Test infrastructure (this project's `flutter_test` harness specifically)

- **Real Isar FFI calls never resolve inside `flutter_test`'s fake-async
  zone.** Needs `tester.runAsync` to let real async work progress,
  interleaved with `tester.pump()`/`settle()` to let the widget tree
  actually rebuild once it has. A fixed-duration delay (300ms, 1000ms,
  even two sequential 1000ms rounds) was never reliable once a genuine
  Isar I/O hop sat on a previously-network-only path; polling (nudge,
  settle, check a state-agnostic condition, repeat) proved the only
  robust fix.
- **A direct re-call to the method under test, used as a "nudge," can
  silently consume a one-shot simulated failure** - producing a false
  pass that never actually exercised the failure UI at all. Only safe to
  reuse *after* a test has already observed the state it's asserting
  about (e.g. after tapping an explicit Retry button), never before the
  first assertion.
- **`Widget.toStringDeep()` on a bare, un-mounted widget config can't see
  inside a `StatelessWidget`'s own `build()` output** - it can only
  recurse into widgets that hold children as literal fields (like
  `Column`'s `children` list). Looking for a key nested inside a custom
  widget's `build()` needs the real `Element` tree (`find.descendant`,
  `tester.element(...)`), not a structural check on the raw `Widget`.
- **`dart format` run on whole directories reformats everything it
  touches, not just your change** - scope it to the specific files
  edited each round, or expect to revert ~100 unrelated files.

### Environment

- **`INSTALL_FAILED_INSUFFICIENT_STORAGE` on the Android emulator**,
  unrelated to actual free space - recurring, fixed each time via a full
  `adb uninstall` + plain `adb install` (not `-r`, since the package no
  longer exists to "replace").
- **A fresh app install with no local Isar data takes 60-120+ real
  seconds** to bulk-sync ~1025 Pokemon plus moves/items/abilities before
  the UI is meaningfully usable - not a hang, just a genuinely slow
  first-run sync; confirmed via live-incrementing `adb logcat` lines, not
  assumed.
- **A foldable phone's `screencap` needs an explicit `-d <display-id>`**
  (it reports multiple displays) - without one it just warns and grabs
  whichever display id it defaults to, which may not be the active one.

## Known limitations / deliberately deferred

- Paper-bend polish (scaleX foreshortening, skewY, curling corner
  radius) on the turning leaf - explicitly out of scope from the
  original design doc.
- Recto/verso (true front/back) card-stock modeling - the same page's
  content shows whichever side of the turning leaf it's on.
- A visual "stack thickness" cue (left/right page stacks getting
  thicker/thinner as you page through) - requested live, not designed or
  built.
- One-finger panning while zoomed (only two-finger pan is supported) -
  an accepted scope cut, not a bug.

## Future feature requests (logged, not built)

- Mock pack-opening with realistic per-rarity pull odds.
- A card detail view (year, set, rarity, card number - already parsed
  and available on `TcgCard`, just not surfaced in the binder's UI).
- Binder cover art customization, and a true "closed" view showing the
  binder's outside (front cover, spine edge) - today's model has no
  closed state at all.

See card-binder.md's "What was left out / left for a follow-up" section
for the full detail on each of these.
