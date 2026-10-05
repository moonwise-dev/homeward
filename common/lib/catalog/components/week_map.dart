import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/week_example.dart';

final class WeekMap extends CatalogComponent {
  const WeekMap();

  @override
  String get name => 'WeekMap';

  @override
  CatalogFamily get family => CatalogFamily.placeAndTravel;

  @override
  String get description =>
      'A map on OpenStreetMap of the places find_place found, each a pin '
      "with its name; with routes, one starting point's week from "
      'measure_week on it: the home, each trip drawn along the route it was '
      "measured on with its minutes and how often, and the week's total.";

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'markers': CatalogSchemas.slice(
      '/places',
      'Always { "path": "/places" }, after find_place.',
    ),
    'routes': CatalogSchemas.bound(
      'One starting point measure_week measured, '
      '{ "path": "/week/<from>" }. Leave it out to show the places alone.',
    ),
  };

  @override
  List<String> get requiredProperties => ['markers'];

  @override
  List<String> get boundProperties => ['markers', 'routes'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A week from a flat in Nacka',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "WeekMap",
    "markers": { "path": "/places" },
    "routes": { "path": "/week/sto-12" }
  }
]
''',
      dataModel: stockholmWeekDataModel,
    ),
    CatalogExample(
      name: 'The places before a week is measured',
      componentsJson: '''
[
  { "id": "root", "component": "WeekMap", "markers": { "path": "/places" } }
]
''',
      dataModel: stockholmWeekDataModel,
    ),
  ];
}
