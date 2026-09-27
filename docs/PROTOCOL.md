# Homeward Protocol

Homeward speaks two protocols: **A2UI v0.9** for the interface, carried over a
**subset of A2A** between the Flutter app and the Dart server.

## Versions

| Layer | Version | Why |
| --- | --- | --- |
| A2UI | v0.9 | What `genui` 0.10.x implements and what the Flutter team presents |
| A2UI A2A extension | `https://a2ui.org/a2a-extension/a2ui/v0.9` | Matches the A2UI version |
| A2A | The version `genui_a2a` speaks, confirmed in spike S1 | Client compatibility decides it |

### Upgrade Path

- **v0.9.1** standardizes the payload MIME type as `application/a2ui+json`
  (v0.9 used `application/json+a2ui`). Adopt when `genui` does. The server
  accepts both on input and emits whichever the client advertises.
- **v1.0** is a release candidate. It adds `components` and `dataModel` inside
  `createSurface`, typed renderer and agent function calls, and removes theme
  branding properties. Do not adopt before `genui` supports it. Keep every
  version-specific shape inside `common/wire` and `server/lib/agent` so the
  upgrade is local.

## Catalogs

| Catalog | ID |
| --- | --- |
| Homeward | `https://moonwise.se/homeward/catalogs/v1/catalog.json` |
| Basic | `https://a2ui.org/specification/v0_9/catalogs/basic/catalog.json` |

The Homeward catalog includes the basic components listed in
`docs/CATALOG.md` plus the Homeward components. The catalog ID is a contract,
not a URL anyone fetches.

The model sees an **agent-visible subset** of the catalog. A component can be
implemented in the app and shown in the gallery without being offered to the
model yet.

## A2A Subset

### Agent Card

`GET /.well-known/agent-card.json`

```json
{
  "protocolVersion": "0.3.0",
  "name": "Homeward",
  "description": "Home-buying and relocation advisor: turns the story of a move into a screen made for that buyer.",
  "url": "https://homeward-server-1065509330520.europe-north1.run.app/a2a",
  "version": "1.0.0",
  "capabilities": {
    "streaming": true,
    "extensions": [
      {
        "uri": "https://a2ui.org/a2a-extension/a2ui/v0.9",
        "required": true,
        "params": {
          "supportedCatalogIds": [
            "https://moonwise.se/homeward/catalogs/v1/catalog.json"
          ],
          "acceptsInlineCatalogs": false
        }
      }
    ]
  },
  "securitySchemes": {
    "firebase": { "type": "http", "scheme": "bearer", "bearerFormat": "Firebase ID token" },
    "gemini": { "type": "apiKey", "in": "header", "name": "X-Homeward-Gemini-Key" }
  },
  "security": [{ "firebase": [], "gemini": [] }],
  "defaultInputModes": ["text/plain", "application/json"],
  "defaultOutputModes": ["text/plain", "application/json+a2ui"],
  "skills": [
    { "id": "relocation", "name": "Relocation", "description": "Turns a buyer's story of their move into a screen made for them.", "tags": ["home-buying", "relocation"] }
  ]
}
```

`protocolVersion`, `defaultInputModes`, `defaultOutputModes`, and skill `tags`
are required by `genui_a2a`'s agent card parser. `url` comes from
`HOMEWARD_PUBLIC_URL`. The card is built from the Freezed A2A models in
`common/lib/wire/a2a`, which the server encodes every A2A message with.

### Methods

| Method | Use |
| --- | --- |
| `message/stream` | Every turn: text or action in, SSE of status and data parts out |
| `tasks/get` | Resume after a dropped stream |
| `tasks/cancel` | Buyer stops a running turn |

A turn runs independently of the HTTP stream that started it, so a dropped
connection does not stop it. `tasks/get` returns the task with its state and
one message holding the full text so far and every A2UI message forwarded so
far, in order; a failed task returns its JSON-RPC error instead. `tasks/cancel`
aborts the Gemini request at once, ends the stream with `canceled`, and
returns the canceled task. Tasks are kept for 10 minutes after they end, in
memory per instance in M1.

`contextId` is the Homeward session ID. Each turn is one task.

### Client To Server

A text turn:

```json
{
  "jsonrpc": "2.0",
  "id": "c-41",
  "method": "message/stream",
  "params": {
    "message": {
      "role": "user",
      "messageId": "m-7f3",
      "contextId": "s-9a2",
      "parts": [{ "kind": "text", "text": "We are moving to Stockholm for my job at KTH, and my mum is moving in with us" }],
      "metadata": {
        "a2uiClientCapabilities": {
          "v0.9": {
            "supportedCatalogIds": ["https://moonwise.se/homeward/catalogs/v1/catalog.json"]
          }
        }
      }
    }
  }
}
```

An action turn carries the A2UI action as a data part, exactly as genui's
`SurfaceController` submits it, references the previous task, and carries the
surface data model in metadata:

```json
{
  "kind": "data",
  "data": {
    "version": "v0.9",
    "action": {
      "surfaceId": "t3-home",
      "name": "keep_home",
      "sourceComponentId": "keep",
      "timestamp": "2026-10-02T09:14:03.201",
      "context": { "homeId": "h1" }
    }
  }
}
```

- genui does not attach the data model; the app reads it from
  `SurfaceController.contextFor(surfaceId).dataModel` and puts it in metadata.
- genui writes `timestamp` in local time without a zone. The server never uses
  it and records its own receive time.
- The client sends `a2uiClientCapabilities` on every turn.
- Clients may serialize absent optional fields as explicit `null`
  (`configuration`, `metadata`, `extensions`, `taskId`). The server treats
  `null` and absent the same.

```json
"metadata": {
  "a2uiClientCapabilities": { "v0.9": { "supportedCatalogIds": ["…"] } },
  "a2uiClientDataModel": {
    "version": "v0.9",
    "surfaces": {
      "t3-home": {
        "notes": "A garden for the dog"
      }
    }
  }
}
```

Both shapes are what `a2ui_core` 0.1.1 produces through
`MessageProcessor.getClientCapabilities` and `getClientDataModel`, and spike S1
recorded `genui_a2a` sending exactly these.

### Server To Client

Each SSE event is `data: {"jsonrpc":"2.0","id":<request id>,"result":<event>}`
followed by a blank line. The server emits only two event kinds, because
`genui_a2a` rejects any other kind with an uncaught error and ignores
`artifact-update`:

| Kind | When |
| --- | --- |
| `task` | Once, first, with `state: submitted` |
| `status-update` | Every later event |

Within a turn:

1. `task` with `state: submitted`, carrying `id` (the turn's task ID) and
   `contextId` (the session ID).
2. `status-update` with `state: working` and no message, as soon as the model
   is called.
3. `status-update` with `state: working` whose message carries a text part with
   **the agent's full text so far**, whenever it grows. Clients replace the
   text they show rather than append. Clients may trim it, which is harmless for
   a full text and would drop spaces between deltas.
4. `status-update` with `state: working` whose message carries one data part
   per A2UI message, in order, as each passes validation.
5. `status-update` with `state: working` whose message carries one progress
   data part: every measuring step of the turn so far, sent whole whenever a
   step starts or ends (D108). Clients replace the list they show.
6. `status-update` with `state: completed`, `final: true`, whose message
   carries the final full text.

A canceled turn ends with `state: canceled`, `final: true`.

A failed turn ends with a JSON-RPC error event instead of a status, then the
stream closes:

```json
{ "jsonrpc": "2.0", "id": 7, "error": { "code": -32000, "message": "Your Gemini key has reached a request limit", "data": { "code": "gemini_quota_exhausted", "retryAfterSeconds": 40 } } }
```

`error.data.code` is a Homeward error code from `docs/REQUIREMENTS_SERVER.md`,
always under JSON-RPC code `-32000`. The A2A codes keep their meaning:
`-32001` task not found, including another caller's task, and `-32002` a task
that already ended and cannot be canceled. Malformed requests get `-32700`,
`-32600`, `-32601`, or `-32602`, as JSON with HTTP 200.
A `failed` status is not used, because A2A clients surface it only as text.

```json
{
  "kind": "data",
  "metadata": { "mimeType": "application/json+a2ui" },
  "data": {
    "version": "v0.9",
    "updateComponents": {
      "surfaceId": "t3-home",
      "components": [
        { "id": "root", "component": "Column", "children": ["title", "notes", "keep"] },
        { "id": "title", "component": "Text", "text": "What the home has to have", "variant": "h3" },
        { "id": "notes", "component": "TextField", "label": "Anything else?", "value": { "path": "/notes" } },
        { "id": "keep", "component": "Button", "child": "keep_label", "action": { "event": { "name": "keep_home", "context": { "homeId": "h1" } } } },
        { "id": "keep_label", "component": "Text", "text": "Keep this one" }
      ]
    }
  }
}
```

A progress data part carries its own media type, so an A2UI client that does
not know it skips it; `genui_a2a` 0.10.x logs a warning and moves on. Step
labels are written by the tool, never by the model.

```json
{
  "kind": "data",
  "metadata": { "mimeType": "application/json+homeward-progress" },
  "data": {
    "steps": [
      { "label": "Finding KTH", "state": "done" },
      { "label": "Looking for schools and parks near 2 homes", "state": "running" },
      { "label": "Timing the ride to KTH by bike", "state": "unavailable" }
    ]
  }
}
```

### Extension Activation

The client sends `X-A2A-Extensions: https://a2ui.org/a2a-extension/a2ui/v0.9`.
The server rejects `message/stream` without it.

### Clients

- The Homeward app uses its own client in `common/wire`, built on the same A2A
  models the server encodes with. See `docs/SPIKES.md` S1 for why it does not
  use `genui_a2a`.
- The server stays compatible with `genui_a2a` 0.10.x: every rule above holds for
  it, and a contract test replays recorded server streams through its connector.

## Surfaces

### Identity And Placement

Placement is encoded in the surface ID so it survives any connector.

| Surface ID | Placement | Author |
| --- | --- | --- |
| `plan` | The plan panel, for the whole plan | Model, validated by server (D131) |
| `t{turn}-{slug}` | Inline in the conversation, under turn `{turn}`'s text | Model, validated by server (D139) |

A plan has two kinds of surface, the two patterns Vishal Motwani showed at the
kickoff (D139). `plan` is the living plan panel: what Homeward understood, the
shortlist, the map, the money. An inline surface holds the question or the
options a turn asks, at most one per turn, and stays in the conversation as
the record of that decision. `planSurfaceId` and `InlineSurfaces` in
`common/lib/wire/` name them.

### Lifecycle

- The first turn that draws creates `plan`. A `createSurface` for it after that
  changes nothing and is not forwarded, so the model may send one every turn.
- Every later turn changes the same surface in place with `updateComponents`:
  a component whose ID exists replaces it, a new ID adds one, and the model
  sends only what changes. A component no longer reachable from `root` stays in
  the surface unseen; A2UI v0.9 has no message that removes one.
- The data model persists across turns. The server seeds new tool results into
  it; what the buyer entered stays until they change it.
- An inline surface is created and filled in its own turn and never changed
  after it. The app keeps it in the conversation, and only the latest turn's
  inline surface takes taps.
- `deleteSurface` is not used.

### Replay

Every A2UI message the server forwards is stored with its turn. Opening a plan
replays them in order into a fresh `SurfaceController`. Uncommitted what-if
changes are not stored and are not replayed.

## Data Model

The server seeds a surface with the slices its components bind. Every turn
keeps the slices as it left them in its record, and the next turn starts from
them, so what a tool found in an earlier turn is still there to bind. When a
tool changes a slice during a turn, the server sends the new value at once to
every surface the turn may change that binds it, so the plan panel shows the
change even when Gemini does not redraw it. `common/lib/catalog/data_model`
declares each slice as it arrives: `/brief` since C4 (D132). The model binds
to paths and never writes values. An input may bind a path that has no
value yet, such as `/notes`; what the buyer enters there reaches the model with
their next action.

Data model values are JSON-shaped as produced by `jsonDecode`; see the binding
rules in `docs/CATALOG.md`.

## Actions

Actions are not a fixed list (D129). Gemini names each action it puts on a
control, in lowercase words joined by underscores, and gives it a context.
When the buyer uses the control, the server applies nothing itself: it hands
Gemini the action's name, its surface, the component that sent it, its context,
and the surface's data model, as the buyer's next message, and Gemini decides
what it means.

Every surface is created with `sendDataModel: true` so what the buyer entered
arrives with the action.

## Server Validation Passes

Every A2UI message the model produces passes these in order before it reaches
a client. Failures are returned to the model as `VALIDATION_FAILED` errors in
the A2UI error shape, `{ code, surfaceId, path, message }`, where `path` is a
JSON pointer into the rejected message, with at most two correction rounds per
turn. A message is forwarded only if every pass accepts it; the first failing
pass rejects it.

1. **Parse.** One JSON object per message inside an `a2ui` fenced block; the
   catalog skill asks for one per line, and a message spread over several lines
   is joined once its braces close. Two slips live runs on 2026-09-26 made are
   mended before anything is rejected: a closing brace too many, and a string
   in single quotes; a third, a comma before a closing brace, followed in C2,
   and in C4 a stray character where a JSON token belongs, and braces left
   open at the end of a message. Since C6b a line that starts a new message
   ends the one before it, so a message a closing brace short, as a nested
   action at the end of a component invites, is mended as braces left open
   rather than joined to the next. Anything
   else is rejected with the text around the error and the surface ID the
   text names, so the correction knows which message to send again.
2. **Envelope.** `A2uiMessage.fromJson` from `a2ui_core`: exactly one message
   type, `version` is `v0.9`. It reports wrong field types as raw cast errors,
   so the pass maps any `TypeError` to a `VALIDATION_FAILED` error. It ignores
   fields the v0.9 envelope does not define, so the pass rejects them first: a
   live run on 2026-09-26 put the components inside `createSurface`, which was
   accepted and then drew nothing.
3. **Ownership.** The surface ID is `plan`, or `t{turn}-{slug}` with this
   turn's number. The model may send only `createSurface`, with the Homeward
   catalog ID and at most one inline surface per turn, and `updateComponents`
   for `plan` once it exists or for this turn's inline surface.
   `updateDataModel` and `deleteSurface` are the server's.
4. **Allow-list.** Component is in the agent-visible catalog subset.
   `a2ui_core` does not check this, so the pass does.
5. **Schema.** Components validate against the Homeward catalog document from
   `homewardCatalogDocument()` through `CatalogValidator` in `common/a2ui`.
   The document composes the agent-visible basic components and functions of
   the A2UI v0.9 basic catalog, vendored from the spec repository at a pinned
   commit (D67), with the Homeward components and functions. Function calls
   therefore resolve against every function the catalog declares, and unknown
   or misspelled properties fail.
6. **Bound numbers.** Money, rate, and percentage properties are typed as
   `CommonSchemas.dataBinding` or a function call in the schema, so a literal
   fails pass 5. This pass exists as a separate test fixture, not separate
   code.
7. **Structure.** Exactly one `root`, every child ID exists, no cycles, and
   every component sent this turn is reachable from `root`. `a2ui_core` does
   not check this, so the pass does. The check runs on the whole screen, every
   component from earlier turns merged with each `updateComponents`, so every
   message must leave a complete tree; components earlier turns left
   unreachable are not orphans. References are read from `child`, `children`,
   `tabs[].child`, `trigger`, and `content` as the v0.9 basic catalog defines
   them.
8. **Paths.** The session's stored messages are replayed into an `a2ui_core`
   `MessageProcessor` at the start of the turn. Each candidate message goes
   through that shadow processor: an update to an unknown surface fails, and
   every bound absolute path must resolve in the surface's data model as
   earlier turns left it or in what this turn's tools seed. A `createSurface`
   for a surface that exists changes nothing and is not forwarded. An input may
   bind to a missing field of an existing object, which it will write; relative
   template paths are skipped. A binding a Homeward block declares, such as
   `AffordabilitySummary`'s `/affordability`, must resolve in full, so the
   block waits for the tool that seeds it.
9. **Seed.** The server prepends `createSurface` with `sendDataModel: true` if
    the model omitted it, and emits `updateDataModel` for the slices the
    components bind to, unless the surface already holds that value. After a
    tool changes a slice, it emits one for every surface the turn may change
    that binds the slice.

Measured in spike S5: schema validation costs about 12 µs per component in the
AOT server binary.

After two failed correction rounds the turn ends with the model's text and a
line of text asking the buyer to send the message again.

The passes check only that a message is valid. None of them decides what the
screen should show or which question comes next (D129).
