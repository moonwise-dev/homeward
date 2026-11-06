import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'household_summary_view.dart';

final householdSummaryItem = catalogItemFor(const HouseholdSummary(), (
  _,
  node,
  props,
  _,
) {
  final slice = jsonModelOf(
    props.value('affordability'),
    AffordabilitySlice.fromJson,
  );
  if (slice == null) {
    return const SizedBox.shrink();
  }
  return HouseholdSummaryView(
    slice: slice,
    onConfirm: props.action('confirm') == null
        ? null
        : () => dispatchAction(
            node,
            'confirm',
            adding: const {'label': HouseholdSummaryView.confirmLabel},
          ),
  );
});
