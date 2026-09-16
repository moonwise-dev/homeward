# Homeward Client App Requirements

## Scope

One Flutter app for iOS, Android, and Web. The app renders agent-generated
surfaces from the Homeward catalog, recomputes what-if figures locally, and
holds the buyer's Gemini key. It contains no market rules, prompts, or agent
logic.

## Platforms

- iOS and Android phones, portrait first, landscape supported.
- Tablets and foldables use the wide layout.
- Web on desktop and mobile browsers, served from Firebase Hosting at the same
  origin as the server.
- macOS for development only, never released.

## Layout

| Width | Layout |
| --- | --- |
| < 900 dp | Chat full screen. Plan board as a bottom sheet with a peek bar showing plan title and progress. |
| ≥ 900 dp | Chat on the left, plan board as a persistent right pane, 380–440 dp wide. |

Inline surfaces are attached under the agent message of the turn that created
them and scroll with the transcript.

## Routes

| Route | Screen |
| --- | --- |
| `/startup` | Startup |
| `/key` | Gemini key |
| `/plans` | Plans |
| `/plans/:sessionId` | Plan chat with board |
| `/gallery` | Catalog gallery |
| `/settings` | Settings |

Guards: no anonymous session goes to `/startup`; no key goes to `/key`.

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
- Remove key is available here and in settings.

### Plans

- Lists the buyer's plans from Firestore, newest activity first, with market
  name, coverage badge, and last activity.
- Empty state offers three starter prompts, including the hero prompt.
- New plan creates a session and opens it.
- Delete plan asks for confirmation and deletes session, turns, and plan.

### Plan Chat

- Transcript: buyer messages, agent text streamed as it arrives, inline surfaces
  under their agent message.
- Status line during a turn from task status updates, for example
  "Researching rules for Madeira".
- Composer with send; stop while a turn is running.
- Starter prompts on a new plan.
- Opening an existing plan replays stored A2UI messages into a fresh surface
  controller before enabling the composer.
- Turn failures show a toast and a retry affordance on the failed turn.
- `gemini_key_invalid` routes to `/key`. `gemini_quota_exhausted` explains that
  the buyer's own quota is used up and when to retry.

### Plan Board

- Renders the `board` surface.
- Before any decision: a short explanation of what will appear and the
  disclaimer.
- Every section's change action sends a `change` action and scrolls chat to the
  new turn.

### Catalog Gallery

- Lists every catalog component with phase and agent visibility.
- Renders each declared example with its example data model.
- Toggles: locked state, resident or non-resident example profile, curated or
  researched coverage.
- Reachable from settings when developer tools are enabled.

### Wire Inspector

- A panel inside plan chat, toggled when developer tools are enabled.
- Timeline of A2A frames sent and received with sizes and timings.
- Pretty-printed A2UI messages per surface.
- Live data model viewer per surface.
- Two counters: network requests and local recomputes since the panel opened.
  These are the video's proof that what-if never leaves the device.

### Settings

- Gemini key: status, replace, remove.
- Developer tools toggle.
- Disclaimer and how sources and coverage work.
- About, with links to A2UI, genui, and the repository.
- Delete all my data: deletes every plan and signs out the anonymous user.

## Features And Controllers

| Feature | Controller responsibilities |
| --- | --- |
| `startup` | Session restore, App Check, key presence, initial route |
| `api_key` | Input state, verify, save, remove |
| `plans` | Stream plans, create, delete |
| `plan_chat` | Send text, send action, stop, stream turn events, replay, retry |
| `plan_board` | Board surface presence and sheet state |
| `catalog_gallery` | Selected component, example, toggles |
| `wire_inspector` | Frame buffer view, counters |
| `settings` | Developer tools flag, delete all data |

## Repositories

| Repository | Backed by |
| --- | --- |
| `AuthRepository` | Firebase Auth |
| `GeminiKeyRepository` | `flutter_secure_storage`, session memory on web |
| `KeyVerificationRepository` | `ApiClient` to `/api/keys/verify` |
| `PlansRepository` | Firestore `sessions` and `plans` streams, server delete route |
| `AgentRepository` | `genui_a2a` connector, `SurfaceController`, turn event stream |
| `TurnHistoryRepository` | Firestore `turns` for replay |
| `WireLogRepository` | In-memory ring buffer fed by the agent connector |

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
- Local recompute per component per frame stays under 2 ms.
- Text deltas render within one frame of arrival.

## Copy

- English only for v1.
- Local terms appear with an English gloss on first use in a surface, for
  example "bostadsrätt (housing cooperative flat)".
- Money is formatted in the market currency with the market's conventional
  grouping; amounts in a second currency show both.
