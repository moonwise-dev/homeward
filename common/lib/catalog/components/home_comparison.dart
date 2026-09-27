import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/homes_example.dart';

final class HomeComparison extends CatalogComponent {
  const HomeComparison();

  @override
  String get name => 'HomeComparison';

  @override
  CatalogFamily get family => CatalogFamily.homes;

  @override
  String get description =>
      'Two or three homes from search_homes side by side: price, what each '
      'costs a month, the cash needed, and size; its choose action sends the '
      'one the buyer picks, with home, its ID, added to its context.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'homes': Schema.list(
      description: 'Two or three homes, each { "path": "/homes/<id>" }.',
      items: CatalogSchemas.bound('One home, { "path": "/homes/<id>" }.'),
      minItems: 2,
      maxItems: 3,
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
      name: 'Nacka against Vasastan',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "HomeComparison",
    "homes": [
      { "path": "/homes/sto-12" },
      { "path": "/homes/sto-01" }
    ],
    "choose": { "event": { "name": "work_out_home", "context": {} } }
  }
]
''',
      dataModel: stockholmShortlistDataModel,
    ),
  ];
}
