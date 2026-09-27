import 'dart:convert';

import '../../money/currency.dart';
import '../../money/money.dart';
import '../../rent/buy_vs_rent.dart';
import '../../rent/rent_figure.dart';
import '../../rent/rent_split.dart';
import '../../samples/home_cost_for.dart';
import 'homes_example.dart';
import 'stockholm_example.dart';

final lisbonRentSplitDataModel = {
  'rentSplit': jsonDecode(jsonEncode(_lisbonRentSplit.toJson())),
};

final stockholmBuyVsRentDataModel = {
  'buyVsRent': jsonDecode(
    jsonEncode(
      compareBuyAndRent(
        home: homeAffordability(
          stockholmSampleHomes.first,
          market: stockholmMarket,
          household: stockholmHousehold,
        )!,
        market: stockholmMarket,
        rent: RentFigure.like(stockholmSampleHomes.first),
        years: 7,
      ).toJson(),
    ),
  ),
};

final _rent = RentFigure(
  monthly: _eur(154900),
  stated: false,
  perM2: _eur(1844),
  sizeM2: 84,
  source:
      'INE, Statistics Portugal, median rent of new leases in São Vicente '
      'parish, 12 months to March 2026',
);

final _people = [
  SharingPerson(label: 'You', income: _eur(240000), roomM2: 14),
  SharingPerson(label: 'Your friend', income: _eur(190000), roomM2: 11),
];

final _lisbonRentSplit = RentSplitSlice(
  rent: _rent,
  bills: _eur(16000),
  homeId: 'lis-06',
  homeName: 'Rua da Graça 50, Graça',
  homeM2: 84,
  people: _people,
  splits: splitRent(
    rent: _rent.monthly,
    bills: _eur(16000),
    people: _people,
    homeM2: 84,
  ),
);

Money _eur(int cents) =>
    Money(minorUnits: cents, currency: Currency.parse('EUR'));
