import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/homes_example.dart';

final class HomeCard extends CatalogComponent {
  const HomeCard();

  @override
  String get name => 'HomeCard';

  @override
  String get description =>
      'One sample home from search_homes: photos, facts, price, and what it '
      'costs this household each month; its choose action sends the home to '
      'work out, and its keep action the home to keep or drop, with home, '
      'its ID, and keep, true or false, added to its context.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'home': CatalogSchemas.bound(
      'One home search_homes found, { "path": "/homes/<id>" }.',
    ),
    'choose': CatalogSchemas.action,
    'keep': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['home'];

  @override
  List<String> get boundProperties => ['home'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Two Stockholm flats',
      componentsJson: '''
[
  { "id": "root", "component": "Column", "children": ["nacka", "vasastan"] },
  {
    "id": "nacka",
    "component": "HomeCard",
    "home": { "path": "/homes/sto-12" },
    "choose": { "event": { "name": "work_out_home", "context": {} } },
    "keep": { "event": { "name": "keep_home", "context": {} } }
  },
  {
    "id": "vasastan",
    "component": "HomeCard",
    "home": { "path": "/homes/sto-01" },
    "choose": { "event": { "name": "work_out_home", "context": {} } },
    "keep": { "event": { "name": "keep_home", "context": {} } }
  }
]
''',
      dataModel: stockholmHomesDataModel,
    ),
  ];
}
