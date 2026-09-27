import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/homes_example.dart';

final class HomeSwipe extends CatalogComponent {
  const HomeSwipe();

  @override
  String get name => 'HomeSwipe';

  @override
  CatalogFamily get family => CatalogFamily.homes;

  @override
  String get description =>
      'The deck search_homes dealt with deal, one sample home at a time, '
      'that the buyer keeps or passes with a swipe or a tap; after the last '
      'card its done action sends the kept and passed IDs.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'homes': CatalogSchemas.slice(
      '/swipe/homes',
      'Always { "path": "/swipe/homes" }, after search_homes dealt a deck.',
    ),
    'done': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['homes', 'done'];

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
    "done": { "event": { "name": "swiped", "context": {} } }
  }
]
''',
      dataModel: stockholmSwipeDataModel,
    ),
  ];
}
