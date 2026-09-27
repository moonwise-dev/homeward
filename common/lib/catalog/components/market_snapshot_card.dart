import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/market_example.dart';

final class MarketSnapshotCard extends CatalogComponent {
  const MarketSnapshotCard();

  @override
  String get name => 'MarketSnapshotCard';

  @override
  CatalogFamily get family => CatalogFamily.money;

  @override
  String get description =>
      'A city at a glance before anything is known about the household, '
      "from look_up_market: the sample lender's rates, the lending rules, "
      "what the other rules wait on, and each area's median price and rent "
      'per square metre, each with its source.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'market': CatalogSchemas.bound(
      'One city look_up_market described, { "path": "/markets/<city>" }.',
    ),
  };

  @override
  List<String> get requiredProperties => ['market'];

  @override
  List<String> get boundProperties => ['market'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Stockholm',
      componentsJson: '''
[
  { "id": "root", "component": "MarketSnapshotCard", "market": { "path": "/markets/stockholm" } }
]
''',
      dataModel: stockholmMarketSnapshotDataModel,
    ),
  ];
}
