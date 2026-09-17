# Homeward Spikes

Each spike answers one question from `docs/ROADMAP.md` with evidence, ends in a
decision, and lists what the decision changed. Probe code lives outside the
repository; the findings here are what remains.

## S1 — What `genui_a2a` Puts On The Wire

**Answered 2026-09-16.**

### Question

What does `genui_a2a` 0.10.x send and accept, and can the Homeward server and app
use it as the A2A connection?

### Method

- Read `genui_a2a` 0.10.1 and the parts of `genui` 0.10.3 that submit actions.
- A scratch Flutter package ran the real `A2uiAgentConnector` against a local
  fake A2A server that recorded every request and replied with scripted SSE
  frames: a text turn, streamed text, an action turn, `sendEvent`, artifact and
  unknown event kinds, failure states, JSON-RPC errors, cancellation, and
  per-request headers.

### Findings

| Area | Result |
| --- | --- |
| Transport | HTTP POST to the agent URL with `Accept: text/event-stream`; JSON-RPC 2.0 `message/stream`, integer request IDs. No WebSocket. |
| Extension header | `X-A2A-Extensions: https://a2ui.org/a2a-extension/a2ui/v0.9`, set once at construction. |
| Message | `role`, `parts`, `messageId` (UUID), `contextId` from the connector, `referenceTaskIds: [previous task]` on later turns, `kind: message`. Absent optionals are sent as explicit `null`. |
| Capabilities | `metadata.a2uiClientCapabilities = { "v0.9": { "supportedCatalogIds": [...] } }`, only when the caller passes them. |
| Data model | `metadata.a2uiClientDataModel`, exactly what the caller passes. genui does not attach it; the app reads `SurfaceController.contextFor(id).dataModel`. |
| Actions | `SurfaceController.onSubmit` emits a user message whose part becomes a data part `{ "version": "v0.9", "action": { surfaceId, name, sourceComponentId, timestamp, context } }`. `timestamp` is local time without a zone. |
| `sendEvent` | Uses non-streaming `message/send` without the data model, and the response is only logged. Not a usable action path. |
| A2UI delivery | Read only from data parts inside `status-update` (or `task`) messages; any data map with an A2UI message key is parsed with `a2ui_core`. The part's `mimeType` is ignored. All three test messages arrived in order. |
| Artifacts | `artifact-update` events are parsed and ignored. |
| Unknown kinds | A `kind: message` result throws an uncaught `ArgumentError` out of `connectAndSend`. |
| Text | Every text part of every status message is trimmed and emitted. Deltas lose spaces: `["Your limit", "is set by", "the loan-to-value cap."]`. The final text is emitted again with the completed status. |
| Failed status | Reaches `errorStream` as `A2A Error: TaskState.failed: Message(...)`, the `toString()` of the whole message. |
| JSON-RPC error | Throws `A2AJsonRpcException` with `code`, `message`, and `data` intact, but the type is not exported from the package. |
| Cancellation | A `CancellationSignal` sends `tasks/cancel` with `{ "id": taskId }` over a separate POST. |
| Headers | `SseTransport`, `Transport`, and the exception types are not exported. Per-request headers work only through `http.runWithClient` around construction; a fresh token per request was verified. |

### Decisions

- **D36:** The app talks to the server through its own thin A2A client in
  `common/wire`, built on Freezed models of the A2A subset that the server also
  encodes with. It exposes typed turn events (full text, A2UI message, error
  code), adds headers per request, and feeds messages to genui's
  `SurfaceController.handleMessage`. The server stays compatible with
  `genui_a2a`, checked by a contract test in the app. This supersedes the client
  half of D21; the server half stands.
- **D37:** Each `status-update` carries the agent's full text so far, so clients
  replace rather than append, and trimming is harmless.

### Consequences

- `docs/PROTOCOL.md`: action part shape, explicit `null` tolerance, server events
  limited to `task` and `status-update`, full text snapshots, failures as
  JSON-RPC error events with `data.code`, and a Clients section.
- `docs/ARCHITECTURE.md`: `common/wire` holds the A2A client; the app stack no
  longer lists `genui_a2a`; the genui boundary names how `AgentRepository` wires
  `onSubmit` and `handleMessage`.
- `docs/REQUIREMENTS_APP.md`: `AgentRepository` and `WireLogRepository` are backed
  by the Homeward client.
- `docs/QUALITY.md`: `wire` tests against the frames recorded here, and the
  `genui_a2a` contract test.

## S2 — Driving The Interactions API From Dart

**Answered 2026-09-16.**

### Question

Can the Dart server drive the Gemini Interactions API cleanly: request shape,
streaming events, function calling continuation, `previous_interaction_id`,
error codes? Is `gemini-3.8-flash` available on a free-tier key?

### Method

- Read the Interactions API reference.
- Raw `curl` against the API with the buyer-style free key: model listing, plain
  and streamed interactions, tool declarations, function results, continuation,
  deletion, and deliberate errors.
- A Dart console probe on `package:http` implemented SSE parsing, event
  assembly, a multi-round tool loop over `previous_interaction_id`, and a
  first-step deadline, then ran it on two models.
- Latency compared across `gemini-3.5-flash` at `minimal`, `low`, and `high`
  thinking, `gemini-3.5-flash-lite`, and `gemini-3.1-flash-lite`.

### Findings

| Area | Result |
| --- | --- |
| Availability | The key lists 58 models including `gemini-3.8-flash`, `gemini-3.7-flash`, `gemini-3.5-flash`, and `gemini-3.8-live`. |
| Overload | `gemini-3.8-flash`: `generateContent` answered 503 "high demand" in 1.8 s. Interactions requests either hung before response headers (one for over 15 minutes) or sent `interaction.created` and then nothing; one ended with an in-stream `error` event, code `api_error`. `gemini-3.7-flash` and `gemini-flash-latest` also hung. |
| Latency | `gemini-3.5-flash` took 7–18 s per round across every model and thinking level tried; `gemini-3.1-flash-lite` was fastest at 7.5 s. Every response included a thought step. The day's overload likely inflates these numbers. |
| Auth | `x-goog-api-key` header; the new `AQ.` key format works. |
| Request | `POST /v1beta/interactions`, `?alt=sse` with `stream: true` to stream. Fields `model`, `input` (string or list), `system_instruction`, `tools`, `generation_config.thinking_level`, `store`, `previous_interaction_id`. |
| Tools | `{ "type": "function", "name", "description", "parameters" }`; a missing `type` is a 400. |
| Response | `id`, `status` (`completed`, `requires_action`, …), `steps` (`thought` with an opaque signature, `model_output` with text content, `function_call` with `id`, `name`, parsed `arguments`), `usage` including thought tokens, `service_tier`. |
| Streaming | Named SSE events with JSON `data` carrying `event_type`: `interaction.created`, `interaction.status_update`, `step.start`, `step.delta`, `step.stop`, `interaction.completed`, then `event: done` with `data: [DONE]`, which is not JSON. |
| Streamed calls | `step.start` carries the call's `id` and `name` with empty `arguments`; `step.delta` of type `arguments_delta` carries JSON string fragments. |
| Continuation | A new interaction with `previous_interaction_id` and `input: [{ "type": "function_result", "call_id", "name", "result" }]` continued the turn and the model used the result. The Dart loop ran resolve, compute, answer across three rounds with correctly typed arguments (`priceMinorUnits: 35000000`, `residency: nonResident`) and an answer that stated no numbers. |
| History errors | Deleted previous interaction: 404 `not_found`. Unknown or never-stored ID: 400 `invalid_request`. `store: false` returns no ID. |
| Error shapes | Invalid key: 401 with a JSON array of Google RPC errors (numeric code, `UNAUTHENTICATED`). Unknown model: 404 object with string code `not_found`. Invalid tool: 400 `invalid_request`. Overload: in-stream `error` event. |
| Cancel | `POST /interactions/{id}/cancel` returned 404 for a stalled streamed interaction after the client disconnected; closing the connection is the cancel. |
| Caching | `total_cached_tokens` stayed 0 for these short prompts. |
| Not observed | The quota exhaustion (429) response shape. |

Recorded streams and error bodies are committed in
`server/test/fixtures/interactions/`. They contain no key.

### Decisions

- **D38:** The server takes an ordered model list, `gemini-3.8-flash` then
  `gemini-3.5-flash`. Each request has a 10 s deadline to headers and a 20 s
  deadline to the first step. A deadline miss, 503, or in-stream `api_error`
  aborts the request, opens that model's circuit for 5 minutes, and retries once
  on the next model. Key and quota errors never fall back.
- **D39:** Before calling the model, the orchestrator pre-runs every tool whose
  inputs are settled in the plan and puts the results in the turn context. The
  model calls only the tools that need interpretation. The target is at most two
  model rounds per turn.

### Consequences

- `docs/AGENT.md`: model configuration and selection, pre-run steps in the turn
  orchestrator and tools, history rebuild on 404 or 400, an Interactions API
  client section, failure handling for overload.
- `docs/REQUIREMENTS_SERVER.md`: model list, thinking level, deadline, and
  cool-down configuration; `gemini_unavailable` covers overload.
- `docs/QUALITY.md`: the Interactions client is tested against the recorded
  fixtures; evals track model rounds and fallbacks.
- `docs/ROADMAP.md`: latency and overload risks; latency re-measured in M1 before
  confirming the model order.

## S3 — Search Grounding With Structured Output

**Closed by design 2026-09-16.**

### Question

Can one interaction combine the `google_search` tool with structured JSON output,
and do citations link each rule to a source URL?

### Method

- Read the Interactions API reference for the tool, `response_format`, search
  step types, and citation annotations.
- Called the API with `google_search` on the same free-tier key used in S2,
  then `url_context`, then plain requests to separate a tool limit from a
  request cap.
- Read the Gemini API pricing page for grounding availability.

### Findings

| Area | Result |
| --- | --- |
| Shapes from the reference | Tool `{ "type": "google_search", "search_types": ["web_search"] }`; `response_format: { "type": "text", "mime_type": "application/json", "schema": {...} }`; steps `google_search_call` (`arguments.queries`) and `google_search_result` (`result`, `is_error`); text `annotations` of type `url_citation` with `start_index`, `end_index`, `url`, `title`; `usage.grounding_tool_count`. The reference does not say whether `response_format` combines with tools. |
| Search on a free key | Every request with `google_search` returned 429 `too_many_requests` within 0.4 s on `gemini-3.8-flash` and `gemini-3.5-flash`, while plain requests to the same model succeeded. |
| Pricing | Grounding with Google Search is "Not available" on the free tier for Gemini 3.x; paid keys get 5,000 searches a month shared across 3.x models, then $14 per 1,000. |
| Free-tier request cap | A later 429 named `generate_content_free_tier_requests, limit: 20, model: gemini-3.8-flash`. It still refused a minute later with a fresh "retry in 28 s" hint, while `gemini-3.1-flash-lite` answered: the cap is about 20 requests a day per model per project, and the retry hint is not a real retry time. Limits apply per project and reset at midnight Pacific. |
| Overload shape | `gemini-3.5-flash` returned HTTP 500 with a high-demand message, in addition to the stream error seen in S2. |
| `generateContent` | Returned 404 for `gemini-3.8-flash` and `gemini-3.5-flash` at the time of testing, so structured quota details were not available. |

The quota and overload bodies are committed as fixtures in
`server/test/fixtures/interactions/`.

### Decisions

- **D40:** Homeward uses no paid features. Google Search grounding is paid only,
  so runtime research of uncovered markets is not built; uncovered markets get
  an honest "not covered yet" state. This supersedes the researched fallback in
  D5. The research design, should a paid key ever exist, is kept in
  `docs/AGENT.md` and was chosen without measurement: search and extraction as
  two interactions, with every figure tied to a `url_citation`.
- **D41:** Buyers bring their own free keys, and a quota error never falls back
  to another model, even though each model has its own daily cap. Replaced for
  the per-model free daily cap by D79 on 2026-09-17.
- **D42:** Billing is attached to the project only because Cloud Run, Artifact
  Registry, Cloud Scheduler, and Hosting rewrites require it; everything is
  sized to stay at €0 with a €1 budget alert.
- **D43:** No paid store accounts; builds reach devices as web, simulators,
  sideloaded Android APKs, and personally provisioned iPhones.

### What This Costs The Product

- **Coverage:** only curated markets get rules. The "any location" idea becomes
  "any curated location", and Tier 3 breadth depends on curation speed.
- **Headroom:** about ten turns a day per buyer on a free key, twenty since D79
  lets the second model take over at a cap; about one full hero run a day per
  key for rehearsal and recording; live evals run as daily subsets
  with replay covering the rest.
- **Privacy wording:** unpaid Gemini API use lets Google use prompts and responses
  to improve its products, so the key screen discloses it.
- **History:** free-tier interactions are kept one day, so a plan resumed the next
  day always rebuilds history from the plan record.
- **Devices:** no TestFlight or Play testing tracks; App Attest and Play Integrity
  are unlikely to pass on unsigned builds, so device App Check relies on debug
  tokens.

### Consequences

- `docs/PRODUCT.md`: coverage is curated or uncovered; research and store
  distribution are non-goals.
- `docs/AGENT.md`: research models, the research tool, and the researched
  fallback are replaced by an Uncovered Markets section and a not-built research
  design; free-tier caps and 429 and 500 shapes are documented.
- `docs/MARKETS.md`, `docs/FIRESTORE.md`, `docs/DESIGN.md`: researched packs and
  their collection, rules, TTL, and badge are removed.
- `docs/ARCHITECTURE.md`: a Cost section; App Check providers match free
  distribution.
- `docs/REQUIREMENTS_SERVER.md`, `docs/REQUIREMENTS_APP.md`: no research limits or
  cleanup; Cloud Run capped at two instances; the key screen discloses the cap and
  data use.
- `docs/QUALITY.md`, `docs/ROADMAP.md`: eval cases, CI, recording plan, risks,
  and decisions updated.

## S4 — genui Bindings, Client Functions, And Drag Performance

**Answered 2026-09-16.**

### Question

Do genui client functions accept object arguments and return numbers, strings,
and booleans? Can a catalog item subscribe to a whole slice and update when a
nested value changes? Does a slider drag with six bound components hold 60 fps?

### Method

- Read `genui` 0.10.3 and `a2ui_core` 0.1.1: client functions, function call
  evaluation, data model subscriptions, the basic Slider and Button, check
  validation.
- A scratch Flutter app with a probe catalog: an `AmountSlider` writing
  `/scenario/downPayment`, four insight cards and two line charts (41 and 360
  points) bound to `/scenario` and `/market`, a basic `Text` whose content is
  `formatMoney(monthlyPayment(scenario, market), currency)`, and a basic
  `Button` with a `withinMaxLtv` check. Functions and builders counted their
  executions and time.
- A widget test drove a nested data model update and a real slider drag.
- Profile web builds, JS and Wasm, ran in headless Chrome on an Apple silicon
  Mac. A ticker wrote the down payment every frame for six seconds and the page
  posted frame timing percentiles to a local server. The DevTools protocol applied
  1× and 4× CPU throttling. Variants isolated the cost: no charts, the same
  widgets without genui, charts with fewer points, and charts drawn with a
  `CustomPainter` instead of `fl_chart`.

### Findings

| Area | Result |
| --- | --- |
| Object arguments | A `{ "path": "/scenario" }` argument resolves to the whole map and re-evaluates when anything under it changes. |
| Return types | `number`, `string`, and `boolean` returns all worked; nested calls worked: 1141.60 → 1397.87 → 532.29 EUR as the down payment changed. |
| Checks | genui evaluates `{ "condition": <DynamicBoolean>, "message" }`. The flat `call`/`args` shape in `docs/CATALOG.md` was wrong. The Button disabled at 85.7% LTV and re-enabled at 32.6%. |
| Slice subscriptions | `a2ui_core` notifies watchers of ancestors and descendants of a written path, and genui's notifier forces a notification when the value is the same mutated map. All six slice-bound components rebuilt exactly once per update. |
| Coalescing | Widget rebuilds coalesce to one per frame; function executions do not (9 executions for 3 writes in one frame). |
| Data model typing | Seeding with a Dart map literal made later writes throw `_Map<String, Object?> is not a subtype of Map<String, Object>`. JSON-decoded data does not. |
| Basic Slider | Creates a new check stream on every build and writes bare numbers. |
| Builder cost | Finance math plus widget construction stayed under 0.2 ms per component even at 4× throttling. |
| Android | Not measured: emulators do not support profile builds and no phone was connected. |

Frame timings, six-second sweeps, milliseconds:

| Build | Variant | CPU | Frames | Over 16.7 ms | Build p50 | Build p90 | Total p90 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| JS | genui + `fl_chart` | 1× | 361 | 4 | 6.9 | 8.6 | 11.2 |
| JS | genui + `fl_chart` | 4× | 139 | 139 | 32.3 | 39.7 | 50.1 |
| JS | no genui, `fl_chart` | 4× | 169 | 169 | 26.6 | 31.3 | 39.8 |
| JS | genui, no charts | 4× | 356 | 10 | 8.4 | 10.8 | 13.5 |
| JS | genui, `fl_chart` with fewer points | 4× | 193 | 193 | 24.3 | 29.8 | 36.9 |
| JS | genui, `CustomPainter` charts | 4× | 339 | 78 | 8.9 | 14.2 | 20.8 |
| Wasm | genui + `fl_chart` | 1× | 358 | 3 | 2.7 | 3.6 | 6.3 |
| Wasm | genui, no charts | 1× | 361 | 1 | 1.7 | 3.1 | 4.3 |
| Wasm | genui, `CustomPainter` charts | 1× | 361 | 9 | 3.6 | 4.5 | 10.2 |

Wasm under 4× throttling varied too much to rank: the same `CustomPainter` build
gave 268 frames over budget in one run and 2 in the next, and the `fl_chart`
build 86 and 223. DevTools CPU throttling evidently does not slow skwasm's render
worker consistently.

### Decisions

- **D44:** Charts are Homeward's own `CustomPainter` widgets in `app/lib/ui`, not
  `fl_chart`, which dominated build time during a drag.
- **D45:** The web app is a Wasm build with a JS fallback, served with COOP and
  COEP headers for multi-threaded rendering.
- **D46:** The frame-timing harness becomes `tool/perf` and `make perf`, run on
  demand against a gallery page, on web and on a physical Android phone.

Coarse slice bindings (P5) and whole-object client function arguments are
confirmed as designed.

### Consequences

- `docs/CATALOG.md`: the check example uses `condition`; binding rules for slice
  subscriptions, function cost, JSON-shaped data, and money inputs.
- `docs/PROTOCOL.md`: data model values are JSON-shaped.
- `docs/ARCHITECTURE.md`: no chart package; a Web Build section.
- `docs/DESIGN.md`: charts are `CustomPainter` widgets.
- `docs/REQUIREMENTS_APP.md`, `docs/REQUIREMENTS_SERVER.md`: measured performance
  method, Wasm build, Hosting headers.
- `docs/QUALITY.md`: a Performance Check section.
- `docs/ROADMAP.md`: `make perf` in M1; Android and COEP risks.

## S5 — `a2ui_core` On The Server

**Answered 2026-09-16.**

### Question

Is `a2ui_core` pure Dart and usable on the server for A2UI message models and
validation, or does Homeward own its v0.9 models?

### Method

- Read `a2ui_core` 0.1.1 and how `genui` 0.10.3 uses it.
- A console probe outside the workspace exercised message parsing, component
  schema validation, and a server-side `MessageProcessor`, run under JIT, AOT,
  and a Linux x64 cross-compile.

### Findings

| Area | Result |
| --- | --- |
| Dependencies | `collection`, `json_schema_builder`, `meta`, `preact_signals`. No Flutter. |
| Relation to genui | `genui` 0.10.3 depends on `a2ui_core ^0.1.0` and exposes every `CatalogItem` to it as a `ComponentApi` whose schema is the item's `dataSchema`. |
| Compilation | JIT and AOT output identical; cross-compiles to Linux x64. |
| Message parsing | `A2uiMessage.fromJson` enforces `version: v0.9` and exactly one message body with `A2uiValidationError`. Wrong field types and missing required fields throw a raw `TypeError` instead. |
| Client actions | `A2uiClientAction` has `toJson` only. The server needs its own parsing. |
| Component validation | None in `a2ui_core`. `genui` validates each component with `json_schema_builder` inside the Flutter package, so the server cannot import it. |
| Schema checks | A `ComponentApi` schema built from `CommonSchemas.dataBinding` rejects a literal where a binding is required, and with `additionalProperties: false` rejects unknown properties and reports missing required ones, each with a path. |
| Schema cost | About 40 µs per component under JIT, 12 µs AOT. |
| Shadow state | `MessageProcessor` runs on the server: builds surfaces, applies data model updates, resolves paths, rejects updates to unknown surfaces with `A2uiStateError`. It does not check component types against the catalog. |
| Capabilities shape | `getClientCapabilities` returns `{ "v0.9": { "supportedCatalogIds": [...] } }`, keyed by version. |
| Data model shape | `getClientDataModel` returns `{ "version": "v0.9", "surfaces": { ... } }`. |

### Decisions

- **D34:** `common` depends on `a2ui_core`, pinned exactly, for message classes,
  `ComponentApi`, `Catalog`, `CommonSchemas`, and `MessageProcessor`. Homeward
  components are declared once as `ComponentApi` classes; the app wraps each in
  a genui `CatalogItem`, and the server validates against the same schema.
  `common/a2ui` adds client action parsing, `TypeError` mapping, the allow-list,
  and tree structure checks.
- **D35:** The server replays each session's stored messages into a shadow
  `MessageProcessor` at the start of a turn and feeds every candidate message
  through it before forwarding.

### Consequences

- `docs/PROTOCOL.md`: capabilities and data model metadata use the version-keyed
  shapes; validation passes name the `a2ui_core` part each relies on; the
  bound-number rule is enforced by schema.
- `docs/CATALOG.md`: declarations are `ComponentApi` classes; app items are genui
  `CatalogItem`s built from them.
- `docs/ARCHITECTURE.md`: `common/a2ui` added; `a2ui_core` is the source of A2UI
  protocol types.
- `docs/AGENT.md`: the turn orchestrator validates through the shadow processor.
- Spike S1 must confirm `genui_a2a` sends the same capability and data model
  shapes.

## S7 — Tier 1 Rules Behind The Hero Numbers

**Answered 2026-09-16.**

### Question

Are the high-impact Tier 1 claims true in primary sources: Portugal's
non-resident IMT, Portugal's DSTI limit, Portugal's non-resident LTV, and
Sweden's top-up cap?

### Method

- Read the law, regulator, and tax authority texts directly. PDFs were
  downloaded and their text extracted locally; nothing relied on a search
  summary.
- Sweden: Lag (2026:226) om begränsning av bostadskrediter as consolidated by
  Riksdagen, and Finansinspektionen's repeal notice of 2026-03-19.
- Portugal lending: Banco de Portugal Recomendação Macroprudencial n.º 1/2026
  and Instrução n.º 23/2023 from Boletim Oficial 9/2023.
- Portugal tax: Decreto-Lei n.º 97/2026 and Declaração de Retificação
  n.º 26/2026/1 from Diário da República, article 17 of the Código do IMT as
  consolidated by the Autoridade Tributária, and Ofício Circulado
  n.º 40129/2026 with the 2026 practical tables.
- Lender practice: Banco BPI's credit price list in force from 2026-09-16.
- Hero figures recomputed with decimal arithmetic, and bracket deductions
  derived from the marginal bands to cross-check the published tables.

### Findings

| Claim | Result | Source |
| --- | --- | --- |
| Sweden top-up cap 80% | **Confirmed.** 90% when a mortgage is granted, 80% when one is increased. | 2026:226 4 §, 5 § |
| Sweden 4.5× income amortization removed | **Confirmed.** The law holds no income-based rule. | FI notice; 2026:226 |
| Sweden amortization tiers | **Confirmed**, with a detail: 1% or 2% of the highest credit amount since the latest valuation, not of the current balance. | 2026:226 7 § |
| Portugal DSTI cut to 45% on 2026-05-20 | **Date wrong.** 45% of net income applies to solvency assessments from **2026-08-01**. Up to 10% of each lender's lending per semester may exceed it. | Recommendation 1/2026 arts. 2, 6, 11 |
| Portugal non-resident LTV 70% | **Not a regulation.** Banco de Portugal caps LTV by purpose: 90% for an own permanent residence, 80% otherwise. 70% for non-resident foreigners is lender practice. | Recommendation 1/2026 art. 5; BPI price list |
| Portugal non-resident IMT 7.5% from the 2026 budget | **True, different law.** Decree-Law 97/2026, in force 2026-05-25. Flat 7.5% on any urban residential purchase by a non-resident, no exemptions. | CIMT art. 17 n.os 10–12 |
| Portugal IMT thresholds 25% higher in Madeira and the Azores | **Confirmed.** Published as tables IV to VI under Lei 21/90. | Ofício Circulado 40129/2026 |

Beyond the four claims:

- **Non-resident IMT exceptions:** a buyer who was ever a Portuguese tax
  resident pays the normal rates. A buyer who becomes tax resident within two
  years of purchase, or rents the home at capped rent within six months and for
  36 months within five years, can have the difference annulled on request
  within six months of qualifying.
- **Madeira inference:** the regional tables change thresholds only, so the
  flat 7.5% applies unchanged in Madeira. No source states this explicitly;
  curation confirms it.
- **Stress:** the index is shocked by 0.5, 1, or 1.5 percentage points for
  terms up to 5, up to 10, or over 10 years, on variable and mixed rates. Fixed
  rates are not shocked. Recommendation 1/2026 still cites Instrução 23/2023.
- **Maximum term:** 40 years when the oldest borrower is 35 or younger,
  otherwise 35.
- **Age at maturity:** income is reduced by at least 20%, weighted by the share
  of the term after the borrower turns 70, unless already retired.
- **IMT table shape:** marginal rates with a deduction per bracket up to
  €660,982 for a primary residence, or €633,931 otherwise; above that a single
  rate on the whole value. Deductions derived from the marginal bands match the
  published ones to the cent.
- **Youth exemption:** buyers 35 or younger pay no IMT on a primary residence up
  to €330,539, or €413,174 in the regions. Its other conditions are unverified.
- **Lender norms at BPI:** a resident's primary home is limited to the lower of
  90% of the price and 85% of the valuation; a second home to the lower of 80%
  and 70%.
- **Stamp duty on the loan:** BPI states 0.6% for terms of five years or more,
  and 4% on interest. Stamp duty on the purchase price is still unverified.

Hero figures for a buyer over 35 buying at €350,000 in Funchal:

| Figure | Amount |
| --- | --- |
| IMT at the deed as a non-resident | €26,250.00 |
| IMT as a resident's primary home, table IV: 7% less €13,072.48 | €11,427.52 |
| Refundable after becoming tax resident within two years | €14,822.48 |
| Maximum loan at the 70% lender norm | €245,000.00 |
| Down payment at that limit | €105,000.00 |
| Maximum loan at the 80% legal cap | €280,000.00 |

### Decisions

- **D47:** The Portugal profile asks whether the buyer was ever a Portuguese tax
  resident and whether they intend to become one within two years. The
  non-resident IMT shows its refundable part and the claim deadline, computed
  by code from pack rules.
- **D48:** Portugal's non-resident limit is a 70% lender norm sourced to a
  lender's published price list, shown under the 80% regulatory cap. A second
  lender is checked during curation to set the range.
- **D49:** The hero buyer is over 35: a 35-year maximum term and no youth
  exemption.

### Consequences

- `docs/MARKETS.md`: Tier 1 notes carry verified status and exact sources;
  schema gains cost rule groups and refunds, buyer age and residency intent
  predicates, loan predicates for stress, and income adjustments.
- `docs/PRODUCT.md`: hero form fields and hero figures.
- `docs/QUALITY.md`: hero eval asks the new fields; `finance` tests pin bracket
  deductions against marginal bands.
- `docs/ROADMAP.md`: S7 answered; D47 to D49; Portugal rules re-verified in the
  recording week.

## S6 — Firebase Admin SDK On Cloud Run, And The Web Path To It

**Answered 2026-09-16.**

### Question

Does `firebase_admin_sdk` verify anonymous ID tokens and App Check tokens and
run Firestore transactions on Cloud Run with Application Default Credentials?
Do the cross-origin isolation headers for multi-threaded Wasm break reCAPTCHA
for App Check? Can a web client reach the server the way the architecture
assumed, through Firebase Hosting rewrites?

### Method

- A throwaway shelf server outside the repository used `firebase_admin_sdk`
  0.5.5, was cross-compiled to Linux x64, packaged on the distroless image, and
  deployed as a Cloud Run service running as `homeward-server` with 0 to 1
  instances. One route ran every check against the tokens it received and timed
  each step; another streamed one SSE event a second.
- A script signed in anonymously through the Identity Toolkit REST API and
  called the service directly and through a Hosting preview channel.
- A throwaway Flutter web app built with `--wasm` used `firebase_auth` and
  `firebase_app_check` with a reCAPTCHA Enterprise key. The same build was
  served from one preview channel under three header variants: `require-corp`,
  `credentialless`, and none. It signed in, got an App Check token, streamed
  from Cloud Run with `fetch` and with `package:http`, and called the server
  through Hosting and directly. Headless Chrome drove each variant through the
  DevTools protocol and captured console output and blocked requests.

### Findings

| Area | Result |
| --- | --- |
| ID tokens | Anonymous tokens verify: 41 ms on first use while public keys load, then under 1 ms. The revocation check calls `getUser` and works with Firebase Authentication Viewer, about 200 ms. |
| App Check | reCAPTCHA Enterprise tokens verify under 25 ms. Replay protection with `consume` works with Firebase App Check Token Verifier: the first use reports `alreadyConsumed: false`, later uses `true`. |
| Firestore | A read-then-write transaction works with Cloud Datastore User: 839 ms on a fresh instance, 130–330 ms warm. |
| Credentials | ADC on Cloud Run needs no key file. OAuth refresh tokens, which is what `gcloud auth application-default login` produces, cannot reach Firestore, so local development uses the emulators. |
| Build | The SDK cross-compiles to Linux x64; its FFI use is libc `setenv`, present in the distroless image. Instances listen 200–450 ms after starting. |
| Errors | Malformed tokens fail with `auth/argument-error` and `app-check/invalid-argument`. |
| Cloud Run invoker check | With the invoker IAM check on, even a public service answers 401 to any `Authorization` bearer token that is not a Google identity token, Firebase ID tokens included; `X-Serverless-Authorization` is checked the same way. With `--no-invoker-iam-check` the header reaches the server. |
| Hosting rewrites | They buffer the whole response. A 10-second SSE stream arrived at once with a `Content-Length`; a 55-second stream arrived at once after 55 seconds; a 65-second stream never returned. Direct to Cloud Run, events arrived about 150 ms after they were sent. |
| Direct calls from web | CORS with an hour of cached preflight works from the Hosting origin. Both `fetch` and `package:http` streamed live from Cloud Run, one chunk a second. |
| Classic reCAPTCHA | Firebase no longer accepts classic reCAPTCHA v3 for App Check; its console field is disabled. A key created in the reCAPTCHA admin console is a Google Cloud key in the project and works with the Enterprise provider. |
| reCAPTCHA price | 10,000 assessments a month are free; above that a flat $8 up to 100,000, then $1 per 1,000. Each App Check token exchange is one assessment. |
| Isolation headers | Under `require-corp` and `credentialless` the page was cross-origin isolated and rendered with Wasm. reCAPTCHA Enterprise, anonymous sign-in, App Check, and direct cross-origin calls all worked under both. |
| Propagation | App Check rejected exchanges with a 400 for about a minute after its configuration was saved. |
| Auth and App Check | With App Check activated, Firebase Auth on web waits for an App Check token before signing in; an unusable site key surfaces as `auth/network-request-failed`. |
| Safari | Not tested. Checked in M1 against the real web app on macOS and iOS Safari. |

### Decisions

- **D50:** Web App Check uses reCAPTCHA Enterprise with one-day tokens, within
  the free assessment tier.
- **D51:** Every client calls the Cloud Run URL directly, with CORS for the
  Hosting origins; Hosting serves only the web app.
- **D52:** Cloud Run runs with the invoker IAM check disabled, and the server
  verifies the Firebase ID token from `Authorization` and App Check itself.

`require-corp` stays as chosen in D45.

### Consequences

- `docs/ARCHITECTURE.md`: App Check on reCAPTCHA Enterprise, no Hosting
  rewrites, the invoker check, reCAPTCHA in the Cost section.
- `docs/REQUIREMENTS_SERVER.md`: CORS headers and preflight caching, deployment
  flags, no rewrites.
- `docs/REQUIREMENTS_APP.md`: the server URL is a build-time value.
- `docs/PROTOCOL.md`: the agent card points at the Cloud Run URL.
- `docs/ROADMAP.md`: S6 answered; D50 to D52; the isolation header risk
  replaced by a reCAPTCHA cost risk.

## S8 — Other Models And APIs Beside Gemini

**Answered 2026-09-17.**

### Question

Can a buyer run Homeward on more than one model or API, offered as a choice
next to Gemini rather than replacing it, and what would each route cost the
server, the app, and the free-key promise?

### Method

- Desk research first. Read the Gemini API
  rate limit, pricing, models, Interactions API, Gemma on Gemini API, and
  OpenAI compatibility pages; the rate limit pages of OpenRouter, Groq, and
  Cerebras; the pub.dev pages of `dartantic_ai` and packages matching `genui`.
- Third-party summaries were used only where a provider page did not load, and
  are marked. Blog tables of Gemini free limits disagreed with each other and
  with what S3 measured, so none is quoted.
- Sized each route against one Homeward request: a system instruction of about
  12k tokens (D69) plus the turn, sent at most twice a turn (D78).
- After the decision, sent the hero first message, "We are a couple in
  Stockholm looking at a 3-room flat in Södermalm for about 4.5 million
  kronor", through a local server limited to one candidate model at a time,
  with `tool/bin/probe_turn.dart` and the probe key.

### Findings

| Area | Result |
| --- | --- |
| Gemini free limits | Applied per project, not per key; daily limits reset at midnight Pacific; the numbers are published only in AI Studio's rate limit page for the signed-in project. S3 and a live session measured 20 requests a day on `gemini-3.8-flash` and `gemini-3.5-flash`, and in S3 `gemini-3.1-flash-lite` still answered while `gemini-3.8-flash` was capped. |
| Gemini models with a free tier | `gemini-3.8-flash`, `gemini-3.7-flash`, `gemini-3.6-flash`, `gemini-3.5-flash`, `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite`, `gemini-2.5-flash`, `gemini-2.5-flash-lite`; not `gemini-3.1-pro-preview`. Free-tier content is used to improve Google's products on all of them. |
| Paid Gemini prices per 1M tokens, input and output | `gemini-3.8-flash`, 3.7, and 3.6: $0.75 and $3.75. `gemini-3.5-flash`: $1.50 and $9.00. `gemini-3.5-flash-lite`: $0.30 and $2.50. `gemini-3.1-flash-lite`: $0.25 and $1.50. |
| Interactions API models | Every Gemini model above plus `gemma-4-31b-it` and `gemma-4-26b-a4b-it`. Free-tier interactions are kept one day. |
| Gemma 4 on the Gemini API | Same key and endpoint; system instructions, function calling, and a thinking level are supported. Free limits are not published. |
| Gemini OpenAI compatibility | `https://generativelanguage.googleapis.com/v1beta/openai/` serves Chat Completions with streaming, tools, and JSON schema output, in beta; unlisted parameters are silently ignored. Same key and limits. |
| Vertex AI express mode | A 90-day trial for new Google Cloud users with an API key and low per-model limits (third-party summary; Google's page did not render). Not a lasting choice. |
| OpenRouter | One OpenAI-style API over many providers, Gemma 4 included. `:free` models allow 20 requests a minute and 50 a day, or 1,000 a day once $10 of credits were ever bought. Requests with a buyer's own provider key are not held to those limits. Streams report errors as SSE events. |
| Groq free plan | `openai/gpt-oss-120b`, `openai/gpt-oss-20b`, `qwen/qwen3.8-27b`: 30 requests a minute, 1,000 a day, 8K tokens a minute, 200K a day. One Homeward request is larger than the per-minute token limit. |
| Cerebras free trial | `gpt-oss-120b`, `qwen-3.8-27b`: 5 requests a minute, 30K uncached tokens a minute, 1M tokens a day, about 60 Homeward requests a day. |
| Mistral free Experiment plan | 1 request a second, 500K tokens a minute, 1B tokens a month per model, meant for evaluation (third-party summary; Mistral's page did not load). |
| Dart libraries | `dartantic_ai` 3.4.2, verified publisher, runs on the Dart VM with streaming and tool calling over OpenAI, Google, Anthropic, Mistral, Cohere, Ollama, OpenRouter, xAI, and OpenAI-compatible APIs. `genui_x` 0.1.0, unverified, connects models to genui on the client, which Homeward's server agent does not use. `flutter_local_ai` 0.0.16 wraps on-device models, Apple Foundation Models, ML Kit GenAI with Gemini Nano, and Windows AI; not sized against a 12k-token prompt. |
| Fit with the server | Model access sits behind one function, `CreateInteraction`, which takes an `InteractionRequest` and streams `InteractionEvent`s, so a second API is one more implementation. The Interactions API keeps the conversation on Google's side through `previous_interaction_id`; a Chat Completions API does not, so the session must store the model conversation, buyer inputs, model text, function calls, and results, and resend it on every request. |
| Fit with the app | The key screen takes one Gemini key. A choice needs a provider picker, verification per provider, and data use terms per provider, as D76 quotes for Gemini. |
| Fit with quality | Prompts and the catalog skill were written and checked on Gemini. Every added model needs the hero script and evals before a buyer can pick it. |

### Probes

| Model | Result |
| --- | --- |
| `gemini-3.5-flash-lite` | Two requests: `resolve_market`, `propose_profile`, and `propose_scenario` together, then text and a valid profile form with five inputs and a commit button, no correction. First text after 5.0 s, done after 7.9 s. |
| `gemini-3.1-flash-lite` | Called `resolve_market` alone, then `propose_profile` and `propose_scenario` in the second request although no tools were offered, and again under `tool_choice: none`: the turn ended with no text and no surface. With a note after the tool results that tools are done, it wrote text and a valid form in the second request, without proposing the household or the price. First text after 15.2 s. |
| `gemma-4-26b-a4b-it`, `gemma-4-31b-it` | `thinking_level: low` is refused; only `high` and `minimal` are accepted. With `high`, 26B answered HTTP 500 and 31B sent no step within 20 s. Then both refused with `generate_content_free_tier_input_token_count, limit: 16000`, retry in about 15 s: 16k input tokens a minute on the free tier, less than two Homeward requests. |

`tool_choice` belongs in `generation_config`; at the top level the request is
refused with `Unknown parameter 'tool_choice'`. A per-minute token quota is
reported like the daily cap and would be shown to a buyer as a daily limit;
no Gemini Flash model reached it.

### Options

1. **More Gemini API models on the same key.** Add a flash-lite model or Gemma
   4 to `HOMEWARD_TURN_MODELS` after their limits are read in AI Studio and the
   hero script passes on them. No new API, key, or screen; stays Google; only
   helps when those models have limits of their own.
2. **An OpenAI-compatible provider choice.** One `CreateInteraction`
   implementation for Chat Completions with tools, a stored model
   conversation, and a provider picker on the key screen. It covers OpenRouter,
   Cerebras, Mistral, OpenAI, and a local Ollama with Gemma, and Gemini itself
   through its compatibility endpoint. Free tiers fit poorly: Groq's token
   limit is below one request, OpenRouter's free limit is 50 requests a day.
3. **Both, in order:** option 1 before the recording, option 2 after the
   livestream.

### Decisions

- **D80:** Before the recording, later fallback models on the same key:
  `gemini-3.5-flash-lite` is the candidate, pending its limits in AI Studio and
  the full hero script; `gemini-3.1-flash-lite` only if needed, since it is
  slower and proposes less; Gemma 4 is out on the free tier. After the
  livestream, an OpenAI-compatible provider choice.

### Consequences

- `docs/ROADMAP.md`: S8 answered; D80; a fallback model item in M2; M7
  Provider Choice.
- `docs/AGENT.md`: the tool round closes with a note and `tool_choice: none`
  (D78).
- `server/prompts/flow.md`: tools are done once their results come back.

### Sources

- https://ai.google.dev/gemini-api/docs/rate-limits
- https://ai.google.dev/gemini-api/docs/pricing
- https://ai.google.dev/gemini-api/docs/models
- https://ai.google.dev/gemini-api/docs/interactions
- https://ai.google.dev/gemma/docs/core/gemma_on_gemini_api
- https://ai.google.dev/gemini-api/docs/openai
- https://openrouter.ai/docs/api-reference/limits
- https://console.groq.com/docs/rate-limits
- https://inference-docs.cerebras.ai/support/rate-limits
- https://pub.dev/packages/dartantic_ai
- https://pub.dev/packages?q=genui
