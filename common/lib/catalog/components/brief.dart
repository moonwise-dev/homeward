import 'package:json_schema_builder/json_schema_builder.dart';

import '../../brief/brief_item.dart';
import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/brief_example.dart';

final class Brief extends CatalogComponent {
  const Brief();

  @override
  String get name => 'Brief';

  @override
  CatalogFamily get family => CatalogFamily.understanding;

  @override
  String get description =>
      'Sections of the brief update_brief kept, drawn when the buyer asks '
      'what you know: one kind or several, each item with where it came '
      'from; a deduction offers Right and Not quite when it has an answer '
      'action.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'brief': CatalogSchemas.slice(
      '/brief',
      'Always { "path": "/brief" }, after update_brief recorded an item.',
    ),
    'kinds': Schema.list(
      description:
          'Optional. The kinds to show, in this order; all without it.',
      items: Schema.string(
        enumValues: [for (final kind in BriefKind.values) kind.name],
      ),
    ),
    'title': Schema.string(description: 'Optional. A heading for the section.'),
    'answer': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['brief'];

  @override
  List<String> get boundProperties => ['brief'];

  @override
  List<CatalogExample> get examples => const [
    CatalogExample(
      name: 'The household and its needs',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "Brief",
    "brief": { "path": "/brief" },
    "kinds": ["household", "need", "want", "open"],
    "answer": { "event": { "name": "check_fact", "context": {} } }
  }
]
''',
      dataModel: stockholmBriefDataModel,
    ),
  ];
}
