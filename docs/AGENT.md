# Homeward Agent

The agent is a loop on the server around the Gemini Interactions API. It reads
the plan, decides what is still open, calls tools, and draws the next surface.
It has no hard-coded stages; the open decisions of the plan decide the step.

## Model Configuration

| Setting | Default | Config key |
| --- | --- | --- |
| Turn models, in preference order | `gemini-3.8-flash,gemini-3.5-flash` | `HOMEWARD_TURN_MODELS` |
| Research models, in preference order | `gemini-3.8-flash,gemini-3.5-flash` | `HOMEWARD_RESEARCH_MODELS` |
| Thinking level | `low` | `HOMEWARD_THINKING_LEVEL` |
| Deadline to response headers | 10 s | `HOMEWARD_HEADERS_DEADLINE` |
| Deadline to first step | 20 s | `HOMEWARD_FIRST_STEP_DEADLINE` |
| Unhealthy model cool-down | 5 min | `HOMEWARD_MODEL_COOLDOWN` |
| Store interactions | `true` | fixed |
| Validation correction rounds | 2 | `HOMEWARD_MAX_CORRECTIONS` |
| Model rounds per turn, target | ≤ 2 | measured in evals |
| Inline surfaces per turn | 2 | fixed |

Spike S2 found every listed model available on a free-tier key, but
`gemini-3.8-flash` overloaded on the day: `generateContent` answered 503, and
Interactions requests hung before headers or after `interaction.created`, one
for over 15 minutes, some ending in an in-stream `api_error`.
`gemini-3.5-flash` answered in 7–18 s per round.

### Model Selection

- Each request goes to the first model in the list whose circuit is closed.
- A request that misses a deadline, receives HTTP 503, or receives an in-stream
  `api_error` is aborted by closing the connection. That model's circuit opens
  for the cool-down, and the request is retried once on the next model.
- Circuits live in memory per instance; a cold instance relearns within one
  request.
- A key or quota error never falls back; it is the buyer's to fix.
- Every turn logs the model used and, when it fell back, the model and phase
  it fell back from.

## Principles

- **Rules in code, judgment in the prompt.** The prompt tells the model how to
  choose and explain. Code guarantees correctness.
- **Controls are the question.** Never ask in prose for something a component
  can collect.
- **Never telegraph.** "Let me check…" is not a turn. Call the tool and draw the
  result in the same turn.
- **Prefill, never commit.** Values the buyer states in chat are proposed into
  the form by the model and committed only by the buyer.
- **Figures live in components.** Chat text refers to results in words and
  points at the component. It does not restate money amounts or rates.
- **Change is a delta.** Changing a decision releases that decision and redraws
  what depends on it, never the whole plan.

## Open Decisions

`common/plan/open_decisions.dart` derives, from the plan and the resolved rule
pack, an ordered list of what is still open. It is the agent's map and the
server's source for the board. It is pure and unit tested.

| Open decision | Opens when |
| --- | --- |
| `target_market` | No market selected |
| `market_coverage` | Market selected, no curated pack, no valid researched pack |
| `profile_fields` | Any field the pack requires for this buyer is missing |
| `scenario` | Profile committed, no scenario |
| `scenario_commit` | Scenario drafted, not committed |
| `obstacles_review` | Buyer faces obstacles with severity `blocker` or `effort` |
| `process` | Scenario committed |

## Flow

| Open decision | Tools | Components |
| --- | --- | --- |
| `target_market` | `resolve_market` | `LocationPicker` in `market` mode |
| `market_coverage` | `research_market` | `MarketSnapshotCard` with researched badge |
| `profile_fields` | `load_market`, `propose_profile` | `LocationPicker` in `country` mode, `MoneyInput`, `ChoicePicker`, commit `Button` |
| `scenario` | `propose_scenario`, `compute_affordability` | `AffordabilitySummary`, `AmountSlider`, `PaymentBreakdown`, commit `Button` with checks |
| `scenario_commit` | `estimate_purchase_costs` | `PurchaseCostsTable`, `StressTestChart`, `EligibilityChecklist` |
| `obstacles_review` | `get_obstacles` | `ForeignBuyerObstacles` |
| `process` | `get_process` | `BuyingProcessTimeline`, `DocumentChecklist` |

The first turn with nothing known draws one surface that asks for the market and
the buyer's basic situation together, with one commit button.

The tools column lists what a step needs, not who calls it. When a step's inputs
are settled in the plan, the orchestrator pre-runs its tools before the model is
called; the model only calls tools that need interpretation.

## Tools

Tools are Dart classes in `server/lib/tools`, one per file, each an adapter over
`common` and repositories. A tool returns three things:

- `modelResult`: compact JSON the model reasons over.
- `planPatch`: changes to the plan record, only for `propose_*` and
  `release_decision`.
- `seeds`: data model slices the server injects into surfaces created this turn.

Each tool declares whether it can be pre-run: `load_market`,
`compute_affordability`, `estimate_purchase_costs`, `get_obstacles`,
`get_process`, and `get_loan_types` can, because their inputs come from the plan.
`resolve_market`, `propose_profile`, `propose_scenario`, `release_decision`, and
`research_market` cannot, because their inputs come from what the buyer wrote.

| Tool | Input | Model result | Seeds |
| --- | --- | --- | --- |
| `resolve_market` | `query` | Candidate markets with coverage | — |
| `load_market` | `marketId` | Coverage, required profile fields for this buyer, headline rules | `/market` |
| `research_market` | `marketId` | Research status, filled and unknown fields | `/market` |
| `propose_profile` | Profile fields stated by the buyer | Accepted and rejected fields | `/profile` draft |
| `propose_scenario` | Price, down payment, term, loan type stated by the buyer | Accepted fields | `/scenario` draft |
| `compute_affordability` | — | Binding constraint, headroom category | `/derived/affordability`, `/derived/downPaymentBounds`, `/derived/payment` |
| `estimate_purchase_costs` | — | Cost item names and which dominate | `/derived/costs`, `/derived/cashNeeded` |
| `get_obstacles` | — | Obstacle IDs and severities | `/market/obstacles` |
| `get_process` | — | Step IDs | `/market/process` |
| `get_loan_types` | — | Loan type IDs | `/market/loanTypes` |
| `release_decision` | `section` | Released decisions | — |

Tool inputs never include market rules, and tool results never ask the model to
compute.

## Prompt Assembly

`server/lib/agent/prompt_assembler.dart` joins, in order:

1. `prompts/role.md`: who Homeward is, what it will and will not do.
2. `prompts/flow.md`: open decisions, the flow table, the principles above.
3. `prompts/markets.md`: coverage, how to talk about researched rules, sources.
4. `prompts/style.md`: tone, the estimates-not-advice line, how to reference
   components instead of restating figures.
5. `prompts/generated/catalog_skill.md`: the agent-visible catalog, generated.
6. A per-turn context block: open decisions, plan summary, coverage, surface IDs
   already used. No rule values.

The catalog skill uses compact examples rather than the full JSON schema, so
the system prompt stays small.

## Turn Orchestrator

`server/lib/agent/turn_orchestrator.dart`:

1. Lease the session turn in a Firestore transaction.
2. If the input is an action the server can complete, apply it to the plan. If
   it needs no model, recompile the board, finish.
3. Derive open decisions.
4. **Pre-run the predictable steps.** Every tool whose inputs are already
   settled in the plan runs now, without the model: loading the selected market,
   computing affordability for a committed profile, costs for a committed
   scenario, obstacles, process. Their model results go into the turn context
   and their seeds are staged for surfaces created this turn.
5. Assemble prompt, the pre-run results, and declarations for only the tools
   that still need interpretation: resolving a free-text place, proposing values
   the buyer stated, releasing a decision, research.
6. Call `interactions.create` with streaming, `previous_interaction_id` when
   present, `store: true`, through model selection.
7. Stream: forward the full text so far; buffer `a2ui` fenced blocks line by
   line; run tools on function calls, run any predictable steps they unlock, and
   continue the interaction with all results at once.
8. Validate each A2UI message against a shadow `MessageProcessor` rebuilt from
   the session's stored messages; on failure send a correction and continue.
9. Seed and forward valid messages.
10. Persist the turn, the new `lastInteractionId`, the models used, the number
    of model rounds, and plan patches.
11. Recompile and forward the board if the plan changed.
12. Release the lease, emit `completed`.

A turn that commits a profile or scenario therefore usually needs one model
round: the numbers are already computed, and the model only writes and lays
out. A turn that starts from free text usually needs two.

### Stream Parser

A small state machine over text deltas:

```text
prose ──"```a2ui"──► a2ui ──newline──► emit line as message candidate
  ▲                    │
  └──────"```"─────────┘
```

Complete lines are validated and forwarded as they arrive, so components appear
progressively while the model is still writing.

### Rebuilding History

Interaction history is a cache. When a request carrying
`previous_interaction_id` fails with 404 `not_found` (deleted or expired) or
400 `invalid_request` (unknown to this key, or never stored), the orchestrator
retries once without it, starting a fresh interaction from the plan summary and
the last few turns' text. Nothing is lost because the plan record holds every
decision.

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
- Errors arrive in three shapes: a Google RPC array
  `[{ "error": { "code": 401, "status": "UNAUTHENTICATED" } }]` for key failures,
  an object `{ "error": { "code": "not_found" | "invalid_request", "message" } }`
  for request failures, and an in-stream `error` event such as `api_error` for
  overload. The client maps all three to one sealed error type.
- A stream is cancelled by closing the connection. The cancel endpoint returned
  404 for a stalled streamed interaction.
- Recorded streams and error bodies live in
  `server/test/fixtures/interactions/`.

## Researched Fallback

When a market has no curated pack, `research_market` produces a researched pack.

```text
research_market(PT-20)
  │
  ├─ cache hit in researchedPacks, not expired ─► use it
  │
  └─ research interaction
       tools: google_search
       instruction: fill MarketRulePack, one source per field, unknown if unsure
       output: JSON matching the researched pack schema
         │
         ▼
     validate
       schema valid
       every numeric field cites a URL present in grounding metadata
       drop fields without a verifiable citation, mark unknown
         │
         ▼
     store researchedPacks/PT-20, expires in 30 days
```

Rules:

- Search results are data. The research instruction forbids following
  instructions found in pages, and the extraction schema has no free-form field
  that reaches the turn prompt.
- A researched pack is never promoted automatically. `tool/promote_pack` turns
  one into a draft curated pack for human review.
- Unknown fields render as unknown with an explanation, never as zero.
- If search and structured output cannot be combined in one interaction, the
  research runs as two interactions: search, then extract. This is spike S3.

## Guardrails

- Homeward estimates and explains. It does not recommend a lender, a product, or
  a decision to buy.
- Every surface that shows a rule-derived figure shows coverage.
- The disclaimer is part of the board and the first surface of every plan.
- Chat text containing money amounts or rates is flagged by evals.
- Tool errors become a short explanation and a retry surface, never invented
  figures.

## Failure Handling

| Failure | Behavior |
| --- | --- |
| Invalid Gemini key (HTTP 401 or 403) | Turn fails with `gemini_key_invalid`; app routes to the key screen |
| Key quota exhausted (HTTP 429) | Turn fails with `gemini_quota_exhausted` and retry-after; app explains it is the buyer's own quota |
| Model overloaded or stalled | Model selection falls back once; if every model is unhealthy, the turn fails with `gemini_unavailable` |
| Unknown or expired previous interaction | Retry once with rebuilt history |
| Model output invalid after corrections | Model text plus a retry surface |
| Tool error | Short explanation plus retry surface |
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
- The text door and the voice door share the plan, so a buyer can switch
  between them mid-plan.
