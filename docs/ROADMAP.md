# Homeward Roadmap

## External Dates

| Date | Event | Source |
| --- | --- | --- |
| 2026-09-28 | Working group and demo build session | Hilda Arteaga, 2026-09-14 |
| ~2026-10-10 | Recording deadline for Andrew Brogdon's GenUI video segment | Andrew Brogdon, 2026-09-10: "around this time next month"; confirm exact date |
| 2026-11 | Livestream premiere, date unannounced | Andrew Brogdon, 2026-09-10 |

## Milestones

### M0 Foundations — Sep 16 to Sep 20

Deliverables:

- Monorepo: move the Flutter scaffold into `app/`, create `server/`, `common/`,
  `markets/`, `tool/`, root `Makefile`, shared analysis options, a pre-push
  hook running `make check`.
- Firebase project `homeward-genui`: anonymous auth, Firestore `eur3`, App
  Check providers, Hosting site, Cloud Run service shell.
- Spikes S1 to S6 answered with a written decision in the decision log.
- S7 started.

Exit: a `/health` deploy exists, the app builds for iOS, Android, and Web,
every spike has a decision.

### M1 Thin Slice — Sep 21 to Sep 27

Deliverables:

- `common`: money, finance core (payment, LTV, DSTI, maximum loan, binding
  constraint, amortization tiers), rule pack models, overlay, applicability,
  open decisions, catalog declarations for five components.
- `markets/packs/SE.json` drafted from Tier 1 notes, review pending.
- Server: A2A subset, turn orchestrator, stream parser, validation passes 1 to
  8, seeding, Interactions client, tools `resolve_market`, `load_market`,
  `propose_profile`, `propose_scenario`, `compute_affordability`.
- App: key screen, plans, plan chat with inline surfaces, catalog items
  `LocationPicker`, `MoneyInput`, `AmountSlider`, `AffordabilitySummary`,
  `PaymentBreakdown`, client functions `withinMaxLtv` and `monthlyPayment`.
- An uncovered market gets `MarketSnapshotCard` in its uncovered state.
- Latency re-measured with the S2 probe at two different times of day; model
  order confirmed.
- `tool/perf` and `make perf` against a minimal gallery page holding the M1
  components; first run on web and on a physical Android phone. The full
  catalog gallery follows in M2.

Exit: at the Sep 28 session, a Stockholm buyer goes from first message to a
live down payment slider updating payment locally, on web and one phone.

### M2 Recording Cut — Sep 28 to Oct 7

Deliverables:

- `SE` and `PT` + `PT-30` curated and reviewed.
- Remaining MVP components: `MarketSnapshotCard`, `StressTestChart`,
  `PurchaseCostsTable`, `EligibilityChecklist`, `ForeignBuyerObstacles`.
- Remaining MVP tools: `estimate_purchase_costs`, `get_obstacles`.
- Maximum price including purchase costs, term and age-at-maturity eligibility
  checks, and an exchange-rate snapshot for income in another currency, which
  the hero flow needs.
- Board compiler and responsive two-pane and sheet layouts.
- Session persistence and replay.
- Wire inspector and catalog gallery.
- Design pass: final tokens and primitives.
- Eval cases `stockholm-first-time`, `madeira-nonresident`,
  `madeira-resident-contrast`, `azores-uncovered`, `change-down-payment`
  passing deterministic scores.
- Hero script rehearsed end to end three times without a correction round, on
  separate days or keys: a free key allows about one full run a day.

Exit: the hero flow in `docs/PRODUCT.md` runs reliably on web at recording
resolution.

### M3 Recording — Oct 8 to Oct 10

- Agree segment outline with Andrew: adaptive form, then instant what-if, then
  the code that makes it possible (catalog declaration, client function, one
  validation pass).
- Recording build tagged; a free key whose daily quota is untouched that day;
  the server warmed with one request just before recording.
- Backup: screen capture of every hero step recorded the day before.
- Portugal sources re-read in the recording week; hero figures in
  `docs/PRODUCT.md` recomputed if any changed.

### M4 Sample Complete — Oct 13 to livestream

- Phase 2 components 11 to 20.
- Tier 2 packs: `ES` with priority regional overlays, `GB`, `US` with `US-FL`,
  `US-CA`, `US-NY`, `US-TX`.
- Reference rate refresh tool and snapshots for every curated market.
- Remaining tools: `get_process`, `get_loan_types`, `release_decision`.
- Full eval case set; replay mode in the pre-push hook.
- Dark theme.
- Public web deployment and README with screenshots.
- Repository made public under Apache-2.0.

### M5 Voice Door — after M4

- `/live` WebSocket door, Live API client, `show_ui` tool, voice composer mode.
- Eval cases for voice turns using recorded audio.

### M6 Tier 3 Destinations — after livestream

- Southern Europe, tax-friendly hubs, Americas lifestyle, Asia-Pacific, in that
  order unless demand says otherwise.

## Spikes

| ID | Question | Method | Decision gate |
| --- | --- | --- | --- |
| S1 | What does `genui_a2a` 0.10.x put on the wire: A2A version, SSE or WebSocket, A2UI MIME type, where capabilities and data model travel, how actions are sent? | Run `genui_a2a` against a recording fake A2A server | **Answered:** the protocol fits; the app uses its own client, see `docs/SPIKES.md`. |
| S2 | Can Dart drive the Interactions API cleanly: request shape, SSE event types, function calling continuation, `previous_interaction_id`, error codes for bad key and quota? Is `gemini-3.8-flash` available on free-tier keys? | Curl and a Dart console probe against a free-tier key | **Answered:** yes; see `docs/SPIKES.md`. Quota (429) shapes recorded during S3. |
| S3 | Can one interaction combine `google_search` with structured JSON output, and what grounding metadata links fields to URLs? | Research call for `PT-20` | **Closed by design:** grounding is paid only, so research is not built (D40); see `docs/SPIKES.md`. |
| S4 | Do genui client functions accept object arguments and return numbers, strings, and booleans; can a catalog item subscribe to a whole slice; is a six-component slider drag at 60 fps? | Probe app, widget test, profile web builds in headless Chrome with CPU throttling | **Answered:** bindings and functions work; charts drawn with `fl_chart` are the bottleneck; see `docs/SPIKES.md`. Android unmeasured. |
| S5 | Is `a2ui_core` pure Dart and usable on the server for message models and validation? | Import into a console app | **Answered:** yes; used from `common`, see `docs/SPIKES.md`. |
| S6 | Does `firebase_admin_sdk` verify anonymous ID tokens and App Check tokens and run Firestore transactions on Cloud Run with ADC? | Deploy a probe route | **Answered:** yes; clients call Cloud Run directly because Hosting rewrites cannot stream, and the invoker IAM check is off; see `docs/SPIKES.md`. |
| S7 | Verify the high-impact Tier 1 claims: Portugal non-resident IMT, Portugal DSTI limit, Portugal non-resident LTV, Sweden top-up cap | Primary sources listed in `docs/MARKETS.md` | **Answered:** Sweden confirmed; Portugal corrected: DSTI 45% from 2026-08-01, non-resident IMT by Decree-Law 97/2026 with a refund path, non-resident 70% is lender practice; see `docs/SPIKES.md`. |

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| genui and A2UI change between now and recording | Rework in catalog and connector | Pin exact versions; genui confined to two places; no upgrades after M2 until recording |
| A Google A2A client changes what it accepts | Other clients stop rendering Homeward | Server emits only `task` and `status-update`, full text snapshots; `genui_a2a` contract test in the app |
| No official Dart GenAI SDK | Client maintenance | Thin typed client over REST, recorded fixtures from S2 |
| Gemini latency: 7–18 s per model round on 2026-09-16 | Slow turns on camera | Server pre-runs predictable steps, at most two rounds per turn, full text streamed as it grows, latency re-measured in M1 and before recording |
| Preferred model overloaded | Hung or failed turns | Deadlines, circuit breaker, fallback to the next model |
| Android slider performance unmeasured | Sluggish drag on real phones | `make perf` on a physical phone in M1 |
| Safari untested with `require-corp`, reCAPTCHA Enterprise, and cross-origin streaming | iPhone viewers cannot sign in or stream | Check macOS and iOS Safari in M1; fall back to single-threaded Wasm without isolation headers for Safari |
| Scripted abuse of the web app exhausts reCAPTCHA's 10,000 free monthly assessments | $8 for the month, then $1 per 1,000 above 100,000 | One-day App Check tokens, the 25 SEK budget alert, per-UID rate limits |
| Free-tier daily cap, about 20 requests per model | Failed turns in rehearsal or on camera; about ten turns a day per buyer | One full run per key per day; recording on a key unused that day; the cap explained in the app |
| Free-tier prompts may be used by Google to improve its products | Buyers' financial details lose a privacy promise | Disclosed on the key screen; terms wording verified before it ships |
| Buyers ask about markets that are not curated | The "any location" idea goes unmet | Honest uncovered state, uncovered requests logged per market to drive curation order |
| Curated rules change after review; Portugal changed lending limits and non-resident IMT within four months of 2026 | Stale numbers on camera | 180-day expiry, effective dates, check warnings, sources re-read in the recording week |
| Four weeks for server, client, catalog, and two markets | Scope slip before recording | Thin slice by Sep 28; Phase 2 components and Tier 2 explicitly after recording |
| BYO key friction for video viewers | Fewer people try the demo | One-screen key flow with direct AI Studio link; hero prompt ready on first plan |
| Financial data privacy in EU | Compliance exposure | Anonymous auth, `eur3`, no content in logs, delete controls, 90-day inactivity cleanup |

## Decision Log

Decisions from the planning session on 2026-09-16.

| # | Decision | Chosen | Alternatives considered |
| --- | --- | --- | --- |
| D1 | Agent host | Dart server on Cloud Run | Python FastAPI, Firebase Functions JS, client-only Firebase AI Logic |
| D2 | Meaning of "10/20 items" | 10–20 custom catalog components; planned 20, 10 for recording | Use cases, phased split |
| D3 | Market scope | Location-adaptive for any market, specialised per jurisdiction and buyer | Sweden only, pluggable later |
| D4 | UI authoring | Model lays out, code does numbers | Raw prompt-first A2UI, typed tools compiled by server |
| D5 | Rule source | Curated packs plus researched fallback | Curated only, fully researched, single market first |
| D6 | Curated markets | SE, PT with Madeira, ES, UK, US, plus popular destinations | — |
| D60 | Unknown buyer facts | Rules needing them are pending; the facts become required profile fields and dependent figures wait | Assume the stricter rule; skip the rule until known |
| D61 | Borrowers | Household income totals, savings, debts, a borrower count, and the oldest borrower's age; the deduction threshold scales by borrower | A profile per borrower now; a single borrower only |
| D62 | Household | Adults and each child's age, costed from Konsumentverket's tables | Adults and a child count with an averaged cost; adults only |
| D63 | Swedish left-to-live-on costs | Konsumentverket's 2026 table plus the Riksbank memo's bank norms: 750 SEK running costs for a bostadsrätt, 850 SEK transport per adult, 7% stress rate | Konsumentverket's table only; one bank's published norms |
| D64 | Swedish income cap | 5× gross income, typical range 5–6×, labelled as bank practice from secondary sources | 5.5× midpoint; no income cap |
| D65 | Swedish variable spread | 0–1.2% over SCB's negotiated average, starting at 0.41%, SBAB's list rate; the 0.5% first proposed did not match banks' list rates | Start at 1.2%, Nordea's list rate; start at the average |
| D66 | `/market` slice | The resolved market in the pack's published format with its reference rates and living costs, parsed by the same models on app and server | A separate data-model format with ppm integers and money objects |
| D67 | Basic component validation | Vendor the A2UI v0.9 basic catalog and common types at a pinned spec commit and validate against a composed Homeward catalog document | Hand-declared basic components; no property schemas for basic components |
| D68 | Place resolution | The model proposes ISO 3166 codes; generated CLDR tables verify them and a curated place list for rule-bearing regions overrides them | A curated gazetteer only; OpenStreetMap Nominatim |
| D69 | Catalog skill | The exact composed catalog document and common types as compact JSON Schema, plus message rules, data model paths, actions, and component and surface examples, as genui's `PromptBuilder` and the A2UI agent SDK embed schemas; about 12k tokens | A compact generated summary of about 5k tokens; schemas without examples |
| D70 | Turn context placement | Appended to `system_instruction`, re-sent on every request and never stored in history | Prepended to the buyer's message, which keeps stale snapshots in history |
| D71 | A single resolved market | `resolve_market` selects it for the plan in the same model round, and the surface offers a change | The buyer confirms every market in a picker first, one extra turn per plan; a market draft committed with the profile |
| D72 | Turn model order | `gemini-3.5-flash` first and `gemini-3.8-flash` as fallback, after live turns found 3.8 stalling or failing mid-stream in every turn; quality compared again in the recording week | 3.8 first; 3.5 only |
| D73 | A model failing after its text streamed | Take the round back and retry it on the next model while no A2UI message of the round was accepted, since clients replace the full text | Fail the turn once any text streamed |
| D74 | Plans list in M1 | Plans started during this app run, held in app memory, while the server keeps sessions in memory; the Firestore list replaces it in M2 | A server list route over in-memory sessions; no plans screen until M2 |
| D75 | Gemini key verification | `POST /api/keys/verify` looks up the first turn model with the key, which spends none of the free daily generate requests | Save the key unchecked and let the first turn report `gemini_key_invalid` |

Defaults chosen during planning without a separate question. Challenge any of
them before M0 ends.

| # | Default | Reason |
| --- | --- | --- |
| P1 | `common` is pure Dart and shared by app and server; UI primitives live in `app/lib/ui` | Server cannot import Flutter; one Flutter app does not need a shared UI package yet |
| P2 | Flutter stack follows Purrtrait: Riverpod generator, hooks, Freezed, go_router | Team conventions, proven in production |
| P3 | Server uses `shelf`, `shelf_router`, `firebase_admin_sdk`, no DI framework | Minimal, official where available |
| P4 | Model emits A2UI as JSONL in fenced blocks, validated server-side | Prompt-first is the A2UI v0.9 and genui direction and streams progressively |
| P5 | Homeward components take coarse slice bindings; client functions serve basic components and checks | The model cannot mis-wire formulas it never writes |
| P6 | The board is compiled by the server without the model | Consistent, instant, cheap |
| P7 | Placement by surface ID namespace | Survives any connector |
| P8 | Reference rates from dated snapshots, never fetched per request | Deterministic demos and tests |
| P9 | Chat text never states money amounts or rates | Figures stay in code-computed components |
| P10 | Values the buyer states are proposed by the model and committed by the buyer | Keeps "code does numbers" honest for user-provided inputs |
| P11 | Cloud Run `europe-north1`, Firestore `eur3` | EU data residency for EU buyers |
| P12 | Fonts Fraunces and Inter; charts decided in D44 | Calm editorial tone |
| P13 | English only in v1, local terms glossed | Global video audience |

## Open Questions

1. Exact recording date, segment length, and production help from Andrew's
   team.
2. What to present at the Sep 28 session and who attends.
3. Whether Google wants a public deployment and where it will be linked.
4. Who is the second reviewer for pack curation at Moonwise.
5. Catalog ID domain: `moonwise.se/homeward` or a dedicated domain.
6. Reply on the email thread with project details, which Hilda asked Moonwise
   for on 2026-09-14.
