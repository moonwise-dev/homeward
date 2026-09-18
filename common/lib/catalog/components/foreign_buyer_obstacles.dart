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
      'What stands between this buyer and the keys beyond the money: the '
      'steps a foreign buyer owes, what each one takes, and the deadlines on '
      'any tax the buyer can claim back. Grouped by how much they block.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'market': CatalogSchemas.market,
    'profile': CatalogSchemas.profile,
    'scenario': CatalogSchemas.scenario,
    'explain': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['market', 'profile'];

  @override
  List<String> get boundProperties => ['market', 'profile', 'scenario'];

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
    "scenario": { "path": "/scenario" },
    "explain": {
      "event": { "name": "explain", "context": { "topic": "obstacles" } }
    }
  }
]
''';
