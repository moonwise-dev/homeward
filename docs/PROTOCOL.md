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
  "description": "Home-buying finance agent: affordability, purchase costs, and foreign buyer obstacles for any location.",
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
    { "id": "affordability", "name": "Affordability", "description": "Maximum loan and price, binding constraint, what-if.", "tags": ["mortgage", "affordability"] },
    { "id": "purchase_costs", "name": "Purchase costs", "description": "Upfront taxes and fees for a buyer in a market.", "tags": ["taxes", "fees"] },
    { "id": "foreign_buyer", "name": "Foreign buyer", "description": "Obstacles, restrictions, and process for non-residents.", "tags": ["cross-border"] },
    { "id": "buying_process", "name": "Buying process", "description": "Steps and documents for a purchase.", "tags": ["process", "documents"] }
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
      "parts": [{ "kind": "text", "text": "I live in Stockholm and want a flat in Funchal around €350k" }],
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
      "surfaceId": "t3-affordability",
      "name": "commit_scenario",
      "sourceComponentId": "commit",
      "timestamp": "2026-10-02T09:14:03.201",
      "context": { "scenarioPath": "/scenario" }
    }
  }
}
```

- genui does not attach the data model; the app reads it from
  `SurfaceController.contextFor(surfaceId).dataModel` and puts it in metadata.
- genui writes `timestamp` in local time without a zone. The server never uses
  it and records its own receive time.
- The client sends `a2uiClientCapabilities` on every turn.
- The first message of a plan, sent from the opening page, also carries
  `homewardStoryReason` in metadata: the reason the buyer picked, as a
  `StoryReason` name. The server sets it on the plan before the model is
  called, so the reason never depends on the model reading it from the text
  (D107).
- Clients may serialize absent optional fields as explicit `null`
  (`configuration`, `metadata`, `extensions`, `taskId`). The server treats
  `null` and absent the same.

```json
"metadata": {
  "a2uiClientCapabilities": { "v0.9": { "supportedCatalogIds": ["…"] } },
  "a2uiClientDataModel": {
    "version": "v0.9",
    "surfaces": {
      "t3-affordability": {
        "scenario": {
          "price": { "minorUnits": 35000000, "currency": "EUR" },
          "downPayment": { "minorUnits": 12000000, "currency": "EUR" }
        }
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
      "surfaceId": "t3-affordability",
      "components": [
        { "id": "root", "component": "Column", "children": ["summary", "slider", "payment", "commit"] },
        { "id": "summary", "component": "AffordabilitySummary", "scenario": { "path": "/scenario" }, "market": { "path": "/market" }, "profile": { "path": "/profile" } },
        { "id": "slider", "component": "AmountSlider", "label": "Down payment", "value": { "path": "/scenario/downPayment" }, "bounds": { "path": "/derived/downPaymentBounds" }, "shareOf": { "path": "/scenario/price" }, "currency": { "path": "/market/currency" } },
        { "id": "payment", "component": "PaymentBreakdown", "scenario": { "path": "/scenario" }, "market": { "path": "/market" }, "profile": { "path": "/profile" } },
        { "id": "commit", "component": "Button", "child": "commit_label", "action": { "event": { "name": "commit_scenario", "context": { "scenarioPath": "/scenario" } } } },
        { "id": "commit_label", "component": "Text", "text": "Use this scenario" }
      ]
    }
  }
}
```

A progress data part carries its own media type, so an A2UI client that does
not know it skips it; `genui_a2a` 0.10.x logs a warning and moves on. Step
labels are written by server code from the plan, never by the model.

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
| `t{turn}-{slug}` | On the journey page of turn `{turn}` | Model, validated by server; `t{turn}-homes` and `t{turn}-retry` are server-drawn fallbacks (D109) |

- At most two inline surfaces per turn.
- Surface IDs are unique per session.

### Lifecycle

- An inline surface is created in its turn and never updated by a later turn.
- When a later commit supersedes it, the server writes `/ui/locked: true` into
  its data model. Interactive Homeward components render read-only when locked.
- `deleteSurface` is used only when a turn is canceled mid-stream.

### Replay

Every A2UI message the server forwards is stored with its turn. Opening a plan
replays them in order into a fresh `SurfaceController`. Uncommitted what-if
changes are not stored and are not replayed.

## Data Model

Every surface is seeded by the server with the slices its components bind to.
The model binds to these paths and never writes values.

```text
/story                   the story, its answers, and map markers
/lineup                  the city's photo lineups, homes and life
/tradeoff
  options                the ways to live compare_areas priced
/assessment              candidates, rows, markers, routes; sample homes carry their listing
/profile                 BuyerProfile
/market                  ResolvedMarket in the pack's published format (D66)
  id, name, currency
  lending                every lending rule that applies to this buyer
  purchaseCosts, recurringCosts
  loanTypes              loan types with spread range and default spread
  referenceRates         dated snapshots for those loan types
  livingCosts            the living cost table when a left-to-live-on rule applies
  pendingRules, requiredFields
  obstacles              applicable foreign buyer obstacles
  process                applicable steps and documents
  sources                source list for everything above
/scenario                price, downPayment, termYears, loanTypeId, rateSpreadPpm,
                         rateShockPpm, associationFee
/derived                 computed by server tools at seed time
  affordability          maxLoan, maxPrice, bindingConstraint, headroom
  downPaymentBounds      min, max, step
  payment                interest, amortization, fees, total
  stress                 series and limit line
  costs                  itemized upfront costs and total
  cashNeeded
  eligibility            checks with status and reason
/ui                      locked
```

Data model values are JSON-shaped as produced by `jsonDecode`; see the binding
rules in `docs/CATALOG.md`.

In slices the buyer edits, `/profile` and `/scenario`, and in `/derived`, money
values are `{ "minorUnits": 35000000, "currency": "EUR" }` and rates are integer
parts per million in fields ending in `Ppm`. `/market` is read-only and uses the
pack format: amounts as decimal strings and rates as percent strings, so the
same `common` models parse packs and the slice.

`/derived` holds seeded values so a surface renders correctly before any
interaction. Homeward components recompute their own figures from `/scenario`
and `/market` through `common/finance` when the buyer changes a bound input.

## Actions

| Action | Context | Server behavior before the model runs |
| --- | --- | --- |
| `answer` | `facet`, `value`, `label`; `pin` for a dropped pin; `storyPath` for the household | Fold one answer into the story (D121): a place is found in the city or taken from the pin, a photo applies its traits, an area option its area, home type, rooms, and price range; the facet counts as answered |
| `commit_story` | `storyPath` | Fold the surface's `/story` fields, pins included, into the story and confirm it; in a city with sample homes, pick the three that fit (D122) |
| `commit_profile` | `profilePath` | Save every valid field from the surface's `/profile` over the saved profile, clear the draft, and report invalid fields |
| `select_market` | `marketId` | Resolve market, write to plan; profile facts on the surface become the profile draft |
| `commit_scenario` | `scenarioPath` | Parse `/scenario`, refuse it unless amounts are in the market currency and `withinMaxLtv` holds, then save it and clear the draft |
| `change` | `section` | Release the decision in the plan, then run the model |
| `explain` | `topic`, `path` | Run the model with the resolved value and its source attached |
| `compare_loan_types` | `scenarioPath` | Run the model with loan types attached |

Every interactive surface is created with `sendDataModel: true` so committed
values arrive with the action.

Actions the server can complete without the model do not call the model.

`server/lib/agent/actions/apply_action.dart` applies an action to the plan before
the model runs and hands the model a summary: the action, the surface, whether
it was applied, and why not or which fields were refused. Values are read as
the basic inputs write them: a `ChoicePicker` writes a one-item list, and a
`TextField` writes a number or a numeric string, so profile fields are
normalized by their data model kind first. In M1 every action runs the model;
`explain` and the actions of later milestones reach it with their context.

## Server Validation Passes

Every A2UI message the model produces passes these in order before it reaches
a client. Failures are returned to the model as `VALIDATION_FAILED` errors in
the A2UI error shape, `{ code, surfaceId, path, message }`, where `path` is a
JSON pointer into the rejected message, with at most two correction rounds per
turn. A message is forwarded only if every pass accepts it; the first failing
pass rejects it.

1. **Parse.** One JSON object per message inside an `a2ui` fenced block; the
   catalog skill asks for one per line, and a message spread over several lines
   is joined once its braces close.
2. **Envelope.** `A2uiMessage.fromJson` from `a2ui_core`: exactly one message
   type, `version` is `v0.9`. It reports wrong field types as raw cast errors,
   so the pass maps any `TypeError` to a `VALIDATION_FAILED` error.
3. **Ownership.** Surface ID matches the turn namespace.
   The model may send only `createSurface`, with the Homeward catalog ID and at
   most two per turn, and `updateComponents` for a surface it created in this
   turn. `updateDataModel` and `deleteSurface` are the server's.
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
7. **Structure.** Exactly one `root`, every child ID exists, no cycles, no
   orphans. `a2ui_core` does not check this, so the pass does. The check runs
   on the surface's components after merging each `updateComponents`, so every
   message must leave a complete tree; references are read from `child`,
   `children`, `tabs[].child`, `trigger`, and `content` as the v0.9 basic
   catalog defines them.
8. **Paths.** The session's stored messages are replayed into an `a2ui_core`
   `MessageProcessor` at the start of the turn. Each candidate message goes
   through that shadow processor: an update to an unknown surface fails, and
   every bound absolute path must resolve in the data model the server will
   seed. A `createSurface` repeating one accepted earlier in the turn changes
   nothing and is not forwarded, since models resend it when correcting. An input may bind to a missing field of an
   existing object, which it will write; relative template paths are skipped.
9. **Actions.** Action names are in the action table. An action turn that
   forwards no surface while a drawing decision is open is asked once more,
   naming the decision and, for `profileFields`, the fields still missing
   (D96). Text written in answer to that request is not shown: the buyer
   already has the turn's words, and the request is the server's, not
   theirs (D124).
10. **Forms.** A surface with a `commit_profile` action binds an input to every
    profile path the market still needs for this buyer, the same paths the
    turn context lists as missing (D83). The pass adds the inputs the model
    left out, in the order the profile slice declares them, above the button
    that sends the action, and picks each one by the field's value shape: a
    `MoneyInput` for money, a `LocationPicker` in country mode for a country,
    a `ChoicePicker` for a choice, a `CheckBox` for a yes or no, a
    `HouseholdInput` for the household, and a number `TextField` for the rest
    (D95). The message is rejected only when there is nowhere to put them,
    such as a button with no container.
11. **Seed.** The server prepends `createSurface` with `sendDataModel: true` if
    the model omitted it, and emits `updateDataModel` for the slices the
    components bind to.

Measured in spike S5: schema validation costs about 12 µs per component in the
AOT server binary.

After two failed correction rounds the turn ends with the model's text and a
single `Text` surface offering to retry.
