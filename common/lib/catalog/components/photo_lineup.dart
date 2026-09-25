import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/case_example.dart';

final class PhotoLineup extends CatalogComponent {
  const PhotoLineup();

  static const lineups = ['/lineup/homes', '/lineup/life'];

  @override
  String get name => 'PhotoLineup';

  @override
  String get description =>
      "Four photos from the buyer's city, of homes or of ways to live there, "
      'curated with the traits each stands for. The buyer taps the one that '
      'feels like theirs, and the server reads its traits. Bind photos to a '
      'lineup the turn context lists. The app adds facet photo, the photo id '
      'as value, and its caption as label to the pick action.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'photos': Schema.object(
      description:
          'Always one of the lineups, such as { "path": "/lineup/homes" }.',
      properties: {'path': Schema.string(enumValues: lineups)},
      required: ['path'],
      additionalProperties: false,
    ),
    'pick': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['photos', 'pick'];

  @override
  List<String> get boundProperties => ['photos'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Which feels like home in Stockholm',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "PhotoLineup",
    "photos": { "path": "/lineup/homes" },
    "pick": { "event": { "name": "answer", "context": {} } }
  }
]
''',
      dataModel: caseLineupDataModel,
    ),
  ];
}
