import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'weekly_travel_view.dart';

final weeklyTravelItem = catalogItemFor(const WeeklyTravel(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<WeekTravel>(
    dataContext: itemContext.dataContext,
    value: data['week'],
    parse: (value) => jsonModelOf(value, WeekTravel.fromJson),
    builder: (context, week) =>
        week == null ? const SizedBox.shrink() : WeeklyTravelView(week: week),
  );
});
