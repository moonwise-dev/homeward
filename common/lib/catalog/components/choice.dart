import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';

final class Choice extends CatalogComponent {
  const Choice();

  @override
  String get name => 'Choice';

  @override
  CatalogFamily get family => CatalogFamily.understanding;

  @override
  String get description =>
      'One decision to ask: its options, the one you recommend first with '
      'why, and a tap that answers at once.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'question': Schema.string(
      description: 'The decision, one short question to the buyer.',
    ),
    'options': Schema.list(
      minItems: 2,
      maxItems: 5,
      items: Schema.object(
        properties: {
          'label': Schema.string(
            description: 'What the buyer taps, a few words.',
          ),
          'detail': Schema.string(
            description: 'Optional. What choosing it means, one short line.',
          ),
        },
        required: ['label'],
        additionalProperties: false,
      ),
    ),
    'recommended': Schema.string(
      description:
          'The label of the option you recommend, shown first. Only when what '
          'you know about this household gives you a reason.',
    ),
    'because': Schema.string(
      description: 'Why you recommend it, one short sentence.',
    ),
    'answer': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['question', 'options', 'answer'];

  @override
  List<String> get boundProperties => const [];

  @override
  List<CatalogExample> get examples => const [
    CatalogExample(
      name: 'Rent first or buy',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "Choice",
    "question": "Would you rather rent first or buy straight away?",
    "options": [
      { "label": "Buy straight away" },
      {
        "label": "Rent first",
        "detail": "Get to know the areas before you commit"
      }
    ],
    "recommended": "Rent first",
    "because": "You have not seen the neighbourhoods yet.",
    "answer": { "event": { "name": "choose_rent_or_buy", "context": {} } }
  }
]
''',
      dataModel: {},
    ),
  ];
}
