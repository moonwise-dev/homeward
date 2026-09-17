import 'dart:convert';

import '../../costs/purchase_costs.dart';
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
  netMonthlyIncome: _euro(5200),
  monthlyDebtPayments: _euro(0),
  savings: _euro(150000),
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
  'derived': {
    'cashNeeded': (estimatePurchaseCosts(
      scenario: funchalScenario,
      market: funchalMarket,
    ) as EstimatedPurchaseCosts).cashNeeded.toJson(),
  },
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

Map<String, Object?> _jsonShaped(Map<String, Object?> json) =>
    jsonDecode(jsonEncode(json)) as Map<String, Object?>;
