import 'package:common/common.dart';

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

  Map<String, String> get covered => {
    for (final MapEntry(key: id, value: pack) in _packsById.entries)
      id.code: pack.name,
  };

  MarketRulePack? packFor(MarketId id) => switch (_packsById[id]) {
    null => null,
    _ => _resolved[id] ??= resolvePackChain(id, _packsById),
  };

  ResolvedMarket? resolveFor(
    MarketId id,
    BuyerProfile profile, {
    Set<Currency> currencies = const {},
  }) {
    final pack = packFor(id);
    if (pack == null) {
      return null;
    }
    return resolveForBuyer(
      pack,
      profile,
      referenceRates: _data.rates,
      exchangeRates: _tableFor(pack.currency!, profile, currencies),
      livingCosts: _data.livingCosts[id.countryCode],
      currencies: currencies,
    );
  }

  ExchangeRateTable? _tableFor(
    Currency currency,
    BuyerProfile profile,
    Set<Currency> currencies,
  ) {
    final wanted = {
      for (final other in currencies)
        if (other != currency) other,
      for (final amount in [
        profile.netMonthlyIncome,
        profile.grossMonthlyIncome,
        profile.monthlyDebtPayments,
        profile.savings,
      ].nonNulls)
        if (amount.currency != currency) amount.currency,
    };
    if (wanted.isEmpty) {
      return null;
    }
    return _data.exchangeRates
        .where(
          (table) =>
              table.holds(currency) &&
              wanted.every((other) => table.holds(other)),
        )
        .firstOrNull;
  }
}
