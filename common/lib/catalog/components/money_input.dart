import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_example.dart';

final class MoneyInput extends CatalogComponent {
  const MoneyInput();

  @override
  String get name => 'MoneyInput';

  @override
  String get description =>
      'An amount field that writes a money object to the bound path. Use it '
      'for incomes, savings, debts, and fees; never write amounts yourself.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'label': CatalogSchemas.label,
    'value': CatalogSchemas.bound(
      'Where the amount is written, such as /profile/netMonthlyIncome.',
    ),
    'currency': Schema.combined(
      anyOf: [
        CatalogSchemas.bound('Usually { "path": "/market/currency" }.'),
        CatalogSchemas.currencyCode,
      ],
    ),
    'period': Schema.string(enumValues: ['once', 'monthly', 'yearly']),
    'checks': CatalogSchemas.checks,
  };

  @override
  List<String> get requiredProperties => ['label', 'value', 'currency'];

  @override
  List<String> get boundProperties => ['value'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Monthly net income',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "MoneyInput",
    "label": "Household net income",
    "value": { "path": "/profile/netMonthlyIncome" },
    "currency": { "path": "/market/currency" },
    "period": "monthly"
  }
]
''',
      dataModel: stockholmDataModel,
    ),
  ];
}
