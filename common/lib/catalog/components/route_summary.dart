import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/week_example.dart';

final class RouteSummary extends CatalogComponent {
  const RouteSummary();

  @override
  String get name => 'RouteSummary';

  @override
  CatalogFamily get family => CatalogFamily.placeAndTravel;

  @override
  String get description =>
      'One trip measure_week measured: where to, how they go, the minutes '
      'and distance, and how often.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'trip': CatalogSchemas.bound(
      'One trip, { "path": "/week/<from>/trips/<n>" }.',
    ),
  };

  @override
  List<String> get requiredProperties => ['trip'];

  @override
  List<String> get boundProperties => ['trip'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'To KTH by public transport',
      componentsJson: '''
[
  { "id": "root", "component": "RouteSummary", "trip": { "path": "/week/sto-12/trips/0" } }
]
''',
      dataModel: stockholmWeekDataModel,
    ),
  ];
}
