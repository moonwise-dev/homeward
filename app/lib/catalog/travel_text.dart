import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String durationText(int minutes) => switch ((minutes ~/ 60, minutes % 60)) {
  (0, final rest) => '$rest min',
  (final hours, 0) => '$hours h',
  (final hours, final rest) => '$hours h $rest min',
};

String distanceText(int meters) => meters < 1000
    ? '$meters m'
    : '${NumberFormat('0.#', 'en').format(meters / 1000)} km';

String byText(TravelMode mode) => switch (mode) {
  TravelMode.walk => 'on foot',
  TravelMode.bike => 'by bike',
  TravelMode.car => 'by car',
  TravelMode.transit => 'by public transport',
};

IconData modeIcon(TravelMode mode) => switch (mode) {
  TravelMode.walk => Icons.directions_walk,
  TravelMode.bike => Icons.directions_bike,
  TravelMode.car => Icons.directions_car,
  TravelMode.transit => Icons.directions_transit,
};

String timesAWeekText(int perWeek) => switch (perWeek) {
  1 => 'once a week',
  2 => 'twice a week',
  _ => '$perWeek times a week',
};

String measuredByText(Iterable<TravelMode> modes) {
  final used = modes.toSet();
  return [
    if (used.any((mode) => mode != TravelMode.transit))
      "FOSSGIS's OpenStreetMap routing, without traffic",
    if (used.contains(TravelMode.transit))
      "Transitous's timetables for a weekday morning",
  ].join(' and ');
}
