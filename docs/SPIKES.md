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
