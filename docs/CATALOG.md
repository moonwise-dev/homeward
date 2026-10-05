# Homeward Catalog

The catalog is the complete vocabulary the agent can draw with. It is declared
once in `common/lib/catalog`, implemented in `app/lib/catalog`, validated in
`server/lib/agent`, and described to the model by a generated skill.

Catalog ID: `https://moonwise.se/homeward/catalogs/v1/catalog.json`

Since the reset (D129) Homeward's own blocks came back one at a time, each
with the chunk of `docs/ROADMAP.md` that needed it, from `Fact` (C4) to
`LoanBalanceChart`, `SavingsPlan`, and `MarketSnapshotCard` (C10b) and
`WeekMap` (C8b): 25 blocks in five families.

## Design Principles

1. **Building blocks, not screens.** The catalog never holds a screen, a step,
   or a flow. Gemini composes every screen from blocks as the conversation
   goes, so two buyers end up on structurally different screens.
2. **A catalog others can build on.** 25 to 30 blocks in families (D140), so
   Homeward's journeys and the ones a developer or a Google field engineer
   builds next share one vocabulary. The money blocks are the core of a
   finance sample (D138). Each block is expressive on its own: it earns its
   place when basic components cannot show what a household's story needs,
   such as what a home costs them each month or their week on a map. The
   skill discloses the catalog progressively: an index of every block with
   its one-line description, and its full schema when Gemini is about to draw
   it (D143).
3. **Blocks carry the design, Gemini carries the layout.** A block draws one
   thing well with Homeward's tokens; Gemini decides which blocks a buyer's
   screen needs and how they sit together.
4. **Figures are bound, never literal.** A figure a buyer relies on comes from
   a tool or from `common`, reaches the surface through the data model, and is
   bound by path. The schema marks such properties as bound, and the server
   refuses a literal.
5. **Every fact shows its source.** A block that shows a fact shows whether it
   was said by the buyer, deduced from their words, measured, estimated, or
   quoted.
6. **One widget, two places.** The widget behind each item renders the same in
   the journey and in the gallery, where each block has its own page with its
   examples and its parameters, read from the declaration (D160).

## Basic Components

Agent-visible basic components, each declared with its one-line description
in `basicComponentSummaries`:

`Text`, `Row`, `Column`, `Card`, `Divider`, `List`, `Tabs`, `Icon`, `Button`,
`CheckBox`, `ChoicePicker`, `TextField`, `DateTimeInput`.

The core components, `coreComponents`: the layout components `Column`,
`Row`, `Card`, `Text`, `Button`, and `Divider`, `Fact`, which every plan
uses, `Choice`, which every ask uses, and `AffordabilitySummary` and
`RuleNote`, since money is in every plan. The skill always carries their full
schemas, and correction rounds offer them (D110, D143 to D146). Every other
component, `MonthlyCostBreakdown` first, is in the index only, and Gemini
reads it through `component_docs` when it wants it.

Not agent-visible: `Image`, `Video`, `AudioPlayer`, `Modal`, `Slider`.

Buttons send actions the model names itself (`docs/PROTOCOL.md`).

## Homeward Components

| Family | Block | What it shows | Properties |
| --- | --- | --- | --- |
| Understanding | `Fact` | One item of the brief: the sentence, and where it came from: "You said", "Deduced from" with the buyer's words, or "You confirmed". A deduction with an `answer` action offers Right and Not quite (D144) | `fact`, bound to one item, `{ "path": "/brief/<id>" }`; `answer`, an optional action |
| Understanding | `Choice` | One decision as an inline ask: the question, two to five options, the recommended one first with why, and a line pointing at the text field for any other answer (D145) | `question`; `options`, each a `label` and an optional `detail`; `recommended`, the label of one option; `because`; `answer`, an action |
| Understanding | `Brief` | Sections of the brief, one kind or several: the household, money, needs, habits, wants, places, and what is open, each item with where it came from, as `Fact` shows it; a deduction offers Right and Not quite when the block has an `answer` action (D158) | `brief`, always `{ "path": "/brief" }`; `kinds`, an optional list of kinds; `title`, optional; `answer`, an optional action |
| Understanding | `HouseholdSummary` | Who the household is and what they stated, as `compute_affordability` kept it: adults, children's ages, borrowers, age, tax residence, work, and use of the home, then the monthly incomes, debts, and savings as they gave them, with the sample exchange rates used (D158) | `affordability`, always `{ "path": "/affordability" }` |
| Money | `MoneyInput` | An amount field with its currency and period that writes `{ amount, currency, per }`, the shape the money tools take, to the path it binds; a `Button` beside it sends the path in its action's context; restored (D158) | `label`; `value`, a path the field writes, such as `{ "path": "/answers/income" }`; `currency`, an ISO 4217 code; `period`, `once`, `month`, or `year` |
| Money | `AffordabilitySummary` | What the household can borrow, the highest price their savings and the sample rules allow, the down payment and cash needed, the monthly payment, and which rule limits the loan, labelled as a sample estimate (D146) | `affordability`, always `{ "path": "/affordability" }` |
| Money | `MonthlyCostBreakdown` | What the home at the slice's price costs each month: interest at the rate, amortization at the rate the rules require or over the term, the monthly fee the buyer stated, the total, and in Sweden the total after the interest deduction, labelled as a sample estimate (D147) | `affordability`, always `{ "path": "/affordability" }` |
| Money | `StressTestChart` | The monthly cost from today's rate up past the rate lenders test, as a line against the most the household can carry each month and the rule that sets it, with today and the tested rate marked; in Sweden after the interest deduction (D148) | `affordability`, always `{ "path": "/affordability" }` |
| Money | `PurchaseCostsTable` | Every upfront cost the buyer owes on the day, each with its local term and source, what is refundable and what earns it back, the total, and the cash needed with the down payment; says so when the sample rules list none (D148) | `affordability`, always `{ "path": "/affordability" }` |
| Money | `DownPaymentSlider` | A what-if on the down payment for the price in the slice: the slider moves through the steps `compute_affordability` worked out, from the minimum the rules allow to what the savings reach after the costs on the day, and shows for each the share of the price, the loan, the monthly cost, the cash needed against the savings, and whether it is within the rules; a button uses the amount (D149) | `affordability`, always `{ "path": "/affordability" }`; `apply`, an optional action |
| Money | `MortgageOptions` | The sample lender's rates side by side for the price and down payment in the slice: variable, fixed for a period, and in Portugal mixed and fixed for the whole term, each with its rate, how long it holds, the monthly cost, and whether the loan is within the rules at it, the one in use marked; a button uses another (D150) | `affordability`, always `{ "path": "/affordability" }`; `choose`, an optional action |
| Money | `RentSplit` | Rent and bills split between two to eight people sharing, each person's part of the rent, the bills, and the total a month, by the rule they choose: equally, by the incomes they stated, or by room size with the shared space split equally, which they switch between; the rent labelled as theirs or as an estimate from the area's median with its source (D155) | `split`, always `{ "path": "/rentSplit" }`; `choose`, an optional action |
| Money | `BuyVsRent` | Buying a home against renting one like it: a line for each of what buying and renting have cost by each year, the costs on the day, interest after any deduction, and the fee against the rent; a slider over the years they expect to stay with both totals and the equity built at today's price; the year buying comes out cheaper, or that renting stays cheaper; the rent labelled as theirs or as an area estimate with its source, and what the comparison leaves out (D155) | `comparison`, always `{ "path": "/buyVsRent" }` |
| Money | `LoanBalanceChart` | The loan year by year over the term at today's rate: the balance falling and the equity rising at today's price, as two lines, and a slider over the years with the balance, the equity, and the interest paid by then after any deduction; in Sweden, where the amortization steps down as the balance falls below 70% and then 50% of the price, the years it steps down named; labelled as a sample estimate (D159) | `affordability`, always `{ "path": "/affordability" }` |
| Money | `SavingsPlan` | How long until the household's savings cover the cash the home in `/affordability` needs on the day, at the monthly saving they stated: the cash needed and the down payment it is for, what they have saved, what is still to save, the saving a month, the months to go and the month they get there, with a bar for how far they are; says so when the savings already cover it; leaves out what the savings earn and prices and incomes changing (D159) | `plan`, always `{ "path": "/savingsPlan" }` |
| Money | `MarketSnapshotCard` | A city at a glance before anything is known about the household: its currency, the sample lender's rates with the date they were read, the rules that set the loan, such as the most of the price a loan can be, the income multiple, the amortization, and the rate lenders test, the rules that wait on the household named, and each area's median price and rent per square metre, each with its source, labelled as samples (D159) | `market`, bound to one city, `{ "path": "/markets/<city>" }` |
| Homes | `HomeCard` | One sample home: its photos, title, area and address, price and monthly fee, rooms, size, floor, and outdoor space, the price per square metre against its area's median with the source, and, once `compute_affordability` has run, what it costs this household each month with the down payment, rate, and term, and whether the loan is within the rules and the cash within their savings, and whether it is on the shortlist; labelled as a sample listing (D151) | `home`, bound to one home, `{ "path": "/homes/<id>" }`; `choose` and `keep`, optional actions |
| Homes | `Shortlist` | The homes the household kept, each with a photo, its area and address, its price, what it costs them a month, and whether it is within reach, with a tap to work it out and one to drop it; says so when nothing is kept yet (D152) | `homes`, always `{ "path": "/homes" }`; `choose` and `drop`, optional actions |
| Homes | `HomeComparison` | Two or three homes side by side: price, what each costs a month, the down payment, the cash needed against savings, whether the loan is within the rules, size, rooms, floor, outdoor space, and the price per square metre against its area, labelled as sample listings (D152) | `homes`, a list of two or three, each `{ "path": "/homes/<id>" }`; `choose`, an optional action |
| Homes | `HomeSwipe` | Up to six sample homes that differ, one card at a time: the photo, area, title, price, rooms and size, and what it costs the household a month once priced; the buyer keeps or passes each with a swipe or a tap, then sees how many they kept, labelled as sample listings (D157) | `homes`, always `{ "path": "/swipe/homes" }`; `done`, an action |
| Homes | `ListingQuote` | One sample home read for the household's needs: each need in the buyer's words with whether the listing meets it, rules it out, or says nothing, and the listing's description with the sentence that decides each one highlighted, every quote checked word for word; says nothing means the listing does not mention it, to ask or check at a viewing (D156) | `reading`, bound to one home, `{ "path": "/reads/<id>" }` |
| Place and travel | `WeeklyTravel` | The buyer's week from one starting point, a sample home or a place: each place with how many times a week they go, how they travel, the minutes each way, and the week's total there and back, measured by open routing and labelled with what measured it (D154) | `week`, bound to one starting point, `{ "path": "/week/<from>" }` |
| Place and travel | `RouteSummary` | One measured trip: where from and to, how they travel, the minutes and distance one way, and how many times a week, labelled with what measured it (D154) | `trip`, bound to one trip, `{ "path": "/week/<from>/trips/<n>" }` |
| Place and travel | `WeekMap` | A map of the household's places and, from one starting point, their week: each place Homeward found as a pin with its name, the starting point as a home pin, each measured trip drawn along the route it was measured on, with how they travel, the minutes each way, and how many times a week on the place's pin, and the week's total there and back above the map; on OpenStreetMap's tiles with their attribution, labelled with what measured the trips; a trip no router could measure keeps its pin without a line (D163) | `markers`, always `{ "path": "/places" }`; `routes`, optional, bound to one starting point, `{ "path": "/week/<from>" }` |
| Trust | `RuleNote` | One lending rule: what it is, the largest loan it allows, whether the loan is within it, and its source with the date it was read, labelled as a sample rule (D146) | `rule`, bound to one rule, such as `{ "path": "/affordability/binding" }` or `/affordability/checks/0` |

A `Choice` tap sends its `answer` action at once, with `choice` and `label`,
the option's label, added to its context; the tapped option stays marked.

A block that binds a slice, such as `AffordabilitySummary` or `Fact`, is
refused until the tool that seeds it has run: its whole path, or every path
of a list such as `HomeComparison`'s, must be in the data model, unlike an
input, which may bind a field it will write.

A `DownPaymentSlider` sends its `apply` action when the buyer taps "Use this
down payment", with `downPayment`, the amount as the buyer saw it, such as
"SEK 480,000", and `label`, such as "Put SEK 480,000 down", added to its
context. The slider itself changes nothing until then.

A `MortgageOptions` button sends its `choose` action with `loanType`, the
option's ID, such as `fixed-3y`, and `label`, such as "Take the rate fixed
for 3 years", added to its context.

A `RentSplit` button sends its `choose` action with `rule`, `equal`,
`income`, or `room`, and `label`, such as "Split the rent by income", added
to its context. Switching rules on the block changes nothing until then.

A `HomeCard` button sends its `choose` action with `home`, the home's ID,
such as `sto-01`, and `label`, such as "Work out Odengatan 64", added to its
context. Its Keep button sends `keep` with `home`, `keep`, `true` to keep it
or `false` to drop it, and `label`, such as "Keep Odengatan 64". A
`Shortlist` row sends `choose` the same way and `drop` with `home` and
`label`, such as "Drop Odengatan 64"; a `HomeComparison` column sends
`choose` like a `HomeCard`.

A `HomeSwipe` sends its `done` action after the last card, with `kept`
and `passed`, the lists of home IDs, and `label`, such as "Kept 2 of 6",
added to its context.

A `Brief` answer sends its action like a `Fact`, with `fact`, `answer`,
and `label` added to its context.

A `Fact` tap sends its `answer` action with `fact`, the item's ID, `answer`,
`right` or `not_quite`, and `label`, the words the conversation shows, such as
"Right: Your mum can't manage stairs". A `Fact` bound to an item the brief
does not hold is refused.

A `WeekMap` takes the names of its two properties, `markers` and `routes`,
from the Maps Agentic UI Toolkit's `GoogleMap` (`googlemaps/a2ui`), and binds
both, where the toolkit takes literal coordinates: Gemini never writes a
coordinate, every pin is a place `find_place` checked, and every line is a
route `measure_week` measured. It fits itself to what it shows, so it has no
`center` or `zoom`, and each trip carries its own way of travelling, so it
has no `travelMode`. It draws on OpenStreetMap's tiles with `flutter_map`
and needs no key (D163).

## Planned Blocks

None before the recording. The Maps Agentic UI Toolkit's own components,
`GoogleMap` and `PlaceDetailsCompact`, were planned for C8b (D133) and
dropped with D163: they draw with Google Maps Platform, whose keys need a
billing account. A Google Maps renderer behind `WeekMap`'s properties is
listed under Later in `docs/ROADMAP.md`.

## Declaring A Component

In `common/lib/catalog/components/`, each component is one declaration: a
`CatalogComponent`, which implements `ComponentApi` from `a2ui_core`, the same
interface genui uses internally for its catalog items. It carries:

- Name.
- Family: understanding, money, homes, place and travel, or trust, which the
  gallery groups by (D160).
- Properties built with `json_schema_builder`, `CommonSchemas`, and
  `CatalogSchemas`. The schema adds the v0.9 envelope (`id`, `component`,
  `weight`, `accessibility`) and sets `additionalProperties: false`.
- Bound properties, which accept only `{ "path" }`, never a literal.
- Agent visibility.
- One or more example component trees with a data model.
- A one-line description for the model, shown in the skill's index and
  carried by the schema.

It is listed in `homewardComponents` in `common/lib/catalog/homeward_catalog.dart`.

`homewardCatalogDocument()` builds the catalog document from these
declarations and the vendored A2UI v0.9 basic catalog: the agent-visible basic
components, every basic function, and the Homeward components and functions,
with `anyComponent` and `anyFunction` rebuilt over all of them. `a2ui_core`'s
`CommonSchemas` mark shared types with a `REF:` description instead of a
`$ref`; the document turns each into a `$ref` to the vendored common types, as
`a2ui_core` does for inline catalogs, so Homeward and basic components validate
against the same definitions. The server validates against it.

Beside the components, `common/lib/catalog` declares:

- `data_model/`: the slices the server seeds from tool results and the fields
  components may bind, with value shapes and meanings. `brief` (C4, D132): an
  object of the brief's items by ID, each `{ id, kind, text, source, words }`,
  declared with `BriefItem` in `common/lib/brief`. `affordability` (C5,
  D146): what `compute_affordability` found, declared with
  `AffordabilitySlice` in `common/lib/affordability`: the market, the price,
  the highest price, the loan and largest loan, the down payment, cash
  needed, savings, rate, term, loan type, the monthly payment, the binding
  rule, and every rule checked, each with its source. The others, each
  seeded by the tool `docs/AGENT.md` names: `homes`, `swipe`, `reads`,
  `places`, `week`, `rentSplit`, `buyVsRent`, `savingsPlan`, and `markets`.
  `docs/generated/catalog_reference.md` lists every slice with its fields.
- `functions/`: client functions, `CatalogFunction`s with a pure `evaluate`
  over JSON-shaped arguments, which the app wraps as genui `ClientFunction`s
  and the server can reuse. They serve basic components, such as a check that
  keeps a button disabled. None yet.
- `planSurfaceId` and `InlineSurfaces` in `common/lib/wire`: the plan panel's
  ID, and the ID pattern and per-turn limit of inline asks (D131, D139).

From the same declarations `make catalog` generates:

- `common/lib/catalog/generated/catalog.json`, the catalog document.
- `server/prompts/generated/catalog_skill.md`, the model-facing skill: how to
  write messages, binding, actions, and the index of the components beyond
  the core ones, each with its one-line description; the examples of the
  core components; then the catalog document with the core components and
  every function, and the common
  types, as compact JSON Schema, exactly what validation enforces (D69,
  D143). The `component_docs` tool returns every other component's schema, in
  the same form, and its examples.
- `docs/generated/catalog_reference.md`, a human reference.

`make catalog-check` fails if generated files are stale, if any component
example is rejected by the server's `TurnValidator`, or if an item in
`app/lib/catalog/<component>/` built with `catalogItemFor(const X(), …)` has no
declaration, or a declaration has no item.

## Implementing A Component

In `app/lib/catalog/<component>/<component>_item.dart`, a catalog item:

1. Is a genui `CatalogItem` whose `name` and `dataSchema` come from the
   `common` declaration, built with `catalogItemFor`.
2. Reads its bindings through typed readers over genui's `DataContext`.
3. Calls `common` for any figure it computes.
4. Builds its view, `<component>_view.dart`, from `app/lib/ui/core` widgets,
   passing typed values and callbacks.

The plain widget has no genui imports and is what the gallery renders. It is
added to `homewardGenuiCatalog()` in `app/lib/catalog/homeward_catalog.dart`.

`catalogItemFor` is in `app/lib/catalog/catalog_item_for.dart` and the
binding readers in `app/lib/catalog/bindings/`.

### Binding Rules

Measured in spike S4:

- A slice binding subscribes once per widget state with
  `DataContext.subscribe(DataPath('/slice'))` and disposes the listenable. An
  update to a field inside the slice notifies it, even though the map object
  is the same instance mutated in place.
- Widget rebuilds coalesce to one per frame. Client function executions do not:
  every data model write re-runs every function bound to it. Client functions
  therefore stay scalar and cheap; series for charts are computed inside the
  component, where rebuilds coalesce.
- Everything written to the data model is JSON-shaped: `Map<String, dynamic>`
  and `List<dynamic>` as produced by `jsonDecode`, never typed Dart literals.
  `a2ui_core` stores maps as given, so writing a `Map<String, Object?>` into a
  map typed `Map<String, Object>` throws.
- genui's basic `Slider` creates a new check stream on every build and writes
  bare numbers, which is why it is not agent-visible.
