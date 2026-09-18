import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/plan_summary.dart';

part 'plans_state.freezed.dart';

@freezed
abstract class PlansState with _$PlansState {
  const factory PlansState({
    @Default([]) List<PlanSummary> plans,
    @Default(false) bool isCreating,
    @Default(false) bool isLoading,
  }) = _PlansState;
}
