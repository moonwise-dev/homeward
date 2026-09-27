import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'route_summary_view.dart';

final routeSummaryItem = catalogItemFor(const RouteSummary(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<Trip>(
    dataContext: itemContext.dataContext,
    value: data['trip'],
    parse: (value) => jsonModelOf(value, Trip.fromJson),
    builder: (context, trip) =>
        trip == null ? const SizedBox.shrink() : RouteSummaryView(trip: trip),
  );
});
