import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import 'anchor.dart';
import 'candidate.dart';
import 'criterion.dart';
import 'story_reason.dart';
import 'travel_mode.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
abstract class Story with _$Story {
  const factory Story({
    StoryReason? reason,
    String? city,
    GeoPoint? cityPoint,
    TravelMode? mode,
    int? maxMinutes,
    @Default([]) List<Anchor> anchors,
    @Default([]) List<Candidate> candidates,
    @Default([]) List<Criterion> criteria,
    @Default(false) bool committed,
    String? chosenCandidateId,
  }) = _Story;

  const Story._();

  factory Story.fromJson(Map<String, Object?> json) => _$StoryFromJson(json);

  Anchor? anchorWith(String? id) =>
      anchors.where((anchor) => anchor.id == id).firstOrNull;

  Candidate? candidateWith(String? id) =>
      candidates.where((candidate) => candidate.id == id).firstOrNull;

  Candidate? get chosen => candidateWith(chosenCandidateId);
}
