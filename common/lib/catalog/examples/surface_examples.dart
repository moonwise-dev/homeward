import '../catalog_component.dart';
import 'stockholm_example.dart';

final surfaceExamples = [
  CatalogExample(
    name: 'Profile form',
    componentsJson: '''
[
  { "id": "root", "component": "Column", "children": ["title", "household", "income", "gross_income", "debts", "age", "borrowers", "savings", "commit"] },
  { "id": "title", "component": "Text", "text": "About your household", "variant": "h3" },
  { "id": "household", "component": "HouseholdInput", "label": "Who lives in the home?", "adults": { "path": "/profile/adults" }, "childAges": { "path": "/profile/childAges" } },
  { "id": "income", "component": "MoneyInput", "label": "Household net income", "value": { "path": "/profile/netMonthlyIncome" }, "currency": { "path": "/market/currency" }, "period": "monthly" },
  { "id": "gross_income", "component": "MoneyInput", "label": "Household gross income", "value": { "path": "/profile/grossMonthlyIncome" }, "currency": { "path": "/market/currency" }, "period": "monthly" },
  { "id": "debts", "component": "MoneyInput", "label": "Payments on other loans", "value": { "path": "/profile/monthlyDebtPayments" }, "currency": { "path": "/market/currency" }, "period": "monthly" },
  { "id": "age", "component": "TextField", "label": "Age of the oldest borrower", "value": { "path": "/profile/age" }, "variant": "number" },
  { "id": "borrowers", "component": "TextField", "label": "People on the loan", "value": { "path": "/profile/borrowers" }, "variant": "number" },
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
