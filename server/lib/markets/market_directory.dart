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

  Map<String, ListingInventory> get cities => _data.cities;

  ({ListingInventory city, Listing listing})? home(String id) {
    for (final city in _data.cities.values) {
      for (final listing in city.listings) {
        if (listing.id == id) {
          return (city: city, listing: listing);
        }
      }
    }
    return null;
  }

  Map<String, PricedHome> pricedHomes(
    Iterable<String> ids,
    AffordabilitySlice? household,
  ) {
    final profile = household?.profile;
    final market = household == null || profile == null
        ? null
        : resolveFor(MarketId.parse(household.marketId), profile);
    return {
      for (final id in ids)
        if (home(id) case (:final city, :final listing))
          id: PricedHome(
            listing: listing.copyWith(description: ''),
            cost: market != null && city.marketId == household!.marketId
                ? homeCostFor(listing, market: market, household: household)
                : null,
          ),
    };
  }

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
