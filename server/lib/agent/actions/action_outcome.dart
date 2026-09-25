import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_outcome.freezed.dart';

typedef PlaceToFind = ({String label, String query});

@freezed
abstract class ActionOutcome with _$ActionOutcome {
  const factory ActionOutcome({
    required Plan plan,
    required Map<String, Object?> summary,
    PlaceToFind? placeToFind,
  }) = _ActionOutcome;
}
