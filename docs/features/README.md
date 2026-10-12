# Feature designs

Smaller, standalone feature docs that don't need a full epic (contrast with
`docs/epics/profiles-and-per-game-tracking/`, which does). Each still follows
`docs/ACCEPTANCE_CHECKLIST.md` before being marked Done. One feature per file -
a doc that starts covering more than one thing gets split, same as these four
were once two.

| Doc | Status | Summary |
|---|---|---|
| [card-binder.md](card-binder.md) | In progress - 14th round (partially live-verified) fixes pinch-zoom still being clipped to the binder's resting frame, adds a page-number label + a price overlay on every card display; 13th round (live on emulator) adds a binder entry point to the main Pokedex list (opens at the list's current scroll position) + an always-visible search field; 12th round (live on emulator) fixes a page turn sliding by one page-group instead of revealing a new non-overlapping pair each time; 11th round fixed a fetch failure misread as "no cards found" + add/remove labeling; 10th round replaces 8th round's zoom-growth fix (had no effect on a real phone) with a plain GestureDetector driving real layout size, no InteractiveViewer; 9th round live on emulator; 7th/6th rounds live on phone; earlier rounds fixed page-turn blanking, zoom panning, labels, search, cache gaps | 3-ring binder, one pocket per Pokemon showing a profile-selected owned card, cycle/add modal |
| [tcg-card-json-parsing-regression.md](tcg-card-json-parsing-regression.md) | Done - fixed and live-verified on emulator | Regression: `TcgCard.isarId` going non-final broke all real TCG card JSON parsing |
| [home-recenter.md](home-recenter.md) | Implemented (built by a parallel agent; merged and verified) | Home (and back) re-centers the Pokedex list on the last-viewed Pokemon |
| [list-sorting.md](list-sorting.md) | Done (built by a parallel agent; merged and verified) | Sort control: name/dex, ascending/descending |
| [search-fuzzy-and-stage.md](search-fuzzy-and-stage.md) | Done (built by a parallel agent; merged and verified) | Fuzzy multi-field search (name/id/type/move/ability, no prefix) + `stage:` evolution-stage modifier |
