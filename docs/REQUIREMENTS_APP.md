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

A plan is one scrolling journey (D120). Every turn adds a section: what the
buyer said or tapped, then the agent's text and the surfaces the turn created,
centred and at most 640 dp wide. The one living screen of R1 in
`docs/ROADMAP.md` replaces this layout next.

| Width | Layout |
| --- | --- |
| < 900 dp | The story fills the screen. The wire inspector opens as a sheet. |
| ≥ 900 dp | The story is centred. The wire inspector can open as a right pane, 380–440 dp wide, from the app bar. |

## Routes

| Route | Screen |
| --- | --- |
| `/startup` | Startup |
| `/key` | Gemini key |
| `/plans` | Plans |
| `/plans/:sessionId` | Journey |
| `/gallery` | Catalog gallery |
| `/settings` | Settings |

Guards: no anonymous session goes to `/startup`; no key goes to `/key`.
`/gallery` needs neither, because it renders declared examples offline.

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
- Remove key is available here and in settings.
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

### Journey

- **Empty plan**: one line asking the buyer to tell Homeward about their move,
  and the text field under it. The first message is whatever they write; there
  is no opening form (D129).
- **Sections** (D120): one per turn that has text, a surface, or a failure, in
  one scrolling story with no page count, pager, or next button. Each opens
  with what the buyer said, or the action they took named in words, then the
  agent's text and the turn's surfaces. The newest section scrolls into view
  when it arrives. Sections fade and rise into place.
- **While a turn runs**, the newest section stays slightly dimmed, and a working
  card under it takes its place until the first surface arrives or the turn
  ends; on an empty plan the card sits over the page:
  - While tools run, the card lists the measuring steps from the server's
    progress data part, each running, done, or unavailable (D108).
  - Otherwise it shows a thinking line with the agent's text so far.
  - Stop cancels the turn.
- **Tell Homeward more**: a one-line field under the story sends free text.
- **History**: an app bar action opens the transcript as a sheet, with buyer
  messages, the actions they took, and each turn's text.
- Opening an existing plan replays stored A2UI messages into a fresh surface
  controller before the sections are shown.
- Turn failures show a toast, and the failed section offers retry.
- `gemini_key_invalid` routes to `/key`. `gemini_quota_exhausted` explains that
  the buyer's free key has hit a request limit, asks them to try again in a
  minute, and shows when the daily limit resets. In a development run with
  another key left, the app moves to that key and retries the turn instead.
  `gemini_credits_depleted` shows the server message with a change key action,
  since waiting does not help.

### Catalog Gallery

- Lists every Homeward component and renders each declared example with its
  example data model. Empty since the reset (D129) until the first component
  returns.
- Reachable from settings when developer tools are enabled.

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

- Gemini key: status, replace, remove.
- Developer tools toggle.
- Disclaimer and how sources work.
- About, with links to A2UI, genui, and the repository.
- Delete all my data: deletes every plan and signs out the anonymous user.

## Features And Controllers

| Feature | View model responsibilities |
| --- | --- |
| `startup` | Session restore, App Check, key presence, initial route |
| `api_key` | Input state, verify, save, remove |
| `plans` | Stream plans, create, delete |
| `journey` | Send text, stop, stream turn events and progress, replay, retry |
| `gallery` | Selected component and example |
| `wire_inspector` | Frame timeline with sizes, A2UI messages, live data model, counters |
| `settings` | Developer tools flag, delete all data |

## Repositories

| Repository | Backed by |
| --- | --- |
| `AuthRepository` | Firebase Auth |
| `GeminiKeyRepository` | `flutter_secure_storage`, session memory on web |
| `KeyVerificationRepository` | `ApiClient` to `/api/keys/verify` |
| `PlansRepository` | The server's session list, merged with the plans this run started |
| `AgentRepository` | Homeward A2A client from `common/wire`, `SurfaceController`, turn event stream |
| `TurnHistoryRepository` | Firestore `turns` for replay |
| `WireLogRepository` | In-memory ring buffer fed by the Homeward A2A client |

`AgentRepository` is the only class outside `app/lib/catalog` that touches
genui.

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
