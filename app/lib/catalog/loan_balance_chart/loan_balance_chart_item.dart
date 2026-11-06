import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'loan_balance_chart_view.dart';

final loanBalanceChartItem = catalogItemFor(const LoanBalanceChart(), (
  _,
  _,
  props,
  _,
) {
  final slice = jsonModelOf(
    props.value('affordability'),
    AffordabilitySlice.fromJson,
  );
  return switch (slice?.schedule) {
    final schedule? => LoanBalanceChartView(slice: slice!, schedule: schedule),
    null => const SizedBox.shrink(),
  };
});
