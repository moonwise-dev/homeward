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

As of 2026-10-09.

- **Built.** 27 blocks in five families, thirteen tools, and the journeys
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
- **Tools assume and estimate** (D183, 2026-10-09).
  `compute_affordability` needs only income and savings; the rest it
  assumes or estimates and marks. Probed on a local server with
  the three opening messages, on `gemini-3.5-flash-lite`, each run more
  than once while the loop notes were tuned; the last run of each: the
  move with two incomes, 2 rounds and 11 s, with what they can borrow, the
  household with children, other loans, and age marked as assumed and
  take-home pay as estimated from Skatteverket's table, the rule, a
  month's cost, the city, and a two-button ask whether that is right; a
  correction in the next turn, a car loan and a child, recalculated in 3
  rounds and 16 s, one of them a correction of a button. The home they
  picked: 3 rounds, 15 s, nothing assumed; what they can borrow, a month's
  cost, the costs on the day, and buying against renting. Two friends in
  Lisbon: 2 rounds, 13 s; three homes, the map, the city, no ask. Looked
  at in headless Chrome at 1440 dp: the first message's reply, and the
  household example in the gallery. Seen on the way and addressed: the
  model sent surfaces without words or words without surfaces, its notes
  leaked into the text once, it claimed an update no tool had made, and
  one turn drew nothing after it named a handed block without its body.
  Seen and left: two of eight button asks needed a correction round, one
  for a missing ID and one for the action's shape; one reply named its
  cards by their component names; a buyer who said "no debts" was once
  shown that as assumed, because Gemini did not pass it; renters are shown
  homes for sale; the README is stale. Left out: Portugal's tax table, so
  there take-home pay is still asked for; pay before tax from take-home
  pay; an answer without savings or a price.
- **Cards drawn by name** (D184, 2026-10-09). Gemini sees a
  tool's cards as ID and component name, shows one by naming it in the
  plan's `root`, and the server supplies the body; a surface is created by
  its first `updateComponents`. A reply's drawing fell from about 2,000
  characters to 200 to 450, and a reply round from about 5 to 7 s to about
  4. Probed on a local server with `gemini-3.5-flash-lite`: the move with
  two incomes ran four times, 2 rounds once and 3 rounds three times,
  12 to 30 s, once with Gemini itself slow and falling back to
  `gemini-3.1-flash-lite`; a follow-up asking what happens if rates rise
  showed the stress test, a card handed in the turn before, in 2 rounds.
  The home they picked: 3 rounds, 16 s. Two friends in Lisbon: 2 or 3
  rounds, 12 to 16 s, and a follow-up added a fourth home by name and the
  rent split in 2 rounds and 9 s. Seen and addressed: a component list
  that held a bare card name crashed the turn, and is now rejected with
  the reason; a stray line of closing brackets after a message was
  rejected, and is now ignored. Seen and left, and the main cost now: in
  about half the first replies Gemini sends its words in one round and its
  cards in the next, or the other way round, and the finishing round that
  fetches the missing half costs 4 to 9 s. Three wordings of the note sent
  with tool results did not settle it.
- **A tool's result shows itself** (D185, 2026-10-09). The
  server puts a tool's cards on the plan as soon as the tools have run;
  Gemini writes the reply and the ask, and changes the plan through a new
  tool, `arrange_plan`. Probed on a local server with
  `gemini-3.5-flash-lite`, each starter several times while the pieces
  landed. On the final code: the move with two incomes, 2 rounds and 11 s,
  cards after 6 s, words after 9 s, and a two-button ask; "what happens if
  rates go up", 2 rounds and 10 s, the stress test added through
  `arrange_plan`. The home they picked, named by its street with no search
  first: 2 rounds and 11 s, with what they can borrow, the rule, a month's
  cost, the home, and buying against renting; "what would we pay on the
  day", 2 rounds and 8 s. Two friends in Lisbon: 2 rounds and 12 s, or 3
  and 17 s when the ask was fetched in its own round; their commutes from
  the first flat, 2 rounds and 10 s, with the map redrawn along the routes.
  Seen and addressed on the way: Gemini said it had added a flat that it
  had not, which `arrange_plan` and a line in the prompt answer; it asked
  in words and drew no buttons, which the finishing round now fetches; a
  constrained round offered every component the turn had shown came back
  empty twice, and is now offered only the ask's components or those of
  the rejected message. Seen and left: the fetched ask was not probed
  again after its schema was narrowed; Gemini's text at times repeats the
  ask's sentence, lists the cards instead of saying what they mean, or
  gives a reason no tool gave; the flat of the second starter costs twice
  what that household can borrow, so its screen says no; renters are shown
  sale prices.
- **People who rent see a rent** (D186, 2026-10-09).
  `search_homes` takes `renting`, and the home card, the shortlist, and the
  comparison then show what renting a home like it costs a month, an
  estimate from the area's median with its source, in place of the price.
  Probed once on a local server with `gemini-3.5-flash-lite`: two friends
  in Lisbon, 2 rounds and 12 s, three flats lowest rent first with Split
  this rent on each; a tap on it, 2 rounds and 9 s, with the split by
  income. Looked at in headless Chrome at 1440 dp. Left out: a highest
  rent as a filter, `HomeSwipe`, which still shows prices, and real
  rental listings.
- **The card that answers, and buttons that run their tool** (D187,
  2026-10-09). A reply shows what they can borrow and only the cards the
  message asks for; the household card confirms with a button of its own;
  a tap on a card's button runs its tool on the server before Gemini
  replies. Probed on a local server with `gemini-3.5-flash-lite`, the
  last run of each: the move with two incomes, 2 rounds and 11 s, two
  cards, what they can borrow and the household, where D185 showed five;
  a tap on These are right, the marks gone at once and a reply in 1 round
  and 4 s, or 2 rounds and 9 s when Gemini went on to find homes within
  reach. The flat they picked, now one within reach and named by what it
  is: 2 rounds and 12 s, with the home, what they can borrow, a month's
  cost, the costs on the day, and buying against renting, all three
  questions answered, where an earlier run of the same message took 4
  rounds and 20 s because Gemini spread its tools over three steps. Two
  friends in Lisbon: 2 rounds and 13 s, the map and three flats, no ask;
  an earlier run took 4 rounds and 22 s, one of them `split_rent` called
  before a flat was named, which it now answers with the first flat
  shown, and one the round that fetches a missing ask, which drew its two
  buttons. Looked at in headless Chrome at 1440 dp: the first reply and
  the tap. Seen and left: Gemini still spreads its tools over two or
  three steps in some runs, each a round of 4 to 6 s; its first round
  takes about 6 s, much of it writing the brief; it offered as the next
  thing to look at cards already on the plan, which the prompt now
  forbids and one run confirmed.
- **A reply to a tap takes one round** (D188, 2026-10-09). Probed on a
  local server with `gemini-3.5-flash-lite`. Before: Split this rent,
  Split equally, and Keep each took 3 rounds and 14 to 16 s, because
  Gemini called again the tool the tap had run and then asked in a round
  of its own. After: These are right, 1 or 2 rounds and 8 to 11 s, text
  after 3 s and two buttons, a month's cost or homes to see; Work out this
  home, the monthly cost at once and a reply with two buttons; Keep, in
  the browser, 1 round and 8 s, the shortlist on the plan and two buttons,
  travel times or the rent split. An ask named for the wrong turn cost a
  correction round in two taps of four and is now renamed. Looked at in
  headless Chrome at 1440 dp: the Lisbon message and the Keep tap. Seen
  and left: Gemini thinks for 300 to 800 tokens before a one-sentence
  reply to a tap, 2 to 4 s of it; when it leaves the buttons out, the
  round that fetches them adds about 5 s, and it has drawn them every
  time since it stopped being constrained, six of six. Tried and
  dropped: thinking level `minimal`, which was no faster and made Gemini
  pass a broken market code and ignore that tools were off. After it:
  `HomeSwipe` shows rents to people who rent, the style prompt asks for
  what a result means and forbids describing the screen, and a reply to a
  tap never runs a tool even when Gemini calls one.
- **On a phone, one scroll** (D189, 2026-10-09). Below 1000 dp the plan
  follows the conversation in the same column, where two tabs kept the
  figure away from the words. Looked at in headless Chrome at 390 dp: the
  first opening message, with what they can borrow right under the reply,
  and a tap on These are right. A row of two buttons overflowed there and
  now wraps. Not looked at: a real phone, and Safari.
- **The plan lists what waits** (D190, 2026-10-09). Under its cards the
  plan shows Also worked out for you and a button for each waiting card,
  built by the server from basic components. Probed on a local server
  with `gemini-3.5-flash-lite`: after the move with two incomes, eight
  buttons, a month's cost, the rates, rising rates, the costs on the day,
  a down payment, the loan year by year, the city, and the lending rule;
  a tap on If rates rise put the stress test on top at once and drew a
  one-sentence reply in 1 round and 4 s, which D191 then dropped. Looked
  at in headless Chrome at 1440 dp. Seen and left: the buttons sit under
  the plan, a long scroll down on a phone once several cards are open.
- **Taps that only move cards draw no reply** (D191, 2026-10-09). Opening
  a waiting card, Keep, and Drop end the turn with no model round. Probed
  on a local server with `gemini-3.5-flash-lite`: a tap on If rates rise
  completed in 27 ms; "Does that hold for us?" after it, 1 round and 4 s,
  answered that the cost at the tested rate stays inside what they can
  carry, where before the meaning was handed over Gemini showed the card
  again and said only that it had. In headless Chrome at 1440 dp: Keep on
  a Lisbon flat, the shortlist on the plan at once, the tap as the
  buyer's line with its chips; and a chain on the first opening message,
  If rates rise, These are right, Costs on the day, where the buttons of
  the reply to the second stayed live after the third. Seen and left:
  after These are right Gemini still offered a month's cost, a card that
  waits, beside homes that fit.
- **Take-home pay is estimated in Portugal too** (D192, 2026-10-09).
  `markets/income_tax/PT.json` holds table I of the 2026 withholding
  tables for mainland Portugal with the employee's 11% social security
  contribution added. Checked without Gemini, by running
  `compute_affordability` for a couple in Lisbon who gave 3,000 and 2,200
  euros before tax and 60,000 saved: it answered, with take-home pay
  estimated at 3,598 euros and marked, where before it asked for it. One
  live turn with that message on a local server: 2 rounds and 10 s, what
  they can borrow and the household, with no other loans, employment,
  and tax residence assumed. Left out: tables for
  dependents and a single earner, the Azores and Madeira, and pensions.
- **More homes** (D193, 2026-10-09). While home cards wait, the row under
  the plan has a More homes button that opens the next three after the
  ones on the plan, with no model round. In headless Chrome at 1440 dp,
  after the Lisbon message: three flats, a tap, six flats in the search's
  order, and the button still there for the rest.
- **An ask is its buttons** (D194, 2026-10-11). A yes or no, or what to
  look at next, is a row of buttons under the reply, whose last sentence
  asks: the question is written once, and the app draws the row with no
  card around it, before the line that says what changed on the plan.
  Every note the server sends before Gemini writes names the buttons the
  buyer already has under the plan, so it offers none of them. A rehearsal
  on the hosted build that morning, the first starter, These are right, a
  waiting card opened in 37 ms, and a question about it, had shown both
  faults: the question twice, word for word, and What a month costs
  offered again. After it, locally: thirteen runs of that starter and tap
  with no waiting card offered, eight asks all rows of buttons with the
  question once, and the other two starters in 3 rounds, 15 s and 19 s.
  Left: a reply to a tap takes a second round about half the time, to
  fetch buttons its question came without; and Gemini still adds a Not
  yet button to an offer, which the prompt asks it not to.
- **Looked at in WebKit** (D195, 2026-10-11). The engine Safari runs,
  loaded from a script, since this machine has no iOS Simulator and Safari
  cannot be driven without changing its settings. The hosted page starts
  there on the JavaScript build with CanvasKit and draws the key screen. A
  build served locally with the hosted headers ran the first starter in
  12 s, opened a waiting card, took These are right, and restored the plan
  on a reload. The plan's cards used to reach the page about 3 s after
  the server sent them; a comment line after a quiet event now brings
  them in 0.15 s. Not looked at: Safari itself, an iPhone, and a turn
  through the hosted server from WebKit, which needs a key typed in.
- **Hosted since 2026-10-09** at `https://homeward-genui.web.app`, with the
  server on Cloud Run at the URL in the `Makefile`, first from commit
  `bf1a0fb`, again the same day with D182 to D193, and on 2026-10-11 with
  D194 and D195; one live turn on the redeployed server drew its cards after 5 s. On the public server: `/health`, the agent card with its
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
  instance and keeps none warm. Since D188 the key screen says what
  Homeward is and links the gallery, so a visitor without a key reaches
  the catalog.
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
| A public web build | Hosted on 2026-10-09 at `https://homeward-genui.web.app`; rehearsed on the hosted server and looked at in WebKit on 2026-10-11 | A turn and a reload through the page with a person's key, in Chrome, Safari, and on an iPhone |
| A golden script, with clickable prompts | Drafted on 2026-10-08: three opening messages on the empty plan, each sent with a tap, taken from journeys 1, 4, and 3 of the README | The owner's edit of the three, and the screen each must end on (D181) |
| A place that shows the catalog | Built: `/gallery`, from the app bar or by URL, with no key; looked at on the hosted page on 2026-10-11, and a wide screen now opens on a block where it showed an empty pane | Nothing |
| A logo, vector or high-resolution PNG | None | Moonwise's or Homeward's mark |
| The repository open-sourced under Apache 2.0, with a Figma file of every catalog component | Private; `LICENSE` and `NOTICE` added on 2026-10-09, the notice naming the OFL fonts, the Unsplash photographers, OpenStreetMap, and the sample data; eight photos no code used were removed; no Figma file | Moonwise confirming the copyright line, "Copyright 2026 Moonwise", the Figma file, and Moonwise making it public |
| A short description with one or two screenshots | The README was rewritten on 2026-10-09 for the screen as it is since D182 to D188; a three-sentence description and screenshots were drafted outside the repository | The owner's edit of the description, and the screenshots taken again on the final build |
| A video, optional | A 74 s recorded run from 2026-10-06, outside the repository | Record again on the hosted build if it is wanted |
| Official SDKs, in the review that follows | genui renders; the Gemini call is our own REST client | Ask Google which package it expects (D177) |

## Next

In this order, each a small chunk that ends with `make check` green, a live
probe, and a visual look.

The order agreed on 2026-10-08 (D181), as it stands on 2026-10-09:

1. The golden script. Drafted: the three opening messages, with the screen
   each ends on and two or three taps to follow, are in the README under
   Three Ways In. Left of it: the owner's read of the three, and what the
   three do not need, blocks included, which nothing has removed yet.
2. Done on 2026-10-09: the build is hosted, and was deployed again with
   each of D182 to D192. Left of it: a turn and a reload through the
   public page with a person's own key, in Chrome and Safari.
3. Done on 2026-10-09 (D183, D192): tools that assume and estimate, in
   Sweden and Portugal.
4. The assessment, taken another way (D185 to D191), with nothing removed.
   The plan holds what the tools worked out, only the card that answers,
   with the rest listed as buttons; the step list and the brief show when
   asked for; a tap on a card runs its tool, and one that only moves cards
   draws no reply; on a phone the plan follows the conversation in one
   scroll. Open, and the owner's to decide: whether a wide screen keeps
   its two panes, and whether one block that sums up what works, what to
   watch, and what is open is still wanted on top.
5. Then a price set against sample sales, and a listing the buyer pastes
   (S13).
6. The licence and notice are in (2026-10-09), and a description and
   screenshots are drafted outside the repository. Left: the logo, the
   Figma file, and Moonwise making the repository public.
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
| The submission is due 2026-10-16, and the logo, the Figma file, and the public repository are not there yet | A partial submission | The build is hosted and licensed since 2026-10-09; what is left needs Moonwise, and is asked for (Open Questions) |
| genui is marked highly experimental and is being redesigned as `a2ui_core`, `a2ui_agent`, and `a2ui_flutter`; `a2ui_core` 0.2 already differs from the 0.1 that genui 0.10 needs | Rework in the catalog and the validation passes | Exact versions pinned; genui confined to a few files (`docs/ARCHITECTURE.md`); no upgrade before the submission |
| Google's review asks for official SDKs, and the Gemini call is Homeward's own REST client | A mandatory comment that costs days in the review window | The client calls the API Google recommends, for which Google lists no Dart package; the question is put to Google before anything is swapped (D177) |
| Sessions live in the memory of one Cloud Run instance (D174) | A restart, a new deploy, or a second instance loses every open plan | One instance; the app starts a new plan when the server no longer holds the one in its URL; nothing a buyer cannot retype |
| Nobody signs in, so any caller can open sessions and run turns (D173) | Server time and open-data requests spent on someone's script | A turn needs a Gemini key that Gemini accepts, and spends that key's quota; open-data requests go one at a time per service; one instance, at most 500 sessions |
| Safari itself and an iPhone are unchecked; only its engine was, on a Mac (D195) | A fault that shows only in Safari's own shell or on iOS | In WebKit the page runs the JavaScript build under `require-corp` and streams a turn across origins; a person opens the hosted page in Safari and on an iPhone before the submission |
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
4. Which blocks stay (Next, 1).
5. Whether Andrew Brogdon's team still wants a recording, and by when.
6. Catalog ID domain: `moonwise.se/homeward` or a dedicated domain.
7. Whether figures should be valued on the spot for each household's story
   rather than from area samples. The Stockholm rent gotcha (D155, Risks)
   shows the limit: a sourced median can be the wrong figure for this
   buyer. Revisit with S12 and the brief.
