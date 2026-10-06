import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';

final class PlanOverview extends CatalogComponent {
  const PlanOverview();

  static const stepStates = ['done', 'now', 'next'];

  @override
  String get name => 'PlanOverview';

  @override
  CatalogFamily get family => CatalogFamily.understanding;

  @override
  String get description =>
      "The plan at a glance, first on the plan panel: the household's story "
      'so far in your words, and the steps you are working through for '
      'them, each done with what you found, the one you are on now, or next.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'story': Schema.string(
      description:
          'Where this household stands, one or two sentences to the buyer: '
          'what you understood and what it means for the home and the '
          'money, never a list of their answers. No figures.',
    ),
    'steps': Schema.list(
      minItems: 2,
      maxItems: 6,
      description:
          'The work for this household, in the order you will do it, written '
          'for their story. Exactly one step is now, and a step the buyer '
          'skipped stays next.',
      items: Schema.object(
        properties: {
          'title': Schema.string(
            description: 'A few words, such as "What you can spend".',
          ),
          'state': Schema.string(enumValues: stepStates),
          'note': Schema.string(
            description:
                'One short line with no figures. done: what you found. now: '
                'what you are working out or what you asked for. next: what '
                'it waits on, or leave it out.',
          ),
        },
        required: ['title', 'state'],
        additionalProperties: false,
      ),
    ),
  };

  @override
  List<String> get requiredProperties => ['story', 'steps'];

  @override
  List<String> get boundProperties => const [];

  @override
  List<CatalogExample> get examples => const [
    CatalogExample(
      name: 'A family early in the plan',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "PlanOverview",
    "story": "A family moving to Stockholm for a job at KTH, with two children at school. You want to buy, so the next thing to settle is what the home must have before we look at what you can borrow.",
    "steps": [
      {
        "title": "Your move",
        "state": "done",
        "note": "Two adults and two children, buying, from January"
      },
      {
        "title": "What the home must do",
        "state": "now",
        "note": "Rooms for four and a short trip to KTH and school"
      },
      {
        "title": "What you can spend",
        "state": "next",
        "note": "Needs your pay and savings"
      },
      { "title": "Homes that fit", "state": "next" }
    ]
  }
]
''',
      dataModel: {},
    ),
    CatalogExample(
      name: 'Two friends sharing, further along',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "PlanOverview",
    "story": "You and a friend renting together in Lisbon. Both your weeks are measured from the flat near Beato, and the rent is split by income, so what is left is to compare it with a second flat.",
    "steps": [
      {
        "title": "The two of you",
        "state": "done",
        "note": "Sharing a two-bedroom flat, renting"
      },
      {
        "title": "Both your weeks",
        "state": "done",
        "note": "Measured from the flat to the startup and the hospital"
      },
      {
        "title": "The rent between you",
        "state": "done",
        "note": "Split by income"
      },
      {
        "title": "A second flat to compare",
        "state": "now",
        "note": "Waiting for the one you pick"
      }
    ]
  }
]
''',
      dataModel: {},
    ),
  ];
}
