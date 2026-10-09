import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'draw.dart';
import 'tool_context.dart';

final class LookUpMarket extends AgentTool {
  const LookUpMarket(this.markets);

  final MarketDirectory markets;

  @override
  String get name => 'look_up_market';

  @override
  String get description =>
      'Describes a city from the sample data before anything is known about '
      "the household: the sample lender's rates, the lending rules that set "
      'the loan, what about the household the other rules wait on, and each '
      "area's median price and rent per square metre, each with its source. "
      'It seeds /markets/<city> for MarketSnapshotCard and answers with the '
      'areas, the kinds of rule, and what the rules wait on.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'city': {
        'type': 'string',
        'enum': [for (final city in markets.cities.values) city.name],
      },
    },
    'required': ['city'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final city = markets.cities.values
        .where((city) => city.name == arguments['city'])
        .firstOrNull;
    if (city == null) {
      return ToolResult(
        modelResult: {
          'error':
              'Not a sample city; the cities: '
              '${[for (final city in markets.cities.values) city.name].join(', ')}',
        },
      );
    }
    final snapshot = marketSnapshot(
      city: city,
      market: markets.resolveFor(
        MarketId.parse(city.marketId),
        const BuyerProfile(),
      )!,
    );
    final earlier = switch (context.slices[marketsSlice.name]) {
      final Map<String, Object?> cities => cities,
      _ => const <String, Object?>{},
    };
    return ToolResult(
      modelResult: {
        'city': city.cityId,
        'areas': [
          for (final area in snapshot.areas)
            {'id': area.areaId, 'name': area.areaName, 'homes': area.homes},
        ],
        'rates': [for (final rate in snapshot.rates) rate.loanTypeId],
        'rules': [
          ...{for (final rule in snapshot.rules) rule.kind.name},
        ],
        'waitingOn': [for (final field in snapshot.waitingOn) field.name],
        shownWhenAloneKey: [
          block('market', 'MarketSnapshotCard', {
            'market': boundTo('/markets/${city.cityId}'),
          }),
        ],
        'note':
            'The city is in /markets/${city.cityId}; never write its '
            'figures in your text. Its card goes on the plan only when '
            'nothing else is there; otherwise it waits under ready, to add '
            'with arrange_plan when they ask about the city, its rates, or '
            'its rules. The rules that wait on the household apply once '
            'compute_affordability knows it: before you ask the buyer for '
            'money facts, call it with what you have.',
      },
      seeds: {
        marketsSlice.name: {
          ...earlier,
          city.cityId: jsonDecode(jsonEncode(snapshot.toJson())),
        },
      },
      logFields: {'city': city.cityId},
    );
  }
}
