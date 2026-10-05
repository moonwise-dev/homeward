# Homeward

Homeward is a home-finance agent: Moonwise's finance and fintech sample for
Flutter's GenUI initiative, built on [A2UI](https://a2ui.org) v0.9 and
[genui](https://pub.dev/packages/genui).

A household tells Homeward about a move in its own words. Homeward works
through it the way a coding agent works through a codebase: it deduces what
it can, looks up what it can find out, asks one decision at a time, and keeps
a brief of what it learned. Then it shows the money decision no bank form was
built for: what they can borrow, what a specific home costs them each month,
the mortgage options, whether it survives a rate rise, what they pay on the
day, buying against renting, and how rent splits between people sharing.

Nothing is scripted. Gemini composes every screen from Homeward's catalog of
building blocks as the conversation goes, so two households end up on two
different screens.

- **Gemini composes; tools measure; code computes.** The model never writes a
  figure a buyer relies on. Amounts come from shared Dart code in `common`,
  places and travel times from open map data, and the blocks bind them from
  the data model instead of taking them as text.
- **Every fact shows where it came from:** said by the buyer, deduced from
  their words, measured, estimated, or quoted word for word from a listing.
- **Two surfaces.** Questions arrive as cards inline in the conversation, so
  the history shows each decision; beside it, the plan panel is one living
  surface Gemini changes in place.

Homeward explains and estimates; it does not give financial advice. The rules,
rates, and homes are labelled samples.

## Run It

You need Flutter with Dart 3.13 or later and a free
[Gemini API key](https://aistudio.google.com/apikey).

```sh
make get
make app          # starts the agent server on localhost:8080 and the app in Chrome
```

The app asks for your Gemini key on first launch. To skip that while
developing, copy `.env.example` to `.env` and fill in
`HOMEWARD_EVAL_GEMINI_KEY`; the local server hands it to the app.

Open `/gallery` in the running app to see every building block with its
examples and parameters, or `/gallery/<Block>` for one, such as
`/gallery/MortgageOptions`. The gallery needs no key and no server.

`make check` runs everything a change must pass.

## Four Journeys

These are examples of what Homeward can do, rehearsed with the live probe
(`make probe`). They are not flows: nothing in the code knows about them,
Gemini decides what to ask and what to draw, and the same words can lead to a
different screen on another run. Try them, mix them, or tell it something else
entirely.

### 1. Can we afford it here?

A couple moving to Stockholm, with one income in kronor and one in euros.

> We're moving to Stockholm for my job. I'll earn 55,000 kronor a month before
> tax, and my partner keeps her remote job paying 3,500 euros a month. We have
> 600,000 kronor saved.

Homeward records what they said in the brief and asks the one thing the
lending rules still need, such as their take-home pay. Once it has that,
`compute_affordability` works out, from Sweden's sample rules, what they can
borrow and which rule limits the loan. The plan shows it with
[`AffordabilitySummary`](docs/generated/catalog_reference.md#affordabilitysummary),
[`RuleNote`](docs/generated/catalog_reference.md#rulenote), and
[`MonthlyCostBreakdown`](docs/generated/catalog_reference.md#monthlycostbreakdown).
Ask about the mortgage options and rising rates, and it adds
[`MortgageOptions`](docs/generated/catalog_reference.md#mortgageoptions) and
[`StressTestChart`](docs/generated/catalog_reference.md#stresstestchart).
Anything they haven't said, such as the down payment, is assumed and offered
back as a choice with no recommendation.

Leaves out: real lenders' offers, and rates changing over the loan.

### 2. A home that works for Mum

A family whose parent can't manage stairs.

> My mum is moving in with us and she can't really do stairs anymore. We're
> looking around Stockholm. We take home 68,000 kronor a month together,
> 92,000 before tax, no debts, and have 900,000 kronor saved. We're both 42,
> two adults plus Mum, no kids.
>
> Show us flats with at least three rooms that would work for her, and what
> each would cost us a month.

Homeward takes step-free access as a need of the home, deduced from their
words. `read_listings` reads each sample listing for that need and keeps a
quote only when it appears in the listing word for word.
`search_homes` prices each home that fits for this household, and the plan
shows them with [`HomeCard`](docs/generated/catalog_reference.md#homecard).
[`ListingQuote`](docs/generated/catalog_reference.md#listingquote) shows the
listing's own words for a home, and
[`HomeComparison`](docs/generated/catalog_reference.md#homecomparison) puts
two or three side by side.

Leaves out: listings from real sites, and needs no listing mentions, which
become questions for a viewing.

### 3. Sharing in Lisbon

Two friends renting together.

> Me and a friend are moving to Lisbon to share a rented flat. I'll be at a
> startup in Beato most days, she works shifts at Santa Maria hospital.
>
> I take home 2,400 euros a month and she takes home 1,800. Show us some
> two-bedroom flats.
>
> Let's take the first one. Split the rent by what we earn, and how long would
> our commutes be from there? I'd cycle, she'd take the metro, five days a week
> each.

`find_place` checks both workplaces against OpenStreetMap, `search_homes`
finds two-bedroom sample homes, `split_rent` splits the area's median rent
by income, with any bills they mention, and `measure_week` routes each
commute by bike and by public transport. The plan shows
[`RentSplit`](docs/generated/catalog_reference.md#rentsplit), which also
switches to an equal split or one by room size,
[`WeeklyTravel`](docs/generated/catalog_reference.md#weeklytravel), and
[`WeekMap`](docs/generated/catalog_reference.md#weekmap), both commutes on
OpenStreetMap, each drawn along the route that was measured.
Before anything is known, it may open with
[`MarketSnapshotCard`](docs/generated/catalog_reference.md#marketsnapshotcard),
the city at a glance.

Leaves out: rents the buyer hasn't found yet, which are area estimates, and
homes on the map before their week is measured.

### 4. Is this one worth it?

A couple weighing one sample home.

> We're looking at flats in Stockholm. We take home 62,000 kronor a month
> together, 85,000 before tax, no debts, and have 900,000 kronor saved. We're
> both 34, two adults, no kids.
>
> We like the look of the corner flat on Odengatan. What would it cost us each
> month, what do we pay on the day, and is buying it better than renting
> something like it?

`search_homes` finds the flat by its street, `compute_affordability` prices it
for this household, and `compare_buy_rent` adds up buying against renting a
home like it, year by year. The plan shows
[`MonthlyCostBreakdown`](docs/generated/catalog_reference.md#monthlycostbreakdown),
[`PurchaseCostsTable`](docs/generated/catalog_reference.md#purchasecoststable),
and [`BuyVsRent`](docs/generated/catalog_reference.md#buyvsrent), with a
slider over the years they expect to stay. Ask how fast the loan comes down,
and it can add
[`LoanBalanceChart`](docs/generated/catalog_reference.md#loanbalancechart);
say what they can put aside each month, and `plan_savings` works out with
[`SavingsPlan`](docs/generated/catalog_reference.md#savingsplan) how long
until their savings cover the cash on the day.

Leaves out: the home's price changing, what savings would earn, selling
costs, and upkeep. Stockholm's area rents are first-hand leases, which take
years in the housing queue, so renting looks cheaper there than a newcomer
will find it.

## The Catalog

25 blocks in five families, each declared once in `common/lib/catalog` and
drawn by a plain Flutter widget in `app/lib/catalog`. The
[catalog reference](docs/generated/catalog_reference.md) lists each with its
properties, what it binds, and the tool that seeds it.

| Family | Blocks |
| --- | --- |
| Understanding | `Fact`, `Brief`, `Choice`, `HouseholdSummary` |
| Money | `MoneyInput`, `AffordabilitySummary`, `MonthlyCostBreakdown`, `StressTestChart`, `PurchaseCostsTable`, `DownPaymentSlider`, `MortgageOptions`, `LoanBalanceChart`, `SavingsPlan`, `MarketSnapshotCard`, `RentSplit`, `BuyVsRent` |
| Homes | `HomeCard`, `Shortlist`, `HomeComparison`, `HomeSwipe`, `ListingQuote` |
| Place and travel | `WeeklyTravel`, `RouteSummary`, `WeekMap` |
| Trust | `RuleNote` |

The money blocks are built to be reused in a bank's or a fintech's own
journey. Gemini sees a compact index of the catalog and reads a block's full
schema through the `component_docs` tool when it wants to draw it, which keeps
the prompt small.

## Build On It

- **A block.** Declare it in `common/lib/catalog/components/`, implement its
  widget and item in `app/lib/catalog/`, and run `make catalog`.
  [Declaring a component](docs/CATALOG.md#declaring-a-component) has the
  details; the `homeward-block` skill in `.claude/skills` walks a coding agent
  through it.
- **A tool.** Add an `AgentTool` in `server/lib/tools/` and list it in
  `homewardTools`. A tool returns what Gemini reads and the data model slices
  it seeds, which blocks bind by path. [Tools](docs/AGENT.md#tools) has the
  rules, and the `homeward-tool` skill walks through it.
- **The maths** lives once in `common`, used by the server's tools and by the
  app, and every figure a buyer relies on is bound, never written by the
  model.

## Sample Data

- **Rules and rates** for Sweden and Portugal in `markets/packs` and
  `markets/rates`, each with its source and the date it was read: the lending
  rules, upfront costs, one sample lender's list rates, and the interest
  deduction.
- **Sample homes** in Stockholm and Lisbon in `markets/listings`, labelled
  and not for sale, each with its area's median price and rent per square
  metre and their sources.
- **Places and routes** from OpenStreetMap (Nominatim), the FOSSGIS routers,
  and Transitous, used within their policies and cached.
- **The map** on OpenStreetMap's own tiles, with their attribution. It needs
  no key and no account.

Everything runs on free tiers: buyers bring a free Gemini key, and open data
measures places and routes and draws the map.

## Repository

| Folder | Holds |
| --- | --- |
| `app` | The Flutter app: the conversation and plan, the catalog widgets Gemini composes from, the gallery, and the wire inspector |
| `server` | The Dart server: the agent loop, the tools, and validation of every A2UI message |
| `common` | Pure Dart shared by both: the finance maths, the catalog contract, and wire types |
| `markets` | Sample rules, rates, exchange rates, and homes for the demo cities |
| `tool` | Developer CLIs: catalog generation and checks, the local server, the live probe |
| `docs` | How Homeward works and why, starting with [PRODUCT](docs/PRODUCT.md) and [ARCHITECTURE](docs/ARCHITECTURE.md) |

Contributors and coding agents start with [AGENTS.md](AGENTS.md).
