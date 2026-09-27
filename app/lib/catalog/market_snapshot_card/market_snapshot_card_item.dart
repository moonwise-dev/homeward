import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'market_snapshot_card_view.dart';

final marketSnapshotCardItem = catalogItemFor(const MarketSnapshotCard(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<MarketSnapshot>(
    dataContext: itemContext.dataContext,
    value: data['market'],
    parse: (value) => jsonModelOf(value, MarketSnapshot.fromJson),
    builder: (context, snapshot) => snapshot == null
        ? const SizedBox.shrink()
        : MarketSnapshotCardView(snapshot: snapshot),
  );
});
