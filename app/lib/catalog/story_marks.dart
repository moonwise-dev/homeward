import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../ui/core/themes/colors.dart';

const _homeColors = [AppColors.accent, AppColors.info, AppColors.warning];

Color homeColor(String? candidateId) {
  final index = int.tryParse(candidateId?.replaceFirst('c', '') ?? '');
  return index == null || index < 1
      ? AppColors.text
      : _homeColors[(index - 1) % _homeColors.length];
}

IconData criterionIcon(CriterionKind? kind) => switch (kind) {
  CriterionKind.commute => Icons.route_outlined,
  CriterionKind.schools => Icons.school_outlined,
  CriterionKind.preschool => Icons.child_care_outlined,
  CriterionKind.groceries => Icons.local_grocery_store_outlined,
  CriterionKind.pharmacy => Icons.local_pharmacy_outlined,
  CriterionKind.healthcare => Icons.local_hospital_outlined,
  CriterionKind.gym => Icons.fitness_center,
  CriterionKind.swimming => Icons.pool_outlined,
  CriterionKind.parks => Icons.park_outlined,
  CriterionKind.running => Icons.directions_run,
  CriterionKind.playground => Icons.toys_outlined,
  CriterionKind.water => Icons.water_outlined,
  CriterionKind.restaurants => Icons.restaurant_outlined,
  CriterionKind.cafes => Icons.local_cafe_outlined,
  CriterionKind.nightlife || CriterionKind.quiet => Icons.nightlife_outlined,
  CriterionKind.transit => Icons.directions_transit_outlined,
  CriterionKind.parking => Icons.local_parking_outlined,
  CriterionKind.charging => Icons.ev_station_outlined,
  CriterionKind.noise => Icons.volume_up_outlined,
  null => Icons.place_outlined,
};

CriterionKind? criterionKindNamed(String? idOrName) {
  final name = idOrName?.split('-').first;
  return CriterionKind.values.where((kind) => kind.name == name).firstOrNull;
}

IconData travelModeIcon(TravelMode mode) => switch (mode) {
  TravelMode.walk => Icons.directions_walk,
  TravelMode.bike => Icons.directions_bike,
  TravelMode.car => Icons.directions_car_outlined,
  TravelMode.transit => Icons.directions_transit_outlined,
};
