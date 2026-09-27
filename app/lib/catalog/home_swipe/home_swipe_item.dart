import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'home_swipe_view.dart';

final homeSwipeItem = catalogItemFor(const HomeSwipe(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<List<PricedHome>>(
    dataContext: itemContext.dataContext,
    value: data['homes'],
    parse: (value) => jsonModelsOf(value, PricedHome.fromJson),
    builder: (context, homes) => homes == null || homes.isEmpty
        ? const SizedBox.shrink()
        : HomeSwipeView(
            homes: homes,
            onDone: data['done'] == null
                ? null
                : (verdict) => dispatchAction(
                    itemContext,
                    data['done'],
                    adding: {
                      'kept': verdict.kept,
                      'passed': verdict.passed,
                      'label': verdict.kept.isEmpty
                          ? 'Passed on all ${homes.length}'
                          : 'Kept ${verdict.kept.length} of ${homes.length}',
                    },
                  ),
          ),
  );
});
