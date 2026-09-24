import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_story_example.dart';

final class DynamicRecommendationStack extends CatalogComponent {
  const DynamicRecommendationStack();

  @override
  String get name => 'DynamicRecommendationStack';

  @override
  String get description =>
      "The buyer's homes ranked by how well they fit the story, best first: "
      'what fits, what comes close and by how much, what misses, and whether '
      'a must-have is lost, each with a button to choose that home. Bind homes '
      'to /assessment/candidates. choose is sent with the chosen home added '
      'to its context as candidateId.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'homes': CatalogSchemas.bound(
      'Always { "path": "/assessment/candidates" }.',
    ),
    'choose': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['homes'];

  @override
  List<String> get boundProperties => ['homes'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Which flat fits the move',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "DynamicRecommendationStack",
    "homes": { "path": "/assessment/candidates" },
    "choose": { "event": { "name": "choose_home", "context": {} } }
  }
]
''',
      dataModel: stockholmStoryDataModel,
    ),
  ];
}
