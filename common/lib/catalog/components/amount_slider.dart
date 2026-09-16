import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_example.dart';

final class AmountSlider extends CatalogComponent {
  const AmountSlider();

  @override
  String get name => 'AmountSlider';

  @override
  String get description =>
      'A money slider between bounds computed from the rules, showing the '
      'value and its share of another amount. Use it for the down payment, '
      'bound to /derived/downPaymentBounds.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'label': CatalogSchemas.label,
    'value': CatalogSchemas.bound('Where the amount is written.'),
    'bounds': CatalogSchemas.bound(
      'Minimum, maximum, and step, such as '
      '/derived/downPaymentBounds.',
    ),
    'shareOf': CatalogSchemas.bound('Amount the value is shown as a share of.'),
    'currency': CatalogSchemas.bound('Usually { "path": "/market/currency" }.'),
  };

  @override
  List<String> get requiredProperties => [
    'label',
    'value',
    'bounds',
    'currency',
  ];

  @override
  List<String> get boundProperties => [
    'value',
    'bounds',
    'shareOf',
    'currency',
  ];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Down payment',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "AmountSlider",
    "label": "Down payment",
    "value": { "path": "/scenario/downPayment" },
    "bounds": { "path": "/derived/downPaymentBounds" },
    "shareOf": { "path": "/scenario/price" },
    "currency": { "path": "/market/currency" }
  }
]
''',
      dataModel: stockholmDataModel,
    ),
  ];
}
