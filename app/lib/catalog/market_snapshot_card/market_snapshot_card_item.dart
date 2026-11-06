import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'market_snapshot_card_view.dart';

final marketSnapshotCardItem = catalogItemFor(const MarketSnapshotCard(), (
  _,
  _,
  props,
  _,
) {
  final snapshot = jsonModelOf(props.value('market'), MarketSnapshot.fromJson);
  return snapshot == null
      ? const SizedBox.shrink()
      : MarketSnapshotCardView(snapshot: snapshot);
});
