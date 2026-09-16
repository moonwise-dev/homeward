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
7. **One widget, three places.** The widget behind each item renders the same in
   an inline surface, on the board, and in the gallery.

## Size And Phasing

20 Homeward components: 10 for the video recording, 10 after.

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
| 11 | `LoanTermPicker` | Input | Phase 2 |
| 12 | `LoanTypePicker` | Input | Phase 2 |
| 13 | `RateShockStepper` | Input | Phase 2 |
| 14 | `LoanTypeComparison` | Insight | Phase 2 |
| 15 | `AmortizationChart` | Insight | Phase 2 |
| 16 | `CurrencyExposureCard` | Insight | Phase 2 |
| 17 | `BuyingProcessTimeline` | Insight | Phase 2 |
| 18 | `DocumentChecklist` | Input | Phase 2 |
| 19 | `SourceList` | Insight | Phase 2 |
| 20 | `PlanSection` | Layout, board only | Phase 2 |

In MVP, the loan term and loan type use the basic `ChoicePicker`, and the board
is compiled from basic layout components plus MVP insights.

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
| `MoneyPath` | `{ "path": "…" }` | Integer minor units, bound |
| `PpmPath` | `{ "path": "…" }` | Integer parts per million, bound |
| `BoundsPath` | `{ "path": "…" }` | `{ min, max, step }` in minor units, bound |
| `Label` | DynamicString | Literal allowed |
| `Action` | A2UI action | Names from `docs/PROTOCOL.md` |

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
| `value` | `MoneyPath` | yes | Writes minor units |
| `currency` | path or ISO 4217 literal | yes | Currency is not a number; literal allowed |
| `period` | `once` \| `monthly` \| `yearly` | no | Changes the suffix only |
| `checks` | A2UI checks | no | |

### 3. `AmountSlider`

A money slider with the value, its share of a reference, and bounds from rules.

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `label` | `Label` | yes | |
| `value` | `MoneyPath` | yes | Writes minor units |
| `bounds` | `BoundsPath` | yes | Seeded from rules, for example minimum down payment |
| `shareOf` | `MoneyPath` | no | Shows the value as a percentage of this amount |
| `currency` | path | yes | |

### 4. `MarketSnapshotCard`

The market at a glance for this buyer: name, currency, coverage badge, the
three rules that matter most for this buyer, the headline reference rate with
its date.

| Property | Type | Required |
| --- | --- | --- |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 5. `AffordabilitySummary`

Maximum price and loan, the binding constraint in words, and headroom against
the current scenario.

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
down payment.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 9. `EligibilityChecklist`

Pass, warn, or fail for each lending rule and each blocking obstacle, with the
reason and what would change it.

| Property | Type | Required |
| --- | --- | --- |
| `scenario` | `ScenarioRef` | yes |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 10. `ForeignBuyerObstacles`

Obstacles grouped by severity (`blocker`, `effort`, `info`) with mitigation and
typical duration.

| Property | Type | Required |
| --- | --- | --- |
| `market` | `MarketRef` | yes |
| `profile` | `ProfileRef` | yes |
| `explain` | `Action` | no |

### 11. `LoanTermPicker`

| Property | Type | Required | Notes |
| --- | --- | --- | --- |
| `value` | path | yes | Writes years |
| `market` | `MarketRef` | yes | Limits from `lending.maxTermYears` and maximum age at maturity |
| `profile` | `ProfileRef` | yes | |

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

### 20. `PlanSection`

Board only; not agent-visible.

| Property | Type | Required |
| --- | --- | --- |
| `title` | `Label` | yes |
| `child` | ComponentId | yes |
| `change` | `Action` | no |

## Client Functions

Registered in the Homeward catalog, implemented as thin adapters over
`common/finance`. They exist for basic components: composing a sentence in
`Text`, and disabling a `Button` through `checks`.

| Function | Arguments | Returns |
| --- | --- | --- |
| `loanAmount` | `scenario` | money |
| `loanToValue` | `scenario` | ppm |
| `monthlyPayment` | `scenario`, `market` | money |
| `cashNeeded` | `scenario`, `market`, `profile` | money |
| `debtServiceToIncome` | `scenario`, `market`, `profile` | ppm |
| `withinMaxLtv` | `scenario`, `market`, `profile` | boolean |
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
class extending `ComponentApi` from `a2ui_core`, the same interface genui uses
internally for its catalog items. It carries:

- Name.
- JSON schema built with `json_schema_builder` and `CommonSchemas`, with
  `additionalProperties: false`.
- Bound-number annotations.
- Agent visibility and phase.
- One or more example component trees with example data models.
- A one-paragraph usage note for the model.

From these declarations `tool` generates:

- `common/lib/catalog/generated/catalog.json`, the catalog document.
- `server/prompts/generated/catalog_skill.md`, the model-facing skill.
- `docs/generated/catalog_reference.md`, a human reference.

`make catalog-check` fails if generated files are stale, if an example does not
validate, or if an app catalog item exists without a declaration or the
reverse.

## Implementing A Component

In `app/lib/catalog/items/`, a catalog item:

1. Is a genui `CatalogItem` whose `name` and `dataSchema` come from the
   `common` declaration.
2. Reads bindings through `app/lib/catalog/bindings/`.
3. Calls `common/finance` for figures.
4. Builds a plain widget from `app/lib/ui` primitives, passing typed values and
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
