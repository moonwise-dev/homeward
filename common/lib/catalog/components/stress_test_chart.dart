import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class StressTestChart extends CatalogComponent {
  const StressTestChart();

  @override
  String get name => 'StressTestChart';

  @override
  CatalogFamily get family => CatalogFamily.money;

  @override
  String get description =>
      'The monthly cost as rates rise past the rate lenders test, against '
      'the most this household can carry, from compute_affordability.';

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
    "component": "StressTestChart",
    "affordability": { "path": "/affordability" }
  }
]
''';
}
