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
- **A detective, not a form.** Homeward works the buyer out the way a
  detective works a case. Each turn it says what it deduced from the last clue
  and asks one question the buyer answers with a tap: which of four homes feels
  like theirs, whether its hunch is right, which of two ways of living they
  would pick. It asks about their life and taste, never for a room count or a
  budget, and the order follows the clues, not a script. After a handful of
  questions it writes the case back as a paragraph the buyer corrects in place,
  then goes looking.
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
to three, or just a city; in Stockholm and Lisbon Homeward also finds homes for
them among sample listings (D122). Buyers are anonymous, bring their own Gemini key,
start and resume plans, answer generated questions, refine criteria on the
board, commit a home and a scenario, and ask the agent to explain any figure.

### Curators

Moonwise maintains verified rule packs for the markets it covers and reviews
them against primary sources. Curated markets are the exception that makes the
rest honest, not a precondition for using Homeward.

## Personas

| Persona | Example | What Homeward weighs |
| --- | --- | --- |
| Relocating family | Moving to Stockholm to study at KTH, two children, torn between a garden further out and a flat close in | Two commutes, schools and their kind, parks, noise, transit, the association's finances, Swedish lending rules |
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
| The home | Price against the range the buyer picked, price per square metre against the area's, monthly cost, the housing association's or building's finances, energy and heating, fibre | Listing, official price statistics, buyer, researched |
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

The flow the video segment is built around. The story is the point, and
Homeward gets it the way a detective would (D121).

1. A buyer opens a new plan, picks *studies* as why they are moving, and
   writes just *Stockholm* as the place.
2. Homeward opens the case with what it can already deduce, and one question:
   *"Studies in Stockholm. First clue: where will you spend your days?"* It
   offers KTH, Stockholm University, and Karolinska as taps, and a pin for
   anywhere else. The buyer taps KTH.
3. *"KTH, then. Most people starting there come alone. Is anyone coming with
   you?"* The buyer sets three adults and two children, six and nine. *"A
   third adult is often a parent moving in. Will stairs matter?"* The buyer
   taps *Step-free, with a shower on the entry floor* (D126). *"Two
   children at school and a parent: a school they can walk to, and four rooms
   at least. Keep the ones that feel like yours."* Six real homes from the
   city, one card at a time (D128): the buyer keeps the two houses with
   gardens and passes the flats. *"Every flat passed, every garden kept."*
4. *"A garden, then. Near KTH that has a price."* Two ways to live, each priced
   from its area's real price per square metre and timed to KTH by bike: a
   house in Danderyd, further out and roomier, and a flat in Vasastan, close
   and smaller. The buyer picks Danderyd, which sets the area and a price range
   without anyone typing a budget.
5. Homeward writes the case back as a paragraph beside the map, its guesses
   dotted: that they cycle, within 25 minutes, and that schools and parks
   matter above all. The buyer changes one guess and taps *Find my three
   homes*.
6. While it looks, the working card lists each step: reading the Stockholm
   listings for step-free entry and a shower on the entry floor, timing the ride
   to KTH, looking for schools and parks near the ones left. Then: *"I went
   through fourteen homes and ruled out eleven: eight were flats, three had
   steps at the door. Three fit the case."* The board shows the three on a map,
   each with its photos, price, size, and price per square metre against its
   area's. Under *Why it fits*, each reason names its source: *"A ramp runs up
   beside the front steps"* quoted from the listing with the words that matter
   highlighted, the ride to KTH as measured, the garden as the buyer's own
   pick. *Where it falls short* says what comes close but misses, and what the
   listing never mentions.
7. The buyer picks one, and the case closes on the map of their week from it.
   With the deal switched on (D125), one short section then asks the money facts the rules need,
   filled in from the case where it can. Then the deal sheet: what they can
   borrow under Sweden's verified rules and the rule that limits it, a down
   payment slider that moves the payment, the bank's stress test, and the cash
   needed, all recomputed on the device with no network traffic, beside the
   rules that apply.
8. Contrast: a remote worker picks *lifestyle* and writes just *Lisbon*. The
   first question is a lineup of ways to live there: surf, the old town, a café
   street, green hills. The trade-off puts a flat by the beach in Carcavelos
   against one in Santos, the three homes are on the Cascais line, and the
   chosen one opens a deal under Portugal's verified rules. A buyer in a city
   with no sample homes gets the same questions and suggested areas instead,
   and a buyer where Homeward never curated rules gets estimated rules,
   labelled.

## Non-Goals For v1

- Listing search or scraping of listing sites. No listing site offers a free
  API (checked 2026-09-25), so the demo cities carry sample listings, priced
  from real prices per square metre and labelled as samples (D122).
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
