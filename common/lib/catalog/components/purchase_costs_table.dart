import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class PurchaseCostsTable extends CatalogComponent {
  const PurchaseCostsTable();

  @override
  String get name => 'PurchaseCostsTable';

  @override
  String get description =>
      'Every upfront cost the buyer owes on the day, with its source, the '
      'total, and the cash needed with the down payment, from '
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
      name: 'A Funchal flat',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "PurchaseCostsTable",
    "affordability": { "path": "/affordability" }
  }
]
''',
      dataModel: funchalAffordabilityDataModel,
    ),
  ];
}
