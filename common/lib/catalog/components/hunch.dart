import 'package:json_schema_builder/json_schema_builder.dart';

import '../../story/case_facet.dart';
import '../catalog_component.dart';
import '../catalog_schemas.dart';

final class Hunch extends CatalogComponent {
  const Hunch();

  @override
  String get name => 'Hunch';

  @override
  String get description =>
      'One deduction about the buyer, the clue it came from, and a tap to '
      'confirm or correct it. The first option confirms the hunch; the others '
      'are the likeliest alternatives. The app adds facet, value, and label '
      'to the answer action. Values by facet: place, a map query without the '
      'city; mode, walk, bike, car, or transit; maxMinutes and rooms, a whole '
      'number; homeType, flat or house; outdoor, none, balcony, or garden; '
      'style, classic or modern; criterion, a criterion kind. A place option '
      'with pin true opens the map to drop a pin instead of its value. Bind '
      'story to /story.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'story': CatalogSchemas.slice('/story', 'Always { "path": "/story" }.'),
    'hunch': Schema.string(
      description:
          'The deduction, one sentence in the second person, such as "I would '
          'bet you will cycle, and no more than 20 minutes."',
    ),
    'because': Schema.string(
      description:
          'The clue it came from, a few words, such as "Two children at '
          'school".',
    ),
    'facet': Schema.string(
      description: 'What the answer sets in the story.',
      enumValues: [for (final facet in CaseFacet.hunchFacets) facet.name],
    ),
    'options': Schema.list(
      minItems: 2,
      maxItems: 4,
      items: Schema.object(
        properties: {
          'label': Schema.string(
            description: 'What the buyer taps, a few words.',
          ),
          'value': Schema.string(description: 'The value for the facet.'),
          'pin': Schema.boolean(
            description: 'For place only: open the map to drop a pin.',
          ),
        },
        required: ['label', 'value'],
        additionalProperties: false,
      ),
    ),
    'answer': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => [
    'story',
    'hunch',
    'facet',
    'options',
    'answer',
  ];

  @override
  List<String> get boundProperties => ['story'];

  @override
  List<CatalogExample> get examples => [
    const CatalogExample(
      name: 'How they will get to KTH',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "Hunch",
    "story": { "path": "/story" },
    "hunch": "I'd bet you'll cycle to KTH, and no more than 20 minutes.",
    "because": "Students in Stockholm cycle",
    "facet": "mode",
    "options": [
      { "label": "Spot on, by bike", "value": "bike" },
      { "label": "I'll take the metro", "value": "transit" },
      { "label": "On foot", "value": "walk" },
      { "label": "I drive", "value": "car" }
    ],
    "answer": { "event": { "name": "answer", "context": {} } }
  }
]
''',
      dataModel: {
        'story': {
          'center': {'lat': 59.3293, 'lng': 18.0686},
        },
      },
    ),
  ];
}
