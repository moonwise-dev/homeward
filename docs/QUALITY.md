# Homeward Quality

## Gate

`make check` must pass before any change is considered done:

1. `dart format --set-exit-if-changed` across `app`, `server`, `common`, `tool`.
2. `flutter analyze` / `dart analyze` with zero issues.
3. `make test`.
4. `make markets-check`.
5. `make catalog-check`.

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
  visuals go to `app/lib/ui`.

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
| `markets/<id>` | Worked examples per curated pack, with the expected figures derived by hand from the cited sources |
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
| Board compiler | Plan fixtures to expected A2UI messages |
| A2A | JSON-RPC dispatch and SSE framing against recorded frame fixtures |
| Actions | Server-completed actions produce the expected plan patches |

Gemini is never called in `make test`. The Interactions client is exercised
against the streams and error bodies recorded in spike S2 under
`server/test/fixtures/interactions/`: text, function call, function result
continuation, stall after `interaction.created`, in-stream high-demand error,
invalid key, unknown model, invalid tool, deleted previous interaction, and from
spike S3 the free-tier request cap, the search grounding quota, and HTTP 500
high demand.
Model selection is tested with a fake clock and a fake transport.

### `app`

One test only, and not a widget test: `genui_a2a` compatibility. Server streams
recorded by the server tests are replayed through `genui_a2a`'s
`A2uiAgentConnector` against a local fake, proving any A2A client built on the
Flutter team's connector renders Homeward's turns.

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

`tool/markets_check`:

- Every pack parses strictly into the `common/markets` models.
- Every list entry `id` is unique within its pack.
- Bracket amounts have no more decimals than the pack currency allows.
- Every rule references an existing source.
- Every source has `retrievedAt`.
- Curated packs have `reviewedAt`, `reviewedBy`, and are not expired; warn within
  30 days of expiry.
- Overlays resolve without cycles; child removals reference parent rule IDs.
- Reference rate snapshots for curated markets are at most 14 days old.

## Catalog Check

`tool/catalog_check`:

- Generated catalog JSON, prompt skill, and reference doc are up to date.
- Every declared component has an app catalog item and the reverse.
- Every agent-visible component has at least one example.
- Every action name used in examples exists in the action table.

## Agent Evals

`tool/eval` runs scripted conversations against an in-process server with a
real Gemini key from `HOMEWARD_EVAL_GEMINI_KEY`.

The key is a free key, capped at about 20 requests a day per model, and the full
case set needs well over that. `make eval` therefore takes `--cases` and runs a
subset per day; replay mode checks everything else without a key.

### Case Format

```yaml
id: madeira-nonresident-first-turn
persona: cross-border
turns:
  - text: I live in Stockholm and want a two-bedroom flat in Funchal, around €350k
    expect:
      tools_called: [resolve_market, load_market]
      market: PT-30
      coverage: curated
      components_include: [MarketSnapshotCard, MoneyInput, LocationPicker]
      components_exclude: [StressTestChart]
      profile_fields_asked: [incomeCurrency, age, formerResident, residencyIntent]
  - action: commit_profile
    data_model: fixtures/madeira-nonresident-profile.json
    expect:
      components_include: [AffordabilitySummary, AmountSlider, PaymentBreakdown]
      binding_constraint: maxLtv
```

### Deterministic Scores

Computed for every turn of every case:

- Validation passed without correction.
- Corrections used.
- Expected tools called; no unexpected tools.
- Expected components present; excluded components absent.
- No literal numbers in bound properties.
- No money amounts or rates in chat text.
- Asked profile fields equal the pack's required fields for the persona.
- Turns to first affordability surface.
- Model rounds per turn, against the target of at most two.
- Models used and fallbacks.
- Latency and token usage.

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

### Reports

`tool/eval/reports/<timestamp>.json` and a markdown summary with per-case and
aggregate scores and a diff against the previous report. A regression of any
deterministic score blocks merging prompt or catalog changes.

### Replay Mode

`make eval-replay` replays recorded Gemini streams from the last report so
parser, validation, seeding, and board changes can be checked without a key.

## Pre-Push Hook

There is no hosted CI while the repository has no remote (D53).

- `make hooks` sets `core.hooksPath` to `tool/githooks` once per clone.
- `tool/githooks/pre-push` runs `make check`; `make eval-replay` joins it when
  replay mode lands.
- Live evals run by hand: `make eval --cases …` with a free eval key.
- Hosted CI running the same targets is added when the repository is hosted.
