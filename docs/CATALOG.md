# Homeward Catalog

The catalog is the complete vocabulary the agent can draw with. It is declared
once in `common/lib/catalog`, implemented in `app/lib/catalog`, validated in
`server/lib/agent`, and described to the model by a generated skill.

Catalog ID: `https://moonwise.se/homeward/catalogs/v1/catalog.json`

Since the reset (D129) Homeward's own blocks come back one at a time, each
with the chunk of `docs/ROADMAP.md` that needs it: `Fact` (C4), `Choice`
(C4b), and `AffordabilitySummary` and `RuleNote` (C5) so far.

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
   the journey and in the gallery.

## Basic Components

Agent-visible basic components, each declared with its one-line description
in `basicComponentSummaries`:

`Text`, `Row`, `Column`, `Card`, `Divider`, `List`, `Tabs`, `Icon`, `Button`,
`CheckBox`, `ChoicePicker`, `TextField`, `DateTimeInput`.

The core components, `coreComponents`: the layout components `Column`,
`Row`, `Card`, `Text`, `Button`, and `Divider`, `Fact`, which every plan
uses, `Choice`, which every ask uses, and `AffordabilitySummary` and
`RuleNote`, since money is in every plan. The skill always carries their full
schemas, and correction rounds offer them (D110, D143 to D146).

Not agent-visible: `Image`, `Video`, `AudioPlayer`, `Modal`, `Slider`.

Buttons send actions the model names itself (`docs/PROTOCOL.md`).

## Homeward Components

| Family | Block | What it shows | Properties |
| --- | --- | --- | --- |
| Understanding | `Fact` | One item of the brief: the sentence, and where it came from: "You said", "Deduced from" with the buyer's words, or "You confirmed". A deduction with an `answer` action offers Right and Not quite (D144) | `fact`, bound to one item, `{ "path": "/brief/<id>" }`; `answer`, an optional action |
| Understanding | `Choice` | One decision as an inline ask: the question, two to five options, the recommended one first with why, and a line pointing at the text field for any other answer (D145) | `question`; `options`, each a `label` and an optional `detail`; `recommended`, the label of one option; `because`; `answer`, an action |
| Money | `AffordabilitySummary` | What the household can borrow, the highest price their savings and the sample rules allow, the down payment and cash needed, the monthly payment, and which rule limits the loan, labelled as a sample estimate (D146) | `affordability`, always `{ "path": "/affordability" }` |
| Trust | `RuleNote` | One lending rule: what it is, the largest loan it allows, whether the loan is within it, and its source with the date it was read, labelled as a sample rule (D146) | `rule`, bound to one rule, such as `{ "path": "/affordability/binding" }` or `/affordability/checks/0` |

A `Choice` tap sends its `answer` action at once, with `choice` and `label`,
the option's label, added to its context; the tapped option stays marked.

A block that binds a slice, such as `AffordabilitySummary` or `Fact`, is
refused until the tool that seeds it has run: its whole path must be in the
data model, unlike an input, which may bind a field it will write.

A `Fact` tap sends its `answer` action with `fact`, the item's ID, `answer`,
`right` or `not_quite`, and `label`, the words the conversation shows, such as
"Right: Your mum can't manage stairs". A `Fact` bound to an item the brief
does not hold is refused.

## Planned Blocks

Candidates toward 25 to 30 (D140), grouped in families, each confirmed,
reshaped, or dropped by the chunk of `docs/ROADMAP.md` that needs it. Blocks
marked restored come back from `6faa8ab`.

| Family | Block | Chunk | What it shows |
| --- | --- | --- | --- |
| Understanding | `Brief` | C10 | A section of the brief: the household, its needs, its week, or what is open |
| Understanding | `HouseholdSummary` | C10 | Who moves, incomes and savings as stated, and who shares the costs |
| Money | `MonthlyCostBreakdown` | C5b | What a home costs each month: interest, amortization, fees, and running costs; restored as `PaymentBreakdown` |
| Money | `MortgageOptions` | C6 | Fixed against variable, down payment levels, and terms, side by side |
| Money | `DownPaymentSlider` | C6 | A what-if recomputed on the device, bound to the seeded bounds |
| Money | `StressTestChart` | C6 | The monthly cost as rates rise, against what the household can carry; restored |
| Money | `PurchaseCostsTable` | C6 | The upfront costs: down payment, taxes, and fees; restored |
| Money | `MoneyInput` | C6 | An amount in a currency, for incomes and savings; restored |
| Money | `RentSplit` | C9 | Rent and bills split between people sharing, by the rule they choose |
| Money | `BuyVsRent` | C9 | Buying a home against renting one like it, over the years they expect to stay |
| Homes | `HomeCard` | C7 | A sample home with its monthly cost for this household and why it fits |
| Homes | `HomeComparison` | C7 | Two or three homes side by side on cost, needs, and the week |
| Homes | `Shortlist` | C7 | The homes the household kept, on the plan panel |
| Homes | `HomeSwipe` | C9 | Keep or pass through homes to learn taste |
| Homes | `ListingQuote` | C9 | The listing text with the sentence that meets a need highlighted |
| Place and travel | `GoogleMap` | C8 | The Maps Agentic UI Toolkit's map, with its schema vendored at a pinned commit from `googlemaps/a2ui` (`agent/python_agent/shared/schema/maps_catalog_extension.json`) and drawn by Homeward's Flutter Maps package (D133) |
| Place and travel | `WeeklyTravel` | C8 | Each place in the week with how often they go and the measured trip, and the weekly total from one home |
| Place and travel | `RouteSummary` | C8 | One trip: mode, minutes, and distance, measured |
| Place and travel | `MarketSnapshotCard` | C10 | The city's reference rates and typical costs, as samples; restored |
| Place and travel | `PlaceDetailsCompact` | Later | The toolkit's place card, after S14 |
| Trust | `EstimateNote` | C5 | Marks a figure as an estimate from sample rates, and says what would change it |

`GoogleMap` keeps the toolkit's schema exactly, so a surface that uses it
stays readable by the toolkit's own clients. Its `markers` and `routes` take
literal coordinates, which a validation pass checks against the places tools
returned rather than a data binding. Its schema is built with `allOf`, which
keeps it out of the correction round's enforced schema (D110).

## Declaring A Component

In `common/lib/catalog/components/`, each component is one declaration: a
`CatalogComponent`, which implements `ComponentApi` from `a2ui_core`, the same
interface genui uses internally for its catalog items. It carries:

- Name.
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
  rule, and every rule checked, each with its source.
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

The helpers the removed components used, `catalogItemFor` and the binding
readers, are in git history at `6faa8ab` and come back with the first
component.

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
