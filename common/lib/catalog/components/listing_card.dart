import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/case_example.dart';

final class ListingCard extends CatalogComponent {
  const ListingCard();

  @override
  String get name => 'ListingCard';

  @override
  String get description =>
      'One sample home in full: photos to swipe through, price, size, rooms, '
      "and floor, the price per square metre against its area's median with "
      'the source, what fits and what misses, and a button to choose it. '
      'Labelled as a sample listing. Bind homes to /assessment/candidates and '
      'name the home by id. choose is sent with candidateId added.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'homes': CatalogSchemas.slice(
      '/assessment/candidates',
      'Always { "path": "/assessment/candidates" }.',
    ),
    'home': Schema.string(
      description: 'The id of the home to show, from the assessment.',
    ),
    'choose': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['homes', 'home'];

  @override
  List<String> get boundProperties => ['homes'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A sample home in Vasastan',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "ListingCard",
    "homes": { "path": "/assessment/candidates" },
    "home": "c1",
    "choose": { "event": { "name": "choose_home", "context": {} } }
  }
]
''',
      dataModel: sampleHomesDataModel,
    ),
  ];
}
