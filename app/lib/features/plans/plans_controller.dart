import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/plan_summary.dart';
import '../../data/providers/repository_providers.dart';
import '../../riverpod/safe_notifier_state.dart';
import 'plans_state.dart';

part 'plans_controller.g.dart';

@riverpod
class PlansController extends _$PlansController
    with SafeNotifierState<PlansState, PlansState> {
  @override
  PlansState build() {
    subscribe(
      ref.watch(plansRepositoryProvider).watchPlans(),
      (plans) => setState((current) => current.copyWith(plans: plans)),
    );
    return const PlansState();
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
