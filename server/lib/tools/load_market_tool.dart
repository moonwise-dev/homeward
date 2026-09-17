import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../logging/log_entry.dart';
import 'agent_tool.dart';
import 'profile_field_paths.dart';

final _log = Logger('markets');

final class LoadMarketTool extends ModelTool {
  const LoadMarketTool();

  @override
  String get name => 'load_market';

  @override
  String get description =>
      'Load the rules of the selected market for this buyer. The result says '
      'whether the market is covered, which profile facts the form must ask '
      'for and why, and which kinds of lending rule apply. It never states '
      'rule values; components show them.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'marketId': {
        'type': 'string',
        'description': 'The market id from resolve_market, such as PT-30.',
      },
    },
    'required': ['marketId'],
  };

  @override
  Map<String, Object?>? settledArguments(ToolContext context) =>
      switch (context.plan.marketId) {
        final id? => {'marketId': id.code},
        null => null,
      };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final MarketId id;
    try {
      id = MarketId.parse(arguments['marketId'] as String? ?? '');
    } on FormatException {
      return const ToolResult(modelResult: {'error': 'Unknown market id'});
    }
    final markets = context.markets;
    if (!markets.isKnown(id)) {
      return const ToolResult(modelResult: {'error': 'Unknown market id'});
    }
    final market = markets.resolveFor(id, context.plan.profile);
    if (market == null) {
      _log.info(
        LogEntry(
          'Uncovered market asked for',
          fields: {'marketId': id.code},
        ),
      );
      return ToolResult(
        modelResult: {
          'marketId': id.code,
          'name': markets.nameOf(id),
          'coverage': Coverage.uncovered.name,
          'curatedMarkets': markets.curatedMarketNames.toList(),
        },
        seeds: {
          'market': MarketSnapshot(
            id: id,
            name: markets.nameOf(id),
            coverage: Coverage.uncovered,
          ).toJson(),
          'selection': {'candidates': markets.curatedCandidates},
        },
      );
    }
    final lending = market.lending;
    return ToolResult(
      modelResult: {
        'marketId': id.code,
        'name': market.name,
        'coverage': Coverage.curated.name,
        'currency': market.currency.code,
        'profileFields': [
          for (final requirement in market.profileFields)
            _profileField(requirement.field, requirement.reason),
          for (final field in market.requiredFields.difference({
            for (final requirement in market.profileFields) requirement.field,
          }))
            _profileField(field, 'Decides which rules apply'),
        ],
        'lendingRules': [
          if (lending.maxLtv.isNotEmpty) 'loanToValue',
          if (lending.maxLti.isNotEmpty) 'loanToIncome',
          if (lending.maxDsti.isNotEmpty) 'debtServiceToIncome',
          if (lending.stress.isNotEmpty) 'stressTest',
          if (lending.amortization.isNotEmpty) 'amortizationRequirement',
          if (lending.leftToLiveOn.isNotEmpty) 'leftToLiveOn',
          if (lending.interestDeduction.isNotEmpty) 'interestDeduction',
        ],
      },
      seeds: {'market': market.toJson()},
    );
  }

  Map<String, Object?> _profileField(ProfileField field, String reason) => {
    'field': field.name,
    'paths': profileFieldPaths(field),
    'reason': reason,
  };
}
