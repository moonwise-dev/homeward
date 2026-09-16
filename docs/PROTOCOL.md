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
  "name": "Homeward",
  "description": "Home-buying finance agent: affordability, purchase costs, and foreign buyer obstacles for any location.",
  "url": "https://homeward-staging.web.app/a2a",
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
  "skills": [
    { "id": "affordability", "name": "Affordability", "description": "Maximum loan and price, binding constraint, what-if." },
    { "id": "purchase_costs", "name": "Purchase costs", "description": "Upfront taxes and fees for a buyer in a market." },
    { "id": "foreign_buyer", "name": "Foreign buyer", "description": "Obstacles, restrictions, and process for non-residents." },
    { "id": "buying_process", "name": "Buying process", "description": "Steps and documents for a purchase." }
  ]
}
```

### Methods

| Method | Use |
| --- | --- |
| `message/stream` | Every turn: text or action in, SSE of status and data parts out |
| `tasks/get` | Resume after a dropped stream |
| `tasks/cancel` | Buyer stops a running turn |

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
          "supportedCatalogIds": ["https://moonwise.se/homeward/catalogs/v1/catalog.json"]
        }
      }
    }
  }
}
```

An action turn carries the A2UI action as a data part and the surface data
model in metadata:

```json
{
  "kind": "data",
  "metadata": { "mimeType": "application/json+a2ui" },
  "data": {
    "action": {
      "name": "commit_scenario",
      "surfaceId": "t3-affordability",
      "sourceComponentId": "commit",
      "timestamp": "2026-10-02T09:14:03Z",
      "context": { "scenarioPath": "/scenario" }
    }
  }
}
```

```json
"metadata": {
  "a2uiClientCapabilities": { "supportedCatalogIds": ["…"] },
  "a2uiClientDataModel": {
    "surfaces": { "t3-affordability": { "scenario": { "price": 35000000, "downPayment": 12000000 } } }
  }
}
```

### Server To Client

SSE events, in order:

1. `status-update` with `state: working`.
2. Zero or more agent text parts, streamed as they arrive.
3. Zero or more data parts, one A2UI message each.
4. `status-update` with `state: completed`, `failed`, or `canceled`, `final: true`.

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

### Extension Activation

The client sends `X-A2A-Extensions: https://a2ui.org/a2a-extension/a2ui/v0.9`.
The server rejects `message/stream` without it.

## Surfaces

### Identity And Placement

Placement is encoded in the surface ID so it survives any connector.

| Surface ID | Placement | Author |
| --- | --- | --- |
| `board` | Plan board: side pane on wide screens, sheet on phones | Server, compiled from the plan record |
| `t{turn}-{slug}` | Inline, attached to the agent message of turn `{turn}` | Model, validated by server |

- At most two inline surfaces per turn.
- The model never creates, updates, or deletes `board`.
- Surface IDs are unique per session.

### Lifecycle

- An inline surface is created in its turn and never updated by a later turn.
- When a later commit supersedes it, the server writes `/ui/locked: true` into
  its data model. Interactive Homeward components render read-only when locked.
- `deleteSurface` is used only when a turn is canceled mid-stream.
- `board` is created once per session and replaced wholesale with
  `updateComponents` and `updateDataModel` after every plan change.

### Replay

Every A2UI message the server forwards is stored with its turn. Opening a plan
replays them in order into a fresh `SurfaceController`. Uncommitted what-if
changes are not stored and are not replayed.

## Data Model

Every surface is seeded by the server with the slices its components bind to.
The model binds to these paths and never writes values.

```text
/profile                 BuyerProfile
/market                  resolved rules for this buyer in this market
  id, name, currency, coverage
  lending                maxLtv, maxDsti, maxLti, stress, maxTermYears, amortization
  costs                  applicable purchase cost rules
  loanTypes              loan types with reference rate and spread range
  obstacles              applicable foreign buyer obstacles
  process                applicable steps and documents
  sources                source list for everything above
/scenario                price, downPayment, termYears, loanTypeId, rateShockBps
/derived                 computed by server tools at seed time
  affordability          maxLoan, maxPrice, bindingConstraint, headroom
  downPaymentBounds      min, max, step
  payment                interest, amortization, fees, total
  stress                 series and limit line
  costs                  itemized upfront costs and total
  cashNeeded
  eligibility            checks with status and reason
/plan                    committed decisions, board only
/ui                      locked
```

Money values are integer minor units. Rates are integer basis points. Every
money object carries its currency at the nearest `market.currency` or explicit
`currency` field.

`/derived` holds seeded values so a surface renders correctly before any
interaction. Homeward components recompute their own figures from `/scenario`
and `/market` through `common/finance` when the buyer changes a bound input.

## Actions

| Action | Context | Server behavior before the model runs |
| --- | --- | --- |
| `commit_profile` | `profilePath` | Validate and write profile to plan |
| `select_market` | `marketId` | Resolve market, write to plan |
| `commit_scenario` | `scenarioPath` | Validate against rules, write scenario to plan |
| `toggle_document` | `documentId` | Toggle checklist state, recompile board, no model call |
| `change` | `section` | Release the decision in the plan, then run the model |
| `explain` | `topic`, `path` | Run the model with the resolved value and its source attached |
| `compare_loan_types` | `scenarioPath` | Run the model with loan types attached |

Every interactive surface is created with `sendDataModel: true` so committed
values arrive with the action.

Actions the server can complete without the model do not call the model.

## Server Validation Passes

Every A2UI message the model produces passes these in order before it reaches
a client. Failures are returned to the model as `VALIDATION_FAILED` errors in
the A2UI error shape, with at most two correction rounds per turn.

1. **Parse.** One JSON object per line inside an `a2ui` fenced block.
2. **Envelope.** Exactly one message type, `version` is `v0.9`.
3. **Ownership.** Surface ID matches the turn namespace; `board` is refused.
4. **Allow-list.** Component is in the agent-visible catalog subset.
5. **Schema.** Component properties validate against `common/catalog`.
6. **Bound numbers.** Properties annotated as money, rate, or percentage are a
   `path` or a function `call`, never a literal.
7. **Structure.** Exactly one `root`, every child ID exists, no cycles, no
   orphans.
8. **Paths.** Every bound path exists in the seeded data model for that surface.
9. **Actions.** Action names are in the action table.
10. **Seed.** The server prepends `createSurface` with `sendDataModel: true` if
    the model omitted it, and emits `updateDataModel` for the slices the
    components bind to.

After two failed correction rounds the turn ends with the model's text and a
single `Text` surface offering to retry.
