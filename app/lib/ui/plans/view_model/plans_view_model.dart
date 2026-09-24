import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/plans_repository.dart';
import '../../../domain/models/plan_summary.dart';
import '../../../utils/safe_notifier_state.dart';

part 'plans_view_model.freezed.dart';
part 'plans_view_model.g.dart';

@riverpod
class PlansViewModel extends _$PlansViewModel
    with SafeNotifierState<PlansState, PlansState> {
  @override
  PlansState build() {
    subscribe(
      ref.watch(plansRepositoryProvider).watchPlans(),
      (plans) => setState((current) => current.copyWith(plans: plans)),
    );
    unawaited(refresh());
    return const PlansState(isLoading: true);
  }

  Future<void> refresh() async {
    final plans = ref.read(plansRepositoryProvider);
    setState((current) => current.copyWith(isLoading: true));
    try {
      await plans.refresh();
    } on Object catch (error, stackTrace) {
      logError(error, stackTrace);
      showErrorMessage(error: error);
    } finally {
      setState((current) => current.copyWith(isLoading: false));
    }
  }

  Future<PlanSummary?> create() async {
    final plans = ref.read(plansRepositoryProvider);
    setState((current) => current.copyWith(isCreating: true));
    try {
      return await plans.create();
    } on Object catch (error, stackTrace) {
      logError(error, stackTrace);
      showErrorMessage(error: error);
      return null;
    } finally {
      setState((current) => current.copyWith(isCreating: false));
    }
  }
}

@freezed
abstract class PlansState with _$PlansState {
  const factory PlansState({
    @Default([]) List<PlanSummary> plans,
    @Default(false) bool isCreating,
    @Default(false) bool isLoading,
  }) = _PlansState;
}
