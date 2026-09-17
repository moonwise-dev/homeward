import 'package:common/common.dart';

import 'agent_tool.dart';

final class ResolveMarketTool extends ModelTool {
  const ResolveMarketTool();

  @override
  String get name => 'resolve_market';

  @override
  String get description =>
      'Resolve a place the buyer named to a market Homeward can talk about. '
      'Pass the place as written and your best ISO 3166 codes for it. When '
      'exactly one market matches, the result names it as selectedMarket and '
      'it is already the market of the plan. When several match, the result '
      'lists candidates with coverage for a LocationPicker in market mode.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'placeName': {
        'type': 'string',
        'description': 'The place as the buyer wrote it, such as Funchal.',
      },
      'countryCode': {
        'type': 'string',
        'description':
            'ISO 3166-1 alpha-2 code of the country the place is in, such as '
            'PT for Funchal or SE for Stockholm.',
      },
      'subdivisionCode': {
        'type': 'string',
        'description': 'ISO 3166-2 code of the region, such as PT-30.',
      },
    },
    'required': ['placeName', 'countryCode'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final markets = context.markets;
    final named = markets.marketsNamed(
      arguments['placeName'] as String? ?? '',
    );
    final proposed = _proposedMarket(arguments, context);
    final ids = {
      ...named,
      if (proposed != null &&
          !named.contains(proposed) &&
          !named.any((id) => id.country == proposed))
        proposed,
    };
    final candidates = [
      for (final id in ids)
        {
          'marketId': id.code,
          'name': markets.nameOf(id),
          'coverage': markets.coverageOf(id).name,
        },
    ];
    final selected = ids.length == 1 ? ids.single : null;
    final plan = context.plan;
    return ToolResult(
      modelResult: switch (candidates) {
        [final market] => {'selectedMarket': market},
        [] => {
          'candidates': candidates,
          'curatedMarkets': markets.curatedMarketNames.toList(),
        },
        _ => {'candidates': candidates},
      },
      seeds: {
        if (candidates.length > 1)
          'selection': {
            'marketId': candidates.first['marketId'],
            'candidates': candidates,
          },
      },
      plan: selected == null || selected == plan.marketId
          ? null
          : plan.copyWith(
              marketId: selected,
              scenario: null,
              scenarioDraft: null,
            ),
    );
  }

  MarketId? _proposedMarket(
    Map<String, Object?> arguments,
    ToolContext context,
  ) {
    final subdivision = _marketId(arguments['subdivisionCode']);
    final country = _marketId(arguments['countryCode']);
    final markets = context.markets;
    return switch ((subdivision, country)) {
      (final region?, _)
          when region.isRegion &&
              markets.isKnown(region) &&
              markets.hasDistinctRules(region) =>
        region,
      (_, final nation?) when !nation.isRegion && markets.isKnown(nation) =>
        nation,
      (final region?, _) when markets.isKnown(region.country) => region.country,
      _ => null,
    };
  }

  MarketId? _marketId(Object? code) {
    if (code is! String) {
      return null;
    }
    try {
      return MarketId.parse(code.trim().toUpperCase());
    } on FormatException {
      return null;
    }
  }
}
