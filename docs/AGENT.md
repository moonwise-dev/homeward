# Homeward Agent

The agent is a loop on the server around the Gemini Interactions API. It reads
the plan, decides what is still open, calls tools, and draws the next surface.
It has no hard-coded stages; the open decisions of the plan decide the step.

## Model Configuration

| Setting | Default | Config key |
| --- | --- | --- |
| Turn models, in preference order | `gemini-3.5-flash-lite,gemini-3.5-flash,gemini-3.8-flash` | `HOMEWARD_TURN_MODELS` |
| Thinking level | `low` | `HOMEWARD_THINKING_LEVEL` |
| Deadline to response headers | 10 s | `HOMEWARD_HEADERS_DEADLINE` |
| Deadline to first step | 20 s | `HOMEWARD_FIRST_STEP_DEADLINE` |
| Unhealthy model cool-down | 5 min | `HOMEWARD_MODEL_COOLDOWN` |
| Store interactions | `true` | fixed |
| Validation correction rounds | 2 | `HOMEWARD_MAX_CORRECTIONS` |
| Model rounds per turn | 2 when the model calls its tools together, up to 4 when it calls them one at a time, plus correction rounds | enforced by the tool round cap |
| Inline surfaces per turn | 2 | fixed |
| Tool rounds per turn, cap | 3 | fixed (D78, D85) |

Spike S2 found every listed model available on a free-tier key, but
`gemini-3.8-flash` overloaded on the day: `generateContent` answered 503, and
Interactions requests hung before headers or after `interaction.created`, one
for over 15 minutes, some ending in an in-stream `api_error`.
`gemini-3.5-flash` answered in 7–18 s per round.

Live turns on 2026-09-17 with `gemini-3.8-flash` first repeated it: of four
turns none finished on it alone. Twice it sent no step within 20 s, and twice
it failed with high demand after its text had streamed; its completed rounds
took 5–20 s, while `gemini-3.5-flash` rounds took 4–10 s. `gemini-3.5-flash`
therefore went first (D72).

`gemini-3.5-flash-lite` has gone first since D81: 25 times the free daily
requests of a Flash model and three times its requests a minute. In probes on
2026-09-17 it ran the Stockholm hero script, message, `commit_profile`, and
`commit_scenario`, in four requests and 16 s without a correction, and drew the
profile form with its first text after about 5 s in ten further first
messages. The Flash models follow it, and the order is compared again for
quality in the M2 rehearsals.

A live run of the M1 exit flow in the web app on 2026-09-17, after D82 to D84:
the Stockholm starter drew the full profile form with `HouseholdInput` in two
requests and 7 s; `commit_profile` drew the what-if in one request and 4.4 s;
dragging the down payment slider recomputed the loan, interest, amortization
tier, and deduction with no server traffic; `commit_scenario` stalled on
`gemini-3.5-flash-lite` and then `gemini-3.5-flash`, 20 s each, failed with
`gemini_unavailable`, and succeeded on Retry in one request and 7.8 s.

Free-tier limits, read in AI Studio for the Homeward project on 2026-09-17.
They apply per Google Cloud project, so every key in the project and AI Studio
share them, and daily limits reset at midnight Pacific:

| Models | Requests a minute | Input tokens a minute | Requests a day |
| --- | --- | --- | --- |
| `gemini-3.8-flash`, `gemini-3.7-flash`, `gemini-3.5-flash` | 5 | 250K | 20 |
| `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite` | 15 | 250K | 500 |
| `gemma-4-26b-a4b-it`, `gemma-4-31b-it` | 30 | 16K | 14,400 |

A turn uses up to two requests, and a model at a limit hands the turn to the
next (D79), so a buyer's free key covers roughly 250 turns a day on
`gemini-3.5-flash-lite` and about twenty more on the Flash models. Two or three quick turns in a minute can reach a Flash model's
per-minute limit. AI Studio counts refused requests too: it showed 7 of 5 a
minute and 24 of 20 a day.

### Model Selection

- Each request goes to the first model in the list whose circuit is closed.
  When every circuit is open, the request tries only the model whose circuit
  closes first, so a busy minute never fails a turn without asking Gemini.
- A request that misses a deadline, receives HTTP 500 or 503 with a high-demand
  message, or receives an in-stream `api_error` is aborted by closing the
  connection. That model's circuit opens for the cool-down, and the round is
  retried once on the next model while no A2UI message of that round has been
  accepted (D73). The turn takes the round back first: its text returns to what
  it was before the round, which clients show by replacing the full text, and
  its function calls and rejections are dropped, because tools run only after a
  round completes. Once a message of the round has been accepted, the turn
  fails with `gemini_unavailable` instead of repeating output.
- An overloaded round is retried on one more model only. A request limit
  refusal arrives within a second, so it moves on through every remaining
  model.
- Circuits live in memory per instance; a cold instance relearns within one
  request.
- A key error, a quota that is not per model, and depleted prepaid credits
  never fall back; they are the buyer's to fix. The free tier's per-model
  request limits do (D79, replacing D41 for them): the round moves to the next
  model under the same rule as an overload, and the refused model is skipped
  for that key for one minute. A per-minute and a daily refusal carry the same
  metric and differ only in the limit number, so the server cannot tell them
  apart; after a daily refusal, the model is asked again once a minute and
  refuses within a second. Skips live in memory per instance, keyed by a
  SHA-256 digest of the key that is never logged or stored. When every model
  is skipped for a key, the request asks them again.
- Every turn logs the model used and, when it fell back, the model and reason
  it fell back from, which the client streams as a `modelFailed` event.

## Principles

- **Rules in code, judgment in the prompt.** The prompt tells the model how to
  choose and explain. Code guarantees correctness.
- **Controls are the question.** Never ask in prose for something a component
  can collect.
- **Never telegraph.** "Let me check…" is not a turn. Call the tool and draw the
  result in the same turn.
- **Prefill, never commit.** Values the buyer states in chat are proposed into
  the form by the model and committed only by the buyer.
- **Figures live in components.** Chat text refers to results in words and
  points at the component. It does not restate money amounts or rates.
- **Change is a delta.** Changing a decision releases that decision and redraws
  what depends on it, never the whole plan.

## Open Decisions

`common/lib/plan/open_decisions.dart` derives, from the plan and the resolved
rule pack, an ordered list of what is still open. It is the agent's map. It is
pure and unit tested.

| Open decision | Opens when |
| --- | --- |
| `story` | The story names no city and no home |
| `storyGaps` | The buyer has not confirmed what matters |
| `homeChoice` | No home is chosen |
| `targetMarket` | No market selected |
| `marketCoverage` | Market selected that has no curated pack |
| `profileFields` | Any field the resolved market requires is missing from the saved profile; a field counts as answered when every profile key it names has a value |
| `scenario` | No scenario saved |
| `scenarioCommit` | No scenario saved; the buyer is trying a draft |
| `obstaclesReview` | Buyer faces obstacles with severity `blocker` or `effort`; from M2 |
| `process` | Scenario committed; from M2 |

The story decisions come first (D97). A buyer who asks only about money can
skip them: the money decisions follow in the same list, and the note that asks
again for a missing surface looks at the money decisions until a story begins.
With no market selected, every money decision except `marketCoverage` is open.
An uncovered market leaves only `marketCoverage` open among them.

## Flow

| Open decision | Tools | Components |
| --- | --- | --- |
| `story` | `propose_story` when the message says anything about the move | — |
| `storyGaps` | `propose_story` | The living story (D119): `StoryDraft`, `LifestyleCommuteMap`, and a `Button` sending `commit_story` on one surface |
| `homeChoice` | `assess_story`, pre-run | `LifestyleCommuteMap`, `DynamicRecommendationStack` sending `choose_home`, `ComparisonTable` |
| `targetMarket` | `resolve_market` | `LocationPicker` in `market` mode |
| `marketCoverage` | — | `MarketSnapshotCard` in its uncovered state |
| `profileFields` | `load_market`, `propose_profile` | The facts page: `HouseholdInput`, `MoneyInput`, `LocationPicker` in `country` mode, `ChoicePicker`, commit `Button`; no market card |
| `scenario` | `propose_scenario`, `compute_affordability`, `estimate_purchase_costs` | The deal sheet, one surface (D113): the chosen home's name, `AffordabilitySummary`, `AmountSlider` for the down payment, `PaymentBreakdown`, `StressTestChart`, `PurchaseCostsTable`, `MarketSnapshotCard` for the rules, commit `Button` with checks |
| `scenarioCommit` | — | Nothing new unless the buyer asks for an input the deal sheet lacks |
| `obstaclesReview` | `get_obstacles` | `ForeignBuyerObstacles` |
| `process` | `get_process` | `BuyingProcessTimeline`, `DocumentChecklist` |

The first message comes from the opening page (D107): the reason the buyer
picked, as a sentence, then the place they are moving to. The reason also
travels as message metadata and is set on the plan before the model is called,
so `story.reason` is known from the first round. The first turn therefore
always has something to infer from; it calls `propose_story`, never asks why
the buyer is moving, and draws the living story (D119): one surface holding
the story as a paragraph, the map, and a Show me homes button. The model writes
the paragraph, what it assumes, and the one or two blanks it cannot guess; the
buyer corrects it on the device with no model turn. Only a sentence typed under
the page or Show me homes reaches the model again.

Homeward researches nothing before it is needed (D119): areas are suggested
only with `propose_areas`, once the story is confirmed and has no homes, the market's rules and the
obstacles wait for a chosen home, and homes are measured when the buyer asks to
see them.

The country code is required: in live turns on 2026-09-17 `gemini-3.5-flash-lite`
sometimes left it out, the place list, which holds only regions with their own
rules, did not know Stockholm, and the turn drew a market picker or a form
without a market.

When `resolve_market` finds exactly one market for the place the buyer typed, it
selects that market for the plan in the same model round, so `load_market` runs
and the profile form is drawn in that turn (D71). Selecting a different market
releases the scenario and keeps the profile. Several matches get a
`LocationPicker` and `select_market`.

The tools column lists what a step needs, not who calls it. When a step's inputs
are settled in the plan, the orchestrator pre-runs its tools before the model is
called; the model only calls tools that need interpretation.

## Tools

Tools are Dart classes in `server/lib/tools`, one per file, each an adapter over
`common` and repositories. A tool returns three things:

- `modelResult`: compact JSON the model reasons over.
- `plan`: the updated plan record, only for `resolve_market` when it selects a
  single market, `propose_*`, which store drafts (`profileDraft`,
  `scenarioDraft`) that the buyer later commits, and `release_decision`.
- `seeds`: data model slices the server injects into surfaces created this turn.

Each tool declares whether it can be pre-run: `load_market`,
`compute_affordability`, `estimate_purchase_costs`, `get_obstacles`,
`get_process`, and `get_loan_types` can, because their inputs come from the plan.
`resolve_market`, `propose_profile`, `propose_scenario`, and `release_decision`
cannot, because their inputs come from what the buyer wrote.

Tools that take no input, `compute_affordability`, `estimate_purchase_costs`,
`get_obstacles`, `get_process`, and `get_loan_types`, are server steps
(`AgentTool`): never offered to the model, run whenever the plan settles them,
and read by the model in `preRun`. The others are `ModelTool`s with a function
declaration; `load_market` is offered until a market is selected and pre-run
after (D78). A model that could call an input-free tool used it to probe the
plan, one request at a time.

| Tool | Input | Model result | Seeds |
| --- | --- | --- | --- |
| `propose_story` | Reason, city, an assumed commute mode and longest trip, anchors with a map query, homes the buyer named with a map query and price, criteria, must-haves | Each anchor and home with whether it was placed and the address found; the market it selected, if any | `/story` from the plan, with the answers prefilled for the living story, the city as a marker, and markers for what was placed |
| `propose_areas` | Up to three areas of the buyer's city, only when the confirmed story has no homes | Each area with whether it was placed; the story is otherwise untouched | `/story` from the plan |
| `assess_story` | — | Each home's rank and whether it misses a must-have, each criterion's status per home, the criteria that could not be measured. Never figures | `/assessment` |
| `resolve_market` | `placeName` and the model's `countryCode`, both required, and its `subdivisionCode` | `selectedMarket` with name and coverage when exactly one matches, already the plan's market; otherwise `candidates`, with the curated markets when none resolve | `/selection` when several match |
| `load_market` | `marketId` | Coverage, currency, profile fields with the profile paths that answer them and reasons, kinds of lending rule, never rule values | `/market`, the rules when curated and `{ id, name, coverage }` when not, with `/selection` holding the curated markets (D86) |
| `propose_profile` | Facts the buyer stated: countries as ISO codes, enums, amounts as `{ amount, currency? }` in major units | Accepted and rejected facts with reasons | `/profile` from the plan's profile draft |
| `propose_scenario` | Price, and any down payment, term, loan type, or association fee the buyer stated | Accepted, defaulted, and rejected fields; unstated values come from the market: the smallest down payment the loan-to-value limit allows, the first loan type and its default spread, the shortest maximum term or 30 years | `/scenario` from the plan's scenario draft |
| `compute_affordability` | — | `assessed` with the binding limit and headroom `comfortable`, `atLimit`, or `overLimit`; `incomplete` with missing facts; or what it needs first. Never amounts | `/derived/affordability`, `/derived/downPaymentBounds`, `/derived/payment`; while `incomplete`, only `/derived/downPaymentBounds` from the loan-to-value cap, so the what-if slider still works (D83) |
| `estimate_purchase_costs` | — | The charges that apply with their local terms, and the deadline and claim window of any refund the buyer is on course for; `incomplete` with missing facts; or what it needs first. Never amounts | — : `PurchaseCostsTable` and `cashNeeded` compute from `/market` and `/scenario`, so the figures follow the down payment slider |
| `get_obstacles` | — | Obstacle IDs, severities, and titles, with the facts that would settle a pending one | — : the obstacles that apply are already in `/market`, resolved with the rest of the pack |
| `get_process` | — | Step IDs | `/market/process` |
| `get_loan_types` | — | Loan type IDs | `/market/loanTypes` |
| `release_decision` | `section` | Released decisions | — |

Tool inputs never include market rules, and tool results never ask the model to
compute.

## Prompt Assembly

`server/lib/agent/prompt/prompt_assembler.dart` loads, once at startup, and
joins in order:

1. `prompts/role.md`: who Homeward is, what it will and will not do.
2. `prompts/flow.md`: open decisions, the flow table, the principles above.
3. `prompts/markets.md`: coverage, how to talk about uncovered markets, sources.
4. `prompts/style.md`: tone, the estimates-not-advice line, how to reference
   components instead of restating figures.
5. `prompts/generated/catalog_skill.md`: the agent-visible catalog, generated.
6. A per-turn context block from `server/lib/agent/prompt/turn_context.dart`:
   turn number, open decisions, the selected market with its coverage, saved
   profile facts without amounts, which amounts were given, missing fields with
   the profile paths that answer them, whether drafts are waiting, surface IDs
   already used, and pre-run tool results. No rule values.

Everything, the context block included, is sent as `system_instruction`, which
goes out again with every request of the turn, tool-result rounds included, and
is never stored in the interaction history. The model therefore sees only the
current plan state, and stale snapshots never pile up in history (D70).

The catalog skill carries the composed catalog document and the A2UI common
types as compact JSON Schema, exactly what validation enforces, after the
message rules, data model paths, actions, and examples (D69). It is about 12k
tokens. Tokens cost nothing on a buyer's free key, but every correction round
spends one of their roughly 20 daily requests, so a first message that
validates is worth more than a short prompt.

## Turn Orchestrator

`server/lib/agent/turn/turn_orchestrator.dart` finds the session, checks its
owner, and leases it; `turn_run.dart` runs one turn:

1. Lease the session turn. A second turn while one runs fails with
   `turn_in_progress`; a missing or foreign session fails with
   `session_not_found`. M1 keeps sessions in `InMemorySessionRepository`
   behind `SessionRepository`; Firestore with a transactional lease replaces it
   in M2.
2. If the input is an action the server can complete, apply it to the plan.
3. Replay the session's stored A2UI messages into the shadow processor.
4. Before every model request, not only the first:
   - Run every tool whose `settledArguments` the current plan provides, such as
     `load_market` once a market is selected and `compute_affordability` once a
     covered market has a scenario. Their model results become `preRun` in the
     turn context, and they are left out of the declarations.
   - Rebuild the seeds: an empty `/selection`, seeds from tools called this
     turn, seeds from the settled tools, and `/profile` and `/scenario` from the
     plan's drafts or saved values.
   - Assemble the system instruction with a fresh turn context.
5. Call `interactions.create` with streaming, `previous_interaction_id` when
   present, `store: true`, through model selection.
6. Stream: forward the full text so far as it grows; validate each message of
   an `a2ui` block as it completes; collect function calls.
7. Forward accepted messages through the seeder: a `createSurface` is held
   until its first valid `updateComponents`, then sent with
   `sendDataModel: true`, followed by one `updateDataModel` for each seeded
   slice its components bind, then the components. A surface whose tree never
   validates never reaches the buyer.
8. When the round ended with function calls, run them in the order of the tool
   list, so `resolve_market` selects the market before a profile proposal in
   the same round converts amounts into its currency, and continue the
   interaction with all results at once, in the order the model called them.
   A round that wrote text or a surface ends the tool phase: function calls
   beside output are dropped, so a model cannot spread tools over requests it
   also draws in (D78). While a round draws nothing, its calls run and the
   model is asked again, at most three tool rounds. The request after the last
   allowed round ends with a text note that tools are done and sets
   `tool_choice` to `none` (D85). Live turns on 2026-09-17 called
   `resolve_market`, then `propose_profile`, then `propose_scenario` in
   separate requests, two first messages in three; with tools switched off
   after one round they called them anyway and the buyer saw nothing. Every round
   is logged with its status, the names of the tools called, and its
   duration.
9. A turn that ends with no text and no forwarded message draws a fallback,
   so a buyer never sees an empty answer (D85).
10. When messages were rejected, continue with one text input listing each
   `VALIDATION_FAILED` error, at most `HOMEWARD_MAX_CORRECTIONS` rounds. The
   correction round asks with an enforced response schema (D110): a JSON object
   of messages, offering the layout basics and the components the turn drew or
   tried to draw. Gemini then cannot write malformed JSON, an unknown
   component, or another catalog ID; the validator still checks bindings and
   ownership. If Gemini refuses the schema, the round repeats without it. After
   the last correction, the server draws a fallback.

The fallback is composed by code from what the turn already measured (D109).
When the open decision is `homeChoice`, `assess_story` ran, and the model drew
no components, it is the homes composition: the map, the ranked homes with
their choose button, and the comparison table, bound to the same `/assessment`
slice the model would have used and passed through the same validation. It
fills the surface the model created and could not fill, or creates
`t{turn}-homes`. Only when there is
nothing measured to show does the `t{turn}-retry` surface ask the buyer to send
the message again.
11. Save the plan, the turn number, the last completed interaction ID, and every
    forwarded message, also when the turn fails or is cancelled, then release
    the lease and emit `completed`.

The turn number advances even when a turn fails, so surface IDs never repeat.

A turn that commits a profile or scenario therefore usually needs one model
round: the numbers are already computed, and the model only writes and lays
out. A turn that starts from free text needs two, and never more apart from
correction rounds. Before D78, live turns on 2026-09-17 took three and four
rounds, the model calling `compute_affordability` and `propose_profile` in
separate requests.

### Stream Parser

A small state machine over text deltas:

```text
prose ──"```a2ui"──► a2ui ──braces close──► emit message candidate
  ▲                    │
  └──────"```"─────────┘
```

Inside a block, lines join into one message until its braces and brackets close
outside strings, so a message on one line and a message pretty-printed over
several lines both parse. Complete messages are validated and forwarded as they
arrive, so components appear progressively while the model is still writing.
On 2026-09-17 `gemini-3.5-flash-lite` pretty-printed in two of five first
messages; when each line was a candidate, every line was rejected, two
correction rounds followed, and one turn drew its form twice.

### Rebuilding History

Interaction history is a cache. When a request carrying
`previous_interaction_id` fails with 404 `not_found` (deleted or expired) or
400 `invalid_request` (unknown to this key, or never stored), the orchestrator
retries once without it, starting a fresh interaction whose turn context
carries the plan state. Replaying the last few turns' text joins with
persistence in M2. Nothing is lost because the plan record holds every
decision.

A stored chain can also be refused later, mid-turn (measured 2026-09-25): a
tool round fails with 400 `invalid_request`, "function response turn
comes immediately after a function call turn", and every retry fails the same
way, because the interaction that ends the last turn cannot be continued with
a tool result. The same tool calls replayed on a fresh chain continue
normally, so the fault is in what Gemini stored, not in the request. When a
request carrying `previous_interaction_id` is refused this way before the turn
has drawn anything, the orchestrator starts the turn over once on a new
conversation, from the turn's first input. The new chain replaces the stored
one, so later turns are clean.

### Interactions API Client

`server/lib/gemini` is a hand-written client over REST, shaped by spike S2:

- `POST /v1beta/interactions?alt=sse` with `x-goog-api-key` and `stream: true`.
- SSE events have an `event:` name and a JSON `data:` carrying `event_type`,
  except the terminator `event: done` / `data: [DONE]`.
- Events: `interaction.created` (ID), `interaction.status_update`,
  `step.start` / `step.delta` / `step.stop` per step, `interaction.completed`
  (status and usage), `error`.
- Steps: `thought` (deltas are `thought_signature`, ignored),
  `model_output` (deltas are `text`), `function_call` (`step.start` carries
  `id` and `name`; deltas are `arguments_delta` string fragments, joined and
  parsed at `step.stop`).
- A completed status of `requires_action` means function calls are pending.
  They are answered by a new interaction with `previous_interaction_id` and
  `input` as a list of `{ "type": "function_result", "call_id", "name",
  "result" }`, one per call.
- Tools are declared as `{ "type": "function", "name", "description",
  "parameters" }` and re-sent on every request.
- Errors arrive in four shapes: a Google RPC array
  `[{ "error": { "code": 401, "status": "UNAUTHENTICATED" } }]` for key failures;
  HTTP 400 `INVALID_ARGUMENT` with a `details` reason `API_KEY_INVALID` for a
  malformed key, recorded on 2026-09-17;
  an object `{ "error": { "code": "not_found" | "invalid_request" |
  "too_many_requests", "message" } }` for request, quota, and some overload
  failures (HTTP 500 carries a high-demand message); and an in-stream `error`
  event after HTTP 200 and `interaction.created`, `api_error` for overload or
  `quota_exceeded` for the free-tier daily cap, recorded on 2026-09-17. The
  client maps all of them to one sealed error type.
- A 429 `too_many_requests` names its cause only in `message`: the free-tier
  request cap reads `Quota exceeded for metric: …generate_content_free_tier_requests,
  limit: 20, model: …`, and a tool the key cannot use, such as `google_search`,
  gets the generic quota message. The "Please retry in N s" hint repeats while a
  daily cap lasts, so it is not used as a retry time.
- A stream is cancelled by closing the connection. The cancel endpoint returned
  404 for a stalled streamed interaction.
- The client streams typed events: `created`, `textDelta`, `functionCall` with
  parsed arguments once its step stops, `completed` with status and usage, and
  `modelFailed`. Thought steps and signatures are dropped. SSE framing comes
  from `decodeSse` in `common/wire`, a stream transformer, so cancelling a turn
  cancels the connection even while the stream is silent.
- A quota error, a 429 or an in-stream `quota_exceeded` or `too_many_requests`,
  is read by its `message`: `prepayment credits are depleted` means the key's
  project ran out of prepaid credits, recorded from a live turn on 2026-09-17,
  and maps to `gemini_credits_depleted`; any other is `gemini_quota_exhausted`
  with the next midnight Pacific as its reset, computed from the US daylight
  saving rules, and is per model when it names
  `generate_content_free_tier_requests`.
- Recorded streams and error bodies live in
  `server/test/fixtures/interactions/`.

## Uncovered Markets

When the buyer names a place with no curated pack, `resolve_market` reports it
as uncovered. `load_market`, pre-run once that market is selected, seeds
`/market` with the market, its name, and `coverage: uncovered`, and `/selection`
with the curated markets. The agent says so plainly and shows
`MarketSnapshotCard`, which reads both, beside a `LocationPicker` for switching. It never states lending limits, taxes, costs, or obstacles for an
uncovered market, whether from a tool or from the model's own knowledge.

Every uncovered request is logged with its market identifier so curation
follows demand.

### Research

Research for any place runs on free services, measured in S9 (D100 to D102):

- `propose_story` finds the city with Nominatim, then each anchor and home
  inside the city's box, so an English campus name cannot land in another town.
- `assess_story` measures every home in one Overpass query for every nearby
  criterion and a noise check against main roads and rail, and routes each
  home to each anchor on the FOSSGIS router by car, bike, or foot and on
  Transitous by public transport on a weekday morning.
- Calls go one at a time per service with the gap its policy asks, under a
  user agent naming Homeward, and are cached for six hours in memory and a
  week in Firestore (D112); a busy Overpass is waited out
  twice; a service that fails leaves its criteria unmeasured, never missed.
- `common` turns each measurement into fits, close, or misses with the words
  for it, and ranks the homes, weighing must-haves three times.
- Each lookup reports a measuring step: finding a place, looking for what is
  near the homes, timing a ride to an anchor. The turn streams the steps as a
  progress data part while tools run, so the buyer sees the work rather than
  a spinner (D108). Labels are written by the tool from the plan; a lookup
  that fails shows as unavailable.

Still to come in M3: a researcher behind one interface, a free third-party
model first and Gemini as its fallback, for estimated rules, area ideas for a
city, and a pasted listing; every place it names verified against open data;
and Google Maps grounding for ratings when the buyer asks.

## Guardrails

- Homeward estimates and explains. It does not recommend a lender, a product, or
  a decision to buy.
- Every surface that shows a rule-derived figure shows coverage.
- The disclaimer is on the opening page of every plan.
- Chat text containing money amounts or rates is flagged by evals.
- Tool errors become a short explanation and a retry surface, never invented
  figures.

## Failure Handling

| Failure | Behavior |
| --- | --- |
| Invalid Gemini key (HTTP 401 or 403, or 400 with `API_KEY_INVALID`) | Turn fails with `gemini_key_invalid`; app routes to the key screen |
| A model's free request limit reached | The round moves to the next model; the refused model is asked again after a minute |
| Key quota exhausted (HTTP 429) | Turn fails with `gemini_quota_exhausted` and the next midnight Pacific as reset time; app asks to try again in a minute and names when the daily limit resets |
| Prepaid credits depleted | Turn fails with `gemini_credits_depleted`; app offers to change the key |
| Model overloaded or stalled | Model selection falls back once; if every model is unhealthy, the turn fails with `gemini_unavailable` |
| Unknown or expired previous interaction | Retry once with rebuilt history |
| Stored chain refused with `invalid_request` before anything is drawn | The turn starts over once on a new conversation |
| Model output invalid after corrections | Model text plus a fallback composed from the turn's measurements, or the retry surface when nothing was measured |
| Tool error | Short explanation plus retry surface |
| Stream dropped | Client resumes with `tasks/get`; server keeps the task for 10 minutes |
| Concurrent turn | Second turn rejected with `turn_in_progress` |

## Voice Door (Phase 2)

Voice uses the Gemini Live API through the same server, tools, catalog, and
validation.

```text
app ──WebSocket /live──► server ──WebSocket──► Live API
     mic PCM 16 kHz              audio in
     ◄── speaker PCM 24 kHz ◄──  audio out
     ◄── A2UI messages      ◄──  show_ui tool calls
```

- The Live session gets the same tool declarations plus `show_ui`, whose
  arguments are an A2UI component list. Spoken models cannot write fenced
  blocks, so UI arrives through a tool call.
- `show_ui` arguments pass the same validation and seeding before they reach
  the client over the socket.
- Speak, then screen: the model says one sentence and draws the rest.
- The buyer's key is sent in the first socket frame, never in the URL.
- The text door and the voice door share the plan, so a buyer can switch
  between them mid-plan.
