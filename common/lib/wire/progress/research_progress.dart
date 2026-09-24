import 'package:freezed_annotation/freezed_annotation.dart';

import 'research_step.dart';

part 'research_progress.freezed.dart';
part 'research_progress.g.dart';

@freezed
abstract class ResearchProgress with _$ResearchProgress {
  const factory ResearchProgress({@Default([]) List<ResearchStep> steps}) =
      _ResearchProgress;

  factory ResearchProgress.fromJson(Map<String, Object?> json) =>
      _$ResearchProgressFromJson(json);

  static const mimeType = 'application/json+homeward-progress';
}
