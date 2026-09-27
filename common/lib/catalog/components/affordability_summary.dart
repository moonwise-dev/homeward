import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class AffordabilitySummary extends CatalogComponent {
  const AffordabilitySummary();

  @override
  String get name => 'AffordabilitySummary';

  @override
  CatalogFamily get family => CatalogFamily.money;

  @override
  String get description =>
      'What the household can borrow, the highest price it allows, and the '
      'rule that limits it, from compute_affordability.';

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
      name: 'A Stockholm couple',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "AffordabilitySummary",
    "affordability": { "path": "/affordability" }
  }
]
''',
      dataModel: affordabilityDataModel,
    ),
  ];
}
