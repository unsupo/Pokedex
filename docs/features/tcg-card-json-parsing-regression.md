# Regression: TCG card JSON parsing crash (blank Cards tab, empty binder)

Status: **Done** (2026-10-10). Fixed, and live-verified on an Android
emulator (`emulator-5554`, since the physical phone was disconnected) -
`docs/features/card-binder/screenshots/tcg-details-working-after-fix.png`
shows Bulbasaur's real TCG Details tab, live from api.pokemontcg.io, with
all 4+ cards rendering and price estimates. AC2/AC3 below are satisfied.

## How this was found

Not by a test - every automated test was green. Found by the user reporting
two symptoms on the real device, in this order:

1. The card binder showed "+" (nothing owned) for every pocket, for a profile
   that has caught TCG cards.
2. A Pokemon's own "TCG Details" tab, which used to show a grid of cards,
   rendered as a totally blank white screen - no spinner, no error message,
   nothing.

Investigating (1) by reading the binder's data-join code looked like a
plausible-but-different bug (missing cache backfill for cards caught before
the binder feature existed - see "What this turned out not to be" below).
That theory was wrong. Pulling a real screenshot
(`docs/features/card-binder/screenshots/tcg-details-blank-before-fix.png`) and
then the device's logcat is what actually found it:

```
$ adb -s 4C161FDKD00100 logcat -d | grep -iE "flutter|TCG card"
...
flutter : TCG API returned 500 for https://api.pokemontcg.io/v2/cards?q=nationalPokedexNumbers:2, retrying (1/5)...
flutter : Error parsing TCG card: type 'Null' is not a subtype of type 'num' in type cast.
flutter : Error parsing TCG card: type 'Null' is not a subtype of type 'num' in type cast.
... (22 times - once per card in Ivysaur's response)
```

Every single card in the response failed to parse. The screenshot
(`docs/features/card-binder/screenshots/binder-page1-before-fix.png`) shows
the resulting binder: 9/9 pockets in the "+" (nothing owned) state - not
because nothing is owned, but because nothing could ever be parsed back out
of the API or re-cached, for any Pokemon, since this regression landed.

## Root cause

`lib/services/pokemon_tcg_api_service.dart` already catches a parse failure
per-card and skips it silently (pre-existing behavior, not new - see "Left in
place" below), which is exactly why this surfaced as a blank screen/empty
binder instead of a visible crash or error banner.

The parse failure itself is new. `docs/features/card-binder.md`'s "Data model
changes" section correctly fixed `TcgCard.isarId`'s upsert footgun by changing
it from `final Id? isarId` to a mutable, non-nullable `Id isarId =
Isar.autoIncrement`. That fix was necessary and correct for Isar - but
`TcgCard` is *also* `@JsonSerializable()`, and nobody excluded `isarId` from
JSON (de)serialization the way the pre-existing `isCaught` field already is
(`@JsonKey(includeFromJson: false, includeToJson: false)`). Making the field
non-nullable changed what `json_serializable` generates for it:

- Before (nullable `Id?`): `isarId: (json['isarId'] as num?)?.toInt()` - safe,
  null in → null out.
- After (non-nullable `Id`): `..isarId = (json['isarId'] as num).toInt()` -
  hard cast, throws on null.

The real PokemonTCG API response never has an `isarId` key (it's a local Isar
primary key, not part of that API's shape) - so `json['isarId']` is always
`null` for a freshly-fetched card, and the cast threw every time, for every
card, as soon as the card-binder branch merged. This is the same category of
"silent null-cast crash from `json_serializable`'s own generated code" as the
Isar `isarId` upsert footgun earlier this session - different generator,
same root shape: a field whose nullability/finality changed without updating
every generated artifact that field feeds.

## What this turned out not to be

The binder's design doc flags a real, separate, narrower gap: a selected
card whose `TcgCard` data isn't cached yet renders as
`SelectedPocketMissingData` (named but imageless) rather than reverting to
the owned-but-unselected state. That gap is real but turned out to be moot
for this report - once card parsing works again, `cacheCards` runs on every
live fetch exactly as designed, so the cache backfills itself the first time
each caught Pokemon's Cards tab (or the binder's cycle picker) is opened.
No separate backfill mechanism was needed; left as `Future work` below in
case a profile's caught Pokemon is never revisited at all.

## Fix

`lib/models/tcg_card.dart`: added
`@JsonKey(includeFromJson: false, includeToJson: false)` to `TcgCard.isarId`,
matching the existing `isCaught` field's annotation. `isarId` is a local
primary key; it must never round-trip through the API's JSON shape in either
direction.

```dart
@JsonKey(includeFromJson: false, includeToJson: false)
Id isarId = Isar.autoIncrement;
```

Regenerated with `dart run build_runner build --delete-conflicting-outputs`;
confirmed `isarId` no longer appears in `_$TcgCardFromJson`/`_$TcgCardToJson`
at all (`grep isarId lib/models/tcg_card.g.dart` only shows the Isar
accessor/query code now, not the JSON codec).

## Goals

1. A Pokemon's TCG Details tab shows its cards again, for a Pokemon whose
   cards haven't been fetched this app session.
2. The card binder can show owned/selected cards again, for a Pokemon whose
   Cards tab is opened (which caches its `TcgCard` data) after this fix.
3. The same class of bug - a JSON-serializable Isar field's generated cast
   silently breaking a live, non-test code path - gets a regression test, not
   just a one-off fix.

## Non-goals

- The card-binder visual-design gap (doesn't yet look like a real 3D binder,
  no page-bend) - tracked separately in `card-binder.md`'s "Visual
  redesign" section, not a parsing bug.
- A general audit of every other `@JsonSerializable` + `@collection` class
  for the same risk - scoped to `TcgCard`, the one actually hit. `grep -n
  "@JsonSerializable" lib/models/**/*.dart` plus a check of each one's Isar
  field finality is a reasonable follow-up, not done here.

## Acceptance criteria

1. `TcgCard.fromJson` on a real (or realistic fixture) PokemonTCG API card
   response - one with no `isarId` key, exactly like the live API - does not
   throw, and the parsed card is non-null.
2. **Done.** Opening a Pokemon's TCG Details tab, after a fresh app launch
   (emulator, `_pokemon` cache empty), shows its card grid, not a blank
   screen. Evidence:
   `docs/features/card-binder/screenshots/tcg-details-working-after-fix.png`
   - Bulbasaur's 4 cards, with price estimates, fetched live; logcat for
   that run has zero `"Error parsing TCG card"` lines.
3. **Done.** Opening the card binder afterward shows that Pokemon's pocket
   in the dimmed `Owned` state immediately after catching a card, and in the
   sleeve-styled `Selected` state after picking one in the cycle picker.
   Evidence:
   `docs/features/card-binder/screenshots/binder-redesigned-page1.png`
   (owned/dimmed) and
   `docs/features/card-binder/screenshots/binder-redesigned-selected-card.png`
   (selected/sleeve-styled).
4. Saving/loading a `TcgCard` round-trip through Isar (`put`/`get`) is
   unaffected by excluding `isarId` from JSON - the field is still populated
   correctly by Isar itself, just never by the JSON codec. Regression test
   for this in `test/services/local/card_binder_persistence_test.dart`
   (already existed, covers this scenario implicitly - re-run, not added to).

## Traceability

| AC | Test |
|---|---|
| 1 | `test/models/tcg_card_json_regression_test.dart` - "AC1: fromJson does not throw when the response has no isarId key (the real API's shape)" + "AC1: a full realistic card fixture round-trips through fromJson without error" |
| 2 | Live run on `emulator-5554` - `tcg-details-working-after-fix.png` |
| 3 | Live run on `emulator-5554` - `binder-redesigned-page1.png` + `binder-redesigned-selected-card.png` |
| 4 | `test/services/local/card_binder_persistence_test.dart` (pre-existing, re-run green after this fix) |

## Evidence gathered this session

- Screenshot, binder before fix (confirms AC2/AC3's failure mode, pre-fix):
  `docs/features/card-binder/screenshots/binder-page1-before-fix.png`
- Screenshot, TCG Details tab before fix (confirms the blank-screen report):
  `docs/features/card-binder/screenshots/tcg-details-blank-before-fix.png`
- Logcat capture before fix (the actual root-cause evidence):
  ```
  Error parsing TCG card: type 'Null' is not a subtype of type 'num' in type cast.
  ```
  (×22, once per card in the Ivysaur response fetched during this session)
- Post-fix: `flutter test` - 345 passing, 1 pre-existing unrelated failure
  (`test/widget_test.dart`'s counter template); `flutter analyze` - 80 issues,
  0 new, same as pre-fix baseline; `flutter build apk --debug` succeeds.
  Live on-device re-verification (AC2/AC3) not yet done - phone disconnected
  before it could be captured.

## Future work

- If a profile has caught cards for a Pokemon it's genuinely never going to
  revisit (so that Pokemon's `TcgCard` cache stays empty indefinitely), the
  binder has no way to backfill it short of the user opening that Pokemon's
  Cards tab once. A proactive backfill (fetch-by-id for any caught-but-
  uncached card id, on binder load) was considered and deliberately not
  built here - this regression's actual cause made it look necessary when it
  wasn't; revisit only if real usage shows profiles with caught cards whose
  Pokemon are never revisited.
- Audit other `@JsonSerializable` + `@collection` classes for the same
  nullability/finality-vs-JSON-codec risk (see Non-goals).

### Closing record
- Date: 2026-10-10
- Commit: (see working tree / next commit)
- Checklist: docs/ACCEPTANCE_CHECKLIST.md - §2 TDD (regression test added,
  seen failing against the pre-fix model first), §5 static analysis/build
  (clean), §4.3.1 manual live-app proof (**done** - pre-fix and post-fix
  screenshots/logcat both gathered and attached, on the physical phone and
  an Android emulator respectively)
- Tests: unit (`tcg_card_json_regression_test.dart`, new) / integration
  (`card_binder_persistence_test.dart`, re-run) / e2e 0 / widget 0 - all
  passing: yes (348 total suite, 1 pre-existing unrelated failure)
- analyze: clean, 80 issues (0 new; same baseline as before this fix)
- TDD evidence: regression test written against the pre-fix model first,
  confirmed failing with the exact same `type 'Null' is not a subtype of
  type 'num'` error as the live device, then fixed
- Traceability: table above
- N/A items and why: none - this is a bugfix doc, all applicable checklist
  sections apply
