import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'savings_plan_view.dart';

final savingsPlanItem = catalogItemFor(const SavingsPlan(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<SavingsPlanSlice>(
    dataContext: itemContext.dataContext,
    value: data['plan'],
    parse: (value) => jsonModelOf(value, SavingsPlanSlice.fromJson),
    builder: (context, plan) =>
        plan == null ? const SizedBox.shrink() : SavingsPlanView(plan: plan),
  );
});
