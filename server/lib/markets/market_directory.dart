import 'dart:math';

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

  ({ListingInventory city, Listing listing})? home(String named) {
    final words = named.trim().toLowerCase();
    final all = [
      for (final city in _data.cities.values)
        for (final listing in city.listings) (city: city, listing: listing),
    ];
    final byId = all.where((home) => home.listing.id == words).firstOrNull;
    if (byId != null || words.isEmpty) {
      return byId;
    }
    final byWords = [
      for (final home in all)
        if (words.contains(home.listing.name.toLowerCase()) ||
            home.listing.address.toLowerCase().contains(words) ||
            home.listing.title.toLowerCase().contains(words))
          home,
    ];
    if (byWords.length == 1) {
      return byWords.single;
    }
    final telling = _tellingWords(words);
    final shared = {
      for (final home in all)
        home: telling
            .intersection(_tellingWords(_wordsOf(home.listing)))
            .length,
    };
    final most = shared.values.fold(0, max);
    final closest = [
      for (final MapEntry(:key, :value) in shared.entries)
        if (value == most) key,
    ];
    return most > 0 && closest.length == 1 ? closest.single : null;
  }

  static String _wordsOf(Listing listing) => [
    listing.name,
    listing.address,
    listing.title,
    listing.areaName,
  ].join(' ').toLowerCase();

  static Set<String> _tellingWords(String text) => {
    for (final word in text.split(_notLetters))
      if (word.length > 3 && !_commonWords.contains(word)) word,
  };

  static final _notLetters = RegExp(r'[^\p{L}]+', unicode: true);

  static const _commonWords = {
    'flat',
    'house',
    'home',
    'room',
    'rooms',
    'with',
    'that',
    'this',
    'look',
    'like',
    'from',
    'near',
    'above',
    'street',
  };

  Map<String, PricedHome> pricedHomes(
    Iterable<String> ids,
    AffordabilitySlice? household, {
    Set<String> kept = const {},
    bool renting = false,
  }) {
    final profile = household?.profile;
    final market = household == null || profile == null
        ? null
        : resolveFor(MarketId.parse(household.marketId), profile);
    return {
      for (final id in ids)
        if (home(id) case (:final city, :final listing))
          id: PricedHome(
            listing: listing.copyWith(description: ''),
            cost:
                !renting &&
                    market != null &&
                    city.marketId == household!.marketId
                ? homeCostFor(listing, market: market, household: household)
                : null,
            rent: renting ? RentFigure.like(listing) : null,
            kept: kept.contains(id),
          ),
    };
  }

  Map<String, String> get covered => {
    for (final MapEntry(key: id, value: pack) in _packsById.entries)
      id.code: pack.name,
  };

  String? coveredCode(String named) {
    final wanted = named.trim().toLowerCase();
    for (final MapEntry(key: code, value: name) in covered.entries) {
      if (code.toLowerCase() == wanted || name.toLowerCase() == wanted) {
        return code;
      }
    }
    for (final city in cities.values) {
      if ((city.name.toLowerCase() == wanted ||
              city.cityId.toLowerCase() == wanted) &&
          covered.containsKey(city.marketId)) {
        return city.marketId;
      }
    }
    return null;
  }

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
      incomeTax: _data.incomeTax[id.countryCode],
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
