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
  `markets/`, `tool/`, root `Makefile`, shared analysis options, CI running
  `make check`.
- Firebase project `homeward-staging`: anonymous auth, Firestore `eur3`, App
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
- Research fallback returns a researched `MarketSnapshotCard` for one uncovered
  market.

Exit: at the Sep 28 session, a Stockholm buyer goes from first message to a
live down payment slider updating payment locally, on web and one phone.

### M2 Recording Cut — Sep 28 to Oct 7

Deliverables:

- `SE` and `PT` + `PT-30` curated and reviewed.
- Remaining MVP components: `MarketSnapshotCard`, `StressTestChart`,
  `PurchaseCostsTable`, `EligibilityChecklist`, `ForeignBuyerObstacles`.
- Remaining MVP tools: `research_market`, `estimate_purchase_costs`,
  `get_obstacles`.
- Board compiler and responsive two-pane and sheet layouts.
- Session persistence and replay.
- Wire inspector and catalog gallery.
- Design pass: final tokens and primitives.
- Eval cases `stockholm-first-time`, `madeira-nonresident`,
  `madeira-resident-contrast`, `azores-researched`, `change-down-payment`
  passing deterministic scores.
- Hero script rehearsed end to end three times without a correction round.

Exit: the hero flow in `docs/PRODUCT.md` runs reliably on web at recording
resolution.

### M3 Recording — Oct 8 to Oct 10

- Agree segment outline with Andrew: adaptive form, then instant what-if, then
  the code that makes it possible (catalog declaration, client function, one
  validation pass).
- Recording build tagged, minimum Cloud Run instances set to 1, Moonwise key
  used.
- Backup: screen capture of every hero step recorded the day before.

### M4 Sample Complete — Oct 13 to livestream

- Phase 2 components 11 to 20.
- Tier 2 packs: `ES` with priority regional overlays, `GB`, `US` with `US-FL`,
  `US-CA`, `US-NY`, `US-TX`.
- Reference rate refresh tool and snapshots for every curated market.
- Remaining tools: `get_process`, `get_loan_types`, `release_decision`.
- Full eval case set; replay mode in CI.
- Dark theme.
- Public web deployment and README with screenshots.

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
| S2 | Can Dart drive the Interactions API cleanly: request shape, SSE event types, function calling continuation, `previous_interaction_id`, error codes for bad key and quota? Is `gemini-3.8-flash` available on free-tier keys? | Minimal Dart client against a free-tier key | Confirms `server/lib/gemini` design and default models. |
| S3 | Can one interaction combine `google_search` with structured JSON output, and what grounding metadata links fields to URLs? | Research call for `PT-20` | One interaction or search-then-extract. |
| S4 | Do genui client functions accept object arguments and return numbers, strings, and booleans; can a catalog item subscribe to a whole slice; is a six-component slider drag at 60 fps? | Throwaway catalog item and profiling on web and Android | Confirms coarse bindings. Otherwise fine-grained bindings with a selector layer in `app/lib/catalog/bindings`. |
| S5 | Is `a2ui_core` pure Dart and usable on the server for message models and validation? | Import into a console app | **Answered:** yes; used from `common`, see `docs/SPIKES.md`. |
| S6 | Does `firebase_admin_sdk` verify anonymous ID tokens and App Check tokens and run Firestore transactions on Cloud Run with ADC? | Deploy a probe route | Confirms server data layer. |
| S7 | Verify the high-impact Tier 1 claims: Portugal non-resident IMT, Portugal DSTI limit, Portugal non-resident LTV, Sweden top-up cap | Primary sources listed in `docs/MARKETS.md` | Pack values and hero script numbers. |

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| genui and A2UI change between now and recording | Rework in catalog and connector | Pin exact versions; genui confined to two places; no upgrades after M2 until recording |
| A Google A2A client changes what it accepts | Other clients stop rendering Homeward | Server emits only `task` and `status-update`, full text snapshots; `genui_a2a` contract test in the app |
| No official Dart GenAI SDK | Client maintenance | Thin typed client over REST, fixture tests, S2 |
| Free-tier key limits during demo or recording | Failed turns on camera | Recording uses a Moonwise paid key; quota errors are explained in the app |
| Researched rules are wrong | Buyer misled | Researched badge, citations, unknown over guessed, estimates-not-advice framing, never promoted without review |
| Curated rules change after review | Stale numbers | 180-day expiry, effective dates, check warnings |
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
| D7 | Product scope | Financing and buying process, no listings | Fixture listings, real listings APIs |
| D8 | Voice | Phase 2, designed now | MVP, out of scope |
| D9 | Tiering | SE and PT-30 for recording; ES, UK, US next; destinations after | All five before recording, fallback only before recording |
| D10 | US depth | National plus FL, CA, NY, TX | National only, all states |
| D11 | Tier 3 groups | Southern Europe, tax-friendly hubs, Americas lifestyle, Asia-Pacific | — |
| D12 | Platforms | Web, iOS, Android, responsive two-pane | Mobile only, web first |
| D13 | Rates and lenders | Loan types with official reference rates, no bank names | Named banks, fictional lenders |
| D14 | Persistence | Anonymous auth and Firestore | In-memory, full accounts |
| D15 | Tests | Math and pack tests, agent evals, no widget tests | Evals only, no tests |
| D16 | Video technique | Adaptive form, then instant what-if | Researched rules, voice, progressive streaming |
| D17 | Name | Homeward | Find Home, Threshold |
| D18 | Design | Token-first, calm fintech | Material defaults, designer handoff |
| D19 | Gemini key | Bring your own key only | Server key, server key plus BYO |
| D20 | Hosting project | New Moonwise project | Google-provided project |
| D21 | Transport | A2A subset on shelf with `genui_a2a` | Custom SSE, community `a2a` package |
| D22 | Package wiring | Dart pub workspace, one lockfile | Independent packages with path dependencies, workspace with Melos |
| D23 | Application ID | `se.moonwise.homeward` | `com.moonwise.homeward` |
| D24 | Desktop platforms | macOS kept for development; Linux and Windows removed | Remove all desktop, keep all |
| D25 | Git workflow | Commit directly to `main` | Branch per chunk, one branch per milestone |
| D26 | Currency source | ISO 4217 table generated from the SIX list | `intl` CLDR digits, enum of supported currencies |
| D27 | Rate unit | Integer parts per million | Integer basis points, `decimal` package |
| D28 | Rounding | Explicit mode and step on every money conversion; cost rules can override | Always half-even, always half-up |
| D29 | Value types | Extension types for single values, Freezed for multi-field | Freezed everywhere, hand-written classes |
| D30 | Server image build | Cross-compile on host or CI, Docker packages the binary | Flutter SDK build stage, strip app from workspace in Docker |
| D31 | Server base image | `distroless/cc-debian12:nonroot` | scratch with Dart runtime files, `debian:bookworm-slim` |
| D32 | Server logging | `package:logging` with Cloud Logging JSON lines | Own logger interface, Cloud Logging API client |
| D33 | Server dev loop | Hot reload with `hotreloader` | Plain restart, Docker locally |
| D34 | A2UI protocol types | `a2ui_core` in `common`, components declared as `ComponentApi` | Own Freezed models in `common/wire`, `a2ui_core` on the server only |
| D35 | Server surface state | Shadow `MessageProcessor` rebuilt per turn from stored messages | Hand-tracked surface IDs and seeded paths |
| D36 | App A2A client | Own thin client in `common/wire`, server kept `genui_a2a`-compatible; supersedes the client half of D21 | `genui_a2a` with workarounds, `genui_a2a` internals |
| D37 | Streaming text | Each status update carries the full text so far | Deltas in artifact updates, deltas in status updates |

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
| P12 | Charts with `fl_chart`, fonts Fraunces and Inter | Mature, web-capable, calm editorial tone |
| P13 | English only in v1, local terms glossed | Global video audience |

## Open Questions

1. Repository visibility and license. travel-a2ui is public under Apache-2.0;
   Google will likely expect the same for a vertical sample.
2. Exact recording date, segment length, and production help from Andrew's
   team.
3. What to present at the Sep 28 session and who attends.
4. Whether Google wants a public deployment and where it will be linked.
5. Who is the second reviewer for pack curation at Moonwise.
6. Catalog ID domain: `moonwise.se/homeward` or a dedicated domain.
7. Reply on the email thread with project details, which Hilda asked Moonwise
   for on 2026-09-14.
