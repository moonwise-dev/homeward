import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'savings_plan_view.dart';

final savingsPlanItem = catalogItemFor(const SavingsPlan(), (_, _, props, _) {
  final plan = jsonModelOf(props.value('plan'), SavingsPlanSlice.fromJson);
  return plan == null ? const SizedBox.shrink() : SavingsPlanView(plan: plan);
});
