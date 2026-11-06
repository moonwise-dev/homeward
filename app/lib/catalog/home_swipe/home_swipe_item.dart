import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'home_swipe_view.dart';

final homeSwipeItem = catalogItemFor(const HomeSwipe(), (_, node, props, _) {
  final homes = jsonModelsOf(props.value('homes'), PricedHome.fromJson);
  if (homes == null || homes.isEmpty) {
    return const SizedBox.shrink();
  }
  return HomeSwipeView(
    homes: homes,
    onDone: props.action('done') == null
        ? null
        : (verdict) => dispatchAction(
            node,
            'done',
            adding: {
              'kept': verdict.kept,
              'passed': verdict.passed,
              'label': verdict.kept.isEmpty
                  ? 'Passed on all ${homes.length}'
                  : 'Kept ${verdict.kept.length} of ${homes.length}',
            },
          ),
  );
});
