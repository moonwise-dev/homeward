import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_story_example.dart';

final class ComparisonTable extends CatalogComponent {
  const ComparisonTable();

  @override
  String get name => 'ComparisonTable';

  @override
  String get description =>
      'Every criterion against every home: whether it fits, comes close and '
      'misses by how much, or misses, with what was measured. Must-haves are '
      'marked. Bind rows to /assessment/rows and homes to '
      '/assessment/candidates.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'rows': CatalogSchemas.bound('Always { "path": "/assessment/rows" }.'),
    'homes': CatalogSchemas.bound(
      'Always { "path": "/assessment/candidates" }.',
    ),
  };

  @override
  List<String> get requiredProperties => ['rows', 'homes'];

  @override
  List<String> get boundProperties => ['rows', 'homes'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Odengatan against Solna',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "ComparisonTable",
    "rows": { "path": "/assessment/rows" },
    "homes": { "path": "/assessment/candidates" }
  }
]
''',
      dataModel: stockholmStoryDataModel,
    ),
  ];
}
