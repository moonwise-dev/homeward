# Homeward Architecture

How Homeward is built, run, and checked. `docs/PROTOCOL.md` has what travels
between the app and the server, `docs/AGENT.md` the agent loop and its tools,
and `docs/CATALOG.md` the blocks.

## Overview

```text
┌─────────────────────── app (Flutter: Web, iOS, Android) ────────────────────────┐
│ screens ─ view models ─ repositories                                            │
│ genui SurfaceController ◄── Homeward catalog (items + client functions)         │
│                                   └── common (pure Dart)                        │
└───────────────┬──────────────────────────────────────────────────▲──────────────┘
                │ A2A JSON-RPC message/stream + the buyer's Gemini key │ SSE: text + A2UI
┌───────────────▼───────────────── server (Dart, Cloud Run) ─────────┴─────────────┐
│ middleware ─ a2a ─ agent (turn orchestrator, stream parser, validation passes)  │
│ tools ──► research (open data: places, nearby, routes)                          │
│ gemini: Interactions API client (REST + SSE)                                    │
│ sessions: in memory                                                             │
└─────────────────────────────────────────────────────────────────────────────────┘
```

Three rules shape everything:

1. **Gemini composes.** The model decides what each buyer's screen shows and
   asks. The server validates what it draws and never picks the next question
   or draws the screen for it (D129).
2. **Math once.** `common` is the only implementation of every formula. Server
   tools call it to seed surfaces; client functions call it to recompute on the
   device. There is no second implementation to keep in parity.
3. **Server owns truth.** The session the server holds keeps every turn: its
   input, text, and the A2UI messages the server forwarded. Gemini interaction
   history is a cache that can be rebuilt from it at any time.

Nobody signs in (D173). The buyer's Gemini key is the only credential, sent
with each turn and never kept, and a plan is reached by its session's ID.

## Repository Shape

```text
/app
/server
/common
/tool
/markets                sample rules, rates, and homes: data, not a package
/docs
AGENTS.md
Makefile
pubspec.yaml            workspace: app, common, server, tool
pubspec.lock            the only lockfile
analysis_options.yaml   shared analyzer, linter, formatter settings
firebase.json           Firebase Hosting for the web build, nothing else
```

The repository is a Dart pub workspace. Every package declares
`resolution: workspace`, so all packages resolve to one set of versions and
code generators cannot drift between app and server. Each package's
`analysis_options.yaml` includes its lint set (`flutter_lints` or `lints`) and
the root file.

| Package | Pub name | Holds |
| --- | --- | --- |
| `app` | `homeward` | The Flutter app |
| `common` | `common` | Pure Dart shared by all: money, the catalog contract, wire types |
| `server` | `homeward_server` | The agent server |
| `tool` | `homeward_tool` | The catalog generator and check, the A2UI schema vendoring, the live probe, the local server launcher |

```text
app ────► common
server ─► common
tool ───► common, server (the catalog check runs the server's validator)
common ─► nothing Homeward-specific, never Flutter
```

`app` and `server` never import each other.

## `/common`

Pure Dart. The only package allowed to define domain vocabulary.

```text
common/lib/
  common.dart
  money/          Money, Currency, Rate (parts per million), Rounding, the ISO 4217 table
  finance/        annuity and straight amortization, monthly payment, amortization
                  tiers, brackets
  affordability/  largest loan, maximum price, monthly ceilings, stress rate,
                  down payment bounds, the binding rule
  costs/          purchase costs from a market's cost rules
  markets/        market rule packs, reference rates, living costs, exchange
                  rates, resolved for one buyer
  samples/        the labelled sample homes: Listing, kind of home, outdoor space,
                  style, and a home priced for one household
  profile/        BuyerProfile, the facts the rules read
  plan/           Scenario: a price, down payment, term, and loan type
  brief/          BriefItem, Gemini's notes on the household
  rent/           rent split between people sharing, and buying against renting
  savings/        the savings plan toward the cash a home needs
  week/           the week's places and trips
  time/           CalendarDate, Period
  geo/            GeoPoint, TravelMode, polyline encoding, path simplification,
                  the CLDR country names
  catalog/        ComponentApi declarations: names, schemas, function signatures,
                  data model slices, examples; generated/ catalog document
  a2ui/           additions over a2ui_core: client action parsing, component
                  schema, allow-list, and tree structure validation; the server
                  adds ownership, shadow state, and seeding on top
  wire/           A2A subset models (Freezed), SSE framing, the Homeward A2A
                  client the app uses, turn transcripts, error codes
```

Rules:

- Freezed for multi-field data classes, `json_serializable` for wire data.
- Single-value wrappers are extension types (`Rate`, `Currency`): type safety
  with no allocation, and their JSON is the bare number or string.
- `Money` is integer minor units plus a `Currency`. Arithmetic across currencies
  throws.
- `Rate` is integer parts per million, exact for every published rate. `Rate.bps`
  exists for convenience only.
- `Currency` accepts only ISO 4217 codes from `money/iso_4217.dart`, a table
  that records its SIX publication date (D178).
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

## `/server`

Dart, `shelf` and `shelf_router`, deployed to Cloud Run. It owns the agent
loop, tools, validation, and session state, and holds no key of its own.

```text
server/
  bin/server.dart   production entry point
  tool/dev.dart     development entry point with hot reload
  lib/
    app.dart        router and middleware pipeline
    run_server.dart serve, wait for SIGTERM or SIGINT, drain, exit
    config/         ServerConfig from environment
    request/        RequestContext, trace header parsing, request ids
    logging/        LogEntry, Cloud Logging JSON and text formatters
    http/           response helpers
    errors/         HomewardFailure, the failures a client is told
    health/         GET /health
    keys/           POST /api/keys/verify
    sessions/       creating a plan and reading one back
    middleware/     request context, request logging, cors, internal errors,
                    gemini key
    development/    the local server's `.env` reader and GET /dev/config
    a2a/            agent card, json-rpc dispatch, sse writer, task registry
    agent/          stream parser, turn run, validation
      prompt/       prompt assembler, turn context
      turn/         turn orchestrator and run, tool belt, seeds, surface
                    seeder, corrections
      validation/   validation passes
    gemini/         interactions client, model fallback, request/response
                    models
    tools/          the tool interface and the list of tools, one file per tool
    markets/        loads the sample market packs and sample homes from
                    `markets/` at startup
    research/       open-data clients (Nominatim, Overpass, routing), polite
                    and cached in memory; the listing reader and the researcher
                    that asks Gemini one structured question on the turn's key
    ids/            random identifiers
    data/
      models/       the session record
      providers/    composition root: builds every dependency once
      repository/   the sessions the server holds, in memory
  prompts/
    role.md
    style.md
    generated/catalog_skill.md
    reply.md        the checklist that follows the turn context
  Dockerfile
```

Rules:

- `shelf` handlers are thin: parse, call one orchestrator or repository method,
  write the response. No business logic in handlers.
- Every external dependency (Gemini, clock, id generator) is injected through
  constructors from `data/providers`, a plain composition root. There is no
  dependency injection framework and no static SDK access.
- Tools never call Gemini themselves. They take typed input, call `common`,
  repositories, and `research`, and return a typed result plus data model
  patches. Research is the only place besides the agent loop that calls out:
  to open-data services, through one polite client, and, for `read_listings`
  alone, to Gemini through the researcher the turn hands it (D156).
- The agent loop is the only place that talks to Gemini; the researcher goes
  through its model selection, on the turn's key.
- Logging uses `package:logging`. Code logs a plain message or a `LogEntry` with
  structured fields; one listener formats records as Cloud Logging JSON in
  production and as text locally. Request context travels in a zone, so any
  log line written while handling a request carries its request ID and trace
  without passing a logger around.
- Paths ending in `z` are avoided because Cloud Run reserves some of them.

### Why A Dart Server

- `common` runs unchanged on the server and in the app, so seeded figures and
  live recomputation cannot drift.
- `common/catalog` drives server validation, app widgets, and the prompt skill
  from one declaration.
- The Interactions API is plain REST with SSE streaming, so `server/lib/gemini`
  is a thin typed client (S2). Google lists no Dart package for that API;
  whether the review wants Genkit Dart instead is open (D177).

### Routes

| Method | Path | Purpose |
| --- | --- | --- |
| GET | `/.well-known/agent-card.json` | A2A agent card |
| POST | `/a2a` | A2A JSON-RPC: `message/stream`, `tasks/get`, `tasks/cancel`. A turn needs the Gemini key header |
| POST | `/api/keys/verify` | Looks up the first turn model with the key in the header, which spends no generate request: 200, or 422 `gemini_key_invalid` |
| POST | `/api/sessions` | Creates a session, which is an empty plan |
| GET | `/api/sessions/:id` | A plan's turns, for replay when it is opened (D90) |
| GET | `/health` | Liveness; not `/healthz`, which Cloud Run may reserve |
| GET | `/dev/config` | The developer's Gemini keys for the app, to `localhost` only; mounted by `server/tool/dev.dart` alone (D117) |

`/api/*` routes use the envelope `{ "ok": true, "data": {} }` and
`{ "ok": false, "error": { "code": "", "message": "", "retryAfterSeconds": 0 } }`,
where `retryAfterSeconds` appears only when waiting helps. `/a2a` uses JSON-RPC
errors with the same codes in `error.data.code`.

Every request passes, in order:

1. Request ID and trace context.
2. Request logging: method, path, status, and duration only. No header or
   body is ever logged, which is how `X-Homeward-Gemini-Key` stays out of
   logs; a test sends one and checks every record.
3. CORS: allows `HOMEWARD_ALLOWED_ORIGINS`, where `http://localhost:*` matches
   any local port, answers preflight for `Content-Type`,
   `X-Homeward-Gemini-Key`, and `X-A2A-Extensions`, refuses preflight from
   other origins, exposes `x-request-id`, and caches preflight for an hour.
4. Error mapping: an unhandled error becomes the `internal` envelope.

`/a2a` and `/api/keys/verify` then read the Gemini key into the request.

### The Gemini Key

- Read from `X-Homeward-Gemini-Key` on each request.
- Held only in the request context for the lifetime of the request.
- Passed to the Gemini client per call; the client has no key of its own.
- Never logged, persisted, included in errors, or sent anywhere except Gemini.
- Never accepted in a query string.

The server holds no keys of its own. One it needs later reaches it as an
environment variable (D115): from a Secret Manager secret on Cloud Run, from
`.env` locally, read into `ServerConfig` at startup and never logged.

### Error Codes

| Code | Meaning |
| --- | --- |
| `gemini_key_missing` | Key header absent |
| `gemini_key_invalid` | Gemini rejected the key |
| `gemini_quota_exhausted` | Gemini returned a quota error on every model it could try, or the models left after those at their request limit were overloaded (D171); includes the next reset, midnight Pacific |
| `gemini_credits_depleted` | The project behind the key has run out of prepaid credits |
| `gemini_unavailable` | The models tried were overloaded, stalled, or returned a server error, after the turn waited and asked again (D171) |
| `turn_in_progress` | Another turn is running in this session |
| `session_not_found` | The server holds no session with this ID |
| `validation_failed` | Model output could not be corrected |
| `internal` | Anything else |

### Sessions And Turns

- A session is created by `/api/sessions` and used as the A2A `contextId`.
  Its ID is 32 random hex characters, and holding it is what lets a caller
  use the plan (D173).
- Sessions live in the server's memory, at most 500; past that the one saved
  longest ago is dropped (D174). A restart forgets them all, so Cloud Run
  runs one instance.
- A session keeps every turn: the input, the text, the A2UI messages
  forwarded, the data model slices as the turn left them, and how it ended.
- One turn runs in a session at a time; a second is refused with
  `turn_in_progress` until the first ends.
- A turn runs as a task that outlives the HTTP stream that started it, kept
  for 10 minutes after it ends for `tasks/get`.

### Configuration

| Key | Purpose |
| --- | --- |
| `PORT` | The port to listen on, 8080 by default |
| `HOMEWARD_TURN_MODELS` | Turn model IDs in preference order |
| `HOMEWARD_THINKING_LEVEL` | Gemini thinking level |
| `HOMEWARD_HEADERS_DEADLINE` | Deadline for Gemini response headers, in seconds |
| `HOMEWARD_FIRST_STEP_DEADLINE` | Deadline for the first Gemini step, in seconds |
| `HOMEWARD_MODEL_COOLDOWN` | How long an overloaded model is skipped, in seconds |
| `HOMEWARD_MAX_CORRECTIONS` | Validation correction rounds |
| `HOMEWARD_MAX_FINISHING_ROUNDS` | Rounds that ask for a reply's missing plan or ask, 1 by default |
| `HOMEWARD_MAX_OVERLOAD_RETRIES` | Times a turn waits and asks again when the models it tried are overloaded, 2 by default |
| `HOMEWARD_OVERLOAD_WAIT` | The wait before asking again, in seconds, multiplied by the attempt; 3 by default |
| `HOMEWARD_ALLOWED_ORIGINS` | CORS origins |
| `HOMEWARD_PUBLIC_URL` | Base URL clients call, used for the agent card's `url` |
| `HOMEWARD_PROMPTS_DIR` | Prompt files; `/app/prompts` in the image |
| `HOMEWARD_MARKETS_DIR` | Sample market packs, rates, living costs, exchange rates, and homes; `markets` from the repository root locally, `/app/markets` in the image |
| `HOMEWARD_LOG_FORMAT` | `json` in the image, `text` by default locally |
| `GOOGLE_CLOUD_PROJECT` | The project named in a log line's trace link |

### Observability

- One JSON object per line on stdout, in the shape Cloud Logging parses:
  `severity`, `message`, `time`, `logger`, `requestId`, and structured fields.
- Traces link through `logging.googleapis.com/trace` and `spanId`, read from
  `traceparent` or `X-Cloud-Trace-Context`. The trace link needs
  `GOOGLE_CLOUD_PROJECT`, set at deploy time because Cloud Run does not set it.
- Every response carries `x-request-id`, and every request logs method, path,
  status, and duration.
- No prompt text, buyer messages, profile values, or model output in logs.
- Unhandled errors are logged at `SEVERE` with the Error Reporting event type
  and stack trace, and the client receives only the `internal` error envelope.

## `/app`

Flutter for Web, iOS, and Android, with macOS kept as a development target.
It renders agent-generated surfaces from the Homeward catalog, recomputes
bound figures on the device, and holds the buyer's Gemini key. It contains no
prompts and no agent logic. The application ID and bundle identifier are
`se.moonwise.homeward`. The layout follows Flutter's guide to app architecture
(docs.flutter.dev/app-architecture and its Compass sample), with Riverpod view
models (D111).

```text
app/lib/
  main.dart
  config/
    environment.dart      build-time values: the server URL
    dependencies.dart     providers for HTTP, secure storage, the Homeward client
  routing/                router, routes, and the plan that is open
  data/
    repositories/         one file per repository, its provider beside it
    services/             the wire log the inspector reads; the local
                          development server's config
  domain/models/          models the data and UI layers share
  utils/                  SafeNotifierState
  ui/
    core/
      themes/             colors, text styles, dimensions, motion, theme
      ui/                 App* widgets every screen and catalog view composes
      messages/           the app-wide message and its overlay
    <feature>/
      view_model/         <feature>_view_model.dart: the notifier and its state
      widgets/            <feature>_screen.dart and the widgets only it uses
  catalog/
    homeward_catalog.dart the genui catalog: every item and client function
    plan_sections.dart    draws each child of the plan's root as a card
    bindings/             typed readers over genui DataContext
    <component>/          <component>_item.dart and <component>_view.dart
```

A file holds a widget or type together with the small things only it uses:
its enum, its labels, its formats. Something two files use moves to the
nearest folder both can see.

| Feature | Owns |
| --- | --- |
| `startup` | Waiting for the key, opening a new plan |
| `api_key` | Entering, verifying, and removing the Gemini key |
| `journey` | The conversation with each turn's text, the chips for what it changed on the plan, and its inline ask, the plan panel, the working card, the text field, turn streaming, and the app bar: Start over, the gallery, the wire inspector, the key, Appearance |
| `gallery` | An index of every catalog item by family, and a page per item with its examples and parameters |
| `wire_inspector` | A2A frames with their sizes, the A2UI message each carried, the live data model of a surface, and the counters |

Lean screens; one generated Riverpod view model per feature with its Freezed
state in the same file; `SafeNotifierState` for view models that mutate;
snapshot state and dependencies before the first `await`; transient messages
through `AppMessages`; a repository's provider next to the repository; `App*`
prefix reserved for `lib/ui/core`.

| Repository | Backed by |
| --- | --- |
| `GeminiKeyRepository` | `flutter_secure_storage`, session memory on web, the local server's development keys while none is saved |
| `AppearanceRepository` | `flutter_secure_storage` |
| `KeyVerificationRepository` | The server's `/api/keys/verify` |
| `AgentRepository` | The Homeward A2A client from `common/wire`, a `SurfaceController` per plan, the turn event stream; a new session, and a plan's turns from the server for replay |
| `GalleryRepository` | The declared examples, drawn as surfaces in a `SurfaceController` of its own |

### Flutter Stack

- `genui` pinned to an exact version, A2UI v0.9.
- The A2A connection uses the Homeward client from `common/wire`, not
  `genui_a2a`; see `docs/SPIKES.md` S1 and D176. `genui_a2a` appears only in
  the app's contract test.
- `http`, `freezed`, `json_serializable`.
- `riverpod_annotation`, `flutter_riverpod`, `hooks_riverpod`, `flutter_hooks`.
- `go_router`.
- `flutter_secure_storage` for the buyer's Gemini key and their appearance
  choice.
- Charts are drawn by Homeward's own `CustomPainter` primitives in
  `app/lib/ui/core/ui`, not a chart package; see `docs/DESIGN.md` and spike S4.
- `flutter_map` and `latlong2` for the map, on OpenStreetMap's tiles with no
  key (D163).
- `google_fonts` with runtime fetching off, drawing the faces in
  `app/assets/fonts`; `intl`; `url_launcher`.

### genui Boundary

genui is 0.x and changes shape between minor versions. Everything that touches
its API is confined to a few places:

- `app/lib/catalog/` for catalog items, client functions, data bindings, and
  the plan and gallery surface views.
- `app/lib/data/repositories/agent_repository.dart` and its provider for the
  `SurfaceController`: it submits actions from `onSubmit` through the Homeward
  A2A client, attaching capabilities and the surface data model, and feeds
  every received `a2ui_core` message to `handleMessage`.
- `app/lib/data/repositories/gallery_repository.dart`, which holds a
  `SurfaceController` of its own for the declared examples.

Features read surfaces through providers and never construct genui objects.
Two widgets import genui for one type each: the journey's
`exchange_section.dart` renders a turn's inline ask with `Surface`, and the
inspector's `surface_data_view.dart` subscribes to a surface's data model. A
genui upgrade should touch these files and nothing else.

Each catalog item is three layers, and only the first knows about genui:

```text
catalog/<component>/<component>_item.dart   CatalogItem: schema from common, reads bindings, builds the view
catalog/<component>/<component>_view.dart   the widget, from typed values and App* widgets
common/lib/...                              the numbers, when the component shows any
```

The widget a catalog item builds takes plain typed values and callbacks, so it
renders identically in the catalog gallery and in the journey.

### Routes

| Route | Screen |
| --- | --- |
| `/startup` | Waits for the key, opens a new plan, and goes to it |
| `/key` | Gemini key |
| `/plans/:sessionId` | The journey: one plan |
| `/gallery` | Catalog gallery |
| `/gallery/:component` | One catalog component |

- With no key saved, every route but the gallery goes to `/key`.
- The gallery needs neither a key nor a server, because it renders declared
  examples offline.
- A plan's URL carries its session, so a reload reopens the same plan from
  the server's record. When the server no longer holds it, the app goes to
  `/startup` and opens a new one (D174, D175).
- The gallery and the key screen return to the plan that was open, however
  they were reached; opened by their URL with no plan open, they go to
  `/startup`.

### Layout

A plan is a conversation beside a living plan panel (D131, D139), the two
patterns Vishal Motwani showed at the kickoff. The conversation holds each
exchange with its inline ask; the panel holds what Homeward knows, changed in
place each turn.

| Width | Layout |
| --- | --- |
| < 1000 dp | Two tabs, Conversation and Plan, each filling the screen. The Plan tab carries a dot while it holds a change the buyer has not seen (D180). The wire inspector opens as a sheet. |
| ≥ 1000 dp | The conversation, at most 640 dp wide, beside the plan panel. The wire inspector can open as a third pane, 380–440 dp wide, from the app bar. |

### Screens

**Gemini key.**

- Explains that Homeward uses the buyer's own free Gemini key, and links to
  Google AI Studio to create one. Paste field, verify button, inline result;
  verification calls `POST /api/keys/verify`.
- Mobile stores the key in `flutter_secure_storage`. Web keeps it for the tab
  session by default, with a "remember on this device" option.
- States that the key is sent to Homeward's server per request, used only to
  call Gemini, and never stored or logged by Homeward; that a free key allows
  a limited number of requests a day; and that on a free key Google may use
  conversations to improve its products and people may review them, as the
  Gemini API terms last modified 2026-04-28 say, with the advice to use round
  figures or a key from a project with billing (D76).
- Development runs skip this screen (D117). A debug or profile app asks the
  local server for `GET /dev/config` and uses the Gemini keys it returns
  while no key is saved. The app takes no compile-time defines but the server
  URL, so `make app`, the VS Code launch "Homeward app", and Run above
  `main()` start the same way. When the server is not there, the startup
  screen says how to start it. Release builds never ask.

**The journey.**

- **Empty plan**: one line asking the buyer to tell Homeward about their move
  and their money, and the text field under it. There is no opening form
  (D129).
- **The conversation** (D139): one section per turn that has text, an inline
  ask, or a failure. Each opens with what the buyer said, or the action they
  took named in words, as a bubble, then Homeward's reply and the turn's
  inline ask as a card. Only the latest turn's ask takes taps; earlier asks
  stay as the record of what was decided. A `Choice` sends the option at once
  when tapped and keeps it marked (D145). A `Questions` card sends every
  answer with its one button (D165). Between the reply and the ask, a line
  of chips names each plan card the turn added or changed; a tap shows that
  card on the plan (D180).
- **The plan panel** (D131): the plan's living surface, `plan`. Each turn
  changes it in place as the turn streams. Each child of its root `Column` is
  drawn as a card of its own, entering as it is added (D169). A fact Homeward
  deduced offers Right and Not quite; a tap goes to Homeward as the buyer's
  next message (D144).
- **What a turn changed** (D180): the app compares each plan card before and
  after a turn, its components and the data they bind, so nothing is asked
  of the model or the server. A card the latest turn added or changed
  carries a New or Updated tag until the next turn starts, and when a turn
  ends the panel scrolls to the first card it added, or else the first it
  changed below the overview, unless that card already starts in the upper
  half of the panel. The reply's chips name new cards first, each heading
  once, and leave out an overview that only changed. A reopened plan works
  out the same from the server's record.
- **While a turn runs**, a thin bar runs along the top of the plan panel,
  the panel takes no taps, and what the buyer
  just said shows at once as their bubble, with a working card under it:
  the measuring steps from the server's progress data part while tools run
  (D108), otherwise a thinking line with the agent's text so far. Stop
  cancels the turn.
- **A turn recovers by itself** before the buyer is asked to do anything
  (D171). On `gemini_quota_exhausted` with another key left, as in a
  development run, the app moves to that key and sends the turn again. On
  `gemini_unavailable` the app waits 4 s and sends the turn again, once, when
  the failed attempt took under 30 s. A turn that still fails shows one quiet
  line under the buyer's message with Try again, and no toast.
  `gemini_key_invalid` shows a toast and routes to `/key`;
  `gemini_credits_depleted` shows a toast with a change key action.
- **Opening a plan** asks the server for its turns and replays the stored
  A2UI messages into a fresh surface controller. A failed turn that the next
  turn asked again is left out, so a turn the app recovered shows once.
- **Start over** stops a running turn and opens a new plan. The plan left
  behind stays with the server until it is dropped.

**Catalog gallery.**

- `/gallery` is an index of every Homeward component grouped by family, each
  with its one-line description (D160).
- `/gallery/:component` shows one component: its name, family, and
  description; its declared examples, one at a time with a switcher, each
  drawn from its example data model as the journey draws it; its parameters,
  read from the declaration so they cannot drift, with the path each bound
  one binds and the tool that seeds it; and the example's A2UI components and
  data model as JSON, each with a copy button.
- On a wide window the index stays beside the page; on a narrow one the page
  replaces it, and a home button returns to the plan.

**Wire inspector.**

- A pane inside the journey, or a sheet on a narrow window.
- A timeline of A2A frames sent and received, each with its size and the gap
  since the frame before it; a frame opens to the A2UI message it carried.
- A live data model viewer for a surface, which moves while a bound input
  moves.
- Two counters, frames over the network and local recomputes since the panel
  opened: the proof that a bound input never leaves the device.

### The Map

`WeekMap` (D163) draws on OpenStreetMap's own tiles with `flutter_map`. There
is no key, no account, and nothing to configure, on any platform.

- **Tiles:** `https://tile.openstreetmap.org/{z}/{x}/{y}.png`, softened by a
  colour filter so the pins and routes read first, and darkened under the
  dark theme (`docs/DESIGN.md`).
- **The tile policy** (operations.osmfoundation.org/policies/tiles, read
  2026-10-05) is followed: "© OpenStreetMap contributors" stays on the map;
  native builds send a user agent naming `se.moonwise.homeward`, and the web
  sends its referrer; tiles are fetched only as they are viewed and cached
  as the server's headers say.
- **What it draws** comes from the data model alone: the places of `/places`
  and one starting point of `/week`, with each trip's path decoded from the
  polyline `measure_week` kept. The app asks no routing or geocoding service
  anything.
- **Gestures:** drag, pinch, and double tap. The scroll wheel is left to the
  plan panel, and the map does not rotate.

### Web Build

The web app is built with `flutter build web --wasm`, which emits a skwasm
build for browsers with WasmGC and a JS build as fallback. skwasm built frames
2.5–3× faster than JS in every unthrottled run of spike S4. Multi-threaded
skwasm needs `Cross-Origin-Opener-Policy: same-origin` and
`Cross-Origin-Embedder-Policy: require-corp` on the page, set in
`firebase.json`.

### Accessibility, Performance, Copy

- Every chart has a text summary as its semantics label. Status is never
  conveyed by colour alone. Minimum tap target 48 dp. Layouts hold at 200%
  text scale.
- A bound input redraws the components bound to it within one frame; text
  deltas render within one frame of arrival.
- English only. Local terms appear with an English gloss on first use, for
  example "bostadsrätt (housing cooperative flat)". Money is formatted in its
  own currency.

## Turn Sequence

```text
app                         server                                 gemini
 │ message/stream (text)      │                                       │
 ├───────────────────────────►│ find session, lease turn              │
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
 │                            │ keep the turn in the session          │
 │◄── status-update completed ┤                                       │
```

A bound input never leaves the device while the buyer edits it:

```text
input ─► the surface's data model ─► bound components rebuild
                                     └► client functions recompute
```

An action sends its name, its context, and the surface's data model; the
server hands them to the model as the buyer's next message, and the model
decides what they mean.

## Local Development

- `make app`, `make app-web`, and `make app-macos` start the local server when
  it is not running, run the app on `DEVICE` (Chrome, macOS, or an Android
  device id), and stop the server they started when the app exits.
- `make server-dev` runs `server/tool/dev.dart` with the VM service and
  `hotreloader`: saved changes in `server` and `common` reload in place. New
  routes and prompts need a restart. The entry point reads `.env` itself, so
  it runs the same from make, an IDE, or a terminal, and it serves
  `GET /dev/config` to `localhost` only (D117). Production never mounts it.
- `make dev-server` starts that server in the background when nothing answers
  on port 8080, logging to `.dart_tool/homeward/server.log`, and forwards the
  port to attached Android devices with `adb reverse`. `make dev-server-stop`
  stops a server it started.
- Ctrl-C, `make dev-server-stop`, and the exit of `make app` stop the local
  server by the shutdown rule under Deployment. A server started while
  another still holds its VM service port logs "Could not start the VM
  service", then serves and hot-reloads as usual.
- `make probe SERVER=… MESSAGE="…"` creates a session and streams one live
  turn against a running server, printing text, surfaces, and timings.
- `make server-image-run` builds and runs the production image on port 8080.
- A developer's keys live in `.env` at the root, copied from `.env.example`
  and ignored by git. The Makefile loads it and exports its variables to
  every target; a variable given on the make command line wins.

| Variable | Read by |
| --- | --- |
| `HOMEWARD_EVAL_GEMINI_KEY`, `HOMEWARD_EVAL_GEMINI_MOON_KEY` | `make probe` and the local server's `/dev/config` for the app's development runs. Two keys from two Google accounts, two free quotas: each moves to the next key when a turn fails with `gemini_quota_exhausted` |

## Deployment

All of it runs only when explicitly asked.

- The server is cross-compiled, not compiled inside Docker, because the pub
  workspace includes the Flutter app and a plain Dart image cannot resolve it.
  `make server-build` runs `dart compile exe --target-os linux --target-arch x64`
  against the committed lockfile.
- `server/Dockerfile` copies that binary, `server/prompts/`, and `markets/`
  onto `gcr.io/distroless/cc-debian12:nonroot`: glibc and CA certificates, no
  shell, user 65532. The root `.dockerignore` admits only what the image
  copies; a folder the Dockerfile copies must be admitted there too.
- The server loads the prompts and the sample markets and homes once at
  startup.
- The server ends its own process on the first SIGTERM or SIGINT. It stops
  accepting connections, closes idle ones, and waits while a request is being
  answered or a turn is still running, for at most 8 seconds, inside the 10
  seconds Cloud Run leaves between SIGTERM and SIGKILL; then it exits with
  status 0, and when the 8 seconds ran out it first logs a warning with the
  connections and turns it cut.
- `make deploy-server` refuses a dirty working tree, tags the image with the
  commit, pushes it to the Artifact Registry repository `homeward`, which
  keeps the three most recent images, and deploys Cloud Run service
  `homeward-server` in `europe-north1`: concurrency 40, request timeout
  300 s, minimum instances 0, maximum 1 because sessions live in memory;
  cold starts are accepted.
- The service is public, deployed with `--no-invoker-iam-check`: the server
  asks for no identity, and a turn needs the caller's own Gemini key.
- `make deploy-web` builds the Wasm web app with the server's URL and deploys
  Firebase Hosting, with the isolation headers and a single-page fallback
  from `firebase.json`. Every client calls the Cloud Run URL directly:
  Hosting's rewrites buffer whole responses and never return after about 60
  seconds, so turns could not stream through them (S6).

### Google Cloud

- Project `homeward-genui`, owned by Moonwise. It runs Cloud Run and Artifact
  Registry and serves the web build from Firebase Hosting.
- Left over from before D173, unused, and safe to remove in the console: the
  Firebase apps registered with `flutterfire configure`, the anonymous sign-in
  provider, the Firestore database, the reCAPTCHA Enterprise key, and the
  service account's roles for Firestore, Firebase Auth, and App Check. The
  service account needs Logs Writer only.
- No Gemini key is stored in the project. Keys are the buyer's.

### Cost

Homeward is designed to cost nothing to run (D163):

- Billing is attached to `homeward-genui` because Cloud Run and Artifact
  Registry require it, with a budget alert of 25 SEK, about €2, at 50%, 90%,
  and 100%.
- Cloud Run stays within its free allowance at one small instance that
  scales to zero.
- Map tiles come from OpenStreetMap's tile server, free and best effort, with
  no key and no account; Google Maps Platform is not used.
- No paid Gemini features such as Google Search grounding, and no third-party
  model that needs a payment method (D136).
- No paid store accounts: builds reach devices as web, simulators, sideloaded
  Android APKs, and personally provisioned iPhones.

## Code Rules

- No comments of any kind, including doc comments. If code needs explaining,
  rename, extract, or introduce a type.
- A file is named after its main type or widget and holds only what that one
  uses. What two files share moves to the nearest folder both can see.
- Functions do one thing. Prefer early returns and pattern matching over nested
  conditionals.
- Sealed classes and exhaustive `switch` for every closed set: turn inputs,
  turn events, wire events.
- No `dynamic`; no `late` without a lifecycle hook that guarantees assignment.
  Strict casts, strict inference, strict raw types.
- No hard-coded currency or locale outside tests.
- No raw colors, text styles, or decorations outside `app/lib/ui/core/themes`.
- Reuse before creating: check `common` and `app/lib/ui/core` first. A second
  copy of anything is a reason to extract; a first copy is not.
- Generated files are committed and never edited by hand.

## Quality

`make check` must pass before any change is considered done:

1. `make codegen-check`: build_runner in `app`, `common`, and `server` changes
   no generated file.
2. `dart format --set-exit-if-changed` across `app`, `server`, `common`, `tool`.
3. `flutter analyze` with zero issues, on `flutter_lints` or `lints` plus
   `avoid_dynamic_calls`, `unawaited_futures`, `prefer_final_locals`,
   `always_declare_return_types`, and `exhaustive_cases`.
4. `make test`.
5. `make catalog-check`: the generated catalog JSON, prompt skill, and
   reference doc are up to date; every component example passes the server's
   `TurnValidator` against its own data model; every declared component has
   an app catalog item and the reverse.

`make hooks` sets `core.hooksPath` to `tool/githooks` once per clone, whose
`pre-push` runs `make check`. There is no hosted CI yet.

### Tests

Tests exist where a wrong answer misleads a buyer or breaks the protocol.
There are no widget tests and no golden image tests; the UI is reviewed
visually. During the rebuild no new unit tests are written (D137): the tests
below keep running, and a test goes when the behaviour it covers changes. Each
chunk ends with `make check` green, a live `make probe` with a few test
stories, and a visual look at the result.

| Package | What is pinned |
| --- | --- |
| `common` | `money`: every rounding mode and step against a hand table and against exact big integer arithmetic, on the VM and in Chrome because web integers are 53-bit. `finance`, `affordability`, `costs`: annuity and straight amortization, the largest loan, the maximum price, down payment bounds, the interest deduction, the stress curve, purchase costs. `markets`: rule packs read and overlaid, which rules apply to a buyer, reference rates, living costs, exchange rates. `catalog` and `a2ui`: each component listed once, every declared example valid against its schema, bound properties refusing literals and unknown properties. `wire`: the A2A models round-trip the frames recorded in spike S1; the client turns text, A2UI, cancel, and JSON-RPC error events into turn events |
| `server` | The stream parser across arbitrary delta boundaries. One fixture per validation pass of `docs/PROTOCOL.md`. The turn loop: tool calls answered in order with their seeds, the tool round cap, actions handed to the model, correction rounds, the retry notice, model fallback, quota errors, starting over on a refused history, unknown sessions and the one-turn lease. Prompts that state no rule values and name only tools and components that exist. The open-data clients and the listing reader. Sessions created and read back. The routes, CORS, and that no log record carries a key. The Gemini client against the streams and error bodies recorded in spikes S2 and S3 under `server/test/fixtures/` |
| `app` | Every catalog example pumped through the gallery repository and the real `Surface` widget at phone width. The `genui_a2a` compatibility test: a turn the server streamed, recorded in `app/test/fixtures/recorded_turn.sse` by `server/test/a2a/recorded_turn_test.dart`, replayed through `genui_a2a`'s `A2uiAgentConnector` into a `SurfaceController` holding the Homeward catalog, which proves a client built on the Flutter team's connector renders Homeward's turns. The wire log, the key repository's development keys, and the theme's faces |
| `tool` | The catalog check and its generated outputs, the probe's reading of surfaces, the local server launcher |

Gemini is never called in `make test`. `make probe` runs live turns against a
running server.

Agent evals were removed with the reset (D129): they scored whether Gemini
followed a script. They return later, driving `TurnOrchestrator` in process
with the real prompts and catalog (D93) and scoring what matters when Gemini
composes freely: every message valid, every figure from a tool, every place
checked, and different stories getting structurally different screens.
