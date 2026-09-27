import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'loan_balance_chart_view.dart';

final loanBalanceChartItem = catalogItemFor(const LoanBalanceChart(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<AffordabilitySlice>(
    dataContext: itemContext.dataContext,
    value: data['affordability'],
    parse: (value) => jsonModelOf(value, AffordabilitySlice.fromJson),
    builder: (context, slice) => switch (slice?.schedule) {
      final schedule? => LoanBalanceChartView(
        slice: slice!,
        schedule: schedule,
      ),
      null => const SizedBox.shrink(),
    },
  );
});
