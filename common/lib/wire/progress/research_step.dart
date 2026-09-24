import 'package:freezed_annotation/freezed_annotation.dart';

import 'research_step_state.dart';

part 'research_step.freezed.dart';
part 'research_step.g.dart';

@freezed
abstract class ResearchStep with _$ResearchStep {
  const factory ResearchStep({
    required String label,
    required ResearchStepState state,
  }) = _ResearchStep;

  factory ResearchStep.fromJson(Map<String, Object?> json) =>
      _$ResearchStepFromJson(json);
}
