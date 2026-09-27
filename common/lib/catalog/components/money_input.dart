import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';

final class MoneyInput extends CatalogComponent {
  const MoneyInput();

  @override
  String get name => 'MoneyInput';

  @override
  String get description =>
      'An amount field that writes { amount, currency, per }, the shape the '
      'money tools take, to the path it binds; a Button beside it sends that '
      'path in its action context. Use it to ask for an income, savings, a '
      'debt, a rent, or a fee.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'label': Schema.string(),
    'value': CatalogSchemas.bound(
      'Where the amount is written, such as { "path": "/answers/income" }.',
    ),
    'currency': Schema.string(
      description: 'The ISO 4217 code the buyer uses, such as SEK or EUR.',
    ),
    'period': Schema.string(enumValues: ['once', 'month', 'year']),
  };

  @override
  List<String> get requiredProperties => ['label', 'value', 'currency'];

  @override
  List<String> get boundProperties => const [];

  @override
  List<CatalogExample> get examples => const [
    CatalogExample(
      name: 'Take-home pay',
      componentsJson: '''
[
  {
    "id": "income",
    "component": "MoneyInput",
    "label": "What you take home together",
    "value": { "path": "/answers/income" },
    "currency": "SEK",
    "period": "month"
  },
  { "id": "root", "component": "Column", "children": ["income", "send"] },
  { "id": "send-label", "component": "Text", "text": "Use this" },
  {
    "id": "send",
    "component": "Button",
    "child": "send-label",
    "action": {
      "event": {
        "name": "give_income",
        "context": { "income": { "path": "/answers/income" } }
      }
    }
  }
]
''',
      dataModel: {
        'answers': {
          'income': {'amount': 62000, 'currency': 'SEK', 'per': 'month'},
        },
      },
    ),
  ];
}
