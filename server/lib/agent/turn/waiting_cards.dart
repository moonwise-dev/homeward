import 'package:common/common.dart';

import '../../tools/draw.dart';

const showCardAction = 'show_card';

const _homeCard = 'HomeCard';
const _homesAtOnce = 3;

List<Map<String, Object?>> waitingCardButtons(
  Map<String, Map<String, Object?>> handed,
  Iterable<String> shown,
) {
  final waiting = [
    for (final MapEntry(key: id, value: body) in handed.entries)
      if (!shown.contains(id)) (id: id, type: '${body['component']}'),
  ];
  final homes = [
    for (final card in waiting)
      if (card.type == _homeCard) card.id,
  ];
  final offered = [
    if (homes.isNotEmpty)
      (
        id: 'homes',
        label: 'More homes',
        opens: {'cards': homes.take(_homesAtOnce).toList()},
      ),
    for (final MapEntry(key: type, value: label) in planSectionHeadings.entries)
      if (type != _homeCard)
        if (waiting.where((card) => card.type == type).toList() case [
          final card,
        ])
          (id: card.id, label: label, opens: {'card': card.id}),
  ];
  if (offered.isEmpty) {
    return const [];
  }
  return [
    block(planMoreId, 'Column', {
      'children': ['$planMoreId-title', '$planMoreId-cards'],
    }),
    block('$planMoreId-title', 'Text', {
      'text': 'Also worked out for you',
      'variant': 'caption',
    }),
    block('$planMoreId-cards', 'Row', {
      'children': [for (final card in offered) '$planMoreId-${card.id}'],
    }),
    for (final card in offered) ...[
      block('$planMoreId-${card.id}', 'Button', {
        'child': '$planMoreId-${card.id}-label',
        'action': {
          'event': {
            'name': showCardAction,
            'context': {...card.opens, 'label': card.label},
          },
        },
      }),
      block('$planMoreId-${card.id}-label', 'Text', {'text': card.label}),
    ],
  ];
}

List<String> waitingButtonLabels(List<Map<String, Object?>> screen) => [
  for (final component in screen)
    if (component
        case {
          'id': final String id,
          'action': {'event': {'context': {'label': final String label}}},
        }
        when id.startsWith('$planMoreId-'))
      label,
];

List<Map<String, Object?>> withoutWaitingButtons(
  List<Map<String, Object?>> screen,
) => [
  for (final component in screen)
    if (!'${component['id']}'.startsWith(planMoreId))
      switch (component['children']) {
        final List<Object?> children when children.contains(planMoreId) => {
          ...component,
          'children': [
            for (final child in children)
              if (child != planMoreId) child,
          ],
        },
        _ => component,
      },
];
