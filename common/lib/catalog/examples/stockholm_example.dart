import 'dart:convert';

import '../../markets/resolved_market.dart';
import '../../money/currency.dart';
import '../../money/money.dart';
import '../../money/rate.dart';
import '../../plan/scenario.dart';
import '../../profile/buyer_profile.dart';
import '../../profile/country_code.dart';
import 'stockholm_market_json.dart';

final stockholmMarket = ResolvedMarket.fromJson(
  jsonDecode(stockholmMarketJson) as Map<String, Object?>,
);

final stockholmProfile = BuyerProfile(
  taxResidence: CountryCode.parse('SE'),
  age: 34,
  netMonthlyIncome: _sek(62000),
  grossMonthlyIncome: _sek(85000),
  monthlyDebtPayments: _sek(0),
  savings: _sek(900000),
  borrowers: 2,
  adults: 2,
  childAges: const [],
);

final stockholmLoneProfile = BuyerProfile(
  age: 35,
  netMonthlyIncome: _sek(56950),
  grossMonthlyIncome: _sek(85000),
  monthlyDebtPayments: _sek(0),
  savings: _sek(900000),
  borrowers: 1,
  adults: 1,
  childAges: const [],
);

final stockholmScenario = Scenario(
  price: _sek(4500000),
  downPayment: _sek(450000),
  termYears: 50,
  loanTypeId: 'variable-3m',
  rateSpread: const Rate.ppm(4100),
  associationFee: _sek(3500),
);

Money _sek(int kronor) =>
    Money(minorUnits: kronor * 100, currency: Currency.parse('SEK'));
