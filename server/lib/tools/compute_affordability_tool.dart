import 'package:common/common.dart';

import 'agent_tool.dart';

final class ComputeAffordabilityTool extends AgentTool {
  const ComputeAffordabilityTool();

  @override
  String get name => 'compute_affordability';

  @override
  String get description =>
      'Compute affordability for the committed profile and the current '
      'scenario. The result names the binding limit and a headroom category, '
      'or the facts still missing. Figures appear only in components.';

  @override
  Map<String, Object?> get parameters => {'type': 'object', 'properties': {}};

  @override
  bool get preRunnable => true;

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
    return switch (assessAffordability(
      scenario: scenario,
      market: market,
      profile: plan.profile,
    )) {
      IncompleteAffordability(:final missing, :final unconvertedCurrencies) =>
        ToolResult(
          modelResult: {
            'status': 'incomplete',
            'missingFacts': [for (final field in missing) field.name],
            'unconvertedCurrencies': [
              for (final currency in unconvertedCurrencies) currency.code,
            ],
          },
        ),
      final AssessedAffordability assessed => ToolResult(
        modelResult: {
          'status': 'assessed',
          'bindingLimit': assessed.binding?.kind.name,
          'headroom': _headroom(assessed).name,
        },
        seeds: {'derived': _derived(assessed)},
      ),
    };
  }

  Map<String, Object?> _derived(AssessedAffordability assessed) => {
    'affordability': {
      'loan': assessed.loan.toJson(),
      'maxLoan': assessed.maxLoan.toJson(),
      'annualRatePpm': assessed.annualRate.partsPerMillion,
      'binding': {
        'kind': assessed.binding?.kind.name,
        'ruleId': assessed.binding?.ruleId,
      },
      'headroom': _headroom(assessed).name,
      'checks': [
        for (final check in assessed.checks)
          {
            'kind': check.kind.name,
            'ruleId': check.ruleId,
            'maxLoan': check.maxLoan.toJson(),
            'allows': check.allows(assessed.loan),
          },
      ],
    },
    'downPaymentBounds': assessed.downPaymentBounds.toJson(),
    'payment': {
      'interest': assessed.payment.interest.toJson(),
      'amortization': assessed.payment.amortization.toJson(),
      'total': assessed.payment.total.toJson(),
      'afterDeduction': assessed.paymentAfterDeduction?.toJson(),
    },
  };

  Headroom _headroom(AssessedAffordability assessed) {
    if (assessed.loan > assessed.maxLoan) {
      return Headroom.overLimit;
    }
    final comfortable = assessed.maxLoan.applyRate(
      const Rate.ppm(900000),
      rounding: Rounding.down,
    );
    return assessed.loan <= comfortable
        ? Headroom.comfortable
        : Headroom.atLimit;
  }
}

enum Headroom { comfortable, atLimit, overLimit }
