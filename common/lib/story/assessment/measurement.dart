import 'package:freezed_annotation/freezed_annotation.dart';

import '../../geo/geo_point.dart';
import '../travel_mode.dart';

part 'measurement.freezed.dart';

@freezed
sealed class Measurement with _$Measurement {
  const factory Measurement.route({
    required TravelMode mode,
    required int minutes,
    required int meters,
    @Default([]) List<GeoPoint> path,
  }) = RouteMeasurement;

  const factory Measurement.nearest({
    required int meters,
    String? name,
    GeoPoint? point,
  }) = NearestMeasurement;

  const factory Measurement.count({required int count}) = CountMeasurement;

  const factory Measurement.none() = NoMeasurement;

  const factory Measurement.unavailable() = UnavailableMeasurement;
}
