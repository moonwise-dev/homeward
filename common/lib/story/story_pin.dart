import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_pin.freezed.dart';
part 'story_pin.g.dart';

@freezed
abstract class StoryPin with _$StoryPin {
  const factory StoryPin({
    required String label,
    required double lat,
    required double lng,
  }) = _StoryPin;

  factory StoryPin.fromJson(Map<String, Object?> json) =>
      _$StoryPinFromJson(json);
}
