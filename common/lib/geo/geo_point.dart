import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_point.freezed.dart';
part 'geo_point.g.dart';

@freezed
abstract class GeoPoint with _$GeoPoint {
  const factory GeoPoint({required double lat, required double lng}) =
      _GeoPoint;

  const GeoPoint._();

  factory GeoPoint.fromJson(Map<String, Object?> json) =>
      _$GeoPointFromJson(json);

  static const _earthRadiusMeters = 6371000.0;

  int metersTo(GeoPoint other) {
    final dLat = _radians(other.lat - lat);
    final dLng = _radians(other.lng - lng);
    final a =
        pow(sin(dLat / 2), 2) +
        cos(_radians(lat)) * cos(_radians(other.lat)) * pow(sin(dLng / 2), 2);
    return (2 * _earthRadiusMeters * asin(sqrt(a))).round();
  }

  static double _radians(double degrees) => degrees * pi / 180;
}
