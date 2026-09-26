import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/case_example.dart';

final class HomeSwipe extends CatalogComponent {
  const HomeSwipe();

  @override
  String get name => 'HomeSwipe';

  @override
  String get description =>
      "Six real sample homes from the buyer's city, one card at a time, that "
      'the buyer keeps or passes with a swipe or a tap. The server chose them '
      'to differ in kind, outdoor space, style, and size. Bind homes to '
      '/swipe/homes. After the last card the app adds facet swipe, the kept '
      'ids as value, a label, and the kept and passed lists to the answer '
      'action.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'homes': Schema.object(
      description: 'Always { "path": "/swipe/homes" }.',
      properties: {
        'path': Schema.string(enumValues: const ['/swipe/homes']),
      },
      required: ['path'],
      additionalProperties: false,
    ),
    'answer': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['homes', 'answer'];

  @override
  List<String> get boundProperties => ['homes'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Keep the ones that feel like yours',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "HomeSwipe",
    "homes": { "path": "/swipe/homes" },
    "answer": { "event": { "name": "answer", "context": {} } }
  }
]
''',
      dataModel: caseSwipeDataModel,
    ),
  ];
}
