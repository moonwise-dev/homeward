# Homeward Roadmap

Where the project is and what is next. `docs/DECISIONS.md` has what was
decided and why, and `docs/SPIKES.md` the evidence.

## External Dates

| Date | Event | Source |
| --- | --- | --- |
| 2026-10-06 | Working and build-up session: Google reviewed each project's progress and live demos | Hilda Arteaga, 2026-10-01 |
| 2026-10-16 | Submission due: the asset bundle, by email to the Flutter consultants team | Hilda Arteaga, 2026-10-06 |
| After 2026-10-16 | Google's review of the repository; some comments are mandatory, to ensure official SDKs are used | Hilda Arteaga, 2026-10-06 |
| To schedule | A user study with Google's UX research on how developers build with GenUI: a screener, about an hour of questions beforehand, and an hour's interview | Email after the session, introduced by Abdallah Shaban |
| ~2026-10-10 | Recording for Andrew Brogdon's GenUI video segment; the submission lists a video as optional | Andrew Brogdon, 2026-09-10; confirm it is still wanted |
| 2026-11 | Livestream premiere, date unannounced | Andrew Brogdon, 2026-09-10 |

## Where We Are

As of 2026-10-08.

- **Built.** 27 blocks in five families, twelve tools, and the four journeys
  of the README, rehearsed with the probe; a gallery page per block; the
  wire inspector; light and dark themes; the map on open tiles with no key
  (D163); a conversation that leads (D164 to D169); and turns that recover
  by themselves (D170, D171).
- **Cleaned up on 2026-10-08** (D172 to D179). Out: Firebase sign-in, App
  Check, and Firestore; the rate limiter; the plans list; three one-off
  data generators; four documents. In their place: a session known by its
  ID and kept in memory, one plan at a time with Start over, and the app
  bar of the plan opening the gallery, the wire inspector, the key, and
  Appearance.
- **Checked on 2026-10-08.** `make check` is green: 882 tests in `common`,
  168 in `server`, 12 in `tool`, and 16 in `app`. One live turn through the
  probe on the trimmed server found Stockholm and KTH, worked out what a
  couple can borrow, and drew the plan and an inline `Choice` in 26 s. In
  the web app, in headless Chrome: a turn drew the plan, a reload reopened
  the same plan, the gallery and the key screen returned to it, Start over
  opened a new one, and five app bar actions fit beside the title at phone
  width. Not looked at: a release build, a device, and the hosted path.
- **The plan says what changed** (D180, 2026-10-08). The owner found the
  conversation and the plan hard to follow side by side. Each reply now
  lists the plan cards the turn added or changed as chips that show them,
  those cards carry a New or Updated tag, the panel scrolls to the first
  new one, and on a phone the Plan tab carries a dot. Looked at in headless
  Chrome over five live turns, at 1440 and 390 dp, in both themes, with a
  reload in between. Not looked at: a real phone.
- **Answer first, ask little, no card owed** (D182, 2026-10-09). Probed on
  a local server with the three opening messages, on
  `gemini-3.5-flash-lite`. The move with two incomes: 2 model rounds and
  14 s, where the hosted build took 6 rounds and 32 s and drew no plan; it
  drew the city card and one `Questions` card. The home they picked: 5
  rounds, 30 s, one correction; it drew what they can borrow, the rule
  that limits it, a month's cost, buying against renting, and the home,
  with a yes or no built from basic components; its text was the model's
  own notes on component IDs, which is not fixed. Two friends in Lisbon: 3
  rounds, 21 s; the city, the map with both workplaces, three homes, and a
  two-button ask; after a tap the reply ended in words with no ask. Seen
  and left: `compute_affordability` still asks for the household and other
  loans where it could assume them, and for take-home pay where it could
  estimate it; it refused a figure once as not the buyer's words; and
  renters are shown homes for sale. The README still describes the plan
  header and the brief on screen.
- **Hosted since 2026-10-09** at `https://homeward-genui.web.app`, with the
  server on Cloud Run at the URL in the `Makefile`, both from commit
  `bf1a0fb`. On the public server: `/health`, the agent card with its
  public URL, a new session, `/dev` shut, a preflight from the Hosting
  origin, and one live turn in 25 s. On the public page, in headless
  Chrome: the key screen at 1440 and 390 dp, and `/gallery/WeekMap` by its
  URL with the map drawn. Not looked at there: a turn through the page,
  which needs a person's own key, a reload of a plan, and Safari.
  What it took: the image used to stop at start, because this checkout's
  `markets` and `server/prompts` are readable by their owner only and the
  image runs as another user, so the Dockerfile hands both to that user;
  `cupertino_icons` came back, since the release build named it missing;
  the owner's own Google account was given Cloud Run Admin, Service
  Account User, Artifact Registry Writer, Firebase Hosting Admin, and Logs
  Viewer; and billing on `homeward-genui`, off until that day, which is
  why the service had answered 503, was turned back on by Moonwise.
  Moonwise was asked for two budgets, a spend cap of 10 dollars on Cloud
  Run and an alert at 1 dollar on the project; the owner's account cannot
  see budgets, so neither is confirmed here. The service allows one
  instance and keeps none warm. The key screen has no link to the gallery
  yet, so a visitor without a key reaches the catalog only by its URL.
- **The repository** is at `github.com/moonwise-dev/homeward`, private, on
  `main`. `make hooks` runs `make check` before every push.
- **What to expect from a turn.** First text after 4 to 26 s on the free
  tier, most often 8 to 19; two and a half model requests a turn on
  average; about one turn in ten needs a correction round. Free requests
  are counted per model per key, 500 a day on each Flash-Lite, and reset at
  midnight Pacific. A demo should set `HOMEWARD_HEADERS_DEADLINE=40` and
  `HOMEWARD_FIRST_STEP_DEADLINE=60` (`docs/AGENT.md`, Model Selection).

## The Submission

What Google asked for on 2026-10-06, due 2026-10-16 (D172).

| Asked for | State | Left to do |
| --- | --- | --- |
| A public web build | Hosted on 2026-10-09 at `https://homeward-genui.web.app` | A turn, a reload, and Safari on it; a link from the key screen to the gallery |
| A golden script, with clickable prompts | Drafted on 2026-10-08: three opening messages on the empty plan, each sent with a tap, taken from journeys 1, 4, and 3 of the README | The owner's edit of the three, and the screen each must end on (D181) |
| A place that shows the catalog | Built: `/gallery`, from the app bar or by URL, with no key | A look at it as a stranger would arrive |
| A logo, vector or high-resolution PNG | None | Moonwise's or Homeward's mark |
| The repository open-sourced under Apache 2.0, with a Figma file of every catalog component | Private; no licence file; no Figma file | `LICENSE`, a notice for the Unsplash photos and the OFL fonts, the Figma file, and Moonwise making it public |
| A short description with one or two screenshots | The README has the words | Screenshots, and the three-sentence version |
| A video, optional | A 74 s recorded run from 2026-10-06, outside the repository | Record again on the hosted build if it is wanted |
| Official SDKs, in the review that follows | genui renders; the Gemini call is our own REST client | Ask Google which package it expects (D177) |

## Next

In this order, each a small chunk that ends with `make check` green, a live
probe, and a visual look.

The order agreed on 2026-10-08 (D181):

1. The golden script: three opening messages and the screen each must end
   on. It is the finish line, and what the three do not need goes, blocks
   included.
2. Done on 2026-10-09: the build as it stands is hosted. Left of it: a
   turn and a reload through the public page with a person's own key.
3. Tools that assume and estimate: `compute_affordability` answers from
   what it has, assumes no other loans and no children until told, takes
   the household from the buyer's words, and estimates take-home pay from
   pay before tax with a sourced table for each market, so the first
   reply to a move shows what they can borrow.
4. One day on the assessment: one new block and a prompt change on the
   tools there are, run against the three messages, with nothing removed.
   If Gemini draws it reliably, the step list, the brief as a card, the two
   panels, the inline ask, and D180's chips go in one change. If not, the
   hosted build stands.
5. Then a price set against sample sales, and a listing the buyer pastes
   (S13).
6. The licence and notice, the description, screenshots, the logo, and the
   Figma file, once the catalog has settled.
7. A rehearsal on the hosted build, and the video if it is wanted.

## Later

- S12, then on-the-spot research of rules and rates (D142).
- S13, then reading a listing the buyer pastes (D142).
- A Google Maps renderer behind `WeekMap`'s `markers` and `routes`, if
  Google asks for one (D163).
- OpenFreeMap's tiles through MapLibre, if traffic outgrows OpenStreetMap's
  tile policy (D163).
- Areas suggested for any city from open data.
- Evals that score facts and validity, never which question came when.
- The voice door: a `/live` WebSocket, the Live API client, and a voice
  composer mode.
- A second model API for composing, picked by the buyer (D80).
- The move to `a2ui_core` 0.2 and `a2ui_agent`, once genui accepts them:
  its surface checks and prompt generation cover what
  `server/lib/agent/validation` and the catalog skill do by hand today.

## How It Got Here

- **Sep 16 to Sep 26.** The foundation: the Dart workspace, the A2A server,
  the streaming Gemini client with model fallback, A2UI validation with
  correction rounds, the catalog contract and its generated prompt skill,
  the app shell with the renderer, gallery, and wire inspector, and the
  open-data clients. On top of it came a question-by-question case, which
  took the flow away from the model.
- **Sep 26, the reset (D129).** The case, the deal, and the evals were
  removed. They are in git at `6faa8ab`.
- **Sep 26 to Oct 6, the rebuild.** Chunks C1 to C12 and C8b, each one
  visible change: one living surface, inline asks, progressive disclosure
  of the catalog, the brief, the money core, homes, places and the week,
  the map, rent, needs read from listings, the gallery, a conversation that
  leads, and turns that recover by themselves. On 2026-09-27 the project
  was realigned from a relocation app to home finance (D138).
- **Oct 8, the cleanup (D172 to D179).**

The chunk-by-chunk record, with what each left out and how each rehearsal
went, is in `docs/ROADMAP.md` at `93e1e1a`.

## Risks

| Risk | Impact | Mitigation |
| --- | --- | --- |
| The submission is due 2026-10-16 and nothing is hosted, licensed, or drawn in Figma yet | A late or partial submission | Host first, since it is the least certain step; the Figma file and the licence need Moonwise, so they are asked for at once (Open Questions) |
| genui is marked highly experimental and is being redesigned as `a2ui_core`, `a2ui_agent`, and `a2ui_flutter`; `a2ui_core` 0.2 already differs from the 0.1 that genui 0.10 needs | Rework in the catalog and the validation passes | Exact versions pinned; genui confined to a few files (`docs/ARCHITECTURE.md`); no upgrade before the submission |
| Google's review asks for official SDKs, and the Gemini call is Homeward's own REST client | A mandatory comment that costs days in the review window | The client calls the API Google recommends, for which Google lists no Dart package; the question is put to Google before anything is swapped (D177) |
| Sessions live in the memory of one Cloud Run instance (D174) | A restart, a new deploy, or a second instance loses every open plan | One instance; the app starts a new plan when the server no longer holds the one in its URL; nothing a buyer cannot retype |
| Nobody signs in, so any caller can open sessions and run turns (D173) | Server time and open-data requests spent on someone's script | A turn needs a Gemini key that Gemini accepts, and spends that key's quota; open-data requests go one at a time per service; one instance, at most 500 sessions |
| Safari untested with `require-corp` and cross-origin streaming | iPhone viewers cannot stream a turn | Check macOS and iOS Safari on the hosted build; fall back to single-threaded Wasm without isolation headers for Safari |
| Buyers' personal details in the EU | Compliance exposure | No account and no name asked; a plan lives only in the server's memory, in `europe-north1`, until it is dropped; no content in logs |
| The buyer has to bring a Gemini key | Fewer people try the demo | One-screen key flow with a direct AI Studio link; starter prompts on the empty plan |
| A Google A2A client changes what it accepts | Other clients stop rendering Homeward | Server emits only `task` and `status-update`, full text snapshots; `genui_a2a` contract test in the app |
| Gemini latency: 7–18 s per model round on 2026-09-16 on Flash, 3–5 s on Flash-Lite on 2026-09-17 | Slow turns on camera | Flash-Lite first (D81), a small catalog, full text streamed as it grows, latency re-measured before recording |
| Preferred model overloaded | Hung or failed turns | Deadlines, circuit breaker, fallback to the next model |
| Gemini is slow on the day, as from 15:03 to 15:07 CEST on 2026-10-05, when a one-word reply took 13.5 s and most turns failed at the 10 s default | A demo that fails on camera | Raise `HOMEWARD_HEADERS_DEADLINE` to 40 and `HOMEWARD_FIRST_STEP_DEADLINE` to 60 for the demo; a screen capture of the whole path recorded the day before |
| Flash-Lite at times writes its reasoning into a reply, leaves out the plan, the ask, or its words, or breaks a line of JSON; a `Choice` or the plan's story can still carry a figure the prompt forbids | A visible slip in a recording | Since C11 the loop drops words written before the tools ran, asks once for what a reply left out, and reads past a broken line (D168); rehearsal until a run is clean, then record |
| The Interactions API refuses a round's function results as not following a function call, in three of about thirty tool rounds in the C10d rehearsals on 2026-09-27 | The turn starts over in a new conversation, which adds seconds and requests and drops the earlier dialogue from the model's history; first text reached 48 s once | The start-over recovers every time so far; retrying the refused request does not (2026-09-25); spike S17 looks for the cause before the recording |
| Free-tier limits per model per Google Cloud project: 20 requests a day on Flash, 500 on Flash-Lite | Failed turns in rehearsal or on camera; roughly 200 turns a day per buyer on Flash-Lite, at the two and a half requests a turn the 2026-09-28 rehearsal took | At most three tool rounds, two catalog rounds, and two corrections a turn (D85, D147); the next model takes over at a cap (D79); recording on a key unused that day; the cap explained in the app |
| Free-tier prompts may be used by Google to improve its products and read by human reviewers; the terms ask for no sensitive or personal information | Buyers' financial details lose a privacy promise | Quoted on the key screen with advice to use round figures or a billing-enabled key (D76); no names are ever asked; terms re-read before recording |
| Public open-data services limit and refuse heavy use: Nominatim one request a second, Overpass and OSRM fair use | Slow or failed screens when many viewers arrive | A user agent naming Homeward, a cache per query, one request at a time per service |
| Gemini draws weaker screens without the server steering it | A demo that wanders | A small catalog of expressive blocks, a prompt that names the order of work, a plan of steps Gemini keeps on screen, and tools that hand over the block to draw (D164, D167); no server rule that picks the next question (D129) |
| One "high demand" answer opens Flash-Lite's circuit for five minutes while Flash is out of its 20 requests a day and 3.8 Flash is overloaded, as from 20:10 to 20:15 CEST on 2026-10-05 | Turns fail with `gemini_unavailable`, or run on a degraded answer that describes cards it did not draw | A shorter `HOMEWARD_MODEL_COOLDOWN` for a demo; rehearse in the hour before; the recorded backup; since C12 `gemini-3.1-flash-lite` stands between them, and the turn waits and asks again before it fails (D170, D171) |
| An unscripted agent wanders on camera | A recording that loses its thread | Rehearsal with test stories kept outside the app, inputs only; a recorded backup; the brief keeps each turn anchored |
| Probes and rehearsals spend the free requests the owner's own testing and a demo need: about 490 `gemini-3.5-flash-lite` requests on 2026-10-05 left ten for the next morning, the day of the working session | A test or a demo that starts on a spent key | Since C12 the turn carries on with `gemini-3.1-flash-lite` and then the next key by itself (D170, D171); bulk probes run on `gemini-3.1-flash-lite`, each batch sized against the day's 500 first, and none on a demo day without asking |
| A coding-agent loop spends more free requests per turn | The buyer's daily quota runs out sooner | Lookups that are cheap; research only on request; the tool-round cap stays |
| OpenStreetMap's tile server is best effort, with no guarantee, and may block heavy use | A map with no tiles when many viewers arrive, or on camera | Its policy followed: attribution on the map, a user agent naming Homeward, tiles fetched only as they are viewed; the recording backed by a screen capture; OpenFreeMap through MapLibre if the public demo draws traffic (D163) |
| Sample homes read as fake | The needs reading looks staged | Labelled as samples; reading a pasted real listing follows after the recording (D142) |
| Homeward reads as a relocation app, not a finance sample | Google's finance vertical goes unmet; field engineers find no reusable finance components | Money in every journey and in the recording, finance blocks first in the build order (D138) |
| A catalog of 25 to 30 components outgrows the prompt | Slower turns, more corrections, the free tier's token limits | Progressive disclosure after S16 (D140) |
| Area samples miss the household's own situation: Stockholm's official rents are first-hand leases a newcomer rarely gets without years in the queue, while second-hand rents run about 2.5 times higher, so `BuyVsRent` makes renting look cheaper there than a newcomer finds it | A comparison that is sourced yet wrong for the buyer in front of it | Each figure carries its source and what it measures, and Gemini sees it; a rent the buyer states replaces the estimate; valuing each situation on the spot from the buyer's story is Open Question 8 |
| The restored finance was the slowest and least reliable part before (D125) | Money turns fail on camera | The math returns without the scripted deal: Gemini composes the finance blocks freely, and tools seed the figures |

## Open Questions

1. Which package Google's review expects for the Gemini call from a Dart
   server: our client on the Interactions API, or Genkit Dart on
   `generateContent` (D177).
2. Whether the map on OpenStreetMap's tiles is acceptable, where the travel
   example Google linked draws Google Maps (D163).
3. Who makes the Figma file, and when Moonwise makes the repository public.
4. Which blocks stay (Next, 3).
5. Whether Andrew Brogdon's team still wants a recording, and by when.
6. Catalog ID domain: `moonwise.se/homeward` or a dedicated domain.
7. Whether figures should be valued on the spot for each household's story
   rather than from area samples. The Stockholm rent gotcha (D155, Risks)
   shows the limit: a sourced median can be the wrong figure for this
   buyer. Revisit with S12 and the brief.
