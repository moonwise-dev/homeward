import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';

final class Questions extends CatalogComponent {
  const Questions();

  static const fieldKinds = ['money', 'number', 'text', 'pick'];

  static const periods = ['once', 'month', 'year'];

  @override
  String get name => 'Questions';

  @override
  CatalogFamily get family => CatalogFamily.understanding;

  @override
  String get description =>
      'A few facts only the buyer knows, asked together: each an amount, a '
      'number, a short text, or a pick from options, with one button that '
      'sends every answer at once.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'title': Schema.string(
      description:
          'What the facts are about, a few words, such as "Your '
          'money".',
    ),
    'fields': Schema.list(
      minItems: 1,
      maxItems: 6,
      description:
          'The facts the step you are on still needs, one field each, never '
          'one you already know; five at most when you can.',
      items: Schema.object(
        properties: {
          'id': Schema.string(
            description:
                'Lowercase words joined by hyphens, such as take-home-pay; '
                'the answer comes back under it.',
          ),
          'label': Schema.string(
            description:
                'The fact to give, a few words to the buyer, such as "What '
                'you take home together".',
          ),
          'kind': Schema.string(
            enumValues: fieldKinds,
            description:
                'money: an amount, with currency and period. number: a count '
                'or an age. text: a few words. pick: one of options.',
          ),
          'currency': Schema.string(
            description:
                'For money. The ISO 4217 code the buyer uses, such as SEK.',
          ),
          'period': Schema.string(
            enumValues: periods,
            description:
                'For money. month for pay, rent, and loan payments; once for '
                'savings and prices.',
          ),
          'options': Schema.list(
            minItems: 2,
            maxItems: 5,
            items: Schema.string(),
            description: 'For pick. What the buyer taps, a few words each.',
          ),
          'hint': Schema.string(
            description:
                'Optional. A short example, or what to enter when there is '
                'none, such as "0 if none".',
          ),
        },
        required: ['id', 'label', 'kind'],
        additionalProperties: false,
      ),
    ),
    'send': Schema.string(
      description: 'The button, a few words, such as "Work it out".',
    ),
    'answer': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['fields', 'answer'];

  @override
  List<String> get boundProperties => const [];

  @override
  List<CatalogExample> get examples => const [
    CatalogExample(
      name: 'The money a loan needs',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "Questions",
    "title": "Your money",
    "fields": [
      {
        "id": "pay-before-tax",
        "label": "What you earn together before tax",
        "kind": "money",
        "currency": "SEK",
        "period": "month"
      },
      {
        "id": "take-home-pay",
        "label": "What you take home together",
        "kind": "money",
        "currency": "SEK",
        "period": "month"
      },
      {
        "id": "savings",
        "label": "What you have saved",
        "kind": "money",
        "currency": "SEK",
        "period": "once"
      },
      {
        "id": "loan-payments",
        "label": "What you pay on other loans",
        "kind": "money",
        "currency": "SEK",
        "period": "month",
        "hint": "0 if none"
      }
    ],
    "send": "Work it out",
    "answer": { "event": { "name": "give_money", "context": {} } }
  }
]
''',
      dataModel: {},
    ),
    CatalogExample(
      name: 'Who is moving',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "Questions",
    "title": "Who is moving",
    "fields": [
      {
        "id": "adults",
        "label": "Adults",
        "kind": "pick",
        "options": ["One", "Two", "Three or more"]
      },
      {
        "id": "children-ages",
        "label": "Children's ages",
        "kind": "text",
        "hint": "Such as 6 and 9, or none"
      },
      {
        "id": "oldest-adult",
        "label": "Age of the oldest adult",
        "kind": "number"
      }
    ],
    "send": "That's us",
    "answer": { "event": { "name": "give_household", "context": {} } }
  }
]
''',
      dataModel: {},
    ),
  ];
}
