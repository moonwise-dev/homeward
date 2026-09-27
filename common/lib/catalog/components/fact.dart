import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/brief_example.dart';

final class Fact extends CatalogComponent {
  const Fact();

  @override
  String get name => 'Fact';

  @override
  String get description =>
      'One item of the brief, with where it came from; a deduction offers '
      'Right and Not quite when it has an answer action.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'fact': CatalogSchemas.bound(
      'One item update_brief recorded, { "path": "/brief/<id>" }.',
    ),
    'answer': Schema.object(
      description:
          'Optional. The action a tap on Right or Not quite sends, with fact, '
          'the item ID, answer, right or not_quite, and label added to its '
          'context. Only a deduced item shows the taps.',
      properties: {
        'event': Schema.object(
          properties: {
            'name': Schema.string(),
            'context': Schema.object(additionalProperties: true),
          },
          required: ['name'],
        ),
      },
      required: ['event'],
      additionalProperties: false,
    ),
  };

  @override
  List<String> get requiredProperties => ['fact'];

  @override
  List<String> get boundProperties => ['fact'];

  @override
  List<CatalogExample> get examples => const [
    CatalogExample(
      name: 'What Homeward understood',
      componentsJson: '''
[
  { "id": "root", "component": "Column", "children": ["stairs", "city"] },
  {
    "id": "stairs",
    "component": "Fact",
    "fact": { "path": "/brief/step-free" },
    "answer": { "event": { "name": "check_fact", "context": {} } }
  },
  { "id": "city", "component": "Fact", "fact": { "path": "/brief/city" } }
]
''',
      dataModel: stockholmBriefDataModel,
    ),
  ];
}
