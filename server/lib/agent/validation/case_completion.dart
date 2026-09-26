import 'package:common/common.dart';

import 'component_tree.dart';

List<Map<String, Object?>> caseAnswerCompletion(
  Map<String, Map<String, Object?>> components,
) {
  final inputs = {
    for (final input in components.values)
      input['id']! as String: ?_facetOf(input),
  };
  if (inputs.isEmpty) {
    return const [];
  }
  final completing = <String, Map<String, Object?>>{};
  final confirmed = <CaseFacet>{};
  for (final button in components.values) {
    if (button case {
      'component': 'Button',
      'action': {
        'event': {'name': 'answer'} && final Map<String, Object?> event,
      },
    }) {
      final named = CaseFacet.values
          .where((facet) => facet.name == (event['context'] as Map?)?['facet'])
          .firstOrNull;
      final facet = inputs.values.contains(named)
          ? named!
          : inputs.values.length == 1
          ? inputs.values.single
          : null;
      if (facet == null) {
        continue;
      }
      confirmed.add(facet);
      final complete = switch (event['context']) {
        {'facet': final String named, 'storyPath': final String path} =>
          named == facet.name && path == storySlice.path,
        _ => false,
      };
      if (!complete) {
        completing[button['id']! as String] = {
          ...button,
          'action': {
            'event': {...event, 'context': _context(facet)},
          },
        };
      }
    }
  }
  for (final MapEntry(key: id, value: facet) in inputs.entries) {
    if (confirmed.contains(facet)) {
      continue;
    }
    final button = 'answer-${facet.name}';
    if (id == 'root') {
      final moved = '${facet.name}-input';
      completing
        ..['root'] = {
          'id': 'root',
          'component': 'Column',
          'children': [moved, button],
        }
        ..[moved] = {...components[id]!, 'id': moved};
    } else {
      final holder = {...components, ...completing}.values
          .where((component) => childReferences(component).contains(id))
          .firstOrNull;
      if (holder == null || holder['children'] is! List<Object?>) {
        continue;
      }
      final children = [...holder['children']! as List<Object?>];
      children.insert(children.indexOf(id) + 1, button);
      completing[holder['id']! as String] = {...holder, 'children': children};
    }
    confirmed.add(facet);
    completing
      ..[button] = {
        'id': button,
        'component': 'Button',
        'child': '$button-label',
        'variant': 'primary',
        'action': {
          'event': {
            'name': SurfaceAction.answer.wireName,
            'context': _context(facet),
          },
        },
      }
      ..['$button-label'] = {
        'id': '$button-label',
        'component': 'Text',
        'text': facet == CaseFacet.household ? "That's us" : "That's my week",
      };
  }
  return completing.values.toList();
}

CaseFacet? _facetOf(Map<String, Object?> component) => switch (component) {
  {'component': 'HouseholdInput', 'adults': {'path': final String path}}
      when path.startsWith(storySlice.path) =>
    CaseFacet.household,
  {'component': 'Routine'} => CaseFacet.routine,
  _ => null,
};

Map<String, Object?> _context(CaseFacet facet) => {
  'facet': facet.name,
  'storyPath': storySlice.path,
};
