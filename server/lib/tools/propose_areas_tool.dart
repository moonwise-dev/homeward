import 'package:common/common.dart';

import '../research/open_data/nominatim.dart';
import 'agent_tool.dart';
import 'locate_place.dart';

final class ProposeAreasTool extends ModelTool {
  const ProposeAreasTool(this._nominatim);

  final Nominatim _nominatim;

  static const maxAreas = 3;

  @override
  String get name => 'propose_areas';

  @override
  String get description =>
      'Suggest up to three areas of the buyer\'s city to compare when they '
      'confirmed their story and named no homes. Only real areas of that '
      'city, chosen to suit their story. The story is otherwise left as the '
      'buyer confirmed it, and the server measures the areas.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'areas': {
        'type': 'array',
        'maxItems': maxAreas,
        'items': {
          'type': 'object',
          'properties': {
            'label': {
              'type': 'string',
              'description': 'Short name, such as Alfama or Solna.',
            },
            'query': {
              'type': 'string',
              'description':
                  'What to search on a map, without the city, such as Alfama.',
            },
          },
          'required': ['label', 'query'],
        },
      },
    },
    'required': ['areas'],
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final plan = context.plan;
    final story = plan.story;
    final city = story.city;
    if (city == null) {
      return const ToolResult(
        modelResult: {'error': 'The story has no city yet'},
      );
    }
    if (story.candidates.isNotEmpty) {
      return const ToolResult(
        modelResult: {'error': 'The buyer already named homes to compare'},
      );
    }
    final steps = context.steps;
    final box = (await locatePlace(_nominatim, city, city, null, steps))?.box;
    final items = [
      if (arguments['areas'] case final List<Object?> list)
        for (final item in list)
          if (item is Map<String, Object?>) item,
    ].take(maxAreas);
    final candidates = <Candidate>[];
    for (final (index, item) in items.indexed) {
      final query = item['query'] as String? ?? item['label'] as String? ?? '';
      final label = item['label'] as String? ?? query;
      candidates.add(
        Candidate(
          id: 'c${index + 1}',
          label: label,
          query: query,
          point: (await locatePlace(
            _nominatim,
            query,
            label,
            box,
            steps,
          ))?.point,
        ),
      );
    }
    return ToolResult(
      modelResult: {
        'areas': [
          for (final candidate in candidates)
            {
              'id': candidate.id,
              'label': candidate.label,
              'placed': candidate.point != null,
            },
        ],
      },
      plan: plan.copyWith(story: story.copyWith(candidates: candidates)),
    );
  }
}
