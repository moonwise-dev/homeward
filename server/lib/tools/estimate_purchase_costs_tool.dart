import 'package:common/common.dart';

import 'agent_tool.dart';

final class EstimatePurchaseCostsTool extends AgentTool {
  const EstimatePurchaseCostsTool();

  @override
  String get name => 'estimate_purchase_costs';

  @override
  Map<String, Object?>? settledArguments(ToolContext context) {
    final plan = context.plan;
    final id = plan.marketId;
    final covered =
        id != null && context.markets.coverageOf(id) == Coverage.curated;
    return covered && (plan.scenario ?? plan.scenarioDraft) != null
        ? const {}
        : null;
  }

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final plan = context.plan;
    final market = switch (plan.marketId) {
      final id? => context.markets.resolveFor(id, plan.profile),
      null => null,
    };
    final scenario = plan.scenario ?? plan.scenarioDraft;
    if (market == null || scenario == null) {
      return ToolResult(
        modelResult: {
          'status': market == null ? 'needsCoveredMarket' : 'needsScenario',
        },
      );
    }
    return switch (estimatePurchaseCosts(scenario: scenario, market: market)) {
      IncompletePurchaseCosts(:final missing) => ToolResult(
        modelResult: {
          'status': 'incomplete',
          'missingFacts': [for (final field in missing) field.name],
        },
      ),
      EstimatedPurchaseCosts(:final charges) => ToolResult(
        modelResult: {
          'status': 'estimated',
          'charges': [for (final charge in charges) _charge(charge)],
        },
      ),
    };
  }

  Map<String, Object?> _charge(PurchaseCharge charge) => {
    'ruleId': charge.ruleId,
    'label': charge.label,
    'localTerm': ?charge.localTerm,
    if (charge.refund case final refund?
        when charge.refundable?.isZero == false)
      'refund': {
        'deadline': refund.deadline.iso,
        'claimWindow': refund.claimWindow.iso,
      },
  };
}
