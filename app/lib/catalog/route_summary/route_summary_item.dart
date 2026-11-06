import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'route_summary_view.dart';

final routeSummaryItem = catalogItemFor(const RouteSummary(), (_, _, props, _) {
  final trip = jsonModelOf(props.value('trip'), Trip.fromJson);
  return trip == null ? const SizedBox.shrink() : RouteSummaryView(trip: trip);
});
