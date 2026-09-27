import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/week_example.dart';

final class WeeklyTravel extends CatalogComponent {
  const WeeklyTravel();

  @override
  String get name => 'WeeklyTravel';

  @override
  CatalogFamily get family => CatalogFamily.placeAndTravel;

  @override
  String get description =>
      "The buyer's week from one starting point, from measure_week: each "
      'place, how often and how they go, the measured minutes, and the '
      "week's total.";

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'week': CatalogSchemas.bound(
      'One starting point measure_week measured, { "path": "/week/<from>" }.',
    ),
  };

  @override
  List<String> get requiredProperties => ['week'];

  @override
  List<String> get boundProperties => ['week'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A week from a flat in Nacka',
      componentsJson: '''
[
  { "id": "root", "component": "WeeklyTravel", "week": { "path": "/week/sto-12" } }
]
''',
      dataModel: stockholmWeekDataModel,
    ),
  ];
}
