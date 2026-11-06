import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import '../rent_text.dart';
import 'rent_split_view.dart';

final rentSplitItem = catalogItemFor(const RentSplit(), (_, node, props, _) {
  final slice = jsonModelOf(props.value('split'), RentSplitSlice.fromJson);
  if (slice == null) {
    return const SizedBox.shrink();
  }
  return RentSplitView(
    slice: slice,
    onChoose: props.action('choose') == null
        ? null
        : (rule) => dispatchAction(
            node,
            'choose',
            adding: {
              'rule': rule.name,
              'label': 'Split the rent ${splitRuleLabel(rule).toLowerCase()}',
            },
          ),
  );
});
