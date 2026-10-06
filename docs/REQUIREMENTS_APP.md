# Homeward Client App Requirements

## Scope

One Flutter app for iOS, Android, and Web. The app renders agent-generated
surfaces from the Homeward catalog, recomputes bound figures locally, and holds
the buyer's Gemini key. It contains no prompts or agent logic.

## Platforms

- iOS and Android phones, portrait first, landscape supported.
- Tablets and foldables use the wide layout.
- Web on desktop and mobile browsers, served from Firebase Hosting as a Wasm
  build with a JS fallback.
- Every platform calls the server at its Cloud Run URL, a build-time value that
  points at a local server in development; `make deploy-web` passes it as
  `HOMEWARD_SERVER_URL`.
- macOS for development only, never released.
- No store distribution: web, simulators, sideloaded Android APKs, and
  personally provisioned iPhones with seven-day profiles.

## Layout

A plan is a conversation beside a living plan panel (D131, D139), the two
patterns Vishal Motwani showed at the kickoff. The conversation holds each
exchange with its inline ask; the panel holds what Homeward knows, changed in
place each turn.

| Width | Layout |
| --- | --- |
| < 1000 dp | Two tabs, Conversation and Plan, each filling the screen. The wire inspector opens as a sheet. |
| ≥ 1000 dp | The conversation, at most 640 dp wide, beside the plan panel. The wire inspector can open as a third pane, 380–440 dp wide, from the app bar. |

## Routes

| Route | Screen |
| --- | --- |
| `/startup` | Startup |
| `/key` | Gemini key |
| `/plans` | Plans |
| `/plans/:sessionId` | Journey |
| `/gallery` | Catalog gallery |
| `/gallery/:component` | One catalog component |
| `/settings` | Settings. Not built |

Guards: no anonymous session goes to `/startup`; no key goes to `/key`.
`/gallery` and its component pages need neither, because they render
declared examples offline.

## Screens

### Startup

- Restores or creates the anonymous Firebase session.
- Activates App Check.
- Routes to `/key` or `/plans`.
- Shows only the background colour and a spinner.

### Gemini Key

- Explains in two sentences that Homeward uses the buyer's own free Gemini key,
  and links to Google AI Studio to create one.
- Paste field, verify button, and inline result.
- Verification calls `POST /api/keys/verify`.
- Mobile stores the key in `flutter_secure_storage`.
- Web keeps the key for the tab session by default, with a "remember on this
  device" option.
- States that the key is sent to Homeward's server per request, used only to
  call Gemini, and never stored or logged by Homeward, and that Gemini stores
  interactions under the buyer's key according to Google's terms.
- States that a free key allows a limited number of requests per day, about 250
  Homeward turns, resetting at midnight Pacific.
- States that on a free key Google may use conversations to improve its
  products and people may review them, as the Gemini API terms last modified
  2026-04-28 say, and suggests round figures or a key from a project with
  billing, whose conversations Google does not use (D76). The wording is checked
  against the current terms again before recording.
- Remove key is available here, and in settings once that screen is built.
- Development runs skip this screen (D117). A debug or profile app asks the
  local server for `GET /dev/config`, which only `server/tool/dev.dart` serves
  and only to `localhost`, and uses the Gemini keys it returns while no key is
  saved. The app takes no compile-time defines, so `make app`, the VS Code
  launch "Homeward app", and Run above `main()` start the same way. When the
  server is not there, the startup screen says how to start it. Release builds
  never ask.
- Development runs do not activate App Check, which the local server does not
  enforce. Pass `--dart-define=HOMEWARD_APP_CHECK_DEBUG_TOKEN=…` to reach a
  server that does.

### Plans

- Lists the buyer's plans, newest activity first, with the first thing the
  buyer wrote as the title and the last activity.
- New plan creates a session and opens it.
- Delete plan asks for confirmation and deletes the session and its turns.
  Not built: neither the app nor the server deletes a plan yet.
- Appearance in the app bar picks Match the device, Light, or Dark (D162).
  The choice is kept on the device and applies at once.
- The app bar also opens the catalog gallery and the Gemini key screen.

### Journey

- **Empty plan**: one line asking the buyer to tell Homeward about their move
  and their money, and the text field under it. The first message is
  whatever they write; there is no opening form (D129).
- **The conversation** (D139): one section per turn that has text, an
  inline ask, or a failure. Each opens with what the buyer said, or the action
  they took named in words, as a bubble, then Homeward's reply and the turn's
  inline ask as a card. Only the latest turn's ask takes taps; earlier asks
  stay as the record of what was decided. The newest section scrolls into view.
  A `Choice` sends the option at once when tapped and keeps it marked; its
  last line points at the text field for any other answer (D145). A
  `Questions` card sends every answer with its one button, which then reads
  Sent, and the buyer's bubble under it lists each answer on a line (D165).
- **The plan panel** (D131): the plan's living surface, `plan`. Each turn
  changes it in place as the turn streams, so components appear and change
  without the panel being rebuilt. Each child of its root `Column` is drawn
  as a card of its own, entering as it is added and resizing as its content
  changes; a root of any other kind is one card (D169). The first card is
  the plan at a glance, `PlanOverview`: the story so far and the steps.
  Before a turn has drawn it, it says the plan appears here as Homeward
  learns about the move and the money. A fact Homeward deduced offers Right
  and Not quite; a tap goes to Homeward as the buyer's next message, shown
  in the conversation as "Right: …" or "Not quite: …" (D144).
- **While a turn runs**, the plan panel takes no taps while it changes, and
  what the buyer just said or tapped shows at once as their bubble, with a
  working card under it that shows the turn:
  - While tools run, the card lists the measuring steps from the server's
    progress data part, each running, done, or unavailable (D108).
  - Otherwise it shows a thinking line with the agent's text so far.
  - Stop cancels the turn.
- **Tell Homeward more**: a one-line field under the conversation sends free
  text.
- Opening an existing plan asks the server for its turns,
  `GET /api/sessions/:id`, and replays the stored A2UI messages into a fresh
  surface controller before the conversation and the plan are shown.
- A turn recovers by itself before the buyer is asked to do anything (D171).
  While it does, the buyer sees only the working card:
  - `gemini_quota_exhausted` with another key left, as in a development run:
    the app moves to that key and sends the turn again, with no message.
  - `gemini_unavailable`: the server has already waited and asked again; the
    app waits 4 s and sends the turn again, once, when the failed attempt
    took under 30 s.
  - A stop from the buyer ends either wait.
- A turn that still fails shows one quiet line under the buyer's message, in
  the secondary text colour, with Try again; no toast. A turn sent again
  keeps the plan panel the failed one drew, since the server keeps it.
  `gemini_quota_exhausted` with no key left says that the buyer's free key
  has hit a request limit, asks them to try again in a minute, and shows
  when the daily limit resets.
- Opening a plan leaves out a failed turn that the next turn asked again, so
  a turn the app recovered shows once.
- `gemini_key_invalid` shows a toast and routes to `/key`.
  `gemini_credits_depleted` shows a toast with the server message and a
  change key action, since waiting does not help.

### Catalog Gallery

- `/gallery` is an index of every Homeward component grouped by family,
  understanding, money, homes, place and travel, and trust, each with its
  one-line description, linking to its page (C10c, D160).
- `/gallery/:component` shows one component: its name, family, and
  description; its declared examples, one at a time with a switcher, each
  drawn from its example data model as the journey draws it; and its
  parameters, read from the declaration so they cannot drift:
  - each property with its type, whether it is required, and whether it is
    bound, with the path it binds and the tool that seeds that slice;
  - the example's A2UI components and data model as JSON, each with a copy
    button.
- An unknown component name shows the index with a note.
- On a wide window the index stays beside the page; on a narrow one the page
  replaces it.
- The app bar always has a way back to the plans screen, however the gallery
  was reached and however many blocks were opened: its back button goes to
  the plans screen, and on a narrow window with a block open the back button
  returns to the index while a home button goes to the plans screen. A
  gallery opened by its URL has them too, and the plans screen then follows
  the usual guards.
- Reachable from the plans screen's app bar, and by its URL with no key and
  no server.

### Wire Inspector

- A panel inside the journey: a right pane, and a sheet on a narrow window,
  toggled from the app bar.
- Timeline of A2A frames sent and received, each with its size and the gap
  since the frame before it, newest first.
- A frame opens to the pretty-printed A2UI message it carried, named by the
  surface it belongs to.
- Live data model viewer: a surface picker and the model as it stands, which
  moves while a bound input moves.
- Two counters: frames over the network and local recomputes since the panel
  opened, the proof that a bound input never leaves the device.
- Sizes are measured where the app encodes and decodes, so they are the JSON
  bytes of the frame, not the compressed transfer.

### Settings

Not built. What it would hold today sits elsewhere: the key screen removes
the key, and the plans screen's app bar opens the key screen, the gallery,
and Appearance.

- Gemini key: status, replace, remove.
- Developer tools toggle.
- Disclaimer and how sources work.
- About, with links to A2UI, genui, and the repository.
- Delete all my data: deletes every plan and signs out the anonymous user.

## The Map

`WeekMap` (C8b, D163) draws on OpenStreetMap's own tiles with `flutter_map`.
There is no key, no account, and nothing to configure, on any platform,
macOS included.

- **Tiles:** `https://tile.openstreetmap.org/{z}/{x}/{y}.png`, softened by a
  colour filter so the pins and routes read first, and darkened under the
  dark theme (`docs/DESIGN.md`).
- **The tile policy** (operations.osmfoundation.org/policies/tiles, read
  2026-10-05) is followed: "© OpenStreetMap contributors" stays on the map,
  bottom right; native builds send a user agent naming
  `se.moonwise.homeward`, and the web sends its referrer; tiles are fetched
  only as they are viewed, never ahead, and cached as the server's headers
  say. The service is best effort and may block heavy use, which
  `docs/ROADMAP.md` lists as a risk.
- **What it draws** comes from the data model alone: the places of `/places`
  and one starting point of `/week`, with each trip's path decoded from the
  polyline `measure_week` kept. The app asks no routing or geocoding service
  anything.
- **Gestures:** drag, pinch, and double tap. The scroll wheel is left to the
  plan panel, so scrolling past a map does not zoom it, and the map does not
  rotate.
- **Size:** the map fits what it shows when it is drawn and is 320 dp tall.

## Features And Controllers

| Feature | View model responsibilities |
| --- | --- |
| `startup` | Session restore, App Check, key presence, initial route |
| `api_key` | Input state, verify, save, remove |
| `plans` | Stream plans, create, appearance; delete is not built |
| `journey` | Send text, stop, stream turn events and progress, replay, retry |
| `gallery` | Components by family, the selected component, and its selected example |
| `wire_inspector` | Frame timeline with sizes, A2UI messages, live data model, counters |
| `settings` | Developer tools flag, delete all data. Not built |

## Repositories

| Repository | Backed by |
| --- | --- |
| `AuthRepository` | Firebase Auth |
| `AppCheckRepository` | Firebase App Check; a stand-in that sends no token in development runs |
| `GeminiKeyRepository` | `flutter_secure_storage`, session memory on web, the local server's development keys while none is saved |
| `AppearanceRepository` | `flutter_secure_storage` |
| `KeyVerificationRepository` | The server's `/api/keys/verify` |
| `PlansRepository` | The server's session list, merged with the plans this run started |
| `AgentRepository` | Homeward A2A client from `common/wire`, `SurfaceController`, turn event stream; a plan's turns from the server for replay |
| `GalleryRepository` | The declared examples, drawn as surfaces in a `SurfaceController` of its own |

The wire log the inspector reads is a service, `data/services/wire_log.dart`,
an in-memory ring buffer fed by the Homeward A2A client.

`AgentRepository` and `GalleryRepository` are the only classes outside
`app/lib/catalog` that hold a genui `SurfaceController`;
`docs/ARCHITECTURE.md` lists the two widgets that also import genui.

## Accessibility

- Every chart has a text summary as its semantics label.
- Status is never conveyed by colour alone; badges and checks carry icons and
  text.
- Minimum tap target 48 dp.
- Layouts hold at 200% text scale.
- Inputs are keyboard and screen reader operable with their value announced.

## Performance

- A bound input redraws the components bound to it within one frame, at 60 fps
  on a mid-range Android phone and in Chrome on a mid-range laptop.
- Text deltas render within one frame of arrival.

## Copy

- English only for v1.
- Local terms appear with an English gloss on first use in a surface, for
  example "bostadsrätt (housing cooperative flat)".
- Money, when a component shows it, is formatted in its own currency.
