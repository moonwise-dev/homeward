import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'buy_vs_rent_view.dart';

final buyVsRentItem = catalogItemFor(const BuyVsRent(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<BuyVsRentSlice>(
    dataContext: itemContext.dataContext,
    value: data['comparison'],
    parse: (value) => jsonModelOf(value, BuyVsRentSlice.fromJson),
    builder: (context, slice) =>
        slice == null ? const SizedBox.shrink() : BuyVsRentView(slice: slice),
  );
});
