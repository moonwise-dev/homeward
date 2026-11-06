import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'home_comparison_view.dart';

final homeComparisonItem = catalogItemFor(const HomeComparison(), (
  _,
  node,
  props,
  _,
) {
  final homes = [
    for (final home in props.list('homes'))
      ?jsonModelOf(ComponentProps.unwrap(home), PricedHome.fromJson),
  ];
  if (homes.length < 2) {
    return const SizedBox.shrink();
  }
  return HomeComparisonView(
    homes: homes,
    onChoose: props.action('choose') == null
        ? null
        : (home) => dispatchAction(
            node,
            'choose',
            adding: {
              'home': home.listing.id,
              'label': 'Work out ${home.listing.address}',
            },
          ),
  );
});
