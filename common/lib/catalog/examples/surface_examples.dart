import '../catalog_component.dart';
import 'stockholm_example.dart';

final surfaceExamples = [
  CatalogExample(
    name: 'Profile form',
    componentsJson: '''
[
  { "id": "root", "component": "Column", "children": ["title", "residence", "use", "household", "income", "savings", "commit"] },
  { "id": "title", "component": "Text", "text": "About you", "variant": "h3" },
  { "id": "residence", "component": "LocationPicker", "label": "Where do you pay tax?", "value": { "path": "/profile/taxResidence" }, "mode": "country" },
  {
    "id": "use",
    "component": "ChoicePicker",
    "label": "How will you use the home?",
    "variant": "mutuallyExclusive",
    "options": [
      { "label": "Live in it", "value": "primary" },
      { "label": "Second home", "value": "secondary" },
      { "label": "Rent it out", "value": "investment" }
    ],
    "value": { "path": "/profile/use" }
  },
  { "id": "household", "component": "HouseholdInput", "label": "Who lives in the home?", "adults": { "path": "/profile/adults" }, "childAges": { "path": "/profile/childAges" } },
  { "id": "income", "component": "MoneyInput", "label": "Household net income", "value": { "path": "/profile/netMonthlyIncome" }, "currency": { "path": "/market/currency" }, "period": "monthly" },
  { "id": "savings", "component": "MoneyInput", "label": "Savings for the purchase", "value": { "path": "/profile/savings" }, "currency": { "path": "/market/currency" } },
  { "id": "commit", "component": "Button", "child": "commit_label", "variant": "primary", "action": { "event": { "name": "commit_profile", "context": { "profilePath": "/profile" } } } },
  { "id": "commit_label", "component": "Text", "text": "Save my details" }
]
''',
    dataModel: stockholmDataModel,
  ),
  CatalogExample(
    name: 'Affordability what-if',
    componentsJson: '''
[
  { "id": "root", "component": "Column", "children": ["summary", "down_payment", "payment", "commit"] },
  { "id": "summary", "component": "AffordabilitySummary", "scenario": { "path": "/scenario" }, "market": { "path": "/market" }, "profile": { "path": "/profile" } },
  { "id": "down_payment", "component": "AmountSlider", "label": "Down payment", "value": { "path": "/scenario/downPayment" }, "bounds": { "path": "/derived/downPaymentBounds" }, "shareOf": { "path": "/scenario/price" }, "currency": { "path": "/market/currency" } },
  { "id": "payment", "component": "PaymentBreakdown", "scenario": { "path": "/scenario" }, "market": { "path": "/market" }, "profile": { "path": "/profile" } },
  {
    "id": "commit",
    "component": "Button",
    "child": "commit_label",
    "variant": "primary",
    "checks": [
      {
        "condition": { "call": "withinMaxLtv", "args": { "scenario": { "path": "/scenario" }, "market": { "path": "/market" } } },
        "message": "The down payment is below the minimum for this market"
      }
    ],
    "action": { "event": { "name": "commit_scenario", "context": { "scenarioPath": "/scenario" } } }
  },
  { "id": "commit_label", "component": "Text", "text": "Use this scenario" }
]
''',
    dataModel: stockholmDataModel,
  ),
];
