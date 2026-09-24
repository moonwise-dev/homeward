import 'package:freezed_annotation/freezed_annotation.dart';

import 'assessed_candidate.dart';
import 'assessed_row.dart';
import 'map_marker.dart';
import 'map_route.dart';

part 'assessment.freezed.dart';
part 'assessment.g.dart';

@freezed
abstract class Assessment with _$Assessment {
  const factory Assessment({
    @Default([]) List<AssessedCandidate> candidates,
    @Default([]) List<AssessedRow> rows,
    @Default([]) List<MapMarker> markers,
    @Default([]) List<MapRoute> routes,
  }) = _Assessment;

  factory Assessment.fromJson(Map<String, Object?> json) =>
      _$AssessmentFromJson(json);
}
