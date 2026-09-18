import 'dart:convert';

import '../../markets/resolved_market.dart';
import '../../money/currency.dart';
import '../../money/money.dart';
import '../../money/rate.dart';
import '../../plan/scenario.dart';
import '../../profile/buyer_profile.dart';
import '../../profile/country_code.dart';
import '../../profile/employment.dart';
import '../../profile/property_use.dart';
import '../../profile/residency_intent.dart';
import 'funchal_market_json.dart';

final funchalMarket = ResolvedMarket.fromJson(
  jsonDecode(funchalMarketJson) as Map<String, Object?>,
);

final funchalProfile = BuyerProfile(
  citizenship: CountryCode.parse('SE'),
  taxResidence: CountryCode.parse('SE'),
  formerResident: false,
  residencyIntent: ResidencyIntent.becomeResident,
  use: PropertyUse.secondary,
  age: 42,
  employment: Employment.employed,
  netMonthlyIncome: _krona(60000),
  monthlyDebtPayments: _krona(0),
  savings: _krona(1700000),
);

final funchalScenario = Scenario(
  price: _euro(350000),
  downPayment: _euro(105000),
  termYears: 30,
  loanTypeId: 'euribor-6m',
  rateSpread: const Rate.ppm(16000),
);

final funchalDataModel = _jsonShaped({
  'profile': funchalProfile.toJson(),
  'market': funchalMarket.toJson(),
  'scenario': funchalScenario.toJson(),
  'selection': {
    'marketId': 'PT-30',
    'candidates': [
      {
        'marketId': 'PT-30',
        'name': 'Madeira, Portugal',
        'coverage': 'curated',
      },
    ],
  },
});

Money _euro(int units) =>
    Money(minorUnits: units * 100, currency: Currency.parse('EUR'));

Money _krona(int units) =>
    Money(minorUnits: units * 100, currency: Currency.parse('SEK'));

Map<String, Object?> _jsonShaped(Map<String, Object?> json) =>
    jsonDecode(jsonEncode(json)) as Map<String, Object?>;
