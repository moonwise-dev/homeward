import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'purchase_costs_table_view.dart';

final purchaseCostsTableItem = catalogItemFor(const PurchaseCostsTable(), (
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
      : PurchaseCostsTableView(slice: slice);
});
