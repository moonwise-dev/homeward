import 'package:common/common.dart';

import 'generated/subdivision_names.dart';
import 'markets_data.dart';

final class MarketDirectory {
  MarketDirectory(MarketsData data)
    : _data = data,
      _packsById = {
        for (final pack in data.packsByFile.values) pack.id: pack,
      };

  final MarketsData _data;
  final Map<MarketId, MarketRulePack> _packsById;
  final _resolved = <MarketId, MarketRulePack>{};

  Coverage coverageOf(MarketId id) =>
      _packsById.containsKey(id) ? Coverage.curated : Coverage.uncovered;

  bool isKnown(MarketId id) =>
      _packsById.containsKey(id) ||
      subdivisionNames.containsKey(id.code) ||
      countryNames.containsKey(id.code);

  String nameOf(MarketId id) {
    final country = countryNames[id.countryCode.code] ?? id.country.code;
    return _packsById[id]?.name ??
        switch (subdivisionNames[id.code]) {
          final subdivision? => '$subdivision, $country',
          null => country,
        };
  }

  List<MarketId> marketsNamed(String placeName) =>
      _data.places?.marketsNamed(placeName) ?? const [];

  bool hasDistinctRules(MarketId id) =>
      _packsById.containsKey(id) ||
      (_data.places?.distinctRuleRegions.contains(id) ?? false);

  Iterable<String> get curatedMarketNames =>
      _packsById.values.map((pack) => pack.name);

  ResolvedMarket? resolveFor(MarketId id, BuyerProfile profile) {
    if (!_packsById.containsKey(id)) {
      return null;
    }
    final pack = _resolved[id] ??= resolvePackChain(id, _packsById);
    return resolveForBuyer(
      pack,
      profile,
      referenceRates: _data.rates,
      livingCosts: _data.livingCosts[id.countryCode],
    );
  }
}
