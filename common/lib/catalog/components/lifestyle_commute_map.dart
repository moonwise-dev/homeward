import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_story_example.dart';

final class LifestyleCommuteMap extends CatalogComponent {
  const LifestyleCommuteMap();

  @override
  String get name => 'LifestyleCommuteMap';

  @override
  String get description =>
      "A map of the buyer's life around the homes they weigh: the places they "
      'travel to, each home, the route from each home to each place with its '
      'minutes, and the nearest place for each criterion. Before homes are '
      'measured, bind markers to /story/markers; after, bind markers to '
      '/assessment/markers and routes to /assessment/routes.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'markers': CatalogSchemas.bound(
      'Markers: /story/markers or /assessment/markers.',
    ),
    'routes': CatalogSchemas.bound('Routes: /assessment/routes.'),
    'pins': CatalogSchemas.bound(
      'Places the buyer dropped: /story/pins. Bind it on the living story.',
    ),
    'focus': Schema.string(
      description:
          'The id of one home, such as c1, to show on its own with its routes '
          'and nearest places.',
    ),
  };

  @override
  List<String> get requiredProperties => ['markers'];

  @override
  List<String> get boundProperties => ['markers', 'routes', 'pins'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Two flats and the campus',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "LifestyleCommuteMap",
    "markers": { "path": "/assessment/markers" },
    "routes": { "path": "/assessment/routes" }
  }
]
''',
      dataModel: stockholmStoryDataModel,
    ),
  ];
}
