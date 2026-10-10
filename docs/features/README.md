# Feature designs

Smaller, standalone feature docs that don't need a full epic (contrast with
`docs/epics/profiles-and-per-game-tracking/`, which does). Each still follows
`docs/ACCEPTANCE_CHECKLIST.md` before being marked Done. One feature per file -
a doc that starts covering more than one thing gets split, same as these four
were once two.

| Doc | Status | Summary |
|---|---|---|
| [card-binder.md](card-binder.md) | Data/behavior implemented; **visual redesign open** (see doc) | 3-ring binder, one pocket per Pokemon showing a profile-selected owned card, cycle/add modal |
| [tcg-card-json-parsing-regression.md](tcg-card-json-parsing-regression.md) | Fixed in code; live re-verification pending (phone disconnected) | Regression: `TcgCard.isarId` going non-final broke all real TCG card JSON parsing |
| [home-recenter.md](home-recenter.md) | Implemented (built by a parallel agent; merged and verified) | Home (and back) re-centers the Pokedex list on the last-viewed Pokemon |
| [list-sorting.md](list-sorting.md) | Done (built by a parallel agent; merged and verified) | Sort control: name/dex, ascending/descending |
| [search-fuzzy-and-stage.md](search-fuzzy-and-stage.md) | Done (built by a parallel agent; merged and verified) | Fuzzy multi-field search (name/id/type/move/ability, no prefix) + `stage:` evolution-stage modifier |
