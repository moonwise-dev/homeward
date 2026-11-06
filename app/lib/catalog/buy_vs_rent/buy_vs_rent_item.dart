import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'buy_vs_rent_view.dart';

final buyVsRentItem = catalogItemFor(const BuyVsRent(), (_, _, props, _) {
  final slice = jsonModelOf(props.value('comparison'), BuyVsRentSlice.fromJson);
  return slice == null ? const SizedBox.shrink() : BuyVsRentView(slice: slice);
});
