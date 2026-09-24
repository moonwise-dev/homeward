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
  open decisions, catalog declarations for six components.
- `markets/packs/SE.json` drafted from Tier 1 notes, review pending.
- Server: A2A subset, turn orchestrator, stream parser, validation passes 1 to
  8, seeding, Interactions client, tools `resolve_market`, `load_market`,
  `propose_profile`, `propose_scenario`, `compute_affordability`.
- App: key screen, plans, plan chat with inline surfaces, catalog items
  `LocationPicker`, `MoneyInput`, `HouseholdInput`, `AmountSlider`,
  `AffordabilitySummary`, `PaymentBreakdown`, client functions `withinMaxLtv`
  and `monthlyPayment`.
- An uncovered market gets `MarketSnapshotCard` in its uncovered state.
- Latency re-measured with the S2 probe at two different times of day; model
  order confirmed.
- `tool/perf` and `make perf` against a minimal gallery page holding the M1
  components; first run on web and on a physical Android phone. The full
  catalog gallery follows in M2.

Exit: at the Sep 28 session, a Stockholm buyer goes from first message to a
live down payment slider updating payment locally, on web and one phone.

### M2 Story Slice — Sep 24 to Sep 28

The re-scope of 2026-09-24 (D97): the product had become a calculator for the
pitch's last act. M2 builds the first two acts on the same pipeline.

Deliverables:

- Product, agent guide, and roadmap rewritten around the story.
- Research tools on open data, cached and polite: `geocode` (Nominatim),
  `route` (OSRM by car, bike, and foot; Transitous by transit), `nearby`
  (Overpass: nearest, counts, and noise by proximity to roads, rail, airports,
  and nightlife).
- A story data model: why the buyer is moving, anchors, criteria with
  thresholds, candidates, and measured results per candidate and criterion.
- Building blocks: `Map`, `ChoiceChips`, `FactTile`, `StatusRow`,
  `ComparisonTable`, `ProsCons`, `SourceChip`, `CandidateInput`.
- Flow: infer from the first message, ask the gaps in one or two cards, show
  the board, refine on it.
- A picked home opens the existing deal workspace with its price.
- A journey shell: an opening page, then one page per turn, with a history
  sheet (D106, D107).
- Measuring steps streamed while tools run (D108).
- A board composed by code when the model's composition fails (D109).
- Constrained A2UI output tried against the composed catalog schema, kept or
  dropped with a decision: kept for correction rounds (D110).

Exit: at the Sep 28 session, the Stockholm family goes from its first message
to a board comparing two flats on a map, and into the deal for one of them.

### M3 Recording Cut — Sep 29 to Oct 7

- Researcher behind one interface (D100): an OpenAI-compatible client, a Groq
  and Cerebras bake-off against Gemini, Gemini as the fallback, the key in
  Secret Manager.
- Research operations: estimated rules, area ideas for a city, a pasted
  listing's facts, toll and safety impressions; every named place verified
  against open data (D101).
- Google Maps grounding for ratings when the buyer asks, with attribution
  (D102).
- City entry: areas suggested and ranked on the map.
- Estimated rules outside `SE` and `PT`, labelled and editable (D98).
- `Gauge`, `Rating`, a deal sheet, and the association's finances for Sweden.
- `MarketSnapshotCard`, `EligibilityChecklist`, and `ForeignBuyerObstacles`
  leave the agent's catalog; the blocks compose what they showed.
- Eval cases re-pointed at the story: `stockholm-family`, `lisbon-city-only`,
  `funchal-cross-border`, `unlisted-city-estimates`.
- The hero rehearsed three times without a correction round.

Exit: the hero flow in `docs/PRODUCT.md` runs reliably on web at recording
resolution.

### M4 Recording — Oct 8 to Oct 10

- Agree the segment outline with Andrew: the story told as UI, then the map
  and comparison, then instant what-if, then the code that makes it possible (a
  building block, a research tool, the composing prompt).
- Recording build tagged; a key whose daily quota is untouched that day; the
  server warmed with one request just before recording.
- Backup: screen capture of every hero step recorded the day before.

### M5 Sample Complete — Oct 13 to livestream

- Public web deployment and README with screenshots.
- The gallery shows every building block beside its parameters.
- Repository made public under Apache-2.0; a tutorial draft.
- Dark theme.

### M6 Voice Door — after M5

- `/live` WebSocket door, Live API client, `show_ui` tool, voice composer mode.
- Eval cases for voice turns using recorded audio.

### M7 Provider Choice — after livestream

- A second model API for composing, picked by the buyer (D80), on the client
  the researcher already brings.

### Dropped On 2026-09-24

Tier 2 and Tier 3 packs, coverage tiers beyond verified and estimated, the
`get_process`, `get_loan_types`, and `release_decision` tools, eval replay
mode, `tool/perf`, and widget tests (D104).

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
| S8 | Can a buyer pick another model or API beside Gemini, and what does each route cost? | Desk research of Google and third-party provider limits, prices, APIs, and Dart libraries; one hero message on each candidate Gemini API model | **Answered:** `gemini-3.5-flash-lite` is the fallback candidate, Gemma 4 does not fit the free tier's 16k input tokens a minute, and an OpenAI-compatible provider choice follows the livestream (D80); see `docs/SPIKES.md`. |
| S10 | Why does Gemini refuse the catalog as a response schema, and does an accepted schema constrain the output? | Bisecting the composed schema live, synthetic schemas, and chained corrections on the probe key | **Answered:** recursion and `allOf` are the obstacles; a flattened subset is enforced; see `docs/SPIKES.md` and D110. |
| S9 | Can Homeward learn about any place on free keys: where things are, how far, how good, and what a listing says? | Open-data services and Gemini tools called around Stockholm on the probe key | **Answered:** open data covers where and how far with no key; Google Maps grounding and `url_context` work on free keys; see `docs/SPIKES.md`. |

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| genui and A2UI change between now and recording | Rework in catalog and connector | Pin exact versions; genui confined to two places; no upgrades after M2 until recording |
| A Google A2A client changes what it accepts | Other clients stop rendering Homeward | Server emits only `task` and `status-update`, full text snapshots; `genui_a2a` contract test in the app |
| No official Dart GenAI SDK | Client maintenance | Thin typed client over REST, recorded fixtures from S2 |
| Gemini latency: 7–18 s per model round on 2026-09-16 on Flash, 3–5 s on Flash-Lite on 2026-09-17 | Slow turns on camera | Flash-Lite first (D81), server pre-runs predictable steps, at most two rounds per turn, full text streamed as it grows, latency re-measured before recording |
| Preferred model overloaded | Hung or failed turns | Deadlines, circuit breaker, fallback to the next model |
| Android slider performance unmeasured | Sluggish drag on real phones | `make perf` on a physical phone in M1 |
| Safari untested with `require-corp`, reCAPTCHA Enterprise, and cross-origin streaming | iPhone viewers cannot sign in or stream | Check macOS and iOS Safari in M1; fall back to single-threaded Wasm without isolation headers for Safari |
| Scripted abuse of the web app exhausts reCAPTCHA's 10,000 free monthly assessments | $8 for the month, then $1 per 1,000 above 100,000 | One-day App Check tokens, the 25 SEK budget alert, per-UID rate limits |
| Free-tier limits per model per Google Cloud project: 20 requests a day on Flash, 500 on Flash-Lite | Failed turns in rehearsal or on camera; about 250 turns a day per buyer on Flash-Lite | At most two requests per turn (D78); the next model takes over at a cap (D79); recording on a key unused that day; the cap explained in the app |
| Free-tier prompts may be used by Google to improve its products and read by human reviewers; the terms ask for no sensitive or personal information | Buyers' financial details lose a privacy promise | Quoted on the key screen with advice to use round figures or a billing-enabled key (D76); no names are ever asked; terms re-read before recording |
| Public open-data services limit and refuse heavy use: Nominatim one request a second, Overpass and OSRM fair use | Slow or failed boards when many viewers arrive | A user agent naming Homeward, a cache per query, one request at a time per service, a board that shows what it has |
| Free research models invent places and misremember rules | Wrong facts on the board | Every named place verified against open data (D101); estimates labelled; verified packs where they exist |
| Google Maps grounding's terms on attribution and on showing its places on another map | Ratings withdrawn or reworked | Attribution shown with every rating; pins from open data; terms read before M3 ends |
| A shared research key reaches its daily cap after launch | Research falls back to buyers' Gemini keys | Gemini fallback (D100); caps watched after launch |
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
| D72 | Turn model order | `gemini-3.5-flash` first and `gemini-3.8-flash` as fallback, after live turns found 3.8 stalling or failing mid-stream in every turn; replaced by D81 | 3.8 first; 3.5 only |
| D73 | A model failing after its text streamed | Take the round back and retry it on the next model while no A2UI message of the round was accepted, since clients replace the full text | Fail the turn once any text streamed |
| D74 | Plans list in M1 | Plans started during this app run, held in app memory, while the server keeps sessions in memory; the Firestore list replaces it in M2 | A server list route over in-memory sessions; no plans screen until M2 |
| D75 | Gemini key verification | `POST /api/keys/verify` looks up the first turn model with the key, which spends none of the free daily generate requests | Save the key unchecked and let the first turn report `gemini_key_invalid` |
| D76 | Free-tier data use on the key screen | Quote the Gemini API terms (last modified 2026-04-28): on a free key Google may use conversations to improve its products and people may review them, and Google asks that sensitive or personal information not be sent; Homeward suggests round figures or a key from a project with billing, whose conversations Google does not use | Disclose without advice; a Moonwise billing-enabled key for the recording |
| D77 | Money formatting | Each country pack declares a BCP 47 `locale`, carried in `/market`, and components format amounts the way that market writes them inside English copy | English grouping with ISO codes everywhere; English grouping with the currency symbol |
| D78 | Model requests per turn | One tool round per turn: the request carrying tool results ends with a note that tools are done and sets `tool_choice` to `none`, and tools without input, such as `compute_affordability`, run only on the server and reach the model in `preRun` | Up to four tool rounds with every tool offered, which took four requests in a live turn; prompt guidance alone |
| D79 | A model at its free request limit | The round moves to the next model, and the refused model is skipped for that key for a minute, since per-minute and daily refusals read the same, which roughly doubles a free key's turns; other quota errors and depleted credits still stop the turn. Replaces D41 for this cap after a live session hit the cap on its fifth turn | Keep D41 and stop at the first model's cap |
| D80 | Models and APIs beside Gemini | Later fallback models on the same key before the recording, `gemini-3.5-flash-lite` once its limits and the hero script check out, Gemma 4 ruled out by its free-tier token limit; an OpenAI-compatible provider choice after the livestream | Gemini models only; the provider choice before the recording; no change until after it |
| D81 | Turn model order | `gemini-3.5-flash-lite` first, then `gemini-3.5-flash` and `gemini-3.8-flash`: 500 free requests a day and 15 a minute against 20 and 5, the hero script in four requests and 16 s; replaces D72 | Flash first and Flash-Lite last, about ten turns a day on Flash; Flash only |
| D82 | Household input | `HouseholdInput`, a domain component with an adults stepper, a child age list, and a one-tap no children answer, bound to `/profile/adults` and `/profile/childAges`; it takes the `LoanTermPicker` slot, since the term uses the basic `ChoicePicker`, making 11 components for the recording and 20 in total | A comma-separated `TextField` parsed by the server; a children count priced at one age band; a 21st component |
| D83 | Keeping the profile and what-if steps on track | A form sending `commit_profile` must bind every profile path the market still needs, or the model gets one correction naming them; when the buyer saves with blanks, `compute_affordability` still seeds down payment bounds from the loan-to-value cap and the summary shows what is still needed; a repeated `createSurface` in a turn is ignored. Found in a live Stockholm run on 2026-09-17: a form without household, then a slider rejected for missing bounds and two corrections | Also reject what-if surfaces while facts are missing; prompt guidance only |
| D84 | Tool calls after the tool round | Superseded by D85 the same day: one extra request was not enough for a model that calls one tool per request | A hard cap of 2 with the send again surface; two tool rounds without the note |
| D85 | Models that call one tool per request | While a round draws nothing, its tool calls run and the model is asked again, at most three tool rounds, so such a turn costs up to 4 requests; a turn that still ends empty draws the retry surface. Replaces D84 after live turns on `gemini-3.5-flash-lite` called `resolve_market`, `propose_profile`, and `propose_scenario` in separate requests | One extra request only (D84); the server drawing the form itself; the retry surface alone |
| D86 | Uncovered markets in the data model | `/market` carries the full rules when a market is curated and `{ id, name, coverage }` when it is not, so `MarketSnapshotCard` reads one path in both states, with the curated markets in `/selection/candidates` where the market picker already reads them | A separate coverage slice; treating a market without rules as uncovered by absence |
| D87 | Choosing between cost rules in one group | `CostRule.precedence`, an integer the highest of which wins inside a group, so a special regime overrides a general one instead of every general rule enumerating the cases it does not cover; `make markets-check` tries every combination of the facts a group's predicates name and fails on a gap or a tie. Found while curating Portugal, where the flat non-resident IMT overrides two ordinary tables | Positive predicates only, seven IMT rules in `PT` and six overrides in `PT-30`; an `unless` clause in the predicate; ordering rules by position in the file |
| D88 | Where a refund's baseline lives | `resolveForBuyer` puts the rule that would apply under the refund's `recomputeAs` in `ResolvedMarket.refundBaselines`, so `/market` carries everything the app needs to recompute upfront costs and the refundable part locally while the buyer drags the down payment slider | The app re-resolving rules from the pack; a server round trip per what-if; seeding the refundable amount as a number, which the slider would strand |
| D89 | Income in another currency | A daily exchange rate table under `markets/fx`, whose rate for the buyer's currency travels inside `/market`, so the app converts locally while the slider moves and every figure can name the rate and its date; `markets-check` keeps the snapshot fresh | Converting once when the profile is saved, which freezes the rate and hides it; asking the buyer for income in the market's currency |
| D90 | Reopening a plan | The session keeps every turn: its input, the text, the A2UI messages the server forwarded, and how it ended, so opening a plan replays them into the surfaces without asking the model again, while the board is recompiled from the plan on the way out and never stored; the plans screen lists `GET /api/sessions` merged with what this run started, so a title and the market show against each plan | Storing the board with the session, which would go stale as rules change; replaying by resending the turns to the model; keeping the list in app memory as in D74 |
| D91 | Where sessions live | A Firestore-backed `SessionRepository` behind the same interface, chosen by `HOMEWARD_SESSION_STORE`, which defaults to Firestore on Cloud Run and with the emulator and to memory otherwise, so a restart between takes no longer loses the hero plan; a turn is one document written once, holding its record as JSON because Firestore refuses nested arrays, and the lease is a transaction over the session document | Keeping sessions in memory through the recording and accepting the loss; a turn subcollection under each session; storing A2UI messages as arrays, which nested children break |
| D92 | Where the wire inspector lives | The second pane beside the chat, in the board's place, and a sheet on a narrow window, rather than a screen of its own: the recording needs the slider and the frame count in one shot, and a surface's data model is only meaningful next to the surface it drives; sizes are the JSON bytes counted where the app encodes and decodes | A separate `/wire` route, which the app had and which hid the chat; an overlay strip over the chat; sizes reported by the server, which would need the protocol to carry them |
| D93 | What an eval drives | Cases run through `TurnOrchestrator` in process rather than over HTTP: the prompts, tools, catalog, and packs are the real ones, while auth, A2A framing, and Firebase are out of the picture, so a failing case points at the model or the prompt; the scores read the structured turn logs the server already writes rather than new instrumentation | Driving the deployed server, which spends a deploy per prompt change; a second set of counters inside `TurnRun` for evals only |
| D94 | A round that asks again for what it has | When every tool call in a round names a tool the server already settled or already ran this turn, the results still come back but the tool rounds end: the next request goes out with no tools and the note to draw now. Found by the first eval pass, where a Stockholm turn after `commit_profile` spent four rounds calling `propose_scenario` twice and `load_market`, whose result was already in `preRun`, and drew nothing; with the guard the same turn draws the affordability surface in two rounds and 8 s instead of 13 | Leaving D85's three tool rounds to run out, which costs a request and 5 s and often ends in the retry surface; refusing to run a settled tool, which leaves the call unanswered |
| D95 | A form that misses a fact the rules need | The validation pass adds the input itself, picked by the field's value shape and placed above the commit button, instead of spending a correction round on it; the rejection stays for a form with nowhere to put an input. Three Portugal runs dropped residency facts and paid a correction each; with the completion the whole Funchal case runs with no correction and its first turn falls from 15.8 s to 8.9 s. The server draws part of one surface, which the sample now says plainly: the model composes, the rules decide what must be asked | Prompt wording, which took the misses from three paths to one but never to none; `gemini-3.5-flash`, which asks for everything but takes 37 s and emits malformed JSON of its own; splitting the Portugal form into two turns |
| D96 | An action answered with words alone | When the buyer used a control and the turn forwarded no surface while a decision that calls for one is open, the server asks the model once more, naming the decision, before it settles for the retry surface. It costs a request when it fires and rescues a turn that would otherwise leave the buyer with prose and no what-if; a typed message answered in prose is left alone, since a question deserves an answer | Letting the turn end, which the eval caught twice on `commit_profile`; firing on every turn, which would force a surface onto an explain answer |
| D97 | Scope | Re-scoped on 2026-09-24 to the pitch sent to Google: a story-driven mortgage and relocation advisor. Discovery of the buyer's life, criteria checked on a map, then the existing deal workspace. The built pipeline, finance code, and packs stay; the first two acts are added on top | Starting over; keeping the calculator and adding markets |
| D98 | Rules outside curated markets | Researched estimates, labelled "estimate — check with a lender" and editable; the math stays in `common`. Replaces the uncovered state of D40 and D86 | Finance only where curated; the buyer typing every rule |
| D99 | How much to ask | Infer from the first message and any listing, ask only the gaps in one or two adaptive cards, show the board, refine on it | A full interview by category, about ten turns; a board with assumed defaults and no questions |
| D100 | Where research runs | Behind one researcher interface: a free third-party model on a key the server holds in Secret Manager first, Gemini on the buyer's key as its fallback, Google Search grounding if credits ever arrive; Google requests stay with composing the UI. Groq and Cerebras compete in a bake-off | Gemini for everything; a second key from the buyer; Gemma 4 on the buyer's key |
| D101 | Places a model names | Checked against Nominatim or Overpass before they are shown, and dropped when they do not resolve; free research models have no maps or search and invent places | Trusting the model; research through Google Maps grounding only |
| D102 | Ratings and quality | Google Maps grounding, which works on free keys (measured 2026-09-24), only when the buyer asks how good something is, shown with its attribution; open data answers what is near and how far | Dropping ratings; routing every place search through Google Maps |
| D103 | Building blocks | Gemini composes screens from mid-level blocks that carry Homeward's design (`Map`, `FactTile`, `StatusRow`, `ComparisonTable`, `ChoiceChips`, and others) beside the A2UI basic components and the finance components that recompute on the device | Basic components only; whole single-purpose items such as a fit matrix |
| D104 | Tests | No widget tests; the UI is reviewed visually. Tests cover `common`, packs, the catalog contract, validation passes, research tools, and evals | Keeping the widget tests added in the design pass |
| D105 | What a buyer brings | Either up to three candidate homes, as a listing link, an address, or a pin, or just a city, for which areas are suggested | Candidates only; a city only |
| D106 | The app's shape | A journey: each turn is one page, holding the agent's text and the surfaces the turn created. The page stays up under an overlay while the next one is built. A "Tell Homeward more" field sits under every page, and the transcript moves to a history sheet. This follows the Very Good Ventures GenUI finance demo (Google Cloud Next 2026), whose lesson is that the best AI interfaces do not look like AI interfaces. The wire inspector keeps its pane (D92) | Keeping the chat; journey pages on phones and chat on wide screens, which is two layouts to polish before Sep 28 |
| D107 | How a plan starts | One hand-built opening page. It has reason chips and a story box, and the first message is built from both, so the model never starts cold and never asks why the buyer is moving | Two hand-built pages, which is Very Good Ventures' exact pattern and one more tap; Gemini from the first screen with starter prompts, as before |
| D108 | What the buyer sees while tools run | Every lookup (finding a place, looking near the homes, timing a ride) is a step. The turn streams the steps whole in a progress data part with its own media type, which other A2UI clients skip, and the page lists them as they run and finish. Labels come from server code, never from the model | A thinking spinner, which says nothing for 5–16 s; animated pins and routes, about half a day more |
| D109 | A composition that fails validation | The server composes the homes surface itself (map, ranked homes, comparison table) from the assessment the turn already measured, and passes it through the same validation. The retry text is left only for turns with nothing measured. About one turn in ten failed after corrections on 2026-09-23; the Very Good Ventures kit calls this a deterministic fallback | Always the retry text; more correction rounds, which spend the buyer's requests |
| D110 | Constrained output | Only the correction round asks with an enforced schema. The schema offers the layout basics and the components the turn drew, flattened into one object each, with every fixed value as an enum and function calls not recursive. The whole catalog is refused, and components built with `allOf` are out of the model's reach under a schema (S10). Normal rounds keep streaming text with fenced A2UI; a refused schema repeats the round without it | Every round as one JSON object, which rewrites the streaming path and costs thousands of tokens a request; dropping constrained output |
| D111 | The app's layout | Flutter's guide to app architecture: `ui/<feature>/view_model` and `widgets`, `ui/core` for themes and shared widgets, `data/repositories` and `services`, `domain/models`, `routing`, `config`, and one folder per catalog component holding its item and view. Riverpod stays, its notifiers named view models. A file keeps the small things only it uses, which replaces one public type per file. The Purrtrait layout had spread one component over two folders and one-function files over `display/` | Feature folders with a design system package, as Very Good Ventures does; keeping the layout and only consolidating; plain `ChangeNotifier` view models |
| D112 | Open data that is slow | Every open-data answer is kept in Firestore for a week, keyed by the SHA-256 of its request and gzipped, behind the six-hour memory cache, whenever sessions are in Firestore. On 2026-09-24 one Overpass query took 25 s and every public Overpass instance was timing out, which made the board wait 37 to 53 s; a rehearsed city now answers at once after a Cloud Run restart. A Firestore failure is a cache miss, never a failed turn | A warm-up run before recording, which a restart undoes; accepting the wait behind the measuring overlay |

Defaults chosen during planning without a separate question. Challenge any of
them before M0 ends.

| # | Default | Reason |
| --- | --- | --- |
| P1 | `common` is pure Dart and shared by app and server; UI primitives live in `app/lib/ui/core` | Server cannot import Flutter; one Flutter app does not need a shared UI package yet |
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
7. Whether Google is comfortable with research on a non-Google model in a
   GenUI sample (D100); worth one line to Abdallah before the recording.
8. ~~The Very Good Ventures product the finish should come close to.~~
   Answered on 2026-09-24. It is their GenUI Kit
   (verygood.ventures/resources/genui-kit) and the Life Goal Simulator shown
   at Google Cloud Next 2026. There is no public repo; D106 to D109 take its
   lessons.
