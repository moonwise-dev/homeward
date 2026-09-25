import 'package:freezed_annotation/freezed_annotation.dart';

import 'criterion_kind.dart';

part 'story_segment.freezed.dart';
part 'story_segment.g.dart';

enum StorySegmentType { text, mode, maxMinutes, criterion, place }

@freezed
abstract class StorySegment with _$StorySegment {
  const factory StorySegment({
    required StorySegmentType type,
    String? text,
    CriterionKind? kind,
    String? id,
    String? label,
    @Default(false) bool assumed,
  }) = _StorySegment;

  factory StorySegment.fromJson(Map<String, Object?> json) =>
      _$StorySegmentFromJson(json);
}
