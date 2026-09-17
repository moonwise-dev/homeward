import 'dart:convert';

import '../../affordability/affordability.dart';
import '../../affordability/assess_affordability.dart';
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

final stockholmScenario = Scenario(
  price: _sek(4500000),
  downPayment: _sek(450000),
  termYears: 50,
  loanTypeId: 'variable-3m',
  rateSpread: const Rate.ppm(4100),
  associationFee: _sek(3500),
);

final stockholmDataModel = _jsonShaped({
  'profile': stockholmProfile.toJson(),
  'market': stockholmMarket.toJson(),
  'scenario': stockholmScenario.toJson(),
  'derived': {
    'downPaymentBounds': (assessAffordability(
      scenario: stockholmScenario,
      market: stockholmMarket,
      profile: stockholmProfile,
    ) as AssessedAffordability).downPaymentBounds.toJson(),
  },
  'selection': {
    'marketId': 'SE',
    'candidates': [
      {'marketId': 'SE', 'name': 'Sweden', 'coverage': 'curated'},
    ],
  },
});

Money _sek(int kronor) =>
    Money(minorUnits: kronor * 100, currency: Currency.parse('SEK'));

Map<String, Object?> _jsonShaped(Map<String, Object?> json) =>
    jsonDecode(jsonEncode(json)) as Map<String, Object?>;
