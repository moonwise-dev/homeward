import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/case_example.dart';

final class Routine extends CatalogComponent {
  const Routine();

  @override
  String get name => 'Routine';

  @override
  String get description =>
      "The buyer's week as taps: every place they go regularly with how many "
      'days a week, those the case knows already filled in, and a way to add '
      'another, such as a clinic once a week, by name and a pin on the map. '
      'Bind routine to /story/routine and story to /story, beside a Button '
      'sending answer with the facet routine and storyPath /story.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'label': CatalogSchemas.label,
    'routine': CatalogSchemas.bound('Always /story/routine.'),
    'story': CatalogSchemas.bound(
      'Always /story; the map for adding a place opens on its centre.',
    ),
  };

  @override
  List<String> get requiredProperties => ['routine', 'story'];

  @override
  List<String> get boundProperties => ['routine', 'story'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Their week around KTH',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "Routine",
    "label": "What does your week look like?",
    "routine": { "path": "/story/routine" },
    "story": { "path": "/story" }
  }
]
''',
      dataModel: caseRoutineDataModel,
    ),
  ];
}
