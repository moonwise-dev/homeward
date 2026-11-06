import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import '../fact/fact_answer.dart';
import 'brief_view.dart';

final briefItem = catalogItemFor(const Brief(), (_, node, props, _) {
  final items = _itemsOf(props.value('brief'));
  if (items == null) {
    return const SizedBox.shrink();
  }
  return BriefView(
    items: items,
    kinds: switch (props.value('kinds')) {
      final List<Object?> names => [
        for (final name in names)
          ?BriefKind.values.where((kind) => kind.name == name).firstOrNull,
      ],
      _ => null,
    },
    title: props.string('title'),
    onAnswer: props.action('answer') == null
        ? null
        : (item, right) =>
              dispatchAction(node, 'answer', adding: factAnswer(item, right)),
  );
});

List<BriefItem>? _itemsOf(Object? value) => switch (value) {
  final Map<String, Object?> items => [
    for (final item in items.values) ?jsonModelOf(item, BriefItem.fromJson),
  ],
  _ => null,
};
