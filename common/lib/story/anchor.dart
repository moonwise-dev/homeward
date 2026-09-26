import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import 'travel_mode.dart';

part 'anchor.freezed.dart';
part 'anchor.g.dart';

@freezed
abstract class Anchor with _$Anchor {
  const factory Anchor({
    required String id,
    required String label,
    required String query,
    GeoPoint? point,
    @Default(TravelMode.transit) TravelMode mode,
    @Default(30) int maxMinutes,
    @Default(5) int perWeek,
  }) = _Anchor;

  factory Anchor.fromJson(Map<String, Object?> json) => _$AnchorFromJson(json);
}
