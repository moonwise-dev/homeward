import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class HouseholdSummary extends CatalogComponent {
  const HouseholdSummary();

  @override
  String get name => 'HouseholdSummary';

  @override
  CatalogFamily get family => CatalogFamily.understanding;

  @override
  String get description =>
      'What the figures rest on, as compute_affordability kept it: the '
      'people, residency, work, incomes, other loans, and savings. A line '
      'the tool assumed or estimated is marked, so draw it when the tool '
      'hands it over, and when the buyer asks who the household is.';

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
      componentsJson: _example,
      dataModel: affordabilityDataModel,
    ),
    CatalogExample(
      name: 'A household buying in Funchal',
      componentsJson: _example,
      dataModel: funchalAffordabilityDataModel,
    ),
    CatalogExample(
      name: 'One buyer who gave pay and savings, the rest assumed',
      componentsJson: _example,
      dataModel: assumedAffordabilityDataModel,
    ),
  ];

  static const _example = '''
[
  { "id": "root", "component": "HouseholdSummary", "affordability": { "path": "/affordability" } }
]
''';
}
