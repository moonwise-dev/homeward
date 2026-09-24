# Homeward Client App Requirements

## Scope

One Flutter app for iOS, Android, and Web. The app renders agent-generated
surfaces from the Homeward catalog, recomputes what-if figures locally, and
holds the buyer's Gemini key. It contains no market rules, prompts, or agent
logic.

## Platforms

- iOS and Android phones, portrait first, landscape supported.
- Tablets and foldables use the wide layout.
- Web on desktop and mobile browsers, served from Firebase Hosting as a Wasm
  build with a JS fallback.
- Every platform calls the server at its Cloud Run URL, a build-time value that
  points at a local server in development.
- macOS for development only, never released.
- No store distribution: web, simulators, sideloaded Android APKs, and
  personally provisioned iPhones with seven-day profiles.

## Layout

A plan is a journey, not a chat (D106). It opens on a hand-built opening page
(D107), and every turn after that is one page: the agent's text and the
surfaces the turn created, centred and at most 1040 dp wide. Each Homeward
component sets its own width inside the page.

| Width | Layout |
| --- | --- |
| < 900 dp | The page fills the screen. The wire inspector opens as a sheet. |
| ≥ 900 dp | The page is centred. The wire inspector can open as a right pane, 380–440 dp wide, from the app bar. |

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

### Plans

- Lists the buyer's plans from Firestore, newest activity first, with market
  name, coverage badge, and last activity.
- New plan creates a session and opens its opening page.
- Delete plan asks for confirmation and deletes session, turns, and plan.

### Journey

- **Opening page**, shown while a plan has no turns (D107):
  - Why the buyer is moving, as chips: work, studies, family, lifestyle,
    retirement, investment, or their own words.
  - A story box: where they are going, what their days look like, and any
    homes they are looking at.
  - Two example stories that fill both in: the Stockholm family and the Lisbon
    surfer.
  - Start builds the first message from the reason and the story, so the model
    never starts cold.
  - The disclaimer, in one line under Start: Homeward estimates and explains;
    it is not financial advice.
- **Pages**: one page per turn that has text, a surface, or a failure. The
  newest page shows by default. A step pager at the top moves to earlier pages;
  their surfaces are read-only once a later commit locks them. Pages fade and
  rise into place when they change.
- **While a turn runs**, the current page stays on screen under an overlay, and
  the next page replaces it when its first surface arrives or the turn ends:
  - While tools run, the overlay lists the measuring steps from the server's
    progress data part, each running, done, or unavailable (D108).
  - Otherwise it shows a thinking line with the agent's text so far.
  - Stop cancels the turn.
- **Tell Homeward more**: a one-line field under every page sends free text,
  which keeps the journey story-driven.
- **History**: an app bar action opens the transcript as a sheet, with buyer
  messages, the actions they took, and each turn's text.
- Opening an existing plan replays stored A2UI messages into a fresh surface
  controller before the pages are shown.
- Turn failures show a toast, and the failed page offers retry.
- `gemini_key_invalid` routes to `/key`. `gemini_quota_exhausted` explains that
  the buyer's free key has hit a request limit, asks them to try again in a
  minute, and shows when the daily limit resets.
  `gemini_credits_depleted` shows the server message with a change key action,
  since waiting does not help.

### Catalog Gallery

- Lists every catalog component with phase and agent visibility.
- Renders each declared example with its example data model.
- Toggles: locked state, resident or non-resident example profile, curated or
  uncovered market.
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
  opened. These are the video's proof that what-if never leaves the device.
- Sizes are measured where the app encodes and decodes, so they are the JSON
  bytes of the frame, not the compressed transfer.

### Settings

- Gemini key: status, replace, remove.
- Developer tools toggle.
- Disclaimer and how sources and coverage work.
- About, with links to A2UI, genui, and the repository.
- Delete all my data: deletes every plan and signs out the anonymous user.

## Features And Controllers

| Feature | View model responsibilities |
| --- | --- |
| `startup` | Session restore, App Check, key presence, initial route |
| `api_key` | Input state, verify, save, remove |
| `plans` | Stream plans, create, delete |
| `journey` | Start from the opening page, send text, stop, stream turn events and progress, replay, retry, page choice |
| `gallery` | Selected component, example, toggles |
| `wire_inspector` | Frame timeline with sizes, A2UI messages, live data model, counters |
| `settings` | Developer tools flag, delete all data |

## Repositories

| Repository | Backed by |
| --- | --- |
| `AuthRepository` | Firebase Auth |
| `GeminiKeyRepository` | `flutter_secure_storage`, session memory on web |
| `KeyVerificationRepository` | `ApiClient` to `/api/keys/verify` |
| `PlansRepository` | Firestore `sessions` and `plans` streams, server delete route |
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
- Sliders are keyboard and screen reader operable with the formatted value
  announced.

## Performance

- Dragging an `AmountSlider` keeps 60 fps on a mid-range Android phone and in
  Chrome on a mid-range laptop with six bound insight components on screen.
- Local recompute per component per frame stays under 2 ms; spike S4 measured
  under 0.2 ms with 4× CPU throttling.
- Text deltas render within one frame of arrival.
- Measured with `make perf`: a scripted sweep writes the down payment every
  frame for six seconds and reports frame build, raster, and total times.
  "Mid-range laptop" is approximated by 4× CPU throttling in headless Chrome.
  Mid-range Android is measured on a physical phone in profile mode, because
  emulators do not support profile builds.

## Copy

- English only for v1.
- Local terms appear with an English gloss on first use in a surface, for
  example "bostadsrätt (housing cooperative flat)".
- Money is formatted in the market currency with the market's conventional
  grouping, from the `locale` in `/market` (D77); amounts in a second currency
  show both.
