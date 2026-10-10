# Acceptance Checklist

Run this checklist before closing **any** doc in `docs/` (epics, phases, tickets), and before
marking any epic phase or ticket done. A doc is not closed until every box is ticked or has a
written reason beside it. "Not applicable" needs a reason, not a tick.

Each item should have evidence: a test name, a file path, a command output, or a link. "I checked"
is not evidence.

---

## 1. Document integrity

- [ ] **Problem and goals are stated**, with a clear non-goals section.
- [ ] **Every acceptance criterion (AC) is testable.** Each one can be turned into a pass/fail test
      or a manual check with a stated procedure.
- [ ] **Every AC maps to at least one test** (see §4). Keep a traceability table
      (AC → test name) in the doc or next to it.
- [ ] **Decisions are logged.** Choices that shape behavior go in the epic's `00-decisions.md`,
      with the reason and the docs they affect. Nothing decided only in chat.
- [ ] **Open questions are listed** with a leaning. Any question that blocks an AC is resolved first.
- [ ] **No contradictions across docs.** If one doc supersedes another, the older one says so and
      links the newer one. Grep for the old term to confirm.
- [ ] **Links resolve.** Relative paths and `#anchors` point at real files and headings.
- [ ] **Code references are current.** Every file path, class, method, and field named in the doc
      exists. Check with `grep` or `ls` before closing.
- [ ] **Unverified API usage is marked.** Any package API the doc relies on is either confirmed in
      the codebase, or flagged "confirm during implementation" with a spike step.
- [ ] **Status is set** (Draft / Accepted / In progress / Done) with a date.

## 2. Test-Driven Development (TDD)

- [ ] **Red first.** Each AC has a test written before its implementation, and the test was seen
      failing for the right reason. Record the failing output.
- [ ] **Green second.** The minimum code to pass the test was written. No extra behavior.
- [ ] **Refactor third.** Tests stay green through the refactor. Re-run after each refactor.
- [ ] **No test was weakened to pass.** If a test changed, the reason is written in the commit or
      doc.
- [ ] **Bug fixes start with a regression test** that fails on the old code.

## 3. Design checks

### 3.1 SOLID

- [ ] **S — Single responsibility.** Each new class has one reason to change. Test: can its job be
      described in one sentence without "and"?
- [ ] **O — Open/closed.** New behavior (a new scope, a new export format, a new game) is added by
      a new class or case, not by editing a growing `if`/`switch` in several places.
- [ ] **L — Liskov.** Every implementation of an abstract type (`LocalService`, `CsvTransport`,
      `CaughtPokemonRepository`, `Scope`) honors the contract, including edge cases like empty
      input and null. Fakes in tests behave the same way.
- [ ] **I — Interface segregation.** No consumer depends on methods it doesn't use. Prefer narrow
      interfaces (like `CaughtPokemonRepository`) over growing `LocalService`.
- [ ] **D — Dependency inversion.** High-level code (providers, transfer service) depends on
      abstractions and receives them through constructors. No direct `IsarService()` or
      `FilePicker` calls inside business logic.

### 3.2 GoF design patterns

- [ ] **Patterns are named where used.** Each use says which GoF pattern it is and why (e.g.
      Strategy for scope behavior, Adapter for `LocalServiceCaughtPokemonRepository`, Observer for
      `ChangeNotifier`, Factory for creating a `Scope` from a stored key, Facade for a service that
      hides several calls).
- [ ] **No pattern for its own sake.** If a plain function or class does the job, don't add a
      pattern. Write down why a pattern is worth its extra indirection.
- [ ] **Anti-patterns avoided.** No God class (a provider that owns persistence, parsing, and UI
      state), no service locator hidden in globals, no singleton that tests can't replace.
- [ ] **Patterns are consistent with existing code.** Prefer the project's current patterns
      (`ChangeNotifier` + `provider`, abstract `LocalService`, `CsvTransport`) over introducing a
      second way to do the same thing.

### 3.3 DRY

- [ ] **No copy-pasted logic.** Search for the new code's key phrases (`grep -rn`) to find
      duplicates. Shared logic lives in one function or class.
- [ ] **Single source of truth for constants and keys.** Scope keys, CSV column names, and
      collection names are defined once and referenced.
- [ ] **Duplicated tests share setup.** Repeated fixtures move into helpers, but test intent stays
      readable in each test body.
- [ ] **DRY doesn't create coupling.** Two pieces of code that look alike but change for different
      reasons stay separate. Note any deliberate duplication.

### 3.4 YAGNI

- [ ] **Every line traces to an AC.** If code exists only "in case," remove it or move the idea to
      a non-goal or open question.
- [ ] **No speculative options.** New configuration, flags, or extension points need an AC that
      uses them today.
- [ ] **No unused fields, methods, or parameters.** Check with the analyzer and by searching for
      callers.
- [ ] **Deferred ideas are written down**, in a "Future work" list in the doc, not built.

### 3.5 Other design checks

- [ ] **Naming** matches the existing codebase's vocabulary (`isCaught`, `pokemon`, `userData`).
      New terms are defined once in the doc's glossary or decisions.
- [ ] **Errors are handled deliberately.** Each failure path (network, DB, file picker cancelled,
      bad CSV) has a defined behavior and a test.
- [ ] **Immutability where practical.** Prefer `final` fields and value objects. Mutable state is
      kept in one owner.
- [ ] **Dependencies are justified.** Any new package is listed with its purpose and the pub.dev
      version. No new package for something a few lines can do.

## 4. Tests

### 4.1 Unit tests (`test/`)

- [ ] Pure logic is covered: value objects, codecs, scope key parsing, derived calculations,
      filter predicates.
- [ ] Each public method has at least one happy-path and one edge-case test (empty, null,
      duplicate, boundary).
- [ ] Tests use fakes for external dependencies (in-memory repository, fake transport), not the
      real Isar database or file picker.
- [ ] Tests are independent: no shared mutable state, no ordering dependence.

### 4.2 Integration tests (`test/` with real components)

- [ ] **Isar-backed tests** use a real Isar instance in a temp directory, opened and closed per
      test group. This is where composite indexes, upserts, and migrations are verified.
- [ ] **Provider tests** wire a real `LocalService` (or a real Isar instance) into
      `PokemonApiProvider`/`TcgApiProvider` and check the observable state after an action.
- [ ] **Migration tests** seed old-shape data and check the result, including a second run.
- [ ] **Transfer tests** round-trip through the real codec and a fake transport.

### 4.3 End-to-end tests (`integration_test/`)

- [ ] **A user flow is driven through the real app**: launch, create a profile, catch a Pokémon,
      switch scope, export, switch profile, import.
- [ ] **E2E runs on at least one device or simulator target** before a phase is closed, with the
      command and result recorded.
- [ ] **E2E uses the real Isar database** on the test device, cleared before each run.
- [ ] **Network is controlled.** E2E does not depend on live PokeAPI responses. Use recorded or
      stubbed responses, so the test is stable.

> **Setup note:** the project does not yet have `integration_test` as a dev dependency. The first
> phase that needs E2E adds it to `pubspec.yaml` under `dev_dependencies` (sdk: flutter), then
> records that in the doc's implementation plan.

### 4.4 Widget tests

- [ ] Each new screen or widget has a test for its main states (empty, loaded, error).
- [ ] Interactions that change state are tapped in the test, and the resulting UI is asserted.

### 4.5 Test quality

- [ ] **Each test asserts behavior**, not implementation details (not "called method X once"
      unless the call is the behavior).
- [ ] **Test names read as sentences** describing the AC, e.g.
      `"switching profile does not change the other profile's caught set"`.
- [ ] **No flaky tests.** A test that fails intermittently is fixed or deleted, not retried.
- [ ] **Coverage is checked for the changed code**, not as a global target. Run
      `flutter test --coverage` and check that new code paths are exercised.

## 5. Static analysis and build

- [ ] `flutter analyze` reports **no new issues** (zero is the target).
- [ ] `flutter test` passes, with the new tests included in the run.
- [ ] `dart run build_runner build --delete-conflicting-outputs` was run after any change to an
      `@collection` or `@JsonSerializable` class, and the generated files are committed.
- [ ] The app builds for at least one target: `flutter build apk --debug` or
      `flutter run -d macos` (or the platform the phase targets).
- [ ] `gen789.dart` is untouched (see `CLAUDE.md`).

## 6. Data safety

- [ ] **Schema changes have a migration** and a test for it (see
      `docs/epics/profiles-and-per-game-tracking/04-migration.md` as the pattern).
- [ ] **Every new Isar collection** is registered in `IsarService.init()` **and** cleared in
      `clearCache()`. Check both.
- [ ] **Existing user data survives an upgrade.** Verified with a seeded old-shape database.
- [ ] **Destructive actions are confirmed** (reset, delete profile, overwrite on import) and the
      confirmation is tested.
- [ ] **Backups are offered** before a migration that rewrites data.

## 7. Behavior and UX

- [ ] **Loading, empty, and error states** exist for every new screen or async action.
- [ ] **Switching context updates the UI** without a restart (profile, scope, game).
- [ ] **Large lists stay smooth.** The Pokédex list (~1000 entries) doesn't rebuild the whole list
      on a single toggle. Check with the Flutter DevTools rebuild view or by reasoning about
      `context.watch` scope.
- [ ] **Text fits.** Long profile names and game titles don't overflow at phone width.
- [ ] **Tap targets** are at least 44×44 logical pixels.
- [ ] **Dark mode and light mode** both render the new UI.
- [ ] **Screen readers** get labels on new icon-only buttons (`tooltip` or `Semantics`).
- [ ] **Offline behavior** is defined: what works from the local cache with no network.

## 8. Security and privacy

- [ ] **No secrets in code or docs.** API keys, tokens, and personal data don't appear in source,
      tests, fixtures, or docs.
- [ ] **Local data stays local** unless the doc says otherwise. No new network calls without an AC.
- [ ] **Imported files are validated.** A malformed or hostile CSV fails with a clear error and
      doesn't partially write (tested).
- [ ] **Test fixtures use fake names**, not real people's data.

## 9. Performance

- [ ] **No blocking work on the UI isolate** for file I/O, CSV parsing of large files, or migration
      of many rows. Use async and batched writes (`putAll`).
- [ ] **Database access is batched** where a loop would otherwise do one write per row.
- [ ] **Startup time** is not measurably worse. Note any new work done in `fetchData()`.

## 10. Documentation hygiene for code

- [ ] **Public APIs have a doc comment** saying what they do, not how.
- [ ] **Comments explain why**, not what. No comments that restate the code.
- [ ] **`CLAUDE.md` is updated** if the architecture, commands, or conventions changed.
- [ ] **The epic README table** reflects the doc's current status.

## 11. Review before closing

- [ ] **Self-review of the full diff** done, reading every changed line.
- [ ] **`/simplify`** run on the changed code, with its findings either applied or noted.
- [ ] **`/code-review`** run at `medium` or higher, with its findings either fixed or recorded.
- [ ] **Open TODOs** in the diff are either removed or tracked in the doc.

## 12. Definition of Done

A doc or phase is **Done** only when all of these hold:

1. Every applicable box above is ticked, with evidence.
2. The traceability table maps every AC to a passing test.
3. `flutter analyze`, `flutter test`, and the build command all succeed.
4. The doc's status is updated, with the date and the commit hash that closed it.

---

## Closing record

Copy this block into the doc being closed:

```markdown
### Closing record
- Date:
- Commit:
- Checklist: docs/ACCEPTANCE_CHECKLIST.md (all applicable items ticked, N/A reasons below)
- Tests: unit __ / integration __ / e2e __ / widget __  (all passing: yes/no)
- analyze: clean / N issues (explain)
- TDD evidence: link to red-run output or commit
- Traceability: AC → test table location
- N/A items and why:
```
