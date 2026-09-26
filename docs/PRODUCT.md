# Homeward Product

## Product Summary

Homeward is a home-buying and relocation advisor. A buyer tells the story of
their move in their own words: why they are moving, who comes with them, where
their days take them, what the home has to do for them. Homeward turns that
story into a screen made for that buyer, shows what it understood, and lets the
buyer correct it by touching the screen or saying more.

Homeward is an A2UI vertical sample for the Flutter GenUI initiative. Its point
is what only generated UI can do: two buyers with different stories get two
structurally different screens from the same small set of building blocks, and
each screen changes as its buyer talks. A family moving a parent in sees what
the home must have for stairs and showers; someone who cycles to the office
three days a week sees their week on a map.

On 2026-09-26 the product was cleaned down to its foundation (D129) and is
being rebuilt in small steps; `docs/ROADMAP.md` names the next one.

## Positioning Against The Other Samples

- Somnio's investing companion, the other Finance & Tech sample, covers
  portfolios someone already holds. Homeward covers a home someone has not
  bought yet, and the life around it.
- Google's travel demo shows a multi-leg trip no static UI was built for.
  Homeward shows a life decision no static UI was built for: many criteria,
  each weighted by one buyer's story.

## Product Principles

- **A screen per buyer.** Gemini decides what the buyer's screen shows, in
  what form, and what it asks. Nothing in the server decides which question
  comes next or draws the screen for the model; the server only checks that
  what Gemini draws is valid.
- **One living screen, not a stream of cards.** The buyer's screen is updated
  in place as the story grows, rather than a new card per turn.
- **The UI comes to the buyer.** When a tap is quicker than typing, the
  question is a control on the screen.
- **Gemini composes; tools measure; code computes.** The composing model never
  writes a figure a buyer relies on: distances, times, counts, and amounts
  come from tools or shared code.
- **Every fact shows where it came from.** Measured, estimated, said by the
  buyer, or quoted from a source word for word.
- **Waiting shows the work.** While a tool runs, the buyer sees what it is
  doing, step by step.
- **Estimates, not advice.** Homeward explains and estimates. It never tells a
  buyer what to sign or presents itself as a lender.
- **Free to run.** Buyers bring a free Gemini key; open map data answers where
  and how far; Google Cloud stays within free allowances.

## Actors

Buyers are anyone deciding where to live: relocating for work, moving for a
lifestyle, making room for family, buying across a border. They are anonymous,
bring their own Gemini key, and start and resume plans.

## What The Demo Shows

Two contrasting stories told to the same app:

1. A family moving to Stockholm for a job at KTH, with a parent moving in who
   cannot manage stairs.
2. A couple moving to Lisbon who cycle everywhere and want the sea close by.

Each gets its own screen, built from the same blocks, and each screen changes
as its buyer adds to the story. The steps that get there are in
`docs/ROADMAP.md`; this section grows as each one lands.

## Non-Goals

- Listing search or scraping of listing sites. No listing site offers a free
  API (checked 2026-09-25).
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
- `docs/ROADMAP.md` - milestones and decisions.
