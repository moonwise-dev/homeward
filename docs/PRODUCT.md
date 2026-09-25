# Homeward Product

## Product Summary

Homeward is a story-driven home-buying and relocation advisor. A buyer says why
they are moving and what their days look like; Homeward turns that story into
the criteria that matter to them, checks candidate homes or whole areas against
those criteria on a map, and then walks them into the deal: what they can
borrow, what it costs on the day and every month, and the rules that apply to
someone like them in that place.

Its job is to make sure nothing is forgotten. A family moving for a job thinks
about the commute and the schools and forgets the congestion charge, the
housing association's debt, or the motorway behind the playground. Homeward
asks only what it cannot infer, measures everything it can, and shows the
answer as condensed and visual as it can be: a map with distances, a table of
what fits, what does not, and what comes close but misses by how much.

Homeward is an A2UI vertical sample in the Finance & Tech industry for the
Flutter GenUI initiative. Gemini composes every screen from Homeward's building
blocks, so a family with a car and a single cyclist see different screens built
from the same pieces, while every distance, time, count, and amount comes from a
tool or from shared finance code.

## Positioning Against The Other Samples

- Somnio's investing companion, the other Finance & Tech sample, covers
  portfolios someone already holds. Homeward covers a home someone has not
  bought yet, and the life around it.
- Google's travel demo shows a multi-leg trip no static UI was built for.
  Homeward shows a life decision no static UI was built for: many criteria,
  each weighted by one buyer's story, joined to the money.

## Product Principles

- **The UI comes to the buyer.** The agent draws the controls it needs rather
  than asking questions in prose. The controls are the question.
- **A journey, not a chat.** One story that grows downward: what Homeward
  composes for each decision is a section of it, the newest section is open,
  and earlier ones fold into a line saying what was decided. The buyer can
  always add a sentence under it, and there is no step count and no next
  button. The conversation is there as history, not as the product.
- **Waiting shows the work.** While Homeward measures, the buyer sees what it
  is measuring, step by step, as each step finishes.
- **Gemini composes; tools measure; code computes.** The composing model decides
  what to ask, which criteria matter, and how the screen is laid out. It never
  writes a figure a buyer relies on.
- **A story you correct, not a form you fill.** From a reason and a place,
  Homeward writes the buyer's story as a short paragraph and marks what it
  assumed. The buyer fixes what is off inside the sentence itself; blanks appear
  only for what Homeward cannot guess, such as where they go every day. Nothing
  is asked in an order Homeward chose, and the buyer can ask for homes at any
  moment.
- **Every fact shows where it came from.** Measured, Google Maps, estimate,
  verified, or said by the buyer.
- **Works anywhere, honest everywhere.** Lifestyle facts come from open map data
  worldwide. Money rules are verified where Homeward curated them and labelled
  estimates elsewhere, editable by the buyer.
- **What-if is instant.** Dragging a slider recomputes on the device; the agent
  is consulted when the buyer commits a decision or asks a question.
- **Estimates, not advice.** Homeward explains and estimates. It never tells a
  buyer what to sign or presents itself as a lender.
- **Free to run.** Buyers bring a free Gemini key; research runs on a free
  third-party model the server holds; Google Cloud stays within free allowances.

## Actors

### Buyers

Anyone deciding where to live and whether they can afford it: relocating for
work, moving for a lifestyle, upsizing for a family, buying across a border.
They bring either candidate homes, as a listing link, an address, or a pin, up
to three, or just a city. Buyers are anonymous, bring their own Gemini key,
start and resume plans, answer generated questions, refine criteria on the
board, commit a home and a scenario, and ask the agent to explain any figure.

### Curators

Moonwise maintains verified rule packs for the markets it covers and reviews
them against primary sources. Curated markets are the exception that makes the
rest honest, not a precondition for using Homeward.

## Personas

| Persona | Example | What Homeward weighs |
| --- | --- | --- |
| Relocating family | Moving to Stockholm for a job at KTH, two children, deciding between a flat in Vasastan and one in Solna | Two commutes, schools and their kind, parks, noise, transit, the association's finances, Swedish lending rules |
| Lifestyle mover | Remote worker moving to Lisbon for surf and quiet, only a city in mind | Areas by vibe, water and nature, cafés, airport access, residency and tax, Portuguese rules |
| Cross-border buyer | Swedish resident buying a flat in Funchal | Non-resident lending limit and taxes, obstacles such as a tax number, walking and views |
| Local upsizer | A couple in Stockholm with a second child on the way | Space, schools, preschool, parking, what the extra room costs a month |

## What Homeward Considers

The criteria Homeward can raise, grouped the way it asks about them. Gemini
picks the ones a buyer's story makes relevant; the buyer can add or drop any on
the board.

| Group | Criteria | Source |
| --- | --- | --- |
| Life anchors | Commute to work for each adult, the school run, family nearby | Measured: routing by car, bike, foot, and transit |
| Schools and care | Schools by kind (public, private, international, language), preschool | Measured locations; quality on request from Google Maps |
| Everyday | Groceries, pharmacy, doctor | Measured |
| Activities | Running, cycling, gym, swimming, parks and nature, water, dogs | Measured; quality on request from Google Maps |
| Evenings | Restaurants, cafés, nightlife, or quiet | Measured density |
| Getting around | Nearest stop and its lines, bike routes; for drivers parking, congestion charges and tolls, charging | Measured; tolls researched |
| Downsides | Noise from roads, rail, airports, and nightlife; safety impression; flood risk; construction | Noise measured by proximity; the rest researched and labelled |
| The home | Price against budget, monthly cost, the housing association's or building's finances, energy and heating, fibre | Listing, buyer, researched |
| Money and rules | What you can borrow, down payment, bank stress test, purchase taxes, running costs | Code, with verified or estimated rules |
| Relocation | Residency and tax consequences, language, international community | Researched and labelled; verified where curated |

## Coverage

| Level | Where | What it means |
| --- | --- | --- |
| Verified | `SE`, `PT`, `PT-30` | Rules from curated packs with sources and review dates |
| Estimated | Everywhere else | Rules researched at the time of asking, labelled "estimate — check with a lender", each one editable |

Lifestyle facts do not depend on coverage: open map data and routing work in
any city.

## Hero Flow

The flow the video segment is built around. The story is the point.

1. A buyer opens a new plan, picks *studies* as why they are moving, and
   writes just *Stockholm* as the place.
2. Homeward writes their story back on one page, beside a map of Stockholm:
   *"You're moving to Stockholm to study. You'll probably get around by
   **transit**, in under **30 minutes**, and **quiet evenings** and **parks**
   matter to you. Where do you study? **drop a pin**"* The bold words are
   assumptions the buyer can change in place, and the one blank is what
   Homeward could not guess. The buyer pins KTH, and adds in one line that they
   have two children and are weighing a flat on Odengatan and one in Solna; the
   story is rewritten with schools and both flats in it. Nothing is a step or a
   Continue button, and nothing waited on the model until the buyer asked to
   see homes.
3. While the homes are measured, a card under the story lists each step as it
   runs and ticks it off: finding the flats, looking for schools and parks near them,
   timing the ride to KTH. Then the board appears: a map with KTH, both flats, commute lines with minutes by
   the chosen mode, schools and parks; a comparison of every criterion against
   both flats, each cell fits, close, or misses; pros and cons; the flats
   ranked. *Solna is six minutes over your 25-minute commute but has two
   international schools within a kilometre.*
4. The buyer asks for well-rated schools near Odengatan; Homeward adds Google
   Maps ratings to that row only.
5. The buyer picks Odengatan. The board folds into a line, and one short section
   asks the money facts the rules need, filled in from the story where it can. Then the deal sheet: the
   listing's price and the association fee, what they can borrow under
   Sweden's verified rules and the rule that limits it, a down payment slider
   that moves the payment, the bank's stress test, and the cash needed, all
   recomputed on the device with no network traffic, beside the rules that
   apply and the association's finances.
6. Contrast: a remote worker picks *lifestyle*, writes just *Lisbon*, and adds
   surfing and quiet evenings as Homeward asks. Homeward suggests areas, ranks
   them on the map, and the chosen area opens a deal under Portugal's verified
   rules. A buyer in a city Homeward never
   curated gets the same flow with estimated rules, labelled.

## Non-Goals For v1

- Listing search or scraping of listing sites; buyers bring their candidates.
- Named lender offers, applications, or credit checks.
- Storing identity or financial documents.
- Legal, tax, or investment advice.
- Voice. Planned for phase 2, see `docs/AGENT.md`.
- Localized UI. English only, with local terms explained inline.
- Refinancing, porting, and bridging.
- Store distribution: TestFlight, App Store, and Google Play testing tracks.

## Related Documents

- `docs/ARCHITECTURE.md` - system shape and research layer.
- `docs/CATALOG.md` - building blocks and finance components.
- `docs/AGENT.md` - the composing loop, research, and prompts.
- `docs/MARKETS.md` - verified packs and estimated rules.
- `docs/ROADMAP.md` - milestones and decisions.
