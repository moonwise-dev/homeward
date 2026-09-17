import 'package:common/common.dart';

import 'agent_tool.dart';

final class ResolveMarketTool extends AgentTool {
  const ResolveMarketTool();

  @override
  String get name => 'resolve_market';

  @override
  String get description =>
      'Resolve a place the buyer named to a market Homeward can talk about. '
      'Pass the place as written and your best ISO 3166 codes for it. The '
      'result lists candidate markets with coverage; confirm with a '
      'LocationPicker when there is more than one.';

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
        'description': 'ISO 3166-1 alpha-2 code of the country, such as PT.',
      },
      'subdivisionCode': {
        'type': 'string',
        'description': 'ISO 3166-2 code of the region, such as PT-30.',
      },
    },
    'required': ['placeName'],
  };

  @override
  bool get preRunnable => false;

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
    return ToolResult(
      modelResult: {
        'candidates': candidates,
        'confirmed': candidates.length == 1,
        if (candidates.isEmpty)
          'curatedMarkets': markets.curatedMarketNames.toList(),
      },
      seeds: {
        if (candidates.isNotEmpty)
          'selection': {
            'marketId': candidates.first['marketId'],
            'candidates': candidates,
          },
      },
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
