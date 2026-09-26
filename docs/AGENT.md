# Homeward Agent

The agent is a loop on the server around the Gemini Interactions API. Each turn
it hands Gemini the buyer's words or the action they took, runs the tools
Gemini calls, and forwards the surfaces Gemini draws once they validate. Gemini
decides what the buyer's screen shows and what it asks; the server decides
only whether what Gemini drew is valid (D129).

The agent works on a move the way a coding agent works on a codebase (D130):
it keeps notes, looks things up before it asks, asks one decision at a time
with its recommendation, shows its work, and proposes for the buyer to
approve.

## Model Configuration

| Setting | Default | Config key |
| --- | --- | --- |
| Turn models, in preference order | `gemini-3.5-flash-lite,gemini-3.5-flash,gemini-3.8-flash` | `HOMEWARD_TURN_MODELS` |
| Thinking level | `low` | `HOMEWARD_THINKING_LEVEL` |
| Deadline to response headers | 10 s | `HOMEWARD_HEADERS_DEADLINE` |
| Deadline to first step | 20 s | `HOMEWARD_FIRST_STEP_DEADLINE` |
| Unhealthy model cool-down | 5 min | `HOMEWARD_MODEL_COOLDOWN` |
| Store interactions | `true` | fixed |
| Validation correction rounds | 2 | `HOMEWARD_MAX_CORRECTIONS` |
| Model rounds per turn | 1, plus one per tool round and one per correction round | enforced by the caps below |
| Surfaces per plan | `plan`, and at most one inline surface per turn (D131, D139) | fixed |
| Tool rounds per turn, cap | 3 | `TurnSettings.maxToolRounds` (D85) |

Spike S2 found every listed model available on a free-tier key, but
`gemini-3.8-flash` overloaded on the day: `generateContent` answered 503, and
Interactions requests hung before headers or after `interaction.created`, one
for over 15 minutes, some ending in an in-stream `api_error`.
`gemini-3.5-flash` answered in 7–18 s per round.

Live turns on 2026-09-17 with `gemini-3.8-flash` first repeated it: of four
turns none finished on it alone. Twice it sent no step within 20 s, and twice
it failed with high demand after its text had streamed; its completed rounds
took 5–20 s, while `gemini-3.5-flash` rounds took 4–10 s. `gemini-3.5-flash`
therefore went first (D72).

`gemini-3.5-flash-lite` has gone first since D81: 25 times the free daily
requests of a Flash model and three times its requests a minute. In probes on
2026-09-17 it ran the Stockholm hero script, message, `commit_profile`, and
`commit_scenario`, in four requests and 16 s without a correction, and drew the
profile form with its first text after about 5 s in ten further first
messages. The Flash models follow it, and the order is compared again for
quality in the M2 rehearsals.

Free-tier limits, read in AI Studio for the Homeward project on 2026-09-17.
They apply per Google Cloud project, so every key in the project and AI Studio
share them, and daily limits reset at midnight Pacific:

| Models | Requests a minute | Input tokens a minute | Requests a day |
| --- | --- | --- | --- |
| `gemini-3.8-flash`, `gemini-3.7-flash`, `gemini-3.5-flash` | 5 | 250K | 20 |
| `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite` | 15 | 250K | 500 |
| `gemma-4-26b-a4b-it`, `gemma-4-31b-it` | 30 | 16K | 14,400 |

A turn uses up to two requests, and a model at a limit hands the turn to the
next (D79), so a buyer's free key covers roughly 250 turns a day on
`gemini-3.5-flash-lite` and about twenty more on the Flash models. Two or three quick turns in a minute can reach a Flash model's
per-minute limit. AI Studio counts refused requests too: it showed 7 of 5 a
minute and 24 of 20 a day.

### Model Selection

- Each request goes to the first model in the list whose circuit is closed.
  When every circuit is open, the request tries only the model whose circuit
  closes first, so a busy minute never fails a turn without asking Gemini.
- A request that misses a deadline, receives HTTP 500 or 503 with a high-demand
  message, or receives an in-stream `api_error` is aborted by closing the
  connection. That model's circuit opens for the cool-down, and the round is
  retried once on the next model while no A2UI message of that round has been
  accepted (D73). The turn takes the round back first: its text returns to what
  it was before the round, which clients show by replacing the full text, and
  its function calls and rejections are dropped, because tools run only after a
  round completes. Once a message of the round has been accepted, the turn
  fails with `gemini_unavailable` instead of repeating output.
- An overloaded round is retried on one more model only. A request limit
  refusal arrives within a second, so it moves on through every remaining
  model.
- Circuits live in memory per instance; a cold instance relearns within one
  request.
- A key error, a quota that is not per model, and depleted prepaid credits
  never fall back; they are the buyer's to fix. The free tier's per-model
  request limits do (D79, replacing D41 for them): the round moves to the next
  model under the same rule as an overload, and the refused model is skipped
  for that key for one minute. A per-minute and a daily refusal carry the same
  metric and differ only in the limit number, so the server cannot tell them
  apart; after a daily refusal, the model is asked again once a minute and
  refuses within a second. Skips live in memory per instance, keyed by a
  SHA-256 digest of the key that is never logged or stored. When every model
  is skipped for a key, the request asks them again.
- Every turn logs the model used and, when it fell back, the model and reason
  it fell back from, which the client streams as a `modelFailed` event.

## Principles

- **Gemini composes the screen.** It decides what a buyer's screen holds, in
  which blocks, and what to ask. No server rule picks the next question,
  withholds a tool to steer the flow, or draws a screen in the model's place.
  When the model misbehaves, the fix is a smaller catalog, a clearer prompt, or
  a better tool before a server rule.
- **Code guarantees correctness.** Validation checks that every message is
  well formed, fits the catalog, binds data that exists, and stays on the
  plan panel or this turn's inline ask.
- **Deduce first.** What Gemini can infer from the buyer's words it writes
  down as deduced, with the words it came from, and shows as assumed for the
  buyer to confirm or correct.
- **Never ask what a tool can find out.** Places, distances, travel times, and
  what a listing says are looked up.
- **One decision at a time.** When Gemini must ask, it asks the one decision
  that matters most next, as a `Choice` in the turn's inline ask with its
  recommendation first and why (C4b, D145). Typing stays open for any other
  answer.
- **Propose, then build.** Gemini offers solutions when it judges it knows
  enough, and the buyer's confirmation or correction decides what grows next.
- **Money is the spine** (D138). Every journey reaches what the household can
  borrow and what a home costs them; Gemini draws the money blocks once it
  knows enough, and tools compute every figure from the sample rates and
  rules.
- **Never telegraph.** "Let me check…" is not a turn. Call the tool and draw the
  result in the same turn.
- **Figures live in components.** Chat text refers to results in words and
  points at the component. It never states a figure a buyer relies on.

## Flow

A turn starts from one of two inputs:

- **Text** the buyer typed, sent as it is.
- **An action** from a control on a surface: its name, which Gemini chose when
  it drew the control, the context Gemini gave it, and the data model of the
  surface it came from. `server/lib/agent/actions/action_input.dart` writes
  them into one message, and Gemini decides what they mean. Actions are not a
  fixed list and the server applies none of them itself.

There are no stages and no open decisions in code. The turn context tells
Gemini the turn number and the screen as it stands: every component of the
plan's one surface, `plan`, or an empty list before a turn has drawn it. Gemini
changes that screen in place, sending only the components that change, the way
a coding agent reads a file before editing it (D131). A turn may also draw its
question or options as one inline surface of its own, `t{turn}-{slug}`, which
the app shows in the conversation under the turn's text; the plan panel keeps
the state (D139).

The brief (C4, D132) is Gemini's notes on the household, the way a coding
agent keeps a plan. Gemini writes it with `update_brief`; the server keeps it
as the `/brief` slice of the turn's record, so the next turn starts from it,
and seeds it into the surfaces that bind it. The plan panel shows its items
with `Fact`. A buyer taps Right or Not quite on a deduction, and Gemini
updates the brief and follows up; the server never edits the brief or decides
from it (D144).

## Tools

A tool is an `AgentTool` in `server/lib/tools/`: a name, a description,
JSON Schema parameters, and a `run` that takes the arguments and the progress
steps and returns a `ToolResult`, the result the model reads and the seeds, data
model slices keyed by name, that surfaces may bind. `homewardTools` in
`server/lib/tools/homeward_tools.dart` lists them, and each further tool
arrives with the step of `docs/ROADMAP.md` that needs it.

- Tools never call Gemini. They measure through `server/lib/research`, whose
  open-data clients find places with Nominatim, look near them with Overpass,
  and route by car, bike, and foot on the FOSSGIS router and by public
  transport on Transitous. Calls go one at a time per service with the gap its
  policy asks, under a user agent naming Homeward, and are cached for six
  hours in memory and a week in Firestore (D112).
- Each lookup reports a measuring step through `ResearchSteps`, which the turn
  streams as a progress data part while tools run (D108). Labels come from the
  tool, never from the model.
- A tool that throws answers the model with an error and changes nothing.
- Every place a model names is checked against open data before it is shown
  (D101).

The first tool, `component_docs` (C3, D143), measures nothing: it takes the
names of catalog components and returns, for each, its schema as validation
enforces it and its examples, as compact JSON text with references into the
common types the skill carries. Text, because the Interactions API reads a
`$ref` key in a function response as a reference to an attached part and
refuses the request. An unknown name gets an error that lists the components.
It reports no progress step and seeds nothing.

`update_brief` (C4, D132) records what Gemini learned or deduced about the
household. Each item has an ID, a kind (`household`, `money`, `need`,
`habit`, `want`, `place`, or `open`), one short sentence to the buyer, a
source (`said`, `deduced`, or `confirmed`, a deduction the buyer tapped Right
on), and the buyer's words it came from. An item with an existing ID replaces
it; `remove` drops items. The tool checks every item before it stores any:
the words must appear word for word in what the buyer wrote or tapped in this
plan, and every number in the sentence, in digits or spelled out, must have
the same value as one in the words, so a figure in the brief is always the
buyer's own, and a count Gemini worked out is refused. A failed check answers with the
reason and stores nothing. It returns the whole brief and seeds it as
`/brief`. Measured, quoted, and estimated items come from the tools that
measure, quote, or estimate, never from `update_brief`.

A tool reads the turn through its `ToolContext`: the progress steps, the
slices as they stand, and the buyer's words in this plan.

Planned tools, each arriving with its chunk:

| Tool | Chunk | What it does |
| --- | --- | --- |
| Affordability | C5 | What the household can borrow and the price range, from `common` and the sample market pack; seeds the money slices |
| Mortgage options | C6 | Monthly cost, stress curve, and upfront costs for a price, a down payment, and a term |
| `search_homes` | C7 | Searches the labelled sample homes and prices each for this household |
| `find_place` | C8 | Resolves a place the buyer names, with Nominatim |
| `measure_week` | C8 | Measures each trip of the week from a home, and the weekly total |
| Listing reader | C9 | Reads listings for the household's needs; code keeps a quote only when it appears word for word |
| Rent split | C9 | Splits rent and bills between people sharing by the rule they pick |

After the recording (D142): on-the-spot research of rules and rates (S12),
reading a listing the buyer pastes (S13), and areas for any city.

## Prompt Assembly

`server/lib/agent/prompt/prompt_assembler.dart` loads, once at startup, and
joins in order:

1. `prompts/role.md`: who Homeward is, what it does, and what it never does.
2. `prompts/style.md`: tone, and how to point at components instead of
   restating figures.
3. `prompts/generated/catalog_skill.md`: how to write messages, bind data, and
   name actions, an index of the components, the catalog document with the
   full schemas of the layout components, and the common types, generated by
   `make catalog` (D143).
4. A per-turn context block from `server/lib/agent/prompt/turn_context.dart`:
   the turn number, the screen as it stands, read from the validator's shadow
   surface, and the brief as it stands, so a tool or correction round sees
   what this turn already changed, and a turn that starts over in a new
   conversation still knows the household.

When `GoogleMap` joins the catalog (C8), the prompt adapts the Maps
Agentic UI Toolkit's guidance on when a map helps, roadmap or satellite, tilt,
and anchor or markers, with attribution to `googlemaps/a2ui` (Apache-2.0).

Everything, the context block included, is sent as `system_instruction`, which
goes out again with every request of the turn, tool-result rounds included, and
is never stored in the interaction history (D70).

The catalog skill discloses the catalog progressively (D143). It carries, as
compact JSON Schema and exactly what validation enforces (D69), the core
components every plan uses and correction rounds offer (`Column`, `Row`,
`Card`, `Text`, `Button`, `Divider`, and `Fact`, D144), every function, and
the A2UI common types. Every other component is listed in an index with its one-line
description, and `component_docs` returns its schema and examples when Gemini
is about to draw it. Tool results stay in the interaction history, so a
component read once in a plan is not read again. S16 found the full catalog
would fit the free tier as well; each read costs a round, one request of the
buyer's free quota, so a first message that validates is still worth more than
a short prompt.

## Turn Orchestrator

`server/lib/agent/turn/turn_orchestrator.dart` finds the session, checks its
owner, and leases it; `turn_run.dart` runs one turn:

1. Lease the session turn. A second turn while one runs fails with
   `turn_in_progress`; a missing or foreign session fails with
   `session_not_found`.
2. Replay the session's stored A2UI messages into the shadow processor, so
   validation knows the surfaces earlier turns drew.
3. Write the first input: the buyer's text, or the action with its context and
   surface data.
4. Before every model request, assemble the system instruction with a fresh
   turn context, and declare the tools.
5. Call `interactions.create` with streaming, `previous_interaction_id` when
   present, `store: true`, through model selection.
6. Stream: forward the full text so far as it grows; validate each message of
   an `a2ui` block as it completes; collect function calls.
7. Forward accepted messages through the seeder: a `createSurface` is held
   until its first valid `updateComponents`, then sent with
   `sendDataModel: true`, followed by one `updateDataModel` for each slice a
   tool seeded that its components bind, then the components. A surface whose
   tree never validates never reaches the buyer.
8. When the round ended with function calls, run them in the order the model
   made them and continue the interaction with every result at once, at most
   three tool rounds. The request after the last allowed round ends with a note
   that tools are done and sets `tool_choice` to `none` (D85). Every round is
   logged with its status, the names of the tools called, and its duration.
9. When messages were rejected, continue with one text input listing each
   `VALIDATION_FAILED` error, at most `HOMEWARD_MAX_CORRECTIONS` rounds. The
   correction round asks with an enforced response schema (D110): a JSON object
   of messages, offering the layout basics and the components the turn drew or
   tried to draw. If Gemini refuses the schema, the round repeats without it.
10. A turn that ends with nothing at all, or with messages still rejected after
    the last correction, ends its text with a line asking the buyer to send
    the message again; the screen keeps what was accepted. A reply in words
    alone is a valid turn.
11. Save the turn number, the last completed interaction ID, and every
    forwarded message, also when the turn fails or is cancelled, then release
    the lease and emit `completed`.

The turn number advances even when a turn fails, so surface IDs never repeat.

### Stream Parser

A small state machine over text deltas:

```text
prose ──"```a2ui"──► a2ui ──braces close──► emit message candidate
  ▲                    │
  └──────"```"─────────┘
```

Inside a block, lines join into one message until its braces and brackets close
outside strings, so a message on one line and a message pretty-printed over
several lines both parse. Complete messages are validated and forwarded as they
arrive, so components appear progressively while the model is still writing.
On 2026-09-17 `gemini-3.5-flash-lite` pretty-printed in two of five first
messages; when each line was a candidate, every line was rejected, two
correction rounds followed, and one turn drew its form twice.

A block opens on a line that is the fence alone or that ends with it, so a
question followed straight by its card still draws: on 2026-09-25 the model
wrote "Who is moving with you?```a2ui" and the whole surface fell into the
prose. A fence with text after it on the same line stays prose.

### Rebuilding History

Interaction history is a cache. When a request carrying
`previous_interaction_id` fails with 404 `not_found` (deleted or expired) or
400 `invalid_request` (unknown to this key, or never stored), the orchestrator
retries once without it, starting a fresh interaction from the turn's input.
The session record keeps every turn's text and surfaces, so the buyer's screen
is not lost; replaying earlier turns' text into the new interaction is not
built yet.

A stored chain can also be refused later, mid-turn (measured 2026-09-25): a
tool round fails with 400 `invalid_request`, "function response turn
comes immediately after a function call turn", and every retry fails the same
way, because the interaction that ends the last turn cannot be continued with
a tool result. The same tool calls replayed on a fresh chain continue
normally, so the fault is in what Gemini stored, not in the request. When a
request carrying `previous_interaction_id` is refused this way before the turn
has drawn anything, the orchestrator starts the turn over once on a new
conversation, from the turn's first input. The new chain replaces the stored
one, so later turns are clean.

### Interactions API Client

`server/lib/gemini` is a hand-written client over REST, shaped by spike S2:

- `POST /v1beta/interactions?alt=sse` with `x-goog-api-key` and `stream: true`.
- SSE events have an `event:` name and a JSON `data:` carrying `event_type`,
  except the terminator `event: done` / `data: [DONE]`.
- Events: `interaction.created` (ID), `interaction.status_update`,
  `step.start` / `step.delta` / `step.stop` per step, `interaction.completed`
  (status and usage), `error`.
- Steps: `thought` (deltas are `thought_signature`, ignored),
  `model_output` (deltas are `text`), `function_call` (`step.start` carries
  `id` and `name`; deltas are `arguments_delta` string fragments, joined and
  parsed at `step.stop`).
- A completed status of `requires_action` means function calls are pending.
  They are answered by a new interaction with `previous_interaction_id` and
  `input` as a list of `{ "type": "function_result", "call_id", "name",
  "result" }`, one per call.
- Tools are declared as `{ "type": "function", "name", "description",
  "parameters" }` and re-sent on every request.
- Errors arrive in four shapes: a Google RPC array
  `[{ "error": { "code": 401, "status": "UNAUTHENTICATED" } }]` for key failures;
  HTTP 400 `INVALID_ARGUMENT` with a `details` reason `API_KEY_INVALID` for a
  malformed key, recorded on 2026-09-17;
  an object `{ "error": { "code": "not_found" | "invalid_request" |
  "too_many_requests", "message" } }` for request, quota, and some overload
  failures (HTTP 500 carries a high-demand message); and an in-stream `error`
  event after HTTP 200 and `interaction.created`, `api_error` for overload or
  `quota_exceeded` for the free-tier daily cap, recorded on 2026-09-17. The
  client maps all of them to one sealed error type.
- A 429 `too_many_requests` names its cause only in `message`: the free-tier
  request cap reads `Quota exceeded for metric: …generate_content_free_tier_requests,
  limit: 20, model: …`, and a tool the key cannot use, such as `google_search`,
  gets the generic quota message. The "Please retry in N s" hint repeats while a
  daily cap lasts, so it is not used as a retry time.
- A stream is cancelled by closing the connection. The cancel endpoint returned
  404 for a stalled streamed interaction.
- The client streams typed events: `created`, `textDelta`, `functionCall` with
  parsed arguments once its step stops, `completed` with status and usage, and
  `modelFailed`. Thought steps and signatures are dropped. SSE framing comes
  from `decodeSse` in `common/wire`, a stream transformer, so cancelling a turn
  cancels the connection even while the stream is silent.
- A quota error, a 429 or an in-stream `quota_exceeded` or `too_many_requests`,
  is read by its `message`: `prepayment credits are depleted` means the key's
  project ran out of prepaid credits, recorded from a live turn on 2026-09-17,
  and maps to `gemini_credits_depleted`; any other is `gemini_quota_exhausted`
  with the next midnight Pacific as its reset, computed from the US daylight
  saving rules, and is per model when it names
  `generate_content_free_tier_requests`.
- Recorded streams and error bodies live in
  `server/test/fixtures/interactions/`.

## Guardrails

- Homeward estimates and explains. It does not recommend a lender, a product, or
  a decision to buy.
- The prompt forbids figures the model worked out itself; figures reach the
  buyer from tools, through bound components.
- Tool errors become a short explanation, never invented figures.

## Failure Handling

| Failure | Behavior |
| --- | --- |
| Invalid Gemini key (HTTP 401 or 403, or 400 with `API_KEY_INVALID`) | Turn fails with `gemini_key_invalid`; app routes to the key screen |
| A model's free request limit reached | The round moves to the next model; the refused model is asked again after a minute |
| Key quota exhausted (HTTP 429) | Turn fails with `gemini_quota_exhausted` and the next midnight Pacific as reset time; app asks to try again in a minute and names when the daily limit resets |
| Prepaid credits depleted | Turn fails with `gemini_credits_depleted`; app offers to change the key |
| Model overloaded or stalled | Model selection falls back once; if every model is unhealthy, the turn fails with `gemini_unavailable` |
| Unknown or expired previous interaction | Retry once on a fresh interaction |
| Stored chain refused with `invalid_request` before anything is drawn | The turn starts over once on a new conversation |
| Model output invalid after corrections | Model text plus the retry notice |
| Tool error | The model hears the error and says so in a sentence |
| Stream dropped | Client resumes with `tasks/get`; server keeps the task for 10 minutes |
| Concurrent turn | Second turn rejected with `turn_in_progress` |

## Voice Door (Phase 2)

Voice uses the Gemini Live API through the same server, tools, catalog, and
validation.

```text
app ──WebSocket /live──► server ──WebSocket──► Live API
     mic PCM 16 kHz              audio in
     ◄── speaker PCM 24 kHz ◄──  audio out
     ◄── A2UI messages      ◄──  show_ui tool calls
```

- The Live session gets the same tool declarations plus `show_ui`, whose
  arguments are an A2UI component list. Spoken models cannot write fenced
  blocks, so UI arrives through a tool call.
- `show_ui` arguments pass the same validation and seeding before they reach
  the client over the socket.
- Speak, then screen: the model says one sentence and draws the rest.
- The buyer's key is sent in the first socket frame, never in the URL.
- The text door and the voice door share the session, so a buyer can switch
  between them mid-plan.
