import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';

part 'routine_place.freezed.dart';
part 'routine_place.g.dart';

@freezed
abstract class RoutinePlace with _$RoutinePlace {
  const factory RoutinePlace({
    required String id,
    required String label,
    @Default(1) int perWeek,
    GeoPoint? pin,
  }) = _RoutinePlace;

  factory RoutinePlace.fromJson(Map<String, Object?> json) =>
      _$RoutinePlaceFromJson(json);
}
