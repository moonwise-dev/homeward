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
  to another model, even though each model has its own daily cap.
- **D42:** Billing is attached to the project only because Cloud Run, Artifact
  Registry, Cloud Scheduler, and Hosting rewrites require it; everything is
  sized to stay at €0 with a €1 budget alert.
- **D43:** No paid store accounts; builds reach devices as web, simulators,
  sideloaded Android APKs, and personally provisioned iPhones.

### What This Costs The Product

- **Coverage:** only curated markets get rules. The "any location" idea becomes
  "any curated location", and Tier 3 breadth depends on curation speed.
- **Headroom:** about ten turns a day per buyer on a free key; about one full hero
  run a day per key for rehearsal and recording; live evals run as daily subsets
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
