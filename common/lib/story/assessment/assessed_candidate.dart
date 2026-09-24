import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessed_candidate.freezed.dart';
part 'assessed_candidate.g.dart';

@freezed
abstract class AssessedCandidate with _$AssessedCandidate {
  const factory AssessedCandidate({
    required String id,
    required String label,
    required int rank,
    required int score,
    required bool missesMustHave,
    @Default([]) List<String> pros,
    @Default([]) List<String> cons,
    @Default([]) List<String> close,
  }) = _AssessedCandidate;

  factory AssessedCandidate.fromJson(Map<String, Object?> json) =>
      _$AssessedCandidateFromJson(json);
}
