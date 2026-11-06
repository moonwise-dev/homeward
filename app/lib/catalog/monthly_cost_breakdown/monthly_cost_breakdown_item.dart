import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'monthly_cost_breakdown_view.dart';

final monthlyCostBreakdownItem = catalogItemFor(const MonthlyCostBreakdown(), (
  _,
  _,
  props,
  _,
) {
  final slice = jsonModelOf(
    props.value('affordability'),
    AffordabilitySlice.fromJson,
  );
  return slice == null
      ? const SizedBox.shrink()
      : MonthlyCostBreakdownView(slice: slice);
});
