import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
abstract class Place with _$Place {
  const factory Place({
    required String id,
    required String name,
    required String address,
    required GeoPoint point,
  }) = _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}
