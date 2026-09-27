import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import '../geo/travel_mode.dart';

part 'week_travel.freezed.dart';
part 'week_travel.g.dart';

@freezed
abstract class WeekTravel with _$WeekTravel {
  const factory WeekTravel({
    required String fromId,
    required String fromName,
    required GeoPoint from,
    required List<Trip> trips,
  }) = _WeekTravel;

  const WeekTravel._();

  factory WeekTravel.fromJson(Map<String, Object?> json) =>
      _$WeekTravelFromJson(json);

  int get weeklyMinutes => trips.fold(
    0,
    (total, trip) => total + (trip.weeklyMinutes ?? 0),
  );

  bool get measuredEveryTrip => trips.every((trip) => trip.minutes != null);
}

@freezed
abstract class Trip with _$Trip {
  const factory Trip({
    required String placeId,
    required String placeName,
    required GeoPoint to,
    required int perWeek,
    required TravelMode mode,
    int? minutes,
    int? meters,
  }) = _Trip;

  const Trip._();

  factory Trip.fromJson(Map<String, Object?> json) => _$TripFromJson(json);

  int? get weeklyMinutes => switch (minutes) {
    final minutes? => minutes * 2 * perWeek,
    null => null,
  };
}
