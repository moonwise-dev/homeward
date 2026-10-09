# Homeward Agent

The agent is a loop on the server around the Gemini Interactions API. Each turn
it hands Gemini the buyer's words or the action they took, runs the tools
Gemini calls, and forwards the surfaces Gemini draws once they validate. Gemini
decides what the buyer's screen shows and what it asks; the server decides
only whether what Gemini drew is valid (D129).

The agent works on a move the way a coding agent works on a codebase (D130):
it keeps notes, looks things up before it asks, asks one decision at a time
with its recommendation, shows its work, and proposes for the buyer to
approve. It works in an order the prompt names, the move before the money,
keeps a plan of steps the buyer can see, and ends every reply with one ask
(D164).

## Model Configuration

| Setting | Default | Config key |
| --- | --- | --- |
| Turn models, in preference order | `gemini-3.5-flash-lite,gemini-3.1-flash-lite,gemini-3.5-flash,gemini-3.8-flash` (D170) | `HOMEWARD_TURN_MODELS` |
| Thinking level | `low` | `HOMEWARD_THINKING_LEVEL` |
| Deadline to response headers | 10 s | `HOMEWARD_HEADERS_DEADLINE` |
| Deadline to first step | 20 s | `HOMEWARD_FIRST_STEP_DEADLINE` |
| Unhealthy model cool-down | 5 min | `HOMEWARD_MODEL_COOLDOWN` |
| Times a turn waits and asks again when every model it tried is overloaded | 2 | `HOMEWARD_MAX_OVERLOAD_RETRIES` (D171) |
| The wait before asking again, multiplied by the attempt | 3 s | `HOMEWARD_OVERLOAD_WAIT` (D171) |
| How long a turn keeps asking again, from the start of its first overloaded round | 30 s | `TurnSettings.overloadPatience` (D171) |
| Store interactions | `true` | fixed |
| Validation correction rounds | 2 | `HOMEWARD_MAX_CORRECTIONS` |
| Finishing rounds, for a reply with no words, or one that drew nothing of what its tools handed it | 1 | `HOMEWARD_MAX_FINISHING_ROUNDS` (D168, D182) |
| Model rounds per turn | 1, plus one per tool round, catalog round, correction round, and finishing round | enforced by the caps below |
| Surfaces per plan | `plan`, and at most one inline surface per turn (D131, D139) | fixed |
| Tool rounds per turn, cap | 3 | `TurnSettings.maxToolRounds` (D85) |
| Catalog rounds per turn, cap | 2; a round whose calls only read `component_docs` counts here, not as a tool round | `TurnSettings.maxCatalogRounds` (D147) |

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

`gemini-3.1-flash-lite` has gone second since D170. Google counts the free
requests per model, so it brings 500 a day of its own on the same key, where
the turn used to fall straight to the Flash models and their 20. On
2026-10-06, with the first key's `gemini-3.5-flash-lite` at its daily limit,
`gemini-3.1-flash-lite` answered on that key: a five-turn replay of the
"take home 10k" conversation took 12 requests and no correction, asked which
figure was meant, asked the missing facts together, and reached what the
family can borrow and two homes. Its rounds took 6 to 9 s against about 5, so
a turn took 14 to 22 s against 10 to 13. One replay, not a rehearsal.

Free-tier limits, read in AI Studio for the Homeward project on 2026-09-17.
They apply per Google Cloud project, so every key in the project and AI Studio
share them, and daily limits reset at midnight Pacific:

| Models | Requests a minute | Input tokens a minute | Requests a day |
| --- | --- | --- | --- |
| `gemini-3.8-flash`, `gemini-3.7-flash`, `gemini-3.5-flash` | 5 | 250K | 20 |
| `gemini-3.5-flash-lite`, `gemini-3.1-flash-lite` | 15 | 250K | 500 |
| `gemma-4-26b-a4b-it`, `gemma-4-31b-it` | 30 | 16K | 14,400 |

A turn takes one request, plus one for each tool round, catalog round,
correction, and finishing round, at most nine under the caps above, and one
more when `read_listings` reads. The ten turns rehearsed on 2026-09-28 took 24
(`docs/SPIKES.md`, S17), about two and a half each, and the 53 of the second
rehearsal on 2026-10-05 took 2.75 on average, 7 of them with a correction. A
model at a limit hands the turn to the next (D79), so a buyer's free key
covers roughly 180 turns a day on `gemini-3.5-flash-lite`, as many again on
`gemini-3.1-flash-lite` (D170), and about fifteen more on the two Flash
models. The key screen's "about 250" dates from two
requests a turn (D78). Two or three quick turns in a minute can reach a Flash
model's per-minute limit. AI Studio counts refused requests too: it showed 7
of 5 a minute and 24 of 20 a day.

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
- The deadlines are the first thing to raise when Gemini is slow. On
  2026-10-05 at 15:05 CEST a one-word reply took 13.5 s on Flash-Lite; at the
  default 10 s to response headers the models missed it and most turns failed
  with `gemini_unavailable`, while at `HOMEWARD_HEADERS_DEADLINE=40` and
  `HOMEWARD_FIRST_STEP_DEADLINE=60` a turn completed in 34 s. A model that
  hangs for good now costs up to 40 s before the fallback, so raise both for
  a demo and keep the defaults otherwise.
- An overloaded round is retried on one more model only. A request limit
  refusal arrives within a second, so it moves on through every remaining
  model.
- When the models a round tried are overloaded, the turn waits and asks
  again instead of failing (D171): `HOMEWARD_MAX_OVERLOAD_RETRIES` times a
  turn, 2 by default, after `HOMEWARD_OVERLOAD_WAIT`, 3 s, then twice that.
  The round is taken back first, as on a fallback, a correction round stays
  a correction round, and a stop from the buyer ends the wait at once. Only
  a round with no accepted message is asked again, and only while less than
  30 s have passed since the turn's first overloaded round began: refusals
  that come within a second are waited out, and requests that hang until a
  deadline are not asked again and again. Each new attempt starts from the
  models whose circuits are still closed, so two waits walk the whole list.
- An overload that ends a round while a model is skipped for the key at its
  request limit is reported as that refusal, `gemini_quota_exhausted`, not
  as `gemini_unavailable` (D171): the key is out of requests on the models
  that would have answered, and a client with another key should move to it
  rather than wait. On 2026-10-06 the first development key had both its
  cheap models at their daily limits and `gemini-3.8-flash` answered "high
  demand"; seven of eleven turns failed as unavailable, and neither the app
  nor the probe ever tried the second key, which was answering.
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
  SHA-256 digest of the key that is never logged or stored. A skipped model
  is asked again only when every model is skipped for the key, those whose
  circuits are open included.
- A request limit refusal also moves on to the models whose circuits are
  open, the one closing first first, since a model that stalled once is a
  better bet than one out of requests. On 2026-09-28 Flash-Lite stalled once
  while both Flash models had spent their 20 requests of the day, and every
  turn for the next five minutes failed within a second without asking
  Flash-Lite. When every model whose circuit is closed is skipped for the key,
  the request starts on the open one closing first rather than asking a
  skipped model to refuse again; on 2026-09-28 a skipped Flash was refused
  once every round before Flash-Lite answered. An overload still moves on to
  one more model only, and never to a model whose circuit is open.
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
  down as deduced, with the words it came from when they are the buyer's
  own, and says in its reply what it assumed.
- **Answer first** (D182). A reply shows what can be worked out from what is
  known, with what was assumed, before it asks for anything.
- **No card is owed** (D182). A block is drawn when a tool produced its data
  this turn or the buyer asked for it. `PlanOverview` and `Brief` are drawn
  when the buyer asks where things stand or what Homeward knows.
- **A result shows itself** (D185). When a tool works something out, its
  cards go on the plan as it answers, the newest on top, before Gemini
  writes a word. Gemini decides which tools run, writes the reply,
  composes what it asks, and changes the plan when it has a reason: it adds
  a card that waits under `ready`, takes one off, or reorders them.
- **Never ask what a tool can find out.** Places, distances, travel times, and
  what a listing says are looked up.
- **The move before the money** (D164). Unless the buyer leads elsewhere,
  Gemini works in the order the prompt names: the move, where to, who will
  live in the home, rent or buy, and when; what the home must do and where
  the week goes; the money; then homes and the week from each. The order is
  a method, never a scenario: no story, question, or wording is fixed.
- **Ask last, and little** (D182). A reply asks at most once, at its end,
  and only for a fact no tool can find or estimate, or a decision that
  changes the result. Confirming what was assumed comes before a question.
  A decision with consequences is a `Choice` with Gemini's recommendation
  first and why (C4b, D145). Several facts only the buyer knows are asked
  together in one `Questions` card (D165). A yes or no, or what to look at
  next, is a sentence with buttons, built from basic components. When
  nothing is needed the reply ends in words. Typing stays open for any
  other answer.
- **Say what the answer changes.** A reply begins with what Gemini can now
  work out, assume, or rule out, never with thanks or the answer repeated.
- **Assume, estimate, and say so** (D183). A tool answers from what it has:
  what the buyer has not said it assumes as the common case or estimates
  from a sourced table, marks it on the screen, and Gemini asks once
  whether it is right. A tool asks only for what cannot be assumed.
- **A figure is checked before it is used** (D166). `compute_affordability`
  refuses pay that cannot be right and says why; Gemini says what looks off
  and offers the figure given and the figure it thinks was meant.
- **Propose, then build.** Gemini offers solutions when it judges it knows
  enough, and the buyer's confirmation or correction decides what grows next.
- **Money is the spine** (D138). Every journey reaches what the household can
  borrow and what a home costs them; Gemini draws the money blocks once it
  knows enough, and tools compute every figure from the sample rates and
  rules.
- **Never telegraph.** "Let me check…" is not a turn. Call the tool and draw the
  result in the same turn. Words written in a round that ends in tool calls
  are dropped (D168).
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

The plan panel's root is a `Column`, and the app draws each of its children
as a card (D169). It holds what tools produced, the newest first (D182).
`PlanOverview` (D164), the household's story so far and the steps Gemini
wrote for it, is drawn when the buyer asks where things stand, and no
longer with every reply.

The brief (C4, D132) is Gemini's notes on the household, the way a coding
agent keeps a plan. Gemini writes it with `update_brief`; the server keeps it
as the `/brief` slice of the turn's record, so the next turn starts from it,
and seeds it into the surfaces that bind it. It is Gemini's own record: the
turn context carries it, and the screen shows it, as one `Brief` whose items
are `Fact`s, when the buyer asks what Homeward knows (D182). A buyer taps
Right or Not quite on a deduction there, and Gemini updates the brief and
follows up; the server never edits the brief or decides from it (D144).

## Tools

A tool is an `AgentTool` in `server/lib/tools/`: a name, a description,
JSON Schema parameters, and a `run` that takes the arguments and the progress
steps and returns a `ToolResult`, the result the model reads and the seeds, data
model slices keyed by name, that surfaces may bind. `homewardTools` in
`server/lib/tools/homeward_tools.dart` lists them, and each further tool
arrives with the step of `docs/ROADMAP.md` that needs it.

- Tools never call Gemini themselves; `read_listings` alone asks it one
  structured question, through the researcher in its `ToolContext` (D156).
  They measure through `server/lib/research`, whose
  open-data clients find places with Nominatim, look near them with Overpass,
  and route by car, bike, and foot on the FOSSGIS router and by public
  transport on Transitous. Calls go one at a time per service with the gap its
  policy asks, under a user agent naming Homeward, and are cached for six
  hours in memory (D173).
- Each lookup reports a measuring step through `ResearchSteps`, which the turn
  streams as a progress data part while tools run (D108). Labels come from the
  tool, never from the model.
- A tool that seeds a slice answers with `draw` (D167): the cards for its
  result, each with an ID, its bound paths, and the actions it takes, such
  as a `HomeCard` for each of the first three homes `search_homes` found.
  Gemini sees each card as its ID and component name only, and shows one by
  naming its ID in the children of the plan's `root`; the server keeps the
  body and supplies it (D184). Gemini still decides which cards show and in
  what order, and never retypes one. The cards a plan was handed stay with
  its session, and the turn context lists those not on the plan under
  `ready`, so a card handed in one turn can be shown in a later one.
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

`arrange_plan` (D185) measures nothing either: it changes which cards the
plan shows. `show` puts cards on the plan, the first named on top, either
ones that wait under `ready` or ones already there that should come first;
`remove` takes cards off. It refuses an ID no tool has handed over, and
names the cards that wait. Cards under `draw` never need it. Gemini calls
it in the same step as the tool whose card it wants, or alone when the
buyer asks to see or drop something, and the plan changes with the other
cards of that tool round. It exists because Gemini calls tools reliably and
writes plan messages unreliably: on 2026-10-09 it said it had added a flat
it had never put on the plan.

`update_brief` (C4, D132) records what Gemini learned or deduced about the
household. Each item has an ID, a kind (`household`, `money`, `need`,
`habit`, `want`, `place`, or `open`), one short sentence to the buyer, a
source (`said`, `deduced`, or `confirmed`, a deduction the buyer tapped Right
on), and the buyer's words it came from. An item with an existing ID replaces
it; `remove` drops items. The tool checks each item and keeps every one it
can (D182). Words that appear word for word in what the buyer wrote or
tapped in this plan are kept as the item's quote; words that do not are
dropped, and the item is kept as deduced with no quote, so a quote on the
screen is always the buyer's own. Every number above twelve in the
sentence, in digits or spelled out, must have the same value as one in the
buyer's words, so a figure in the brief is always the buyer's own; a small
count, such as two adults, may be deduced. An item that fails that check,
or is malformed, is left out and named to Gemini under `leftOut`, with a
note not to call again for it, while the rest are stored. Until
2026-10-09 one failed item stored nothing, and on the hosted build a turn
spent three rounds on it and drew no plan. Only the summary is logged,
never the buyer's figures. It returns the whole brief and seeds it as
`/brief`. Measured, quoted, and estimated items come from the tools that
measure, quote, or estimate, never from `update_brief`. When a money item
was recorded, its answer reminds Gemini to call `compute_affordability` with it before replying, so
the figure is checked in the turn it is given (D166), unless they rent:
people renting are never asked what a loan needs, and `split_rent` takes
what each of them earns.

`compute_affordability` (C5, D146) works out what the household can borrow
from the sample rules of a covered market, Sweden or Portugal, which the
server loads from `markets/` at startup. Its arguments are the figures the
buyer stated, such as incomes, savings, and debts, each with its currency and
period, and the household: adults, children's ages, borrowers, residency, and
use of the home. Every amount other than zero must appear in the buyer's
words, as `update_brief` checks; one that does not is left out and named
under `leftOut`, and the tool works with the rest (D183). The buyer's words
include what an action's context carries, its text and its numbers, such as
an amount typed into a `MoneyInput` (D158). It returns what it still needs,
each fact with the pack's reason, or the result: the largest loan, the
highest price the savings and the rules allow, and the rule that limits it,
with its source. It seeds `/affordability`, which `AffordabilitySummary`,
`HouseholdSummary`, and `RuleNote` bind. Its
market is one of the covered packs, listed in its description, so for a home
anywhere else Gemini tells the buyer the sample does not cover it. Incomes,
debts, and savings are lists in their own currencies, converted with the
sample exchange rates the summary names. It logs the facts it still needs,
never the figures.

Before it works anything out, the tool checks that pay makes sense (D166).
`figureDoubts` in `common` compares the take-home pay, and the pay before
tax, with the sample everyday costs of the household as known so far, one
adult when nothing is known: the pack's living costs plus the running and
transport costs lenders count. Pay that does not cover them, which no loan
would pass, or take-home pay above pay before tax, comes back as `doubts`,
each with its argument and why, and whether one more zero would cover the
costs; nothing is seeded. Gemini then says what looks off and asks with a
`Choice` whose options are the figure given and the figure it thinks was
meant, and calls again with the answer, with `confirmed` naming the argument
when the buyer stands by theirs. A figure is doubted only in the call that
passes it.

The tool needs two things from the buyer, what they earn and what they
have saved, or a price in place of savings. Everything else it assumes or
estimates when it is not passed, and says so (D183). `assumeUnstated` in
`common` fills what the market's pack lists under `profileFields` and the
buyer has not said: one adult for each income passed, no children, no other
loans, an oldest borrower of 35, and, where the pack asks, tax residence in
the market, a home to live in, and employment. Every adult is taken as a
borrower. Take-home pay comes from pay before tax through the market's
income tax table, `markets/income_tax`, each income taxed as one person's
pay; Sweden has one, Skatteverket's 2026 table for Stockholm, and Portugal
has none yet, so there take-home pay is still asked for. The slice lists
each under `assumed`, with `takeHomeSource` for the estimate, and
`HouseholdSummary` marks those lines. An assumption stays, and stays
marked, until a call passes the fact; take-home pay is estimated again when
pay before tax is passed again.

When income or savings are missing, `needs` lists them, each with `ask`, the
fields for it in plain words, such as "What you earn together before tax" as
money a month, and its note tells Gemini to ask for them together in one
`Questions` card. Gemini calls the tool before it asks for money facts, with
the market alone if that is all it has. Once it has answered, the tool keeps
that household and its figures for the market, so a later call passes only
what is new, such as `home`. The market itself may be left out: the tool
takes it from the last run, or from the one city `look_up_market` has looked
up.

With the result it answers `limit`, one sentence on what sets the limit, the
savings, the income, or what is left to live on, for Gemini to put in its own
words; `assumedAboutThem`, what it assumed or estimated about the household,
with a note to say so in the reply; `draw`, the cards that answer (D187):
the summary always, the household when anything about it was assumed, the
monthly cost when there is a home or a price, the limiting rule when the
loan is over it, and the home being worked out; and `drawWhenAsked`, the
rest, the stress test, the costs on the day, the down payment slider, the
rates, and the loan year by year among them, each ready to add when the
buyer asks or picks it as the next thing to look at.

`show` names cards the buyer's message asks for, so one call answers a
message that asks several things: each entry holds the card, `monthly`,
`costs`, `stress`, `down-payment`, `rates`, `loan`, `household`, or `limit`,
and `theirWords`, the words of the buyer that ask for it. A card whose
words are not in what the buyer wrote waits instead; without that check
Gemini named four cards for a message that asked for none.

The household card carries a `confirm` action while a line is assumed, a
button that reads These are right, so Gemini draws no ask for the
assumptions. `assumedRight` clears the marks of everything the tool
assumed; an estimated take-home pay stays marked as an estimate. The tool
claims three taps (D187), which the server runs before the first model
round: `confirm_household` as `assumedRight`, `work_out_home` with the
home's ID, and `take_rate` with the rate's ID.

The buyer's preferences shape what a home costs them a month (C5b, D147):
the price of a home they name, the down payment they want to make, and the
monthly fee they stated, such as a Swedish association fee or a Portuguese
condominium fee, all checked against their words like the other amounts, and
the term. The fee also counts in the Swedish left-to-live-on check. Where the
buyer has not said, the tool assumes the minimum down payment the rules allow,
or, when the savings cannot reach it, the most the savings can put down, never
below the loan-to-value minimum, so a home out of reach shows what it would
really cost and how far the loan is over the limit (D153); and, where the term
moves the payment, the longest term they allow, and its
answer lists what it assumed. Gemini shows the result, then asks about one
assumption that matters to this household with `Choice`, and records the
answer in the brief. It offers no choice the tool cannot compute, such as a
fixed rate, and a choice about money carries no recommendation, since
Homeward explains and does not advise. `MonthlyCostBreakdown`
binds the same `/affordability`.

With the result, the tool adds the stress curve and the upfront costs (C6,
D148): the monthly cost at today's rate, at the rate lenders test, and past
it, against the most the household can carry and the rule that sets it; and
every upfront cost the pack lists, each with its source and what is
refundable. `StressTestChart` and `PurchaseCostsTable` bind them in
`/affordability`.

It also works out the down payment what-if (C6b, D149): steps from the
minimum the rules allow at that price up to what the savings reach after
the costs on the day, at most 40, each with the loan, the monthly cost, the
cash needed, and whether it is within the rules, all from the same code.
`DownPaymentSlider` moves through them on the device. When the buyer taps
"Use this down payment", its action carries the amount, which the number
check accepts as the buyer's words, and Gemini calls the tool again with it.

The mortgage options (C6c, D150) are the sample lender's rates for each
market: SBAB's list rates in Sweden, variable and fixed for 1, 3, and 5
years, and Banco BPI's price list in Portugal, variable, mixed with the rate
fixed for 3 or 5 years, and fixed for the whole term. The tool works out
each at the plan's price, down payment, and term, with the monthly cost and
whether the loan is within the rules at it, since Portugal's stress test
applies to variable and mixed rates only. Its `loanType` argument takes the
option the buyer chose; without it the variable rate is assumed. Rates come
from the pack and the rates file; Gemini never names one.

It also works out the loan year by year (C10b, D159) at today's rate over
the term: the balance, the equity at today's price, and the interest paid
by then after any deduction, into `/affordability` for `LoanBalanceChart`.
The schedule lives once in `common` and `compare_buy_rent` uses it too. In
Sweden each year's amortization is the rules' share of the loan as first
taken for the tier the balance is in, 2% while it is above 70% of the price,
1% above 50%, and none below; in Portugal it is the annuity over the term.

`plan_savings` (C10b, D159) works out how long until the household's
savings cover the cash the home in `/affordability` needs on the day. It
takes the monthly saving the buyer stated, from their words or a
`MoneyInput`, checked like every amount. The target is the cash needed at
the down payment they chose, or at the minimum the rules allow. It seeds
`/savingsPlan` for `SavingsPlan` with what is still to save, the months to
go, and the month they get there, and answers with the months. It leaves out
what the savings earn and prices and incomes changing, and says so. Before any
affordability run it says it needs the household.

`look_up_market` (C10b, D159) describes a city from the sample data before
anything is known about the household: the currency, the sample lender's
rates with the date read, the lending rules that set the loan for a buyer
Homeward knows nothing about yet, the rules that wait on the household, and
each area's median price and rent per square metre from the sample homes,
each with its source. It takes one of the cities `search_homes` covers, seeds
`/markets/<city>` for `MarketSnapshotCard`, and answers with the areas and
the rules, never the figures.

For people who rent, `search_homes` takes `renting` (D186) and remembers
it for the plan: each home then carries `rent`, an estimate from its area's
median rent a square metre and its size, with the source, the homes come
lowest rent first, and nothing is priced as a purchase. The card's choose
action is then `split_this_rent`, which Gemini answers with `split_rent`.

`search_homes` (C7, D151) searches the labelled sample homes of Stockholm
and Lisbon, which the server loads from `markets/listings/` at startup. Its
arguments are what the buyer asked for: the city, the kind of home, the
fewest rooms or bedrooms, areas, outdoor space, and a highest price they
stated, checked against their words like the other amounts. It prices each
home that matches for the household the last `compute_affordability` run
kept in `/affordability`, its profile and whether the down payment was the
buyer's: at the home's price and fee, with that down payment or the minimum
the rules allow, the same rate, and the same term, from the same code. It
answers with each home's ID, address, title, area, kind, rooms, and whether
it is within the rules and the savings, so Gemini can tell which home the
buyer means by its street, and seeds `/homes`, an object of homes by ID that
`HomeCard` binds. Before any affordability run in that market it seeds the
homes with their price and fee only and says pricing needs the household;
when nothing matches, it answers with how many homes each filter ruled out,
so Gemini can ask which to loosen. When the buyer taps a `HomeCard`, Gemini
calls `compute_affordability` with `home`, the home's ID, whose price and
fee come from the listing rather than the buyer's words, so every money
block follows that home.

`keep_homes` (C7b, D152) keeps and drops homes on the household's
shortlist. Its arguments are the IDs to keep and the IDs to drop, from a
`HomeCard` or `Shortlist` tap or the buyer's words. It marks each home kept
or not in `/homes`; a sample home the plan has not shown yet is priced and
added first, the way `search_homes` prices it. An ID that is no sample home
gets an error naming it. It answers with the kept IDs and seeds `/homes`,
which `Shortlist` binds. `search_homes` and `compute_affordability` keep the
flag when they reprice the homes.

With `deal` (C9c, D157), `search_homes` also deals a swipe deck: from the
homes that match, up to six that differ in kind, outdoor space, style, and
size, flats and houses in turn, priced like the rest, seeded as
`/swipe/homes` for `HomeSwipe`. When the buyer finishes the deck, Gemini
calls `keep_homes` with the kept IDs as `keep` and the others as `passed`;
the kept homes join the shortlist, and the answer says what every kept
home shares that a passed one lacks, a kind of home, outdoor space, or
style, with the kept areas, for Gemini to deduce from and confirm.

`find_place` (C8, D154) resolves the places the buyer names: work, a
school, a parent's home, a clinic. It takes the city the places are in and
looks it up first, then searches for each place within the city's bounds,
since the first match for a name can be another city's: "KTH Royal Institute
of Technology" alone finds the Södertälje campus. Each place has an ID, a
short name for the screen, and a search in the buyer's words. Nominatim looks
each one up, so every place shown was checked against open data (D101), and
the answer gives each address so Gemini can search again when it is not the
place the buyer means; one it cannot find
comes back unresolved and is not stored, and Gemini asks the buyer where it
is. It seeds `/places`, an object of places by ID with the name, the address
OpenStreetMap gives, and the point, and answers with what it found. It shows
a progress step for each lookup and logs how many it found, never the
places.

`measure_week` (C8, D154) measures the buyer's week from one starting point:
a sample home's ID from `/homes` or a place's ID from `/places`. Each trip
names a place from `/places`, how many times a week the buyer goes there and
back, from 1 to 14, a small count Gemini may deduce, and how they travel:
walking, bike, car, or public transport. The FOSSGIS routers measure walking,
cycling, and driving, and Transitous public transport on a weekday morning.
The tool seeds `/week/<from>` with the starting point, each trip's minutes
and distance one way, and the weekly total, there and back; a trip no router
can measure is kept without figures and named in the answer. It answers with
each trip's minutes and the weekly total, and shows a progress step for each
trip. `WeeklyTravel` binds `/week/<from>` and `RouteSummary` one trip,
`/week/<from>/trips/<n>`.

Each measured trip also keeps its path in the slice (C8b, D163): the route
the router returned, simplified in `common` to at most 100 points and
encoded as a polyline, a short string. `WeekMap` binds `/places` as its
`markers` and one `/week/<from>` as its `routes`, and draws each trip along
that path, so the line on the map is the route that was measured. The
tool's answer to Gemini carries no path; like every seeded slice, it reaches
Gemini only inside the surface data an action on the plan sends back, which
is why it is kept short.

Each sample home carries its area's median rent per square metre with its
source (C9, D155): Statistics Sweden's 2025 figure for first-hand leases in
Stockholm, which a newcomer rarely gets without years in the queue, and
INE's median for new leases in Lisbon. A home like it rents for that figure
times its size, an estimate; a rent the buyer states replaces it.

`split_rent` (C9, D155) splits a home's rent and bills between two to eight
people sharing. It takes a sample home's ID, whose area gives the rent, or
the rent the buyer stated, the monthly bills they stated, and each person:
a label in the buyer's words, such as "You" or "Your friend", their income
and their room's size when the buyer gave them. Every amount and size is
checked against the buyer's words. It works out each rule it has the
figures for: equally; by income, rent and bills in proportion to the
incomes; and by room size, rent in proportion to each room plus an equal
part of the shared space, bills equally. The parts add up to the total to
the cent. It seeds `/rentSplit` for `RentSplit` and answers with the rules
it could work out and which figures would add the others. When the buyer
takes a rule, Gemini calls it again with `rule`. Without a home or a rent
it splits the first flat `search_homes` showed for renting and says which
(D187), so it can run in the same step as the search.

`compare_buy_rent` (C9, D155) compares buying a sample home with renting
one like it. It takes the home's ID, the rent the buyer stated if any, and
how many years they expect to stay, 1 to 30, a small count Gemini may
deduce; without it ten years is assumed and said. It prices the home for
the household the last `compute_affordability` run kept, like
`search_homes`, then adds month by month what buying costs, the costs on
the day, interest after any deduction, and the home's fee, against the
rent, with the equity built from the down payment and the loan paid off at
today's price, for 30 years, on the loan schedule
`compute_affordability` uses. It seeds `/buyVsRent` for `BuyVsRent` and
answers with both totals at the years chosen and the year buying comes out
cheaper. Before any affordability run it says it needs the household.

`read_listings` (C9b, D156) reads sample homes for what the household
needs the home itself to have. It takes the IDs of the homes, or a city to
read every sample home there, and up to six needs Gemini names from the
buyer's story: an ID, the buyer's short words, such as "A bath for the
kids", and what counts as meeting it. One structured request on the
buyer's key, fast model first, answers per home and need whether the
description meets it, rules it out, or says nothing, with the sentence that
decides it. Code keeps a quote only when it appears in the description word
for word; a verdict without one becomes says nothing. Readings are kept per
home and need, so asking again costs no request. It seeds `/reads/<home>`
with the description and every need read so far, which `ListingQuote`
binds, and answers per home with the needs met, ruled out, and not
mentioned. Gemini decides which homes to show or leave out. It shows one
progress step for the read and logs counts, never the needs or quotes.

A tool reads the turn through its `ToolContext`: the progress steps, the
slices as they stand, the buyer's words in this plan, and a researcher that
asks Gemini one structured question on the turn's key.

No other tools are planned before the recording.

After the recording (D142): on-the-spot research of rules and rates (S12),
reading a listing the buyer pastes (S13), and areas for any city.

## Prompt Assembly

`server/lib/agent/prompt/prompt_assembler.dart` loads, once at startup, and
joins in order:

1. `prompts/role.md`: who Homeward is, how it works, in which order, and
   what it never does.
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
5. `prompts/reply.md`: five lines on what to do before replying, check a
   buyer's money figure, look up a city or a place, do what they asked for
   outright, record what their words imply, then say what the answer
   changes, send the plan, and end with one ask. It comes
   last because the model follows best what it read last (D168).

Everything, the context block included, is sent as `system_instruction`, which
goes out again with every request of the turn, tool-result rounds included, and
is never stored in the interaction history (D70).

The catalog skill discloses the catalog progressively (D143). It carries, as
compact JSON Schema and exactly what validation enforces (D69), the core
components every plan uses and correction rounds offer (`Column`, `Row`,
`Card`, `Text`, `Button`, `Divider`, `Fact`, `Choice`,
`AffordabilitySummary`, and `RuleNote`, D144 to D146), every function, and
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
   surface data. When a tool claims the action as a tap on its own card's
   button (D187), the server runs that tool first, shows its cards, and
   adds its answer to the input with a note not to call it again, so the
   reply takes one model round.
4. Before every model request, assemble the system instruction with a fresh
   turn context, and declare the tools.
5. Call `interactions.create` with streaming, `previous_interaction_id` when
   present, `store: true`, through model selection.
6. Stream: forward the full text so far as it grows; validate each message of
   an `a2ui` block as it completes; collect function calls. When the round
   ends in function calls that run, the words it wrote are taken back, the
   way a failed model's draft is: they were written before the facts, and
   Flash-Lite at times writes its reasoning there. They return only if the
   turn ends with no other words (D168).
7. Forward accepted messages through the seeder: a `createSurface` is held
   until its first valid `updateComponents`, then sent with
   `sendDataModel: true`, followed by one `updateDataModel` for each slice a
   tool seeded that its components bind, then the components. A surface whose
   tree never validates never reaches the buyer. A round that ends with a
   surface created but no components counts as a rejected message, so the
   correction round asks for its `updateComponents` (C5b). A surface need
   not be created by the model at all (D184): an `updateComponents` for
   `plan`, or for an inline ask of this turn, that has no surface yet
   creates it. A card a tool handed over is drawn from the tool's body
   (D183, D184): when a message names its ID in a container's children
   without sending it, the body is added, and when it sends a component of
   the same ID and kind, the tool's body replaces it. A card whose body a
   tool changed in this turn is sent again when the tree still shows it.
   A component list that holds anything but objects, such as a bare card
   name, is rejected with the reason, and a line of closing brackets left
   over after a message is ignored.
8. When the round ended with function calls, run them in the order the model
   made them and continue the interaction with every result at once, at most
   three tool rounds, plus at most two rounds that only read `component_docs`.
   After the tools ran, the server shows what they handed over under
   `draw` (D185): it sends the plan's `root` with those cards' IDs put
   before the children it had; cards already on the plan keep their
   place. Cards under `drawWhenAlone`, the city at a glance, go on only
   when the plan would otherwise be empty, and wait under `ready`
   otherwise (D187). The message goes through the same validation as Gemini's, and
   one that fails is logged and dropped, never sent back to Gemini to
   correct. Every batch of tool results carries a short note (D183): call
   what the buyer's message still asks for, then reply with sentences for
   the buyer, and an `a2ui` block only to ask something or to change the
   plan. The request after the last allowed tool round ends
   with a note that tools are done and sets `tool_choice` to `none` (D85).
   Every round is logged with its status, the names of the tools called,
   and its duration.
9. When messages were rejected, continue with one text input listing each
   `VALIDATION_FAILED` error, at most `HOMEWARD_MAX_CORRECTIONS` rounds. The
   correction round asks with an enforced response schema (D110): a JSON object
   of messages, offering the core components and the components the turn drew
   or tried to draw. The schema leaves out `minItems` and `maxItems`, which
   validation still enforces: on 2026-10-05 Gemini answered `invalid_request`
   to any schema holding `Questions`, whose `fields` are a bounded list of
   objects with seven properties, and accepted it without the bounds. If
   Gemini refuses the schema, the round repeats without it.
10. When nothing is rejected and the reply is unfinished, continue once with
    a note that names what is missing and asks for that only, at most
    `HOMEWARD_MAX_FINISHING_ROUNDS` times (D168). Unfinished means no
    words for the buyer, or words that end in a question with no inline
    ask drawn (D185): the buyer would have nothing to tap, so the note
    asks for the ask alone, under the correction round's schema. From D182
    to D185 a turn that drew nothing its tools had handed it was
    unfinished too; the server shows those cards itself now. Words that hold the model's notes to itself count as no
    words (D183): text with a backtick, a JSON object, or a protocol word
    such as `updateComponents` is taken back, and the note says why. The
    words are asked for in a free round. A round that still asks for a
    tool after the last tool round is unfinished too: its words, written
    before any result, are dropped, and each call is answered with an
    error beside the note. The note picks no question and draws nothing.
    From 2026-10-05 to 2026-10-09 every reply owed a plan panel and an
    inline ask; a reply in words alone, to a question that needs no
    screen, is a finished turn again.
11. A turn that drew nothing, and has no words or has messages still
    rejected after the last correction, ends its text with a line asking
    the buyer to send the message again. A turn that drew something keeps
    what was accepted and says nothing of what was not (D182): on the
    hosted build the line stood above a card that had drawn.
12. Save the turn number, the last completed interaction ID, and every
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

A line that starts a new message, `{"version"`, ends the message before it
even when that one left a quote open (D168). JSON cannot hold a raw line break
inside a string, so such a line is always a boundary. On 2026-10-05 a step
note missing one quote, `"note: "At least three rooms"`, kept the parser
inside a string to the end of the block, and the turn's inline ask was lost
with it. The validator's repair now closes such a key, so the message is
accepted without a correction round.

Messages joined by commas on one line, an array without its brackets, are
split into their messages, as an array is; Flash-Lite wrote the plan and its
ask's `createSurface` that way once on 2026-10-05.

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
conversation, from the turn's first input. A continued request answered with
nothing at all, no text and no tool call, is handled the same way (C6b): it
happened on three later turns on 2026-09-27, twice in a row in one session,
so the fault sits in the stored chain. The new chain replaces the stored
one, so later turns are clean.

To find that fault (spike S17), each round's log line names the model that
served it, and when a round's function results are refused, the orchestrator
reads the interaction it chained to back from the API before starting over,
with `GET /v1beta/interactions/{id}`, and logs its status, its model, and the
types of its stored steps, such as `user_input`, `thought`, and
`function_call`, never their content, beside the model of the round before
and the names of the tools answered. A failed read is logged and changes
nothing.

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
  `generate_content_free_tier_requests`. An in-stream error whose code is
  none of these but whose message starts `Rate limit exceeded` is a quota
  error too, per model when it reads `Rate limit exceeded for model …`,
  recorded from a live turn on 2026-09-27 at Flash-Lite's 500 requests a day.
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
| Key quota exhausted (HTTP 429) | Turn fails with `gemini_quota_exhausted` and the next midnight Pacific as reset time; an app with another key sends the turn again on it without a word (D171); with none left it asks to try again in a minute and names when the daily limit resets |
| Prepaid credits depleted | Turn fails with `gemini_credits_depleted`; app offers to change the key |
| Model overloaded or stalled | Model selection falls back once; when that fails too, the turn waits and asks again, twice by default (D171); then it fails with `gemini_unavailable`, and the app waits once more and sends the turn again before it shows anything |
| Overloaded while a model is at its request limit for the key | Turn fails with `gemini_quota_exhausted`, so a client with another key moves to it (D171) |
| Unknown or expired previous interaction | Retry once on a fresh interaction |
| Stored chain refused with `invalid_request` before anything is drawn | The turn starts over once on a new conversation |
| Model output invalid after corrections | Model text, and the retry notice when the turn drew nothing |
| A reply with no words | One finishing round asks for them; what was drawn stands |
| A reply that asks in words and draws no ask | One finishing round asks for the ask alone, unconstrained, and keeps only its `a2ui` block; a card that asks by itself, such as the household card's button, counts as the ask |
| A tap on a card's own button that a tool claims | The tool runs before the first model round, and Gemini hears its answer with the tap |
| A plan message that names a card where a component belongs | The card is put first on the plan, as `arrange_plan` would |
| Words written before the tools ran | Dropped when the round ends in tool calls, unless no later words come |
| Words that hold the model's notes to itself or code | Taken back, and the one finishing round asks for sentences for the buyer |
| A message that names a handed block without its body | The body is filled in from the tool's answer |
| A money figure that cannot be right | `compute_affordability` answers with `doubts` and seeds nothing; Gemini asks which figure is right |
| Tool error | The model hears the error and says so in a sentence |
| A tool throws | The model hears that the tool failed and nothing was changed; the error is logged |
| The turn throws unexpectedly | Turn fails with `internal`; the turn is cancelled, so its session is saved and released for the next message |
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
