# Homeward Quality

## Gate

`make check` must pass before any change is considered done:

1. `make codegen-check`: build_runner in `app`, `common`, and `server` changes
   no generated file, so the committed `*.g.dart` and `*.freezed.dart` match
   their sources.
2. `dart format --set-exit-if-changed` across `app`, `server`, `common`, `tool`.
3. `flutter analyze` / `dart analyze` with zero issues.
4. `make test`.
5. `make markets-check`.
6. `make catalog-check`.

`make eval` runs separately because it calls Gemini.

## Static Analysis

All packages share the Purrtrait analysis setup: `flutter_lints` or `lints`,
`strict-casts`, `strict-inference`, `strict-raw-types`, single quotes, const
constructors, super parameters, generated files excluded. Additionally:

- `avoid_dynamic_calls`
- `unawaited_futures`
- `prefer_final_locals`
- `always_declare_return_types`
- `exhaustive_cases`

## Code Standards

- No comments, including doc comments.
- One public type per file.
- Small functions with a single responsibility.
- Sealed classes and exhaustive switches for closed sets.
- No `dynamic`; no `late` without a lifecycle hook that guarantees assignment.
- No duplication across packages: shared vocabulary goes to `common`, shared
  visuals go to `app/lib/ui/core`.

## Tests

Tests exist where a wrong answer costs a buyer money or breaks the protocol.
There are no widget tests and no golden image tests.

### `common`

| Area | What is pinned |
| --- | --- |
| `money` | Every rounding mode and step against a hand table, 10 000 random cases against exact big integer arithmetic, currency parsing, currency mismatch errors, JSON; run on the VM and in Chrome because web integers are 53-bit |
| `finance` | Annuity and straight amortization payments against Banco BPI's published examples and Lag (2026:226), inverse maximum principal, exact limit comparisons, LTV, DSTI, LTI, left to live on, interest deduction, stress payment, maximum loan and binding constraint, purchase cost brackets including marginal and deduction styles, deductions derived from marginal bands equal to published tables, refunds by recomputation, cash needed, currency exposure |
| `affordability` | Maximum loan per lending rule and the binding constraint for Swedish and Portuguese buyers against independently computed figures, the Swedish interest deduction, down payment bounds, facts still missing, pending lending rules, and income in another currency |
| `markets` | Overlay resolution, buyer and loan predicate applicability, exactly one applicable rule per cost group, required profile fields per buyer |
| `plan` | Open decisions for every combination the flow table depends on |
| `catalog` | Every declared example validates against its schema; bound-number annotations present on every money, rate, and percentage property |
| `wire` | A2A models round-trip the frames recorded in spike S1, including explicit `null` fields; the client turns text, A2UI, cancel, and JSON-RPC error events into turn events |

Finance tests are table driven. Each row names its source, for example an
official calculator or a tax authority worked example.

### `server`

| Area | What is pinned |
| --- | --- |
| Stream parser | Prose and fenced blocks split correctly across arbitrary delta boundaries |
| Validation passes | One fixture per rule in `docs/PROTOCOL.md`, valid and invalid |
| Surface seeding | Seeds contain exactly the slices bound components need |
| A2A | JSON-RPC dispatch and SSE framing against recorded frame fixtures; the app's `HomewardClient` from `common/wire` reads a scripted turn and its failures through the real app handler; an unexpected error ends a turn with `internal` |
| Key verification | Model lookup request, invalid key, unknown model, and deadline to typed errors; the route's statuses and envelope |
| Gemini client | Recorded streams and error bodies to typed events and errors, request JSON, headers and first-step deadlines, fallback only before output, circuits, no key in any error, the next midnight Pacific across daylight saving changes |
| Actions | Server-completed actions produce the expected plan patches |
| Form completion | Every input the server can add for a missing profile field is in the catalog and valid, ordered as the slice declares, above the commit button |
| Session documents | A session with its plan and turns survives the round trip through the documents Firestore holds |
| Firestore sessions | Against the emulator: a plan outlives the server, a later turn joins the ones kept, the plans list order and owner, and the lease that one turn at a time takes |

The Firestore tests skip unless `FIRESTORE_EMULATOR_HOST` is set, so `make check`
passes without the emulator; run `make emulator` beside them to cover the store
the recording depends on.

Gemini is never called in `make test`. The Interactions client is exercised
against the streams and error bodies recorded in spike S2 under
`server/test/fixtures/interactions/`: text, function call, function result
continuation, stall after `interaction.created`, in-stream high-demand error,
invalid key, unknown model, invalid tool, deleted previous interaction, and from
spike S3 the free-tier request cap, the search grounding quota, and HTTP 500
high demand. Model lookups for key verification use the responses recorded
under `server/test/fixtures/models/`.
Model selection is tested with a fake clock and a fake transport.

### `app`

Two tests. The first pumps every catalog example, component and surface alike,
through the gallery repository and the real `Surface` widget at phone width and
fails on any exception, which is what catches a chart or a table that throws on
the figures a market actually produces. It also fails when a component has no
example in the gallery.

The second is the `genui_a2a` compatibility test.

A third covers the wire log the inspector reads: what the device recomputed
since the last frame, the counters a panel opened mid-plan subtracts from, the
size and surface a frame carries, the ring buffer, and the stream a watcher
sees. A fourth pumps the inspector pane itself against a still repository: the
counters move as frames arrive, a frame opens to its message, and the data tab
shows the live model of a surface. Frame sizes and the gaps between them are
pinned where they are formatted. A turn the
server streamed, a resolved market and the profile form, is recorded in
`app/test/fixtures/recorded_turn.sse` by `server/test/a2a/recorded_turn_test.dart`,
which fails when the wire changes and rewrites the file when run with
`RECORD=1`. It serves that recording from a local HTTP fake and
replays it through `genui_a2a`'s `A2uiAgentConnector` into a `SurfaceController`
holding the Homeward catalog, proving any A2A client built on the Flutter team's
connector renders Homeward's turns: the capabilities go out with the catalog id,
the text arrives, the four A2UI messages arrive in order, the seeded data model
resolves, and every component of the form is in the catalog.

Searching for the highest price a buyer's savings reach runs the whole
assessment at each candidate price, which costs about 1.5 ms, so the search
keeps its last answer and returns it while only the down payment moves: 4 µs a
frame during a drag. Any figure that does change with the down payment is
computed outright.

## Performance Check

`make perf` builds the app's catalog gallery for web in profile mode, JS and Wasm,
serves it locally, and drives headless Chrome through the DevTools protocol at 1×
and 4× CPU throttling. A scripted sweep writes the down payment every frame for
six seconds; the page posts frame build, raster, and total time percentiles back
to the runner, which prints a table. It is not part of `make check`, because
timings depend on the machine. Wasm results under throttling vary widely between
runs, so each configuration runs at least twice. On a physical Android phone the
same sweep runs with `flutter run --profile` and prints its report.

## Markets Check

`tool/bin/markets_check.dart`, run by `make markets-check` and part of
`make check`. Errors fail; warnings print.

- Every pack, rate file, and living cost file parses strictly into the
  `common/markets` models, and each pack is stored under its own ID.
- Every entry `id` is unique within its pack, and rate IDs are unique.
- Overlays resolve without cycles, missing parents, or unknown removals.
- Every rule and refund references a source in its resolved pack.
- Amounts and brackets are valid in the pack currency.
- Every cost group charges each buyer exactly once: over every combination of
  the facts the group's predicates name, one rule applies, and no two share the
  highest precedence.
- Every loan type has a reference rate snapshot at most 75 days old.
- Every pack with a left-to-live-on rule has a living cost table in its
  currency from this year or last.
- Exchange rate tables are no more than a week old, warning past that and
  failing at 30 days, and every curated market's currency is in one.
- A pack without `reviewedAt` warns that review is pending; a reviewed pack
  needs `reviewedBy`, fails once expired, and warns within 30 days of expiry.
- `tool/test/markets/<id>_pack_test.dart` pins worked examples on the real files.

## Catalog Check

`tool/bin/catalog_check.dart`:

- Generated catalog JSON, prompt skill, and reference doc are up to date.
- Every component example and surface example passes the server's
  `TurnValidator` against the Stockholm data model: envelope, ownership,
  allow-list, schema, structure, paths, and action names.
- Every agent-visible component has at least one example, checked by the
  `common` catalog tests.
- Every declared component has an app catalog item and the reverse, once the
  app's catalog items land.

## Agent Evals

`tool/eval` runs scripted conversations through the turn orchestrator in
process, with the real prompts, tools, catalog, and rule packs, and a real
Gemini key from `HOMEWARD_EVAL_GEMINI_KEY`, which make reads from `.env`. A
turn refused with `gemini_quota_exhausted` runs again on
`HOMEWARD_EVAL_GEMINI_MOON_KEY`, a key from a second account, when it is set.
There is no HTTP, no auth, and no Firebase: a case is a plan, not a request.

The key is a free key: `gemini-3.5-flash-lite` allows about 500 requests a day
and 15 a minute, the Flash models about 20 a day. A turn costs one to four
requests, so a run waits twelve seconds between turns and twenty between cases;
without the wait a five-case run trips the per-minute limit, which arrives as
`internal` on a turn that never started. Runs back to back still degrade: after
half an hour of them, streams came back truncated and three turns in a row paid
a correction for invalid JSON. A verdict is worth reading when the key is
rested. `make eval CASES="stockholm-first-time"` runs a subset; replay mode
checks everything else without a key.

### Case Format

One file per case under `tool/eval/cases`.

```yaml
id: madeira-nonresident
persona: cross-border
turns:
  - text: I live in Stockholm and want a two-bedroom flat in Funchal, around 350 000 euro
    expect:
      tools_called: [resolve_market, load_market]
      tools_allowed: [propose_profile, propose_scenario, get_obstacles]
      market: PT-30
      coverage: curated
      components_include: [MarketSnapshotCard]
      components_exclude: [StressTestChart, EligibilityChecklist]
      profile_fields_asked: [age, residencyIntent, formerResident]
  - action: commit_profile
    data:
      profile:
        age: 42
        netMonthlyIncome: { minorUnits: 6000000, currency: SEK }
    expect:
      components_include: [AffordabilitySummary, AmountSlider]
      binding_constraint: loanToValue
```

`tools_called` must all be called; `tools_allowed` may be. An action turn takes
the surface the model drew, fills the slices under `data` over what the server
seeded, and sends the action the component declares, the way the app would.
`max_model_rounds` defaults to 2.

### Deterministic Scores

Computed for every turn of every case, from the messages the turn forwarded
and the structured turn logs the server already writes:

- The turn finished.
- Validation passed without a correction.
- Every expected tool called, and no tool outside `tools_allowed`.
- The market and its coverage.
- Expected components present; excluded components absent.
- The profile fields the form binds cover what the case asks for.
- The binding constraint after the turn, computed from the stored plan.
- No money amounts or rates in the prose.
- Model rounds within the case's limit, which defaults to the four D85 allows.

A tool the server settled counts as called, since the model cannot call what is
already in `preRun`. A correction score carries the rejection that caused it,
which is what turns a failing case into a fix. A literal number in a bound
property fails schema validation, so the correction count already covers it. Every turn also records the tools called, the
components drawn, rounds, corrections, and latency as metrics, which are
reported but never gating. Token usage and judged scores are not recorded yet.

### Judged Scores

A separate Gemini call scores each turn from 1 to 5 against a fixed rubric:
explains the binding constraint in plain language, mentions every blocker
obstacle, uses the estimates-not-advice framing, does not ask in prose for
something a component collects. Judged scores are reported, never gating.

### Case Set

| Case | Covers |
| --- | --- |
| `stockholm-first-time` | Local buyer, SE curated |
| `madeira-nonresident` | Hero cross-border path |
| `madeira-resident-contrast` | Same flat, resident path, different form |
| `lisbon-relocator` | Residency intent changes the path |
| `self-employed-se` | Income evidence fields |
| `azores-uncovered` | Uncovered market: says so, states no rules |
| `change-down-payment` | Change as delta |
| `explain-limit` | Explain action with source |
| `prompt-injection-chat` | Buyer message instructing the agent to state rules or skip checks |
| `off-topic` | Declines politely, stays in scope |

The five cases the recording depends on are written: `stockholm-first-time`,
`madeira-nonresident`, `madeira-resident-contrast`, `azores-uncovered`, and
`change-down-payment`. The rest of the table is still to write.

### Reports

`tool/eval/reports/<timestamp>.json` and a markdown summary beside it, with
per-case scores, the metrics behind them, and a line for every case whose
verdict changed since the last report. `make eval` exits non-zero when any
deterministic score fails. A regression blocks merging prompt or catalog
changes.

### Replay Mode

Planned: `make eval-replay` replays recorded Gemini streams from the last report
so parser, validation, and seeding changes can be checked without a key.
The report does not record the raw streams yet.

The eval library itself is covered without a key: the cases load, the scores
pass and fail on synthetic turns, and a report round-trips to JSON, a summary,
and a diff.

## Pre-Push Hook

There is no hosted CI while the repository has no remote (D53).

- `make hooks` sets `core.hooksPath` to `tool/githooks` once per clone.
- `tool/githooks/pre-push` runs `make check`; `make eval-replay` joins it when
  replay mode lands.
- Live evals run by hand: `make eval --cases …` with a free eval key.
- Hosted CI running the same targets is added when the repository is hosted.
