import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'weekly_travel_view.dart';

final weeklyTravelItem = catalogItemFor(const WeeklyTravel(), (_, _, props, _) {
  final week = jsonModelOf(props.value('week'), WeekTravel.fromJson);
  return week == null ? const SizedBox.shrink() : WeeklyTravelView(week: week);
});
