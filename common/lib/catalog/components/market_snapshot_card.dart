import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_example.dart';
import '../examples/uncovered_example.dart';

final class MarketSnapshotCard extends CatalogComponent {
  const MarketSnapshotCard();

  @override
  String get name => 'MarketSnapshotCard';

  @override
  String get description =>
      'The selected market at a glance for this buyer: its name, whether '
      'Homeward has curated rules there, the kinds of rule that apply, and '
      'the reference rate behind the payment. In an uncovered market it says '
      'so and names the markets Homeward covers. Draw it when the market is '
      'new to the buyer.';

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
      name: 'A curated market',
      componentsJson: _componentsJson,
      dataModel: stockholmDataModel,
    ),
    CatalogExample(
      name: 'A market without rules',
      componentsJson: _componentsJson,
      dataModel: uncoveredDataModel,
    ),
  ];
}

const _componentsJson = '''
[
  {
    "id": "root",
    "component": "MarketSnapshotCard",
    "market": { "path": "/market" },
    "profile": { "path": "/profile" },
    "explain": { "event": { "name": "explain", "context": { "topic": "market" } } }
  }
]
''';
