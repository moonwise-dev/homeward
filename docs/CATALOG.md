# Homeward Catalog

The catalog is the complete vocabulary the agent can draw with. It is declared
once in `common/lib/catalog`, implemented in `app/lib/catalog`, validated in
`server/lib/agent`, and described to the model by a generated skill.

Catalog ID: `https://moonwise.se/homeward/catalogs/v1/catalog.json`

## Design Principles

1. **Domain components, coarse bindings.** Homeward components bind to whole
   slices (`/scenario`, `/market`, `/profile`) and compute their own figures
   through `common/finance`. The model cannot mis-wire a formula it never
   writes.
2. **Numbers are bound, never literal.** Money, rate, and percentage properties
   carry the `x-homeward-bound` annotation. The server refuses literals.
3. **Inputs write, insights read.** Input components write to `/scenario` or
   `/profile`. Insight components only read. No component does both.
4. **Every insight can be questioned.** Insight components expose an optional
   `explain` action so the buyer can ask why.
5. **Provenance travels with the rule.** Any component showing a rule-derived
   figure shows the coverage badge and opens sources on tap.
6. **Locked is a state, not a separate component.** Interactive components read
   `/ui/locked` and render read-only when superseded.
7. **One widget, two places.** The widget behind each item renders the same on
   a journey page and in the gallery.

## Size And Phasing

22 Homeward components: the three story blocks below, 11 for the deal, and 8 after the recording. The story blocks come first because the story comes first (D97, D103).

| # | Component | Kind | Phase |
| --- | --- | --- | --- |
| 1 | `LocationPicker` | Input | MVP |
| 2 | `MoneyInput` | Input | MVP |
| 3 | `AmountSlider` | Input | MVP |
| 4 | `MarketSnapshotCard` | Insight | MVP |
| 5 | `AffordabilitySummary` | Insight | MVP |
| 6 | `PaymentBreakdown` | Insight | MVP |
| 7 | `StressTestChart` | Insight | MVP |
| 8 | `PurchaseCostsTable` | Insight | MVP |
| 9 | `EligibilityChecklist` | Insight | MVP |
| 10 | `ForeignBuyerObstacles` | Insight | MVP |
| 11 | `HouseholdInput` | Input | MVP |
| 12 | `LoanTypePicker` | Input | Phase 2 |
| 13 | `RateShockStepper` | Input | Phase 2 |
| 14 | `LoanTypeComparison` | Insight | Phase 2 |
| 15 | `AmortizationChart` | Insight | Phase 2 |
| 16 | `CurrencyExposureCard` | Insight | Phase 2 |
| 17 | `BuyingProcessTimeline` | Insight | Phase 2 |
| 18 | `DocumentChecklist` | Input | Phase 2 |
| 19 | `SourceList` | Insight | Phase 2 |

The loan term uses the basic `ChoicePicker`, which is why `HouseholdInput`
took the `LoanTermPicker` slot (D82). In MVP the loan type uses it too.

## Basic Components

Agent-visible basic components:

`Text`, `Row`, `Column`, `Card`, `Divider`, `List`, `Tabs`, `Icon`, `Button`,
`CheckBox`, `ChoicePicker`, `TextField`, `DateTimeInput`.

Not agent-visible: `Image`, `Video`, `AudioPlayer`, `Modal`, `Slider`. Money
sliders always use `AmountSlider`.

## Shared Property Types

| Type | Shape | Notes |
| --- | --- | --- |
| `ProfileRef` | `{ "path": "/profile" }` | Whole buyer profile |
| `MarketRef` | `{ "path": "/market" }` | Resolved rules for this buyer |
| `ScenarioRef` | `{ "path": "/scenario" }` | Current scenario |
| `MoneyPath` | `{ "path": "…" }` | A money object `{ minorUnits, currency }`, bound |
| `PpmPath` | `{ "path": "…" }` | Integer parts per million, bound |
| `BoundsPath` | `{ "path": "…" }` | `{ min, max, step }`, each a money object, bound |
| `Label` | DynamicString | Literal allowed |
| `Action` | A2UI action | Names from `docs/PROTOCOL.md` |

## Story Blocks

Building blocks Gemini composes the story from, beside the basic components.
They bind to `/story` and `/assessment`, which the server fills from open data:
the model lays them out and never writes a figure they show.

### `StoryDraft`

The buyer's story as a short paragraph Homeward writes and the buyer corrects
in place. The model writes the prose and picks which slots the sentence needs;
the device does the rest, so every correction is instant. A slot Homeward
guessed is drawn as an assumption until the buyer touches it. In the case
(D121) it is the case summary, drawn once after the questions.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `story` | path | yes | Always `/story` |
| `segments` | list | yes | Prose and slots, in reading order |

A segment has a `type`:

| Type | Fields | Shows | Writes |
| --- | --- | --- | --- |
| `text` | `text` | The sentence around the slots | Nothing |
| `mode` | `assumed` | How they get around: on foot, by bike, by car, by transit | `/story/mode` |
| `maxMinutes` | `assumed` | The longest trip they accept, 10 to 60 minutes | `/story/maxMinutes` |
| `criterion` | `kind`, `assumed` | One thing that matters, with a menu: matters, must have, leave it out | `/story/picks/<group>`, `/story/mustHaves` |
| `place` | `id`, `label`, `assumed` | A place they travel to; a blank opens a map to drop a pin, a placed one shows a pin | `/story/pins/<id>` |

`LifestyleCommuteMap` shows the pins the buyer drops, through its optional
`pins` binding to `/story/pins`.

### `LifestyleCommuteMap`

A map of the buyer's life around the homes they weigh: anchors, homes, a route
from each home to each anchor with its minutes, its mode, and how many days a
week the buyer makes the trip, and, when one home is in view, the nearest place
for each criterion and the home's week in travel. OpenStreetMap's own tiles,
with no key, attributed on the map.

Its property names are those of the Maps Agentic UI Toolkit's `GoogleMap`
(D127): `center`, `zoom`, `markers`, `routes` whose items carry an `origin` and a
`destination` pin of `lat`, `lng`, and `label`, and `travelMode`. Homeward binds
the places instead of writing them, so every place on the map is one it
checked against open map data.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `markers` | path | yes | `/story/markers` before measuring, `/assessment/markers` after |
| `routes` | path | no | `/assessment/routes`; each route has `origin`, `destination`, `minutes`, `mode`, and `perWeek` |
| `center` | path | no | `/story/center`; otherwise the map fits what it shows |
| `zoom` | number | no | Map zoom, with `center` |
| `travelMode` | enum | no | `driving`, `walking`, `bicycling`, or `transit`: show only routes of that mode |
| `pins` | path | no | `/story/pins`, the places the buyer dropped, shown as anchors |
| `focus` | string | no | A home id; shows that home alone with its routes, places, and week |

### `ComparisonTable`

Every criterion against every home, grouped as the buyer thinks about them:
each cell fits, comes close with how much it misses by, misses, or could not be
measured, with what was measured. Must-haves are marked. Criteria down the side
and homes across on a wide card; one criterion at a time on a narrow one.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `rows` | path | yes | `/assessment/rows` |
| `homes` | path | yes | `/assessment/candidates` |

### `DynamicRecommendationStack`

The homes ranked by how well they fit, best first: a score bar, what fits,
what comes close, what misses, a warning when a must-have is lost, and a
button to choose the home. A sample home leads with its photos, price, size,
and price per square metre against its area's (D122).

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `homes` | path | yes | `/assessment/candidates`, already in rank order |
| `choose` | `Action` | no | `choose_home`; the app adds the tapped home as `candidateId` |

The case summary that comes before them is `StoryDraft` and the map, with a
basic `Button` sending `commit_story`.

### `ListingCard`

One sample home in full: photos to swipe through, the price, size, rooms, and
floor, the price per square metre against its area's with the source, why it
fits and where it falls short, and a button to choose it (D126). Every reason
names its source: a quote from the listing with the words that matter
highlighted, measured by Homeward, or what the buyer said. It is labelled as a
sample listing, and each photo carries its credit.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `homes` | path | yes | `/assessment/candidates` |
| `home` | string | yes | The id of the home to show |
| `choose` | `Action` | no | `choose_home`; the app adds `candidateId` |

## Case Blocks

The detective's questions (D121, D123). Each is one card the buyer answers with
a tap, sending `answer`; the app adds what was tapped to the action's context,
so the model writes only the question. Figures on them come from tools.

### `Hunch`

A deduction about the buyer, the clue it came from, and one tap to confirm or
correct it. The first option is the hunch itself.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `story` | path | yes | Always `/story`; a place option's map opens on its centre |
| `hunch` | string | yes | The deduction, one sentence in the second person |
| `because` | string | no | The clue it came from, such as "Two children at school" |
| `facet` | enum | yes | `place`, `mode`, `maxMinutes`, `homeType`, `outdoor`, `style`, `rooms`, `needs`, `criterion` |
| `options` | list | yes | Two to four `{ label, value }`. `place`: a map query; `mode`: a travel mode; `maxMinutes` and `rooms`: a whole number; `homeType`: `flat` or `house`; `outdoor`: `none`, `balcony`, or `garden`; `style`: `classic` or `modern`; `needs`: needs separated by commas, such as `stepFree,entryLevelShower`, or `none` (D126); `criterion`: a criterion kind. A `place` option with `pin: true` opens the map to drop a pin |
| `answer` | `Action` | yes | `answer`; the app adds `facet`, `value`, and `label`, and `pin` with `lat` and `lng` when the buyer dropped one |

### `PhotoLineup`

Four photos from the buyer's city, of homes or of ways to live there, each
curated with the traits it stands for. The buyer taps the one that feels like
theirs, and the server reads the traits.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `photos` | path | yes | `/lineup/homes` or `/lineup/life`, whichever the turn context lists |
| `pick` | `Action` | yes | `answer`; the app adds `facet` `photo`, the photo id as `value`, and its caption as `label` |

### `HomeSwipe`

Six real sample homes from the buyer's city, one card at a time: a photo, the
title, the area, the price, and the size (D128). The buyer keeps a home with a
swipe right or a tap on Keep, and passes with a swipe left or Pass; after the
last card the app sends the answer. The server chose the six to differ in
kind, outdoor space, style, and size, so the pattern means something.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `homes` | path | yes | `/swipe/homes` |
| `answer` | `Action` | yes | `answer`; the app adds `facet` `swipe`, the kept ids as `value`, a `label` such as "Kept 2 of 6", and `kept` and `passed` lists |

### `TradeOff`

Two or three ways to live side by side: an area with its character, a home
type and a size, the estimated price from the area's price per square metre
with its source, and the minutes to the buyer's daily place.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `options` | path | yes | `/tradeoff/options`, seeded by `compare_areas` |
| `pick` | `Action` | yes | `answer`; the app adds `facet` `area`, the option id as `value`, and a short `label` |

### `Routine`

The buyer's week as taps (D127): every place they go regularly with how many
days a week, those the case already knows filled in, and a way to add another,
such as a clinic once a week, by name and a pin on the map.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `routine` | path | yes | `/story/routine`: each place's `id`, `label`, and `perWeek`, and a `pin` for one the buyer added |
| `story` | path | yes | `/story`; the add sheet's map opens on its centre |
| `label` | string | no | The question, such as "What does your week look like?" |

A basic `Button` sends `answer` with the facet `routine` and `storyPath`.

`HouseholdInput` asks who moves when it binds `/story/adults` and
`/story/childAges`, with a basic `Button` sending `answer` with the facet
`household` and `storyPath`.

## Components

### 1. `LocationPicker`

Chooses a country or a sub-national market. Used for the target market,
citizenship, and residency.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `label` | `Label` | yes | |
| `value` | path | yes | Writes an ISO 3166 code, `PT` or `PT-30` |
| `mode` | `market` \| `country` | yes | `market` allows subdivisions and shows coverage |
| `action` | `Action` | no | Usually `select_market` in `market` mode |

### 2. `MoneyInput`

A currency-aware amount field.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `label` | `Label` | yes | |
| `value` | `MoneyPath` | yes | Writes a money object |
| `currency` | path or ISO 4217 literal | yes | Currency is not a number; literal allowed |
| `period` | `once` \| `monthly` \| `yearly` | no | Changes the suffix only |
| `checks` | A2UI checks | no | |

### 3. `AmountSlider`

A money slider with the value, its share of a reference, and bounds from rules.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `label` | `Label` | yes | |
| `value` | `MoneyPath` | yes | Writes a money object |
| `bounds` | `BoundsPath` | yes | Seeded from rules, for example minimum down payment |
| `shareOf` | `MoneyPath` | no | Shows the value as a percentage of this amount |
| `currency` | path | yes | |

### 4. `MarketSnapshotCard`

The market at a glance for this buyer. Curated: name, coverage badge,
currency, the headline reference rate with its date, the first three kinds of
rule that apply, and a note when more rules wait on missing facts. Uncovered:
name, coverage badge, that Homeward has no rules there, and the markets it
covers, read from `/selection/candidates` as the market `LocationPicker` does.

The card reads whichever shape `/market` holds: the full rules of a curated
market, or `{ id, name, coverage }` for an uncovered one (D86).

| Property | Type | Required |
| --- | --- | --- |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 5. `AffordabilitySummary`

The largest loan at this price, the highest price the buyer's savings reach
once every upfront charge is paid, the binding constraint in words, headroom
against the current scenario, and the rate a foreign income was counted at.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 6. `PaymentBreakdown`

Monthly interest, amortization, recurring fees, and total, with the
debt-service-to-income ratio against the market limit.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 7. `StressTestChart`

Monthly cost from today's rate to the stress rate and beyond, against the
affordability limit, with today and stress marked.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 8. `PurchaseCostsTable`

Itemized upfront costs for this buyer, the total, and cash needed including the
down payment. A charge with a refund shows the refundable part and the condition
that earns it.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 9. `EligibilityChecklist`

Pass, warn, or fail for each lending rule, with what would settle a rule the
buyer is outside: the down payment that fits, or the term that does. Breaking a
lender's norm warns where breaking the law fails, since another lender may
lend. Obstacles are left to `ForeignBuyerObstacles` rather than listed in both
components when a plan shows them side by side.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 10. `ForeignBuyerObstacles`

Obstacles grouped by severity (`blocker`, `effort`, `info`) with mitigation and
typical duration, and the claim terms of any charge this buyer is on course to
have partly refunded.

| Property | Type | Required |
| --- | --- | --- |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 11. `HouseholdInput`

Who lives in the home: an adults stepper, a child list with an age for each
child, and a one-tap answer for no children. It answers the `household` profile
fact, which living costs price by each person's age. Added in M1 after a live
turn could not ask for children's ages with any basic component (D82).

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `label` | `Label` | yes | |
| `adults` | path | yes | Writes an integer, usually `/profile/adults` |
| `childAges` | path | yes | Writes a list of integers, usually `/profile/childAges`; `[]` means no children |

### 12. `LoanTypePicker`

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `value` | path | yes | Writes `loanTypeId` |
| `market` | `MarketRef` | yes | Options from `loanTypes` with reference rate and spread |

### 13. `RateShockStepper`

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `value` | `PpmPath` | yes | Writes `rateShockPpm` |
| `step` | integer ppm | no | Default 2 500, which is 25 basis points |

### 14. `LoanTypeComparison`

Every loan type side by side for the current scenario: rate, monthly payment,
interest over the fixed period, exposure to rate changes.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |

### 15. `AmortizationChart`

Remaining balance and cumulative interest over the term.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |

### 16. `CurrencyExposureCard`

Monthly cost in the buyer's income currency today and at plus or minus 10% and
20% currency moves.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |

### 17. `BuyingProcessTimeline`

| Property | Type | Required |
| --- | --- | --- |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |

### 18. `DocumentChecklist`

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `market` | `MarketRef` | yes | Documents from `process` |
| `checked` | path | yes | `/plan/checklist` |
| `action` | `Action` | yes | `toggle_document` |

### 19. `SourceList`

| Property | Type | Required |
| --- | --- | --- |
| `market` | `MarketRef` | yes |

## Client Functions

Declared in `common/lib/catalog/functions/` as `a2ui_core` `FunctionApi`
classes with a pure `evaluate` over JSON-shaped arguments, which the app wraps
as genui `ClientFunction`s and the server reuses when seeding `/derived`. They
exist for basic components: composing a sentence in `Text`, and disabling a
`Button` through `checks`. `/market` is already resolved for the buyer, so
functions that need only rules take no `profile`. Evaluators return null, or
false for checks, while their inputs are incomplete. M1 implements
`monthlyPayment` and `withinMaxLtv`.

| Function | Arguments | Returns |
| --- | --- | --- |
| `loanAmount` | `scenario` | money |
| `loanToValue` | `scenario` | ppm |
| `monthlyPayment` | `scenario`, `market` | money |
| `cashNeeded` | `scenario`, `market` | money |
| `debtServiceToIncome` | `scenario`, `market`, `profile` | ppm |
| `withinMaxLtv` | `scenario`, `market` | boolean |
| `withinMaxDsti` | `scenario`, `market`, `profile` | boolean |
| `withinStress` | `scenario`, `market`, `profile` | boolean |
| `formatMoney` | `value`, `currency` | string |
| `formatRate` | `value` | string |

Commit button with rule checks. A check is `{ "condition": <DynamicBoolean>,
"message" }` with no other properties, per genui's embedded v0.9 schema:

```json
{
  "id": "commit",
  "component": "Button",
  "child": "commit_label",
  "variant": "primary",
  "checks": [
    {
      "condition": {
        "call": "withinMaxLtv",
        "args": { "scenario": { "path": "/scenario" }, "market": { "path": "/market" }, "profile": { "path": "/profile" } }
      },
      "message": "Down payment is below the minimum for your situation"
    }
  ],
  "action": { "event": { "name": "commit_scenario", "context": { "scenarioPath": "/scenario" } } }
}
```

## Declaring A Component

In `common/lib/catalog/components/`, each component is one declaration: a
`CatalogComponent`, which implements `ComponentApi` from `a2ui_core`, the same
interface genui uses internally for its catalog items. It carries:

- Name.
- Properties built with `json_schema_builder`, `CommonSchemas`, and
  `CatalogSchemas`. The schema adds the v0.9 envelope (`id`, `component`,
  `weight`, `accessibility`) and sets `additionalProperties: false`. Slice
  references accept only their own path.
- Bound properties, which accept only `{ "path" }`, never a literal.
- Agent visibility and phase.
- One or more example component trees with a data model. Examples share the
  Stockholm sample: a profile, a scenario, and a `/market` generated from
  `markets/packs/SE.json`, which a tool test keeps in step with the pack.
  Components that only Portugal exercises, such as `PurchaseCostsTable`, use
  the Funchal sample from `PT-30` the same way: a non-resident buying at
  €350,000, kept in step by the same kind of test.
- A usage note for the model.

`homewardCatalogDocument()` builds the catalog document from these
declarations and the vendored A2UI v0.9 basic catalog: the agent-visible basic
components, every basic function, and the Homeward components and functions,
with `anyComponent` and `anyFunction` rebuilt over all of them. `a2ui_core`'s
`CommonSchemas` mark shared types with a `REF:` description instead of a
`$ref`; the document turns each into a `$ref` to the vendored common types, as
`a2ui_core` does for inline catalogs, so Homeward and basic components validate
against the same definitions. The server validates against it.

Beside the components, `common/lib/catalog` declares:

- `data_model/`: the slices the server seeds and the fields components may
  bind, with value shapes and meanings. `propose_profile` and
  `propose_scenario` build their tool parameters from the same fields, and
  `ProfileField.profileKeys` maps each pack profile field to the profile keys
  that answer it.
- `examples/surface_examples.dart`: whole surfaces, a profile form and an
  affordability what-if, that show the model complete trees with basic
  layout, checks, and actions.
- `SurfaceAction` and `InlineSurfaces` in `common/lib/wire`: action names with
  their context keys, and the surface ID and per-turn limits.

From the same declarations `make catalog` generates:

- `common/lib/catalog/generated/catalog.json`, the catalog document.
- `server/prompts/generated/catalog_skill.md`, the model-facing skill: how to
  write messages, the data model paths, the actions, the surface and component
  examples, and then the catalog document and the common types as compact JSON
  Schema, exactly what validation enforces (D69).
- `server/prompts/generated/catalog_skill_story.md`, the same skill without the
  deal (D125): components, functions, data model slices, and actions each
  belong to the story or the deal, and this one leaves out the deal's, and
  the surface examples, which are all the deal's.
- `docs/generated/catalog_reference.md`, a human reference.

`make catalog-check` fails if generated files are stale or if any component or
surface example is rejected by the server's `TurnValidator`, or if an item in
`app/lib/catalog/<component>/` built with `catalogItemFor(const X(), …)` has no
declaration, or a declaration has no item.

## Implementing A Component

In `app/lib/catalog/<component>/<component>_item.dart`, a catalog item:

1. Is a genui `CatalogItem` whose `name` and `dataSchema` come from the
   `common` declaration.
2. Reads bindings through `app/lib/catalog/bindings/`.
3. Calls `common/finance` for figures.
4. Builds its view, `<component>_view.dart`, from `app/lib/ui/core` widgets, passing typed values and
   callbacks.

The plain widget has no genui imports and is what the gallery renders.

### Binding Rules

Measured in spike S4:

- A slice binding subscribes once per widget state with
  `DataContext.subscribe(DataPath('/scenario'))` and disposes the listenable.
  An update to `/scenario/downPayment` notifies it, even though the map object is
  the same instance mutated in place. `app/lib/catalog/bindings/` owns this
  subscription so no item writes it twice.
- Widget rebuilds coalesce to one per frame. Client function executions do not:
  every data model write re-runs every function bound to it. Client functions
  therefore stay scalar and cheap; series for charts are computed inside the
  component, where rebuilds coalesce.
- Everything written to the data model is JSON-shaped: `Map<String, dynamic>`
  and `List<dynamic>` as produced by `jsonDecode`, never typed Dart literals.
  `a2ui_core` stores maps as given, so writing a `Map<String, Object?>` into a
  map typed `Map<String, Object>` throws.
- Homeward money inputs are Homeward components. genui's basic `Slider` creates
  a new check stream on every build and writes bare numbers.
