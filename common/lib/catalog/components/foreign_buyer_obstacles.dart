import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/funchal_example.dart';

final class ForeignBuyerObstacles extends CatalogComponent {
  const ForeignBuyerObstacles();

  @override
  String get name => 'ForeignBuyerObstacles';

  @override
  String get description =>
      'What stands between this buyer and the deed, grouped by whether it '
      'blocks the purchase, costs effort, or only corrects an expectation, '
      'each with what to do about it and how long it takes, and the deadline '
      'of any tax a refund depends on.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  CatalogPart get part => CatalogPart.deal;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'market': CatalogSchemas.market,
    'profile': CatalogSchemas.profile,
    'explain': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['market', 'profile'];

  @override
  List<String> get boundProperties => ['market', 'profile'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Funchal non-resident',
      componentsJson: _componentsJson,
      dataModel: funchalDataModel,
    ),
  ];
}

const _componentsJson = '''
[
  {
    "id": "root",
    "component": "ForeignBuyerObstacles",
    "market": { "path": "/market" },
    "profile": { "path": "/profile" },
    "explain": { "event": { "name": "explain", "context": { "topic": "obstacles" } } }
  }
]
''';
