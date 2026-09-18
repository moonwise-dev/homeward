import 'package:common/common.dart';

import 'agent_tool.dart';

final class GetObstaclesTool extends AgentTool {
  const GetObstaclesTool();

  @override
  String get name => 'get_obstacles';

  @override
  Map<String, Object?>? settledArguments(ToolContext context) {
    final id = context.plan.marketId;
    return id != null && context.markets.coverageOf(id) == Coverage.curated
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
    if (market == null) {
      return const ToolResult(
        modelResult: {'status': 'needsCoveredMarket'},
      );
    }
    final missing = market.missingFor(RuleSection.obstacles);
    return ToolResult(
      modelResult: {
        'status': 'found',
        'obstacles': [
          for (final obstacle in market.obstacles)
            {'id': obstacle.id, 'severity': obstacle.severity.name},
        ],
        if (missing.isNotEmpty)
          'missingFacts': [for (final field in missing) field.name],
      },
    );
  }
}
