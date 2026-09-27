import 'dart:convert';

import '../../affordability/affordability_answer.dart';
import '../../affordability/affordability_slice.dart';
import '../../money/currency.dart';
import '../../money/money.dart';
import '../../samples/home_cost_for.dart';
import '../../savings/savings_plan.dart';
import '../../time/calendar_date.dart';
import 'homes_example.dart';
import 'stockholm_example.dart';

final stockholmSavingsPlanDataModel = _dataModel(
  homeAffordability(
    stockholmSampleHomes.first,
    market: stockholmMarket,
    household: (answerAffordability(
      market: stockholmMarket,
      profile: stockholmProfile.copyWith(savings: _sek(250000)),
    ) as AffordabilityAnswered).slice,
  )!,
  _sek(12000),
);

final coveredSavingsPlanDataModel = _dataModel(
  stockholmHousehold,
  _sek(10000),
);

Map<String, Object?> _dataModel(AffordabilitySlice home, Money monthly) => {
  'savingsPlan': jsonDecode(
    jsonEncode(
      planSavings(
        home: home,
        monthlySaving: monthly,
        today: CalendarDate.parse('2026-09-27'),
      )!.toJson(),
    ),
  ),
};

Money _sek(int kronor) =>
    Money(minorUnits: kronor * 100, currency: Currency.parse('SEK'));
