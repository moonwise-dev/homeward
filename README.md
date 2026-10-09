# Homeward

Homeward is a home-finance agent: Moonwise's finance and fintech sample for
Flutter's GenUI initiative, built on [A2UI](https://a2ui.org) v0.9 and
[genui](https://pub.dev/packages/genui).

A household tells Homeward about a move in its own words. Homeward works
through it the way a coding agent works through a codebase: it deduces what
it can, looks up what it can find out, answers first with what it can work
out, marks what it assumed, asks little, and questions a figure that cannot
be right. It shows the money decision no bank form was built for: what they
can borrow, what a specific home costs them each month, the mortgage
options, whether it survives a rate rise, what they pay on the day, buying
against renting, and how rent splits between people sharing.

Try it at [homeward-genui.web.app](https://homeward-genui.web.app) with a
free [Gemini API key](https://aistudio.google.com/apikey); the catalog
gallery there needs no key.

Nothing is scripted. Gemini decides which tools run and what to say and ask,
and the screen is composed from Homeward's catalog of building blocks as the
conversation goes, so two households end up on two different screens.

- **Gemini composes; tools measure; code computes.** The model never writes a
  figure a buyer relies on. Amounts come from shared Dart code in `common`,
  places and travel times from open map data, and the blocks bind them from
  the data model instead of taking them as text.
- **Every fact shows where it came from:** said by the buyer, deduced from
  their words, assumed, measured, estimated, or quoted word for word from a
  listing. What Homeward assumed is marked on the card, with one button to
  say it is right.
- **One plan, changed in place.** The plan is a living A2UI surface. A tool's
  result goes on it as a card the moment the tool answers, and only the card
  that answers what was asked; the rest wait, listed under the plan as
  buttons built from basic components, and open with a tap. Gemini
  writes the words, arranges the plan, and composes each question from basic
  components, a sentence and two or three buttons, inline in the
  conversation. A button on a card runs its tool at once.

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

## Three Ways In

The empty plan offers three opening messages, each sent with a tap. They are
examples, not flows: nothing in the code knows about them, Gemini decides
which tools to call and what to say, and the same words can lead to a
different screen on another run. Try them, mix them, or tell it something
else entirely.

### Can we afford it here?

A couple moving to Stockholm, with one income in kronor and one in euros.

> We're moving to Stockholm for my job. I'll earn 55,000 kronor a month before
> tax, and my partner keeps her remote job paying 3,500 euros a month. We have
> 600,000 kronor saved.

`compute_affordability` needs only what they earn and have saved. It counts
the euros at a sample exchange rate, estimates their take-home pay from the
tax authority's table, assumes what they did not say, no children and no
other loans, and works out from Sweden's sample rules what they can borrow
and which rule limits it. The plan shows
[`AffordabilitySummary`](docs/generated/catalog_reference.md#affordabilitysummary)
and
[`HouseholdSummary`](docs/generated/catalog_reference.md#householdsummary),
where each assumed line is marked and one button says they are right; say
what is different, and it is worked out again. From there Homeward offers
what to look at next: what a month costs
([`MonthlyCostBreakdown`](docs/generated/catalog_reference.md#monthlycostbreakdown)),
homes within reach
([`HomeCard`](docs/generated/catalog_reference.md#homecard)), the rates side
by side
([`MortgageOptions`](docs/generated/catalog_reference.md#mortgageoptions)),
or what a rate rise does
([`StressTestChart`](docs/generated/catalog_reference.md#stresstestchart)).

Leaves out: real lenders' offers, and rates changing over the loan.

### Is this one worth it?

A couple weighing one sample home.

> We're looking at flats in Stockholm. We take home 62,000 kronor a month
> together, 85,000 before tax, no debts, and have 900,000 kronor saved. We're
> both 34, two adults, no kids.
>
> We like the look of the loft-style flat by the lake in Nacka. What would it
> cost us each month, what do we pay on the day, and is buying it better than
> renting something like it?

`compute_affordability` finds the flat by the words they named it by and
prices it for this household, and `compare_buy_rent` adds up buying against
renting a home like it, year by year. One reply answers all three questions:
the plan shows the home,
[`MonthlyCostBreakdown`](docs/generated/catalog_reference.md#monthlycostbreakdown),
[`PurchaseCostsTable`](docs/generated/catalog_reference.md#purchasecoststable),
and [`BuyVsRent`](docs/generated/catalog_reference.md#buyvsrent), with a
slider over the years they expect to stay. Ask how fast the loan comes down,
and it adds
[`LoanBalanceChart`](docs/generated/catalog_reference.md#loanbalancechart);
say what they can put aside each month, and `plan_savings` works out with
[`SavingsPlan`](docs/generated/catalog_reference.md#savingsplan) how long
until their savings cover the cash on the day.

Leaves out: the home's price changing, what savings would earn, selling
costs, and upkeep. Stockholm's area rents are first-hand leases, which take
years in the housing queue, so renting looks cheaper there than a newcomer
will find it.

### Sharing in Lisbon

Two friends renting together.

> Me and a friend are moving to Lisbon to share a rented flat. I'll be at a
> startup in Beato most days, she works shifts at Santa Maria hospital. I take
> home 2,400 euros a month and she takes home 1,800. Show us some two-bedroom
> flats.

`find_place` checks both workplaces against OpenStreetMap, and `search_homes`
finds two-bedroom sample homes and shows what renting one like each costs a
month, an estimate from the area's median rent, lowest first. Split this
rent on a card splits it by what they earn with
[`RentSplit`](docs/generated/catalog_reference.md#rentsplit), which also
switches to an equal split or one by room size; Keep puts a home on the
[`Shortlist`](docs/generated/catalog_reference.md#shortlist). Ask how long
their commutes would be, one by bike and one by metro, and `measure_week`
routes each: the plan shows
[`WeeklyTravel`](docs/generated/catalog_reference.md#weeklytravel) and
[`WeekMap`](docs/generated/catalog_reference.md#weekmap), both commutes on
OpenStreetMap, each drawn along the route that was measured.

Leaves out: real rental listings, so rents are area estimates, and homes on
the map before their week is measured.

## More To Try

- **A need of the home.** "My mum is moving in with us and she can't really
  do stairs anymore. Show us flats with at least three rooms that would work
  for her." Homeward takes step-free access as a need deduced from their
  words; `read_listings` reads each sample listing for it and keeps a quote
  only when it appears in the listing word for word, shown with
  [`ListingQuote`](docs/generated/catalog_reference.md#listingquote), and
  [`HomeComparison`](docs/generated/catalog_reference.md#homecomparison) puts
  two or three homes side by side.
- **A figure that cannot be right.** "We take home about 10k sek" would not
  cover the sample everyday costs of a household in Stockholm, so
  `compute_affordability` answers with a doubt instead of a result, and
  Homeward asks which figure they meant, each a tap. Pay before tax below
  take-home pay is questioned the same way.
- **A correction.** "We also have a car loan of 2,500 a month and a child of
  three." The tool runs again with what changed, and the marks on the
  household card go.
- **What Homeward knows.** Ask where things stand or what it knows, and it
  shows [`PlanOverview`](docs/generated/catalog_reference.md#planoverview)
  or its [`Brief`](docs/generated/catalog_reference.md#brief): each fact
  with where it came from.

## The Catalog

27 blocks in five families, each declared once in `common/lib/catalog` and
drawn by a plain Flutter widget in `app/lib/catalog`. The
[catalog reference](docs/generated/catalog_reference.md) lists each with its
properties, what it binds, and the tool that seeds it.

| Family | Blocks |
| --- | --- |
| Understanding | `PlanOverview`, `Fact`, `Brief`, `Choice`, `Questions`, `HouseholdSummary` |
| Money | `MoneyInput`, `AffordabilitySummary`, `MonthlyCostBreakdown`, `StressTestChart`, `PurchaseCostsTable`, `DownPaymentSlider`, `MortgageOptions`, `LoanBalanceChart`, `SavingsPlan`, `MarketSnapshotCard`, `RentSplit`, `BuyVsRent` |
| Homes | `HomeCard`, `Shortlist`, `HomeComparison`, `HomeSwipe`, `ListingQuote` |
| Place and travel | `WeeklyTravel`, `RouteSummary`, `WeekMap` |
| Trust | `RuleNote` |

The money blocks are built to be reused in a bank's or a fintech's own
journey. Gemini sees a compact index of the catalog; the tool that works out
a result hands over the block that shows it, the server puts it on the plan,
and a block no tool has given is read through the `component_docs` tool,
which keeps the prompt small. Every block has a page in the gallery, with
its examples and parameters.

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
| `markets` | Sample rules, rates, tax tables, exchange rates, and homes for the demo cities |
| `tool` | Developer CLIs: catalog generation and checks, the local server, the live probe |
| `docs` | How Homeward works and why, starting with [PRODUCT](docs/PRODUCT.md) and [ARCHITECTURE](docs/ARCHITECTURE.md) |

Contributors and coding agents start with [AGENTS.md](AGENTS.md).

## Licence

Apache License 2.0; see [LICENSE](LICENSE). The fonts, the photographs of the
sample listings, and the map data are under their own terms, listed in
[NOTICE](NOTICE).
