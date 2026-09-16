# Homeward Architecture

## Overview

```text
┌──────────────────────────── app (Flutter: iOS, Android, Web) ────────────────────────────┐
│ features ─ controllers ─ repositories                                                    │
│ genui SurfaceController ◄── Homeward catalog (items + client functions)                  │
│                                   │                                                      │
│                                   └── common/finance (pure Dart)                         │
└───────────────┬───────────────────────────────────────────────────────────▲──────────────┘
                │ A2A JSON-RPC message/stream + Firebase ID token + BYO key │ SSE: text + A2UI
┌───────────────▼───────────────────────── server (Dart, Cloud Run) ─────────┴──────────────┐
│ middleware ─ a2a ─ agent (turn orchestrator, stream parser, validation passes)           │
│ tools ──► common/finance · markets (curated packs)                                       │
│ gemini: Interactions API client (REST + SSE) · Live API client (phase 2, WebSocket)      │
│ data: firebase_admin_sdk ─► Firestore                                                     │
└──────────────────────────────────────────────────────────────────────────────────────────┘
```

Three rules shape everything:

1. **Rules in data.** Market rules live in rule packs. Code reads packs; prompts
   describe how to use them; widgets never know a market.
2. **Math once.** `common/finance` is the only implementation of every formula.
   Server tools call it to seed surfaces; client functions call it to recompute
   on drag. There is no second implementation to keep in parity.
3. **Server owns truth.** The plan record in Firestore is the source of truth
   for decisions. Gemini interaction history is a cache that can be rebuilt from
   the plan record at any time.

## Repository Shape

```text
/app
/server
/common
/markets
/tool
/docs
AGENTS.md
Makefile
pubspec.yaml            workspace: app, common, server, tool
pubspec.lock            the only lockfile
analysis_options.yaml   shared analyzer, linter, formatter settings
```

The repository is a Dart pub workspace. Every package declares
`resolution: workspace`, so all packages resolve to one set of versions and
code generators cannot drift between app and server. Each package's
`analysis_options.yaml` includes its lint set (`flutter_lints` or `lints`) and
the root file.

| Package | Pub name |
| --- | --- |
| `app` | `homeward` |
| `common` | `common` |
| `server` | `homeward_server` |
| `tool` | `homeward_tool` |

### Dependency Direction

```text
app ────► common
server ─► common
tool ───► common, server (eval runner boots the server in-process)
common ─► nothing Homeward-specific, never Flutter
```

`app` and `server` never import each other.

## `/common`

Pure Dart. The only package allowed to define domain vocabulary.

```text
common/lib/
  common.dart
  money/          Money, Currency, Rate (parts per million), Rounding, ISO 4217 table
  finance/        affordability, amortization, payment, stress, purchase_costs, fx
  markets/        MarketRulePack models, buyer predicates, overlay resolution
  profile/        BuyerProfile, Residency, Citizenship, Employment
  plan/           Plan, Scenario, ChecklistState
  catalog/        ComponentApi declarations: names, schemas, function signatures,
                  examples; generated/ skill text
  a2ui/           additions over a2ui_core: client action parsing, component
                  schema, allow-list, and tree structure validation; the server
                  adds ownership, shadow state, and seeding on top
  wire/           A2A subset models (Freezed), SSE framing, the Homeward A2A
                  client the app uses, action names, data model paths, error codes
  errors/         HomewardError
```

Rules:

- Freezed for multi-field data classes, `json_serializable` for wire and
  persistence.
- Single-value wrappers are extension types (`Rate`, `Currency`): type safety
  with no allocation, and their JSON is the bare number or string.
- `Money` is integer minor units plus a `Currency`. Arithmetic across currencies
  throws.
- `Rate` is integer parts per million, exact for every published rate. `Rate.bps`
  exists for convenience only.
- `Currency` accepts only ISO 4217 codes from the generated table
  (`make iso-4217`), which records its SIX publication date.
- Nothing rounds silently. Every conversion to money takes a `Rounding` with a
  mode and a step. Rounding is exact integer arithmetic that stays within 53
  bits, so results match on the VM and on the web.
- Floating point is allowed only inside a formula that needs it, such as an
  annuity power, and is converted back through a `Rounding` at the formula's
  boundary.
- Every formula is a pure top-level function or a static method on a small
  value type. No service classes, no I/O, no clocks; time is a parameter.
- `catalog/` is the contract shared by the app's widget implementations, the
  server's validation passes, and the generated prompt skill. A component that
  is not declared here does not exist.
- A2UI protocol types come from `a2ui_core`, the pure Dart package genui is
  built on, pinned to an exact version: message classes, `ComponentApi`,
  `Catalog`, `CommonSchemas`, and `MessageProcessor`. `common/a2ui` adds only
  what it lacks. No Homeward package re-implements a type `a2ui_core` provides.

## `/markets`

```text
markets/
  packs/
    SE.json
    PT.json
    PT-30.json
  rates/
    SE.json
    EUR.json
  schema/
    market_rule_pack.schema.json
```

Packs are validated by `make markets-check` against the schema generated from
`common/markets`. The server bundles `markets/` into its image. The app never
loads packs; the values a surface needs arrive in its data model. See
`docs/MARKETS.md`.

## `/server`

Dart, `shelf` and `shelf_router`, deployed to Cloud Run.

```text
server/
  bin/server.dart   production entry point
  tool/dev.dart     development entry point with hot reload
  lib/
    app.dart        router and middleware pipeline
    run_server.dart serve, wait for SIGTERM or SIGINT, close
    config/         ServerConfig from environment
    request/        RequestContext, trace header parsing, request ids
    logging/        LogEntry, Cloud Logging JSON and text formatters
    http/           response helpers
    health/         GET /health
    middleware/     request context, request logging, internal errors;
                    later auth, app check, gemini key, redaction, rate limit, cors
    a2a/            agent card, json-rpc dispatch, sse writer, task registry
    agent/          turn orchestrator, prompt assembly, stream parser,
                    validation passes, surface seeding, board compiler
    gemini/         interactions client, live client, request/response models
    tools/          one file per tool, each a thin adapter over common + repositories
    markets/        pack loader, overlay resolver, coverage
    data/
      providers/    composition root: builds every dependency once
      repository/   sessions, turns, plans
  prompts/
    role.md
    flow.md
    markets.md
    style.md
    generated/catalog_skill.md
  Dockerfile
```

Rules:

- `shelf` handlers are thin: parse, call one orchestrator or repository method,
  write the response. No business logic in handlers.
- Every external dependency (Firestore, Gemini, clock, id generator) is injected
  through constructors from `data/providers`. No static SDK access.
- Tools never call Gemini and never touch HTTP. They take typed input, call
  `common` and repositories, and return a typed result plus data model patches.
- The agent loop is the only place that talks to Gemini.
- There is no dependency injection framework on the server. `data/providers`
  is a plain composition root.
- Logging uses `package:logging`. Code logs a plain message or a `LogEntry` with
  structured fields; one listener formats records as Cloud Logging JSON in
  production and as text locally. Request context travels in a zone, so any
  log line written while handling a request carries its request ID and trace
  without passing a logger around.
- Paths ending in `z` are avoided because Cloud Run reserves some of them.

### Why A Dart Server

- `common/finance` runs unchanged on the server and in the app, so seeded
  figures and live recomputation cannot drift.
- `common/catalog` drives server validation, app widgets, and the prompt skill
  from one declaration.
- Google has no official Dart GenAI SDK. The Interactions API is plain REST with
  SSE streaming, so `server/lib/gemini` is a thin typed client. This is spike S2.

## `/app`

Flutter for iOS, Android, and Web, with macOS kept as a development target for
fast local iteration. macOS is never a release target, and features that need
App Check or platform integrations are not required to work there. The
application ID and bundle identifier are `se.moonwise.homeward`. The
implementation rules follow the Moonwise conventions used in Purrtrait.

```text
app/lib/
  main.dart
  catalog/
    homeward_catalog.dart
    items/          one CatalogItem per component, builder only
    functions/      ClientFunction adapters over common/finance
    bindings/       typed readers over genui DataContext
  data/
    models/
    providers/
    repository/
  features/<feature>/
    <feature>_screen.dart
    <feature>_controller.dart
    <feature>_state.dart
    widgets/
  navigation/
  ui/               App* tokens and primitives
  widgets/          provider-bound shared widgets
  display/          presentation helpers over common models
```

### Flutter Stack

- `genui` pinned to an exact version, A2UI v0.9.
- The A2A connection uses the Homeward client from `common/wire`, not
  `genui_a2a`; see `docs/SPIKES.md` S1. `genui_a2a` appears only in the app's
  contract test.
- `http` for the A2A client's requests; headers are added per request.
- `freezed`, `json_serializable`.
- `riverpod_annotation`, `flutter_riverpod`, `hooks_riverpod`, `flutter_hooks`.
- `go_router`.
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_app_check`.
- `flutter_secure_storage` for the user's Gemini key.
- `fl_chart` for charts.
- `google_fonts`, `intl`.

### genui Boundary

genui is 0.x and changes shape between minor versions. Everything that touches
its API is confined to two places:

- `app/lib/catalog/` for catalog items, client functions, and data bindings.
- `app/lib/data/repository/agent_repository.dart` and its providers for the
  `SurfaceController`: it submits actions from `onSubmit` through the Homeward
  A2A client, attaching capabilities and the surface data model, and feeds
  every received `a2ui_core` message to `handleMessage`.

Features read surfaces through providers and render `Surface` widgets. They
never construct genui objects. A genui upgrade should touch those two places
and nothing else.

### Catalog Items

Each catalog item is three layers, and only the first knows about genui:

```text
items/payment_breakdown_item.dart       CatalogItem: schema from common, reads bindings, builds widget
ui/…                                    App* primitives the widget is composed from
common/finance/payment.dart             the numbers
```

The widget a catalog item builds takes plain typed values and callbacks, so it
renders identically in the catalog gallery, in a surface, and on the plan board.

### Features

| Feature | Owns |
| --- | --- |
| `startup` | Session restore, anonymous sign-in |
| `api_key` | Entering, verifying, and removing the Gemini key |
| `plans` | Plan list and creating a plan |
| `plan_chat` | Transcript, composer, inline surfaces, turn streaming |
| `plan_board` | Board surface placement: side pane on wide screens, sheet on phones |
| `catalog_gallery` | Every catalog item with example data |
| `wire_inspector` | A2A frames, A2UI messages, local recompute counter |
| `settings` | Key, disclaimer, about, reset |

The rules from Purrtrait apply unchanged: lean screens, generated Riverpod
controllers with Freezed state, `SafeNotifierState` for mutating controllers,
snapshot state and dependencies before the first `await`, transient messages
through the message bus, providers under `lib/data/providers`, `App*` prefix
reserved for `lib/ui`.

## Turn Sequence

```text
app                         server                                 gemini
 │ message/stream (text)      │                                       │
 ├───────────────────────────►│ load session + plan (Firestore)       │
 │                            │ lease turn                            │
 │                            │ assemble prompt + tools               │
 │                            ├──────── interactions.create stream ──►│
 │                            │◄──────── text delta ──────────────────┤
 │◄── status-update (text) ───┤                                       │
 │                            │◄──────── function call ───────────────┤
 │                            │ run tool → result + data patches      │
 │                            ├──────── function result ─────────────►│
 │                            │◄──────── ```a2ui JSONL ───────────────┤
 │                            │ parse → validate → seed → forward     │
 │◄── data part (A2UI) ───────┤                                       │
 │                            │ persist turn, update plan, compile board
 │◄── data part (board A2UI) ─┤                                       │
 │◄── status-update completed ┤                                       │
```

What-if during a drag never leaves the device:

```text
AmountSlider ─► DataModel /scenario/downPayment ─► bound items rebuild
                                                   └► common/finance recompute
```

Committing sends an A2UI action with the surface data model; the server applies
the committed values to the plan record deterministically before the model
sees the turn.

## Firebase And Google Cloud

- Project: new Moonwise project, `homeward-staging`.
- Firebase Auth, anonymous provider.
- Firestore, region `eur3`.
- App Check: reCAPTCHA v3 on Web. Device builds are not distributed through the
  stores, so App Attest and Play Integrity are unlikely to pass; simulators,
  sideloaded Android builds, and personally provisioned iPhones use registered
  debug tokens. Unverified until spike S6.
- Cloud Run, region `europe-north1`, container built from `server/Dockerfile`.
- Firebase Hosting serves the Flutter web build; `/a2a`, `/api/**`, and
  `/.well-known/**` rewrite to Cloud Run so web runs same-origin.
- No Gemini key is stored in the project. Keys are bring-your-own; see
  `docs/REQUIREMENTS_SERVER.md`.

### Cost

Homeward is designed to cost nothing to run (D40, D42, D43):

- Billing is attached to `homeward-staging` because Cloud Run, Artifact
  Registry, Cloud Scheduler, and Hosting rewrites require it, with a budget alert
  at €1.
- Cloud Run: minimum 0 and maximum 2 instances; cold starts are accepted.
- Artifact Registry keeps the last three server images.
- Firestore stays within its free daily quota; one Cloud Scheduler job.
- No Secret Manager, no reCAPTCHA Enterprise, no paid Gemini features such as
  Google Search grounding.
- No paid store accounts: builds reach devices as web, simulators, sideloaded
  Android APKs, and personally provisioned iPhones.

## Code Rules

- No comments of any kind, including doc comments. If code needs explaining,
  rename, extract, or introduce a type.
- One public type per file. File name matches the type.
- Functions do one thing. Prefer early returns and pattern matching over nested
  conditionals.
- Sealed classes and exhaustive `switch` for every closed set: coverage, buyer
  residency, cost rule kinds, tool results, wire events.
- No `dynamic`. Strict casts, strict inference, strict raw types.
- No hard-coded market, currency, or locale outside `markets/` and tests.
- No raw colors, text styles, or decorations outside `app/lib/ui`.
- Reuse before creating: check `common`, `app/lib/ui`, and `app/lib/widgets`
  first. A second copy of anything is a reason to extract; a first copy is not.
- Generated files are committed and never edited by hand.
