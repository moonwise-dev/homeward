import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/case_example.dart';

final class TradeOff extends CatalogComponent {
  const TradeOff();

  @override
  String get name => 'TradeOff';

  @override
  String get description =>
      'Two or three ways to live side by side, as compare_areas priced them: '
      'an area and its character, a home type and size, the estimated price '
      "from the area's price per square metre with its source, and the "
      'minutes to their daily place. The buyer picks one, which sets the area '
      'and a price range. Call compare_areas first and bind options to '
      '/tradeoff/options. The app adds facet area, the option id as value, and '
      'a label to the pick action.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'options': CatalogSchemas.slice(
      '/tradeoff/options',
      'Always { "path": "/tradeoff/options" }.',
    ),
    'pick': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['options', 'pick'];

  @override
  List<String> get boundProperties => ['options'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A garden or the city',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "TradeOff",
    "options": { "path": "/tradeoff/options" },
    "pick": { "event": { "name": "answer", "context": {} } }
  }
]
''',
      dataModel: caseTradeOffDataModel,
    ),
  ];
}
