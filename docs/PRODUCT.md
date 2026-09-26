# Homeward Product

## Product Summary

Homeward is a relocation agent: it does for a move what a coding agent does for
a codebase (D130). A buyer or renter tells it a little about their move in
their own words. Homeward deduces what it can from that, looks up what it can
find out, and asks only what it cannot: one real decision at a time, as a
choice on the screen with its recommendation. Piece by piece it builds an
understanding of the buyer's needs, habits, and wants, shows it back, and
offers solutions once it knows enough: areas that fit their week, homes with
the reasons each one fits, and research on the spot when the conversation
turns to money.

Homeward is an A2UI vertical sample for the Flutter GenUI initiative. Its point
is what only generated UI can do. Nothing is scripted: Homeward holds building
blocks, not screens, and Gemini composes each buyer's screen from them as the
conversation goes. A family moving a parent in ends up looking at what a home
must have for stairs and showers; two friends sharing a flat end up looking at
both their weeks on one map. Neither screen existed before they talked to it.

On 2026-09-26 the product was cleaned down to its foundation (D129) and is
being rebuilt in small chunks; `docs/ROADMAP.md` names the next one.

## How It Works

- **The brief.** Gemini keeps its own notes on the buyer, the way a coding
  agent keeps a plan: needs, habits (a place and how often), wants, places, and
  what is still open. Each item says where it came from: said by the buyer,
  deduced from their words, measured by a tool, or quoted from a source. The
  buyer sees the brief and can correct any of it (D132).
- **One living screen.** A plan is one screen that grows. It starts with the
  brief, the open question, and the buyer's week on a map. When the buyer
  confirms with "Looks right", solutions grow onto the same screen, and a later
  correction re-ranks them in place. The buyer confirms their story before
  seeing homes without walking through a wizard (D131).
- **Solutions when the conversation gets there.** Gemini decides what to offer
  and when: areas that fit the buyer's week in any city, from open map data;
  sample homes it searches, labelled as samples; and real listings the buyer
  pastes, read on the spot. Every reason a home fits, and every way it falls
  short, shows its source: a line quoted word for word from the listing, a
  measured route, or something the buyer said (D134).
- **Money as research.** There is no prebuilt deal. When the buyer wants to
  talk about money, or accepts Homeward's offer to, it researches the local
  rules and rates and quotes its sources; the figures are computed in shared
  code and labelled as estimates. Rent split per person covers people sharing
  (D135).

## Positioning Against The Other Samples

- Somnio's investing companion, the other Finance & Tech sample, covers
  portfolios someone already holds. Homeward covers a home someone has not
  bought or rented yet, and the life around it.
- Google's travel demo shows a multi-leg trip no static UI was built for.
  Homeward shows a life decision no static UI was built for: many criteria,
  each weighted by one person's story.
- Homeward renders the Maps Agentic UI Toolkit's catalog
  (`googlemaps/a2ui`) in Flutter, which the toolkit itself does not: its
  `GoogleMap` component, with the toolkit's exact schema, drawn on Google Maps
  by a reusable Flutter package (D133).

## Product Principles

- **Nothing scripted.** Gemini decides what the screen shows, in what form,
  and what it asks. Nothing in the server decides which question comes next or
  draws the screen for the model; the server only checks that what Gemini
  draws is valid.
- **Deduce first.** What Gemini can infer it shows as assumed, with the words
  it came from, for the buyer to confirm or correct.
- **Never ask what a tool can find out.** Places, distances, travel times, and
  what a listing says are looked up, not asked.
- **One decision at a time.** When Gemini must ask, it asks one real decision,
  as a choice on the screen with its recommendation. Typing is always open.
- **Building blocks, not screens.** The catalog holds small, expressive blocks.
  Two buyers get two structurally different screens from the same blocks.
- **One living screen, not a stream of cards.** The screen is updated in place
  as the story grows.
- **Gemini composes; tools measure; code computes.** The composing model never
  writes a figure a buyer relies on: distances, times, counts, and amounts
  come from tools or shared code.
- **Every fact shows where it came from.** Said, deduced, measured, estimated,
  or quoted from a source word for word.
- **Waiting shows the work.** While a tool runs, the buyer sees what it is
  doing, step by step.
- **Estimates, not advice.** Homeward explains and estimates. It never tells a
  buyer what to sign or presents itself as a lender.
- **Free to run.** Buyers bring a free Gemini key; open map data measures where
  and how far; Google Cloud and Google Maps Platform stay within their free
  monthly allowances, with quotas capped there.

## Actors

Buyers and renters are anyone deciding where to live: relocating for work,
moving for a lifestyle, making room for family, sharing a flat, moving across a
border. They are anonymous, bring their own Gemini key, and start and resume
plans.

## What The Demo Shows

No fixed stories: the presenter tells Homeward about a move, and the
conversation goes wherever it goes. What the demo shows is the arc:

1. A few words about a move become a brief, with Homeward's deductions marked
   as assumed and one question asked, as a choice with its recommendation.
2. Back and forth, the brief fills in, and the buyer's week appears on a map.
3. The buyer confirms, and solutions grow onto the same screen, each reason
   with its source.
4. A correction reshapes the screen in place.

And the proof: a second, different story told to the same app ends up on a
structurally different screen. Test stories used to rehearse live outside the
app; they are inputs, never a flow. The chunks that get there are in
`docs/ROADMAP.md`; this section grows as each lands.

## Non-Goals

- Listing search across listing sites, or scraping them. No listing site offers
  a free API (checked 2026-09-25). Labelled sample homes and single listings a
  buyer pastes are in scope.
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
