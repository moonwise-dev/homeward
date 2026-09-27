import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'monthly_cost_breakdown_view.dart';

final monthlyCostBreakdownItem = catalogItemFor(const MonthlyCostBreakdown(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<AffordabilitySlice>(
    dataContext: itemContext.dataContext,
    value: data['affordability'],
    parse: (value) => jsonModelOf(value, AffordabilitySlice.fromJson),
    builder: (context, slice) => slice == null
        ? const SizedBox.shrink()
        : MonthlyCostBreakdownView(slice: slice),
  );
});
