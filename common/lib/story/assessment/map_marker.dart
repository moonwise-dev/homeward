import 'package:freezed_annotation/freezed_annotation.dart';

import 'map_marker_kind.dart';

part 'map_marker.freezed.dart';
part 'map_marker.g.dart';

@freezed
abstract class MapMarker with _$MapMarker {
  const factory MapMarker({
    required String id,
    required String label,
    required MapMarkerKind kind,
    required double lat,
    required double lng,
    String? category,
    String? candidateId,
  }) = _MapMarker;

  factory MapMarker.fromJson(Map<String, Object?> json) =>
      _$MapMarkerFromJson(json);
}
