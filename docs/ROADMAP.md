# Homeward Roadmap

## External Dates

| Date | Event | Source |
| --- | --- | --- |
| 2026-09-28 | Working group and demo build session; shows the direction (D130 to D135), the foundation, and C1 to C3 if ready | Hilda Arteaga, 2026-09-14 |
| ~2026-10-10 | Recording deadline for Andrew Brogdon's GenUI video segment | Andrew Brogdon, 2026-09-10: "around this time next month"; confirm exact date |
| 2026-11 | Livestream premiere, date unannounced | Andrew Brogdon, 2026-09-10 |

## Milestones

### Before The Reset — Sep 16 to Sep 26

The foundation was built and kept: the Dart workspace, the A2A server on Cloud
Run with Firestore sessions, the streaming Gemini client with model fallback,
A2UI validation with correction rounds, the catalog contract and its generated
prompt skill, the Flutter app shell with the renderer, gallery, and wire
inspector, and the open-data clients for places and routes.

On top of it came a question-by-question case (D121), sample homes (D122), a
deal workspace with verified rule packs (D113), and evals that scored the
case's script. On 2026-09-26 all of that was removed (D129): the server had
taken the flow away from the model, so the app read as a filter rather than
generated UI. It is in git history at `6faa8ab`.

### The Rebuild — Chunks C1 to C13

The rebuild runs in small chunks, grouped into steps R1 to R7. Each chunk is
one visible change, demoable on its own, and says what it leaves out. Each ends
with `make check` green, a live probe with a few test stories, and a visual
look; no new unit tests are written (D137). Earlier work to bring back from
`6faa8ab` is named where it exists. The recording targets R1 to R4.

#### R1 The Brief And The Living Screen — next

- **C1 One living surface — done.** A plan's screen is one surface that later turns
  update in place, instead of a new card per turn; the ownership pass allows
  it (D131). Leaves out the brief and new blocks.
- **C2 The brief.** An `update_brief` tool and a `/brief` slice, stored with
  the session and seeded into the data model; Gemini draws it with basic
  components (D132). Leaves out editing it on the screen.
- **C3 Asking like a coding agent.** Prompt only: deduce first, never ask what
  a tool can find out, one decision at a time as a choice with a
  recommendation, typing always open (D130).
- **C4 `Fact`.** The first Homeward block: a statement, its source, and
  confirm or correct. Edits reach the brief with the next action.

#### R2 The Map

- **C5 The Maps renderer package.** After a short S11: the Maps Agentic UI
  Toolkit's `GoogleMap`, schema vendored at a pinned commit, drawn with
  `google_maps_flutter` with center, zoom, and markers, shown in the gallery
  (D133). Leaves out routes and agent use.
- **C6 Places on the living screen.** A `find_place` tool over Nominatim, the
  brief's places pinned, and a validation pass that checks marker coordinates
  against the places tools returned.

#### R3 The Week

- **C7 Routes drawn.** The renderer's route resolver draws the routes the
  server measured.
- **C8 Weekly travel.** Habits with how often, a `measure_week` tool, and a
  weekly travel block (D127's routine, without its card).

#### R4 Homes With The Why

- **C9 Sample homes.** A labelled pool of sample listings in one city, with
  long descriptions, and a `search_homes` tool.
- **C10 Needs read from listings.** Needs read from descriptions with every
  quote checked word for word (the listing reader of D126), and a home block
  with sourced reasons and shortfalls.

#### R5 Areas

- **C11 Areas for any city.** Neighbourhoods scored against the week and the
  needs, from open data (D134).

#### R6 Pasted Listings

- S13, then **C12**: a listing the buyer pastes, read on the spot against the
  brief.

#### R7 Research On The Spot

- S12, then **C13**: money and local rules researched when the buyer asks,
  quoted with sources, figures from `common` (D135).

#### Later

- S14 and `PlaceDetailsCompact`.
- Swipe cards for taste (D128's idea, rebuilt as a block).
- S15, the toolkit's own client rendering a Homeward map surface.
- Evals that score facts and validity, never which question came when.

### M4 Recording — around Oct 8 to Oct 10

- Agree the segment outline with Andrew: a conversation that becomes a brief
  and a screen, the week on the map, the homes with the why, then the code
  that makes it possible (a building block, the Maps renderer, a tool, the
  composing prompt).
- Recording build tagged; a key whose daily quota is untouched that day; the
  server warmed with one request just before recording.
- Backup: screen capture of every step recorded the day before.

### M5 Sample Complete — Oct 13 to livestream

- Public web deployment and README with screenshots.
- The gallery shows every building block beside its parameters.
- Repository made public under Apache-2.0; a tutorial draft.
- Dark theme.

### M6 Voice Door — after M5

- `/live` WebSocket door, Live API client, `show_ui` tool, voice composer mode.

### M7 Provider Choice — after livestream

- A second model API for composing, picked by the buyer (D80).

## Spikes

| ID | Question | Method | Decision gate |
| --- | --- | --- | --- |
| S1 | What does `genui_a2a` 0.10.x put on the wire: A2A version, SSE or WebSocket, A2UI MIME type, where capabilities and data model travel, how actions are sent? | Run `genui_a2a` against a recording fake A2A server | **Answered:** the protocol fits; the app uses its own client, see `docs/SPIKES.md`. |
| S2 | Can Dart drive the Interactions API cleanly: request shape, SSE event types, function calling continuation, `previous_interaction_id`, error codes for bad key and quota? Is `gemini-3.8-flash` available on free-tier keys? | Curl and a Dart console probe against a free-tier key | **Answered:** yes; see `docs/SPIKES.md`. Quota (429) shapes recorded during S3. |
| S3 | Can one interaction combine `google_search` with structured JSON output, and what grounding metadata links fields to URLs? | Research call for `PT-20` | **Closed by design:** grounding is paid only, so research is not built (D40); see `docs/SPIKES.md`. |
| S4 | Do genui client functions accept object arguments and return numbers, strings, and booleans; can a catalog item subscribe to a whole slice; is a six-component slider drag at 60 fps? | Probe app, widget test, profile web builds in headless Chrome with CPU throttling | **Answered:** bindings and functions work; charts drawn with `fl_chart` are the bottleneck; see `docs/SPIKES.md`. Android unmeasured. |
| S5 | Is `a2ui_core` pure Dart and usable on the server for message models and validation? | Import into a console app | **Answered:** yes; used from `common`, see `docs/SPIKES.md`. |
| S6 | Does `firebase_admin_sdk` verify anonymous ID tokens and App Check tokens and run Firestore transactions on Cloud Run with ADC? | Deploy a probe route | **Answered:** yes; clients call Cloud Run directly because Hosting rewrites cannot stream, and the invoker IAM check is off; see `docs/SPIKES.md`. |
| S7 | Verify the high-impact Tier 1 claims: Portugal non-resident IMT, Portugal DSTI limit, Portugal non-resident LTV, Sweden top-up cap | Primary sources listed in `docs/MARKETS.md`, removed in D129 and kept at `6faa8ab` | **Answered:** Sweden confirmed; Portugal corrected: DSTI 45% from 2026-08-01, non-resident IMT by Decree-Law 97/2026 with a refund path, non-resident 70% is lender practice; see `docs/SPIKES.md`. |
| S8 | Can a buyer pick another model or API beside Gemini, and what does each route cost? | Desk research of Google and third-party provider limits, prices, APIs, and Dart libraries; one hero message on each candidate Gemini API model | **Answered:** `gemini-3.5-flash-lite` is the fallback candidate, Gemma 4 does not fit the free tier's 16k input tokens a minute, and an OpenAI-compatible provider choice follows the livestream (D80); see `docs/SPIKES.md`. |
| S10 | Why does Gemini refuse the catalog as a response schema, and does an accepted schema constrain the output? | Bisecting the composed schema live, synthetic schemas, and chained corrections on the probe key | **Answered:** recursion and `allOf` are the obstacles; a flattened subset is enforced; see `docs/SPIKES.md` and D110. |
| S9 | Can Homeward learn about any place on free keys: where things are, how far, how good, and what a listing says? | Open-data services and Gemini tools called around Stockholm on the probe key | **Answered:** open data covers where and how far with no key; Google Maps grounding and `url_context` work on free keys; see `docs/SPIKES.md`. |
| S11 | Does `google_maps_flutter` draw the toolkit's `GoogleMap` on web, Android, and iOS: markers, anchor, satellite, tilt, and routes from a resolver? How does the Maps key reach each platform from the environment, and do the quotas cap at the free allowances? | A throwaway app on each platform with a restricted key | Before C5. |
| S12 | Which sources answer money and local-rule questions on free keys, and how is each quote checked? | `url_context` on official pages, Google Search grounding on the models that have a free tier, our own fetch for checking quotes | Before C13. |
| S13 | Can Homeward read a listing the buyer pastes, and check its quotes? | `url_context` against our own fetch, on listing sites in the demo cities | Before C12. |
| S14 | Can Grounding Lite give Google place IDs for `PlaceDetailsCompact`, and how does Flutter show the place card? | Grounding Lite `search_places`; the `gmp-place-details-compact` element on web | Before `PlaceDetailsCompact`. |
| S15 | Does the toolkit's own web client render a Homeward map surface? | Its React sample pointed at a local Homeward server | Optional, after C7. |

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| genui and A2UI change between now and recording | Rework in catalog and connector | Pin exact versions; genui confined to two places; no upgrades after M2 until recording |
| A Google A2A client changes what it accepts | Other clients stop rendering Homeward | Server emits only `task` and `status-update`, full text snapshots; `genui_a2a` contract test in the app |
| No official Dart GenAI SDK | Client maintenance | Thin typed client over REST, recorded fixtures from S2 |
| Gemini latency: 7–18 s per model round on 2026-09-16 on Flash, 3–5 s on Flash-Lite on 2026-09-17 | Slow turns on camera | Flash-Lite first (D81), a small catalog, full text streamed as it grows, latency re-measured before recording |
| Preferred model overloaded | Hung or failed turns | Deadlines, circuit breaker, fallback to the next model |
| Safari untested with `require-corp`, reCAPTCHA Enterprise, and cross-origin streaming | iPhone viewers cannot sign in or stream | Check macOS and iOS Safari in M1; fall back to single-threaded Wasm without isolation headers for Safari |
| Scripted abuse of the web app exhausts reCAPTCHA's 10,000 free monthly assessments | $8 for the month, then $1 per 1,000 above 100,000 | One-day App Check tokens, the 25 SEK budget alert, per-UID rate limits |
| Free-tier limits per model per Google Cloud project: 20 requests a day on Flash, 500 on Flash-Lite | Failed turns in rehearsal or on camera; about 250 turns a day per buyer on Flash-Lite | At most two requests per turn (D78); the next model takes over at a cap (D79); recording on a key unused that day; the cap explained in the app |
| Free-tier prompts may be used by Google to improve its products and read by human reviewers; the terms ask for no sensitive or personal information | Buyers' financial details lose a privacy promise | Quoted on the key screen with advice to use round figures or a billing-enabled key (D76); no names are ever asked; terms re-read before recording |
| Public open-data services limit and refuse heavy use: Nominatim one request a second, Overpass and OSRM fair use | Slow or failed screens when many viewers arrive | A user agent naming Homeward, a cache per query, one request at a time per service |
| Gemini draws weaker screens without the server steering it | A demo that wanders | A small catalog of expressive blocks, a clear prompt, and evals on validity and facts; no server rule that picks the next question (D129) |
| The rebuild is not demoable by the Sep 28 session | Little to show at the session | Each chunk demoable on its own; show the direction and the foundation if C1 to C3 are not done |
| An unscripted agent wanders on camera | A recording that loses its thread | Rehearsal with test stories kept outside the app, inputs only; a recorded backup; the brief keeps each turn anchored |
| A coding-agent loop spends more free requests per turn | The buyer's daily quota runs out sooner | Lookups that are cheap; research only on request; the tool-round cap stays |
| The Maps key sits on a billing account | A bill if usage passes the free allowances | Quotas capped at the free allowances, the budget alert, the key restricted by referrer and bundle ID |
| `google_maps_flutter` has no macOS support | The development build shows no map | A placeholder on macOS; record on web or mobile |
| The Maps toolkit is alpha | Its schema changes under us | The schema vendored at a pinned commit (D133) |
| The Flutter map is 2D where the toolkit's web client draws 3D | Tilt looks different from Google's own client | Said plainly in the docs and the README |
| Sample homes read as fake | The needs reading looks staged | Labelled as samples; a pasted real listing is read the same way (C12) |
| BYO key friction for video viewers | Fewer people try the demo | One-screen key flow with direct AI Studio link; hero prompt ready on first plan |
| Buyers' personal details in EU | Compliance exposure | Anonymous auth, `eur3`, no content in logs, delete controls, 90-day inactivity cleanup |

## Decision Log

Decisions from the planning session on 2026-09-16 onwards. Rows that D129
superseded stay as history.

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
| D100 | Where research runs | Behind one researcher interface: a free third-party model on a key the server holds in Secret Manager first, Gemini on the buyer's key as its fallback, Google Search grounding if credits ever arrive; Google requests stay with composing the UI. Groq and Cerebras compete in a bake-off. Its third-party researcher is superseded by D136 | Gemini for everything; a second key from the buyer; Gemma 4 on the buyer's key |
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
| D113 | The deal after a home is chosen | Two pages. The facts page asks only what the rules need, filled in from the story. The deal sheet is one surface with the affordability, the down payment slider, the payment, the stress test, the purchase costs, and the rules, all recomputed on the device. It replaces a market card on the form and separate affordability and stress-test turns, and matches the pitch's deal workspace | One page where figures fill in while the buyer types, the riskiest change before Sep 28; polishing the step-by-step deal, four waits after choosing |
| D114 | The plan board | Removed. It was a server-compiled summary pane from the chat design, and after D113 it only repeated what the journey pages and the deal sheet show. Its compiler, the `board` surface, the `toggle_document` action, and the app's pane go with it, and the disclaimer moves to the opening page. `change` stays as an action Gemini can put on any page | Keeping it as a "Your plan" pane beside the journey |
| D115 | Where keys live | Every key is an environment variable. A developer's keys sit in a git-ignored `.env` at the root that the Makefile loads, beside a committed `.env.example`; on Cloud Run, keys the server holds come from Secret Manager through `--set-secrets`, so the server has no Secret Manager client and the image holds no key. Provider keys keep their vendors' names, `CEREBRAS_API_KEY` and `GROQ_API_KEY`; the probe and eval key stays `HOMEWARD_EVAL_GEMINI_KEY`, since the server never reads a Gemini key, and `HOMEWARD_EVAL_GEMINI_MOON_KEY` from a second account doubles the free quota: probe, eval, and development runs of the app move to it on `gemini_quota_exhausted`. Development runs take those keys from `.env` and skip the key screen. The buyer's key stays in `flutter_secure_storage` | A key file under `~/.config/homeward`, read only by the probe; a Secret Manager client in the server; a `dotenv` package in every entry point |
| D116 | The story interview | Replaced by D119. Story Steps: a short sequence of small, single-purpose cards, each folded into the story with `continue_story` and the last with `commit_story`, gated on `/story`'s own fields and `surfacesUsed` rather than a fixed stage in code. The opening page drops its story box for a location line; everything else is asked one thing at a time and narrated back as it grows. Buyer testing on 2026-09-24 found the single "storyGaps" card (D99), even prefilled, read as a filter form of six controls at once, which is what an A2UI sample should avoid. Revises D99 and the opening page's second half of D107 | Keeping one card with every control, better prefilled; a fully atomic one-question-per-turn interview, more turns and more waiting than the chosen grouping; a plain-text back-and-forth with no cards, more typing than tapping |
| D117 | How a development run starts | The local server hands the app what it needs, so the app takes no compile-time defines: `server/tool/dev.dart` reads `.env` and `.firebaserc`, turns App Check off, and serves `GET /dev/config` (the two Gemini keys) to `localhost` only, and a debug app asks for it and skips the key screen; a debug app without an App Check debug token does not activate App Check. `make app`, `app-web`, `app-macos`, and the VS Code launch start the server when nothing answers on 8080, forward it to Android with `adb reverse`, and stop what they started. Run above `main()` needs only a server already up, and the startup screen says how to start one. Found the same day: `PlansViewModel.build` read its state before `build` returned, which the debugger stops on. Replaces the dart-define delivery in D115 | Defines written from `.env` by make, which only make and the launch config could pass; a Gemini key held by the server, which moves key rotation off the app; pointing development at the hosted server, which needs a deploy |
| D118 | Map tiles | OpenStreetMap's own tile server, with no key, under a colour filter that keeps the pins readable and the map as calm as the light basemap it replaces. CARTO's keyless tiles have carried an "API KEY REQUIRED" watermark since 2026-09-23. The sample is not a production app, so an account and a key for a map style is not worth it; the OSM policy allows light interactive use with a named user agent, attribution, and caching, and can block heavy use, which the livestream is the moment to watch. Replaced by D133 | A free CARTO key (email only; 5 million tiles a month for non-commercial use), which keeps the exact look but adds a key to deploy and to development; OpenFreeMap vector tiles, which need no key but a new package and style loading |
| D119 | The living story | The story phase is one surface: `StoryDraft`, the story as a paragraph Homeward writes from a reason and a place, with inline slots for the commute mode and longest trip, the criteria that matter, and the places they travel to, beside a map and a Show me homes button. Guesses are marked as assumed; blanks are only what Homeward cannot guess. Corrections run on the device with no model turn, and only typed text or Show me homes reaches Gemini, so a story costs two requests instead of five. A pin dropped on the map is an anchor with no geocoding. Testing on 2026-09-25 found Story Steps still read as an onboarding wizard: a page and a Continue per question, in an order Homeward chose. Also cut: the areas suggested on turn 1, and `load_market` and `get_obstacles` before a home is chosen. Replaces D116, and `continue_story` goes | Story Steps with adaptive questions; a map-first conversation of pins and a drag ring, kept for later since it suits commute stories better than lifestyle ones; a chat with inline controls, which is the journey D106 left |
| D120 | One scrolling story | The journey is one scrolling story, not a page per turn. Each turn adds a section; the newest is open and scrolls into view, earlier ones fold into a recap of what they showed and what the buyer answered, and tapping a recap opens it in place. There is no step count, pager, or next button, and a working card under the newest section replaces the overlay once the story has begun. The recap names what a section holds from its components, and shows the buyer's own words or the action they took as the answer. Amends D106 | Step titles from the plan's stage (still a wizard); the story pinned on top with one focus card below (hides earlier decisions); recaps written by the model (a request and a figure to check for each) |
| D121 | The case | The story phase is a case Homeward works like a detective. Each turn states one deduction from the last clue and asks one question the buyer answers with a tap, as a `Hunch`, a `PhotoLineup`, a `TradeOff`, or the household, sending `answer`. It asks about life and taste, never for a room count or a budget; rooms are a deduction to confirm, and the price range comes from the trade-off picked. The server tracks answered facets and derives what is open; after the essential ones, or five questions, the living story paragraph (D119) is drawn once as the case summary with Find my three homes. Every answer is a model turn, one round when the server pre-runs what the question needs. Amends D119, which drew the paragraph first | A short interview drafted once and tapped through on the device, which is a wizard again; the living story kept as the opening with questions after it; a case board of clue chips instead of the paragraph |
| D122 | Sample homes | No listing site offers a free API (checked 2026-09-25: Zillow and Hemnet partner-only, Booli unclear, Idealista on request, RentCast US-only). Stockholm and Lisbon carry about twelve sample homes each, generated by `make listings` from a reviewed spec: real street addresses placed with Nominatim, prices from the area's price per square metre (Svensk Mäklarstatistik, INE) times a factor, photos from Unsplash series of the same home bundled as WebP assets. At `commit_story` code rules out homes that miss the type, price range, area, or rooms, relaxing in that order until three remain, and `assess_story` measures those three. Labelled as samples. Other cities fall back to suggested areas | Generating listings at runtime for any city from price statistics and Overpass, which adds seconds and cannot review photos; scraping listing sites; photos from Firebase Storage, which needs the Blaze plan; images from Gemini, which are not free |
| D123 | The detective's cards | `Hunch` (a deduction with alternatives), `PhotoLineup` (four curated photos whose traits the server reads), `TradeOff` (ways to live priced by `compare_areas`), and `ListingCard` (one sample home in full); the stack shows a sample home's photos. The app adds the tapped value to the `answer` action, so the model writes only the question, and every figure comes from a tool. A day-rhythm card is deferred to M3 | The day rhythm first, about a day to build; a free-form photo picker where the model names photos |
| D124 | The case's household reaches the facts form | The profile seed takes who moves from the case when the profile has not said, and the ask-once request names the missing profile fields; its reply's words are dropped. A Skopje plan financed under Swedish rules on 2026-09-25 saved its facts with no adults, because the case had written them to the story only; the closing turn then asked Gemini for the facts page, and Gemini answered in words the buyer saw, "An error occurred or `profileFields` is not actually open" | Writing the case's answer into the committed profile, which the buyer never confirmed there; refusing `commit_profile` with a field blank, which strands a buyer who saw a prefilled-looking form |
| D125 | The deal switch | `HOMEWARD_DEAL`, off by default and for the Sep 28 demo, leaves the deal out of the agent: its tools, its open decisions, `prompts/deal.md` and `prompts/markets.md`, and a story catalog skill without the deal's components, functions, slices, actions, and examples. Choosing a home closes the case with the buyer's week from it. The code, packs, and evals stay, and `deal: true` eval cases run on a server with it on. Workshop feedback on 2026-09-26 was about the story and the homes, never the money, and the deal was the slowest and least reliable part of the runs on 2026-09-25: every failure of the Skopje plan came after its home was chosen, and the Stockholm eval's three deal turns took 124 s, 50 s, and 44 s. The deal is about a third of the catalog schema sent with every request | Keeping the deal in the demo; deleting it; one monthly-cost line per home |
| D126 | Needs of the home, read from the listing | The case can ask what the home itself must have: step-free entry, a lift, a shower or a bedroom on the entry floor, room for a home office, pets. Each sample listing carries a description of about eighty words. Gemini on the buyer's key reads the city's listings for the buyer's needs, answering per need whether the listing meets it, fails it, or says nothing, with the sentence that says so, and code keeps a quote only when it appears word for word. A home that fails a need is ruled out, and each chosen home shows why it fits and where it falls short, every reason with its source: the listing, measured, or the buyer. Workshop feedback asked for an agent that finds "stepless entry and a main-floor walk-in shower" in long descriptions for a parent moving in, and shows why each home was picked and where each reason comes from | Features tagged by hand when curating, which shows no reading; the composing model quoting without a check |
| D127 | The routine and the week map | Each place the buyer goes gets how often, and one routine card sets the week with taps: the places the case knows, days a week for each, and places to add on the map. Code computes each home's weekly travel time from the measured trips, and the map draws each routine trip with its frequency. The routine is an essential clue once a daily place is on the map, so the case asks at most six questions, not five. The map component takes the property names of the Maps Agentic UI Toolkit's `GoogleMap`: `center`, `zoom`, `markers`, `routes` with `origin` and `destination`, and `travelMode`, drawn on OpenStreetMap, which D133 replaces with the toolkit's own component on Google Maps. Workshop feedback asked to map the buyer's actual routine, such as three office days and a weekly clinic visit, with a weekly commute figure and the routes drawn, and pointed at the toolkit | A median over departure times, which needs several routing calls per trip; the toolkit itself, which has no Flutter client and needs a Maps Platform key with billing |
| D128 | Swipe clues | A `HomeSwipe` card deals six of the city's sample homes that differ in type, outdoor space, style, and size. The buyer keeps or passes each with a swipe or a tap, and the server reads what the kept homes share that the passed ones lack: a kind of home, outdoor space, or style it then sets on the story, and the pattern it hands the model for its next deduction, such as every flat passed. The model draws it where it would draw the homes lineup. Stairs were planned as a fourth trait, but only a listing reading knows them, and that waits for needs | Photos alone, which carry taste but not size or price |
| D129 | The reset | Clean the project down to what is essential and certainly correct, and rebuild in small steps around one screen per buyer that Gemini composes and updates as the buyer talks. Kept: the server platform, the agent loop with validation and correction rounds, the catalog contract with basic components only, the app shell with renderer, gallery, and wire inspector, money and geo types, the probe, and the open-data clients. Removed: the case and every question card (D121, D123, D126 to D128), the story model and its tools, the sample homes and photos (D122), the deal with its finance code, rule packs, and markets (D113, D125), the plan record, the fixed action list, and the evals (D93). Actions are now named by the model and handed back to it with their surface's data model. Reviewed on 2026-09-26, the app still felt like a filter dressed as AI: each live failure had been fixed with a server rule (must-ask lists, rejections, withheld tools, fallbacks the server drew), until the server scripted the flow and Gemini only worded it, and the evals scored the script | Stripping the guardrails but keeping the question cards; a full restart in a new repository |
| D130 | What Homeward is | A relocation agent that works like a coding agent. There are no scenarios and no scripted flows: Gemini deduces what it can from what the buyer says and shows it as assumed, with the words it came from; never asks what a tool can find out; asks one real decision at a time, as a choice on the screen with its recommendation, with typing always open; shows its work while tools run; and proposes, for the buyer to approve or correct. The server only validates (D129). Set on 2026-09-26 from the pitch, two emails from Google's Vishal (a screen that confirms the buyer's own filters before homes, needs read from long listings with each reason's source, the buyer's week on a map, the Maps Agentic UI Toolkit, and later mortgage options, rentals, and roommates), and the owner's call for "a specialised agent for relocating, like you are for coding" | Two fixed demo stories; a question flow chosen by the server, which D129 removed |
| D131 | The living screen grows | One surface per plan, updated in place. It starts with the brief, the open question, and the buyer's week on the map; "Looks right" grows solutions onto the same screen, and a later correction re-ranks them in place. This is the confirmation before homes that Google asked for, without a wizard | A confirmation screen and then a separate homes screen, which reads as steps; homes from the first message with the understanding above them, which skips the confirmation |
| D132 | The brief | Gemini's own notes on the buyer, written with a tool, the way a coding agent keeps a plan: needs, habits (a place and how often), wants, places, and open questions, each marked said, deduced (from which words), measured, or quoted. Stored with the session, seeded into the data model for the screen, edited by the buyer, and read by tools, such as the week's places for routes. The server never decides from it | The understanding only in what Gemini draws, re-read from the conversation each turn, which tools cannot read and long sessions drift from; the plan record D129 removed, which the server filled |
| D133 | Maps | Homeward renders the Maps Agentic UI Toolkit's catalog (`googlemaps/a2ui`, alpha, Apache-2.0) in Flutter, which the toolkit does not. Its `GoogleMap` schema is vendored at a pinned commit, as the basic catalog is (D67), and joins Homeward's catalog; a reusable Flutter package draws it with `google_maps_flutter` on Android, iOS, and web, and resolves route geometry through an injectable resolver so that the drawn routes are the ones the server measured. Open data stays the measuring layer, and a validation pass checks the literal marker coordinates against places tools returned. The prompt adapts the toolkit's guidance on maps. The Maps key sits on the project's billing account, restricted by referrer and bundle ID, with quotas capped at the free allowances: the mobile SDKs are free without limit, and web maps have 10,000 free loads a month (checked 2026-09-26). Replaces D118, and the OSM drawing of D127 | The toolkit's properties drawn on OpenStreetMap, a component named after Google Maps that is not; the full Google stack with Grounding Lite for places and routes, kept for S14 |
| D134 | Solutions | Offered when the conversation gets there, in the order Gemini judges: areas for any city, from open data; labelled sample homes it searches, with long, realistic descriptions; and listings the buyer pastes, read on the spot. Every reason a home fits, and every shortfall, carries its source: a quote checked word for word in code, a measurement, or the buyer's words | Sample homes only; areas only |
| D135 | Money | Researched on the spot when the buyer wants it or accepts Homeward's offer: local rules and rates quoted with their sources, figures computed in `common` and labelled as estimates, rent split per person for people sharing. No prebuilt deal | A monthly cost block per home; the deal workspace from `6faa8ab` (D113), the slowest and least reliable part of earlier runs (D125) |
| D136 | Cerebras | Not used. On 2026-09-26 the server's Cerebras key answered HTTP 402, payment required; the free trial now needs a payment method for $5 of credit that expires in 30 days. Even free it allows 5 requests a minute and 1M tokens a day on one key shared by every viewer, about 100 of today's 8.3k-token requests a day for everyone, against 15 a minute and 500 a day on each buyer's own Gemini Flash-Lite key. Gemma 4 on the Gemini key fits 16k input tokens a minute, about one request. Homeward stays on Gemini and spends fewer requests. Supersedes D100's third-party researcher; the provider choice after the livestream (D80) stays open | Cerebras for reading listings or research; Cerebras as a composing fallback |
| D137 | Tests during the rebuild | No new unit tests. Existing tests keep running in `make check`, and a test goes when the behaviour it covers changes. Each chunk ends with `make check` green, a live probe with a few test stories, and a visual look | Tests for each chunk, as before the reset; no probe or visual check |

Defaults chosen during planning without a separate question. Challenge any of
them before M0 ends.

| # | Default | Reason |
| --- | --- | --- |
| P1 | `common` is pure Dart and shared by app and server; UI primitives live in `app/lib/ui/core` | Server cannot import Flutter; one Flutter app does not need a shared UI package yet |
| P2 | Flutter stack follows Purrtrait: Riverpod generator, hooks, Freezed, go_router | Team conventions, proven in production |
| P3 | Server uses `shelf`, `shelf_router`, `firebase_admin_sdk`, no DI framework | Minimal, official where available |
| P4 | Model emits A2UI as JSONL in fenced blocks, validated server-side | Prompt-first is the A2UI v0.9 and genui direction and streams progressively |
| P5 | Homeward components take coarse slice bindings; client functions serve basic components and checks | The model cannot mis-wire formulas it never writes |
| P6 | The board is compiled by the server without the model; superseded by D114 | Consistent, instant, cheap |
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
2. Who attends the Sep 28 session. It shows the direction (D130 to D135) and
   whatever of C1 to C3 is ready.
3. Whether Google wants a public deployment and where it will be linked.
4. Catalog ID domain: `moonwise.se/homeward` or a dedicated domain.
5. Reply on the email thread with project details, which Hilda asked Moonwise
   for on 2026-09-14.
6. ~~The Very Good Ventures product the finish should come close to.~~
   Answered on 2026-09-24. It is their GenUI Kit
   (verygood.ventures/resources/genui-kit) and the Life Goal Simulator shown
   at Google Cloud Next 2026. There is no public repo; D106 to D109 take its
   lessons.
