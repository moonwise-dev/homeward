import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class DownPaymentSlider extends CatalogComponent {
  const DownPaymentSlider();

  @override
  String get name => 'DownPaymentSlider';

  @override
  String get description =>
      'Lets the buyer try down payments for the price in /affordability and '
      'see the loan, the monthly cost, and the cash needed; its apply action '
      'sends the one they use, with downPayment added to its context.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'affordability': CatalogSchemas.slice(
      '/affordability',
      'Always { "path": "/affordability" }, after compute_affordability '
          'answered.',
    ),
    'apply': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['affordability'];

  @override
  List<String> get boundProperties => ['affordability'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A Stockholm flat',
      componentsJson: _example,
      dataModel: monthlyCostDataModel,
    ),
    CatalogExample(
      name: 'A Funchal flat',
      componentsJson: _example,
      dataModel: funchalAffordabilityDataModel,
    ),
  ];

  static const _example = '''
[
  {
    "id": "root",
    "component": "DownPaymentSlider",
    "affordability": { "path": "/affordability" },
    "apply": { "event": { "name": "use_down_payment", "context": {} } }
  }
]
''';
}
