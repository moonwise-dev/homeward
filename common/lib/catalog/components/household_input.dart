import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/stockholm_example.dart';

final class HouseholdInput extends CatalogComponent {
  const HouseholdInput();

  @override
  String get name => 'HouseholdInput';

  @override
  String get description =>
      'Asks who lives in the home: how many adults and the age of each child, '
      'with a one-tap answer for no children. Use it for the household fact, '
      'bound to /profile/adults and /profile/childAges.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'label': CatalogSchemas.label,
    'adults': CatalogSchemas.bound(
      'Where the number of adults is written, /profile/adults.',
    ),
    'childAges': CatalogSchemas.bound(
      'Where the list of child ages is written, /profile/childAges.',
    ),
  };

  @override
  List<String> get requiredProperties => ['label', 'adults', 'childAges'];

  @override
  List<String> get boundProperties => ['adults', 'childAges'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A couple without children',
      componentsJson: _componentsJson,
      dataModel: stockholmDataModel,
    ),
    CatalogExample(
      name: 'A family with two children',
      componentsJson: _componentsJson,
      dataModel: {
        ...stockholmDataModel,
        'profile': {
          ...stockholmDataModel['profile']! as Map<String, Object?>,
          'childAges': [4, 7],
        },
      },
    ),
  ];
}

const _componentsJson = '''
[
  {
    "id": "root",
    "component": "HouseholdInput",
    "label": "Who lives in the home?",
    "adults": { "path": "/profile/adults" },
    "childAges": { "path": "/profile/childAges" }
  }
]
''';
