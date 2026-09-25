import 'package:json_schema_builder/json_schema_builder.dart';

import '../../story/criterion_kind.dart';
import '../../story/story_segment.dart';
import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/living_story_example.dart';

final class StoryDraft extends CatalogComponent {
  const StoryDraft();

  @override
  String get name => 'StoryDraft';

  @override
  String get description =>
      "The buyer's story as a short paragraph the buyer corrects in place. "
      'Write two to four sentences in the second person from what the buyer '
      'said, and put a slot where a value belongs: the commute mode, the '
      'longest trip, a thing that matters, or a place they travel to. Mark a '
      'slot assumed when you guessed it. The buyer changes slots on the '
      'device; you never write their values. Bind story to /story.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'story': CatalogSchemas.slice('/story', 'Always { "path": "/story" }.'),
    'segments': Schema.list(
      description:
          'The paragraph in reading order: text between slots, and the slots '
          'themselves.',
      items: Schema.object(
        properties: {
          'type': Schema.string(
            description:
                'text is prose; mode is how they get around; maxMinutes is '
                'the longest trip they accept; criterion is one thing that '
                'matters, named by kind; place is somewhere they travel to.',
            enumValues: [for (final type in StorySegmentType.values) type.name],
          ),
          'text': Schema.string(description: 'The prose, for type text.'),
          'kind': Schema.string(
            description: 'What matters, for type criterion.',
            enumValues: [
              for (final kind in CriterionKind.values)
                if (kind != CriterionKind.commute) kind.name,
            ],
          ),
          'id': Schema.string(
            description:
                'A short id such as work or school, for type place; unique '
                'in the story.',
          ),
          'label': Schema.string(
            description:
                'What the buyer calls the place, such as work, for type place.',
          ),
          'assumed': Schema.boolean(
            description: 'True when you guessed the slot rather than heard it.',
          ),
        },
        required: ['type'],
        additionalProperties: false,
      ),
    ),
  };

  @override
  List<String> get requiredProperties => ['story', 'segments'];

  @override
  List<String> get boundProperties => ['story'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A family moving for studies',
      componentsJson: _componentsJson,
      dataModel: livingStoryDataModel,
    ),
  ];
}

const _componentsJson = '''
[
  {
    "id": "root",
    "component": "StoryDraft",
    "story": { "path": "/story" },
    "segments": [
      { "type": "text", "text": "You're moving to Stockholm to study at " },
      { "type": "place", "id": "study", "label": "KTH" },
      { "type": "text", "text": ", and you have two children who will need schools. You'll probably get around " },
      { "type": "mode", "assumed": true },
      { "type": "text", "text": " and would like to be there in under " },
      { "type": "maxMinutes", "assumed": true },
      { "type": "text", "text": ". Above all, " },
      { "type": "criterion", "kind": "schools" },
      { "type": "text", "text": " matter to you, and " },
      { "type": "criterion", "kind": "parks", "assumed": true },
      { "type": "text", "text": " would be nice. You're weighing a flat on Odengatan against one in Solna." }
    ]
  }
]
''';
