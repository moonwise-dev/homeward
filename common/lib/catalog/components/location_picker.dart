import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_example.dart';

final class LocationPicker extends CatalogComponent {
  const LocationPicker();

  @override
  String get name => 'LocationPicker';

  @override
  String get description =>
      'Chooses a market or a country and writes its ISO 3166 code. Use mode '
      'market for where the buyer is buying, with the select_market action; '
      'use mode country for citizenship and tax residence.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'label': CatalogSchemas.label,
    'value': CatalogSchemas.bound(
      'Where the ISO 3166 code is written, such as /profile/taxResidence.',
    ),
    'mode': Schema.string(enumValues: ['market', 'country']),
    'action': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['label', 'value', 'mode'];

  @override
  List<String> get boundProperties => ['value'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Target market',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "LocationPicker",
    "label": "Where are you buying?",
    "value": { "path": "/selection/marketId" },
    "mode": "market",
    "action": {
      "event": {
        "name": "select_market",
        "context": { "marketId": { "path": "/selection/marketId" } }
      }
    }
  }
]
''',
      dataModel: stockholmDataModel,
    ),
    CatalogExample(
      name: 'Tax residence',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "LocationPicker",
    "label": "Where do you pay tax?",
    "value": { "path": "/profile/taxResidence" },
    "mode": "country"
  }
]
''',
      dataModel: stockholmDataModel,
    ),
  ];
}
