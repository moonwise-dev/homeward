# Homeward Product

## Product Summary

Homeward is a home-finance agent, Moonwise's sample for the finance and
fintech vertical of the Flutter GenUI initiative. It works out what a home
would really cost one household, and whether they can carry it, the way a
coding agent works through a codebase (D130, D138).

A buyer or renter tells it a little about their move in their own words.
Homeward deduces what it can, looks up what it can find out, and asks only what
it cannot: one real decision at a time, as a choice with its recommendation.
Piece by piece it learns the household behind the money: who moves, what they
earn, where their week takes them, what the home must do for them. Then it
shows the money decision that no bank form can fit: what they can borrow, what
a specific home costs them each month, which mortgage option suits them,
whether it survives a rate rise, what they pay up front, and how rent splits
between people sharing.

The story is what makes the numbers personal. A family moving a parent in sees
the monthly cost of the larger, step-free home they need; two friends sharing
in Lisbon see the rent split fairly beside both their weeks on one map.
Nothing is scripted: Homeward holds building blocks, not screens, and Gemini
composes each household's screen from them as the conversation goes.

On 2026-09-26 the product was cleaned down to its foundation (D129) and
rebuilt in small chunks. By 2026-09-28 the four journeys below were built
and rehearsed, all but the map, which waits on the Maps keys; "Where We Are"
in `docs/ROADMAP.md` says what is built, what is next, and what is open.

## How It Works

- **The conversation and the plan** (D139). Questions and options arrive as
  cards inline in the conversation, so the history shows each decision. Beside
  it, the plan panel is one living surface Gemini changes in place (D131): what
  it understood, the homes on the shortlist, the week on the map, and the
  money. On a phone the plan is a tab.
- **The brief.** Gemini keeps its own notes on the household, the way a coding
  agent keeps a plan: incomes and savings as stated, needs, habits (a place and
  how often), wants, places, and what is still open. Each item says where it
  came from: said by the buyer, deduced from their words, measured by a tool,
  or quoted from a source. The buyer sees the brief and can correct any of it
  (D132).
- **Money in every journey** (D138). Affordability, monthly cost, mortgage
  options, the stress test, upfront costs, buy versus rent, and rent split are
  computed in shared code from sample rates and rules for the demo cities,
  each labelled as a sample and an estimate. Mocked data is fine for this
  sample; the point is the interface.
- **Homes and places when the conversation gets there** (D134). Gemini decides
  what to offer and when: labelled sample homes, each with what it costs this
  household a month and why it fits, every reason with its source; and the
  household's week measured from each home with open map data.

## Journeys

Four journeys show what Homeward can do (D141). They are capabilities,
documented and rehearsed; none is coded as a flow, and a buyer can mix them or
go somewhere else entirely.

1. **Can we afford it here?** A couple relocating to Stockholm for a job, with
   two incomes, one of them from abroad: what they can borrow, the mortgage
   options, and the stress test.
2. **A home that works for Mum.** A family whose parent cannot manage stairs:
   needs read from each listing, and the monthly cost of the larger home.
3. **Sharing in Lisbon.** Two friends renting together: the rent split
   between them, and both weeks on one map.
4. **Is this one worth it?** A buyer weighing a sample home: its monthly cost,
   buy versus rent, and the upfront costs.

## Positioning

- Homeward is a finance sample. Somnio's investing companion covers portfolios
  someone already holds; Very Good Ventures' Life Goal Simulator covers goals
  in general. Homeward covers lending tied to a real home and a real
  household, the largest loan most people ever take.
- Its catalog is built for reuse: Google's field engineers can take the money
  components (affordability, monthly cost, mortgage options, stress test,
  upfront costs, rent split) into a bank's or a fintech's own journey.
- Google's travel demo shows a multi-leg trip no static UI was built for.
  Homeward shows a household finance decision no bank form was built for: two
  incomes in two currencies, a parent moving in, a flat shared by friends.
- Homeward renders the Maps Agentic UI Toolkit's catalog (`googlemaps/a2ui`)
  in Flutter, which the toolkit itself does not: its `GoogleMap` component,
  with the toolkit's exact schema, drawn on Google Maps by a reusable Flutter
  package (D133).

## Product Principles

- **Nothing scripted.** Gemini decides what the screen shows, in what form,
  and what it asks. Nothing in the server decides which question comes next or
  draws the screen for the model; the server only checks that what Gemini
  draws is valid.
- **Deduce first.** What Gemini can infer it shows as assumed, with the words
  it came from, for the buyer to confirm or correct.
- **Never ask what a tool can find out.** Places, distances, travel times,
  costs, and what a listing says are looked up or computed, not asked.
- **One decision at a time.** When Gemini must ask, it asks one real decision,
  as a choice with its recommendation. Typing is always open.
- **Building blocks, not screens.** The catalog holds 25 to 30 blocks in
  families (D140). Two households get two structurally different screens from
  the same blocks.
- **Gemini composes; tools measure; code computes.** The composing model never
  writes a figure a buyer relies on: amounts, rates, distances, times, and
  counts come from tools or shared code.
- **Every fact shows where it came from.** Said, deduced, measured, estimated,
  or quoted from a source word for word. Sample rates and rules say so.
- **Waiting shows the work.** While a tool runs, the buyer sees what it is
  doing, step by step.
- **Estimates, not advice.** Homeward explains and estimates. It never tells a
  buyer what to sign or presents itself as a lender.
- **Free to run.** Buyers bring a free Gemini key; open map data measures where
  and how far; Google Cloud and Google Maps Platform stay within their free
  monthly allowances, with quotas capped there.

## Actors

Buyers and renters are anyone deciding where to live and how to pay for it:
relocating for work, making room for family, sharing a flat, buying across a
border. They are anonymous, bring their own Gemini key, and start and resume
plans.

## What The Demo Shows

The presenter tells Homeward about a move, and the conversation goes wherever
it goes; the journeys above are what is rehearsed. What the demo shows is the
arc:

1. A few words become a brief, with Homeward's deductions marked as assumed,
   and one question asked inline, as a choice with its recommendation.
2. Back and forth, the plan panel fills in: the household, its week on a map,
   and what it can afford.
3. Homes appear with what each costs this household a month and why it fits;
   the mortgage options and the stress test follow for the one they like.
4. A correction reshapes the plan in place.

And the proof: a second, different household told to the same app ends up on
a structurally different screen. Test stories used to rehearse live outside
the app; they are inputs, never a flow.

## Non-Goals

- Listing search across listing sites, or scraping them. No listing site offers
  a free API (checked 2026-09-25). Labelled sample homes are in scope; reading
  a listing the buyer pastes comes after the recording (D142).
- Named lender offers, applications, or credit checks.
- Storing identity or financial documents.
- Legal, tax, or investment advice.
- Voice before M6; see `docs/AGENT.md`.
- Localized UI. English only, with local terms explained inline.
- Store distribution: TestFlight, App Store, and Google Play testing tracks.

## Related Documents

- `docs/ARCHITECTURE.md` - system shape.
- `docs/CATALOG.md` - building blocks.
- `docs/AGENT.md` - the composing loop and prompts.
- `docs/ROADMAP.md` - chunks, milestones, and decisions.
