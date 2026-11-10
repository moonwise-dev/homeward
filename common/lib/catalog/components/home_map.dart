import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/home_map_example.dart';

final class HomeMap extends CatalogComponent {
  const HomeMap();

  @override
  String get name => 'HomeMap';

  @override
  CatalogFamily get family => CatalogFamily.placeAndTravel;

  @override
  String get description =>
      "The city's sample homes from map_homes on a map, each with what it "
      'costs this household a month, the places of their week, and the homes '
      'left after the budget, the travel limit, and the must-haves the buyer '
      'turned on. map_homes draws it; never draw it yourself.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'map': CatalogSchemas.slice(
      '/map',
      'Always { "@path": "/map" }, after map_homes.',
    ),
  };

  @override
  List<String> get requiredProperties => ['map'];

  @override
  List<String> get boundProperties => ['map'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Homes for a couple working at KTH',
      componentsJson: '''
[
  { "id": "root", "component": "HomeMap", "map": { "@path": "/map" } }
]
''',
      dataModel: stockholmHomeMapDataModel,
    ),
  ];
}
