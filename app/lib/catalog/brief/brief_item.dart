import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import '../fact/fact_answer.dart';
import 'brief_view.dart';

final briefItem = catalogItemFor(const Brief(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final answer = data['answer'];
  return BoundParsed<List<BriefItem>>(
    dataContext: itemContext.dataContext,
    value: data['brief'],
    parse: _itemsOf,
    builder: (context, items) => items == null
        ? const SizedBox.shrink()
        : BriefView(
            items: items,
            kinds: switch (data['kinds']) {
              final List<Object?> names => [
                for (final name in names)
                  ?BriefKind.values
                      .where((kind) => kind.name == name)
                      .firstOrNull,
              ],
              _ => null,
            },
            title: data['title'] as String?,
            onAnswer: answer == null
                ? null
                : (item, right) => dispatchAction(
                    itemContext,
                    answer,
                    adding: factAnswer(item, right),
                  ),
          ),
  );
});

List<BriefItem>? _itemsOf(Object? value) => switch (value) {
  final Map<String, Object?> items => [
    for (final item in items.values) ?jsonModelOf(item, BriefItem.fromJson),
  ],
  _ => null,
};
