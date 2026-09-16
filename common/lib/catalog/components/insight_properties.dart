import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_schemas.dart';

Map<String, Schema> scenarioInsightProperties() => {
  'scenario': CatalogSchemas.scenario,
  'market': CatalogSchemas.market,
  'profile': CatalogSchemas.profile,
  'explain': CatalogSchemas.action,
};

const scenarioInsightRequired = ['scenario', 'market', 'profile'];

String scenarioInsightExample(String component, String topic) =>
    '''
[
  {
    "id": "root",
    "component": "$component",
    "scenario": { "path": "/scenario" },
    "market": { "path": "/market" },
    "profile": { "path": "/profile" },
    "explain": {
      "event": {
        "name": "explain",
        "context": { "topic": "$topic", "path": "/scenario" }
      }
    }
  }
]
''';
