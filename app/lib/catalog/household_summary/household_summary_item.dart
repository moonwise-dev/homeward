import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'household_summary_view.dart';

final householdSummaryItem = catalogItemFor(const HouseholdSummary(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<AffordabilitySlice>(
    dataContext: itemContext.dataContext,
    value: data['affordability'],
    parse: (value) => jsonModelOf(value, AffordabilitySlice.fromJson),
    builder: (context, slice) => slice == null
        ? const SizedBox.shrink()
        : HouseholdSummaryView(
            slice: slice,
            onConfirm: data['confirm'] == null
                ? null
                : () => dispatchAction(
                    itemContext,
                    data['confirm'],
                    adding: const {'label': HouseholdSummaryView.confirmLabel},
                  ),
          ),
  );
});
