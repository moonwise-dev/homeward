import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/homes_example.dart';

final class Shortlist extends CatalogComponent {
  const Shortlist();

  @override
  String get name => 'Shortlist';

  @override
  String get description =>
      'The homes the household kept with keep_homes, each with what it costs '
      'them a month; its choose action sends a home to work out and its drop '
      'action one to drop, with home, its ID, added to its context.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'homes': CatalogSchemas.slice(
      '/homes',
      'Always { "path": "/homes" }, after search_homes or keep_homes.',
    ),
    'choose': CatalogSchemas.action,
    'drop': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['homes'];

  @override
  List<String> get boundProperties => ['homes'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Two kept flats',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "Shortlist",
    "homes": { "path": "/homes" },
    "choose": { "event": { "name": "work_out_home", "context": {} } },
    "drop": { "event": { "name": "drop_home", "context": {} } }
  }
]
''',
      dataModel: stockholmShortlistDataModel,
    ),
  ];
}
