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
      'Who the household is and the figures they stated, as '
      'compute_affordability kept them: the people, residency, work, and '
      'the incomes, debts, and savings they gave.';

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
  ];

  static const _example = '''
[
  { "id": "root", "component": "HouseholdSummary", "affordability": { "path": "/affordability" } }
]
''';
}
