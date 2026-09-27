import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class MonthlyCostBreakdown extends CatalogComponent {
  const MonthlyCostBreakdown();

  @override
  String get name => 'MonthlyCostBreakdown';

  @override
  String get description =>
      'What the home at the price in /affordability costs each month: '
      'interest, amortization, the fee the buyer stated, and the total, from '
      'compute_affordability.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'affordability': CatalogSchemas.slice(
      '/affordability',
      'Always { "path": "/affordability" }, after compute_affordability '
          'answered.',
    ),
  };

  @override
  List<String> get requiredProperties => ['affordability'];

  @override
  List<String> get boundProperties => ['affordability'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A Stockholm flat with an association fee',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "MonthlyCostBreakdown",
    "affordability": { "path": "/affordability" }
  }
]
''',
      dataModel: monthlyCostDataModel,
    ),
  ];
}
