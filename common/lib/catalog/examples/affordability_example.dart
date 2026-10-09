import 'dart:convert';

import '../../affordability/affordability_answer.dart';
import '../../affordability/affordability_slice.dart';
import '../../markets/source.dart';
import '../../markets/source_kind.dart';
import '../../profile/profile_assumption.dart';
import '../../time/calendar_date.dart';
import 'funchal_example.dart';
import 'stockholm_example.dart';

final affordabilityDataModel = _dataModel(
  answerAffordability(market: stockholmMarket, profile: stockholmProfile),
);

final monthlyCostDataModel = _dataModel(
  answerAffordability(
    market: stockholmMarket,
    profile: stockholmProfile,
    price: stockholmScenario.price,
    monthlyFee: stockholmScenario.associationFee,
  ),
);

final funchalAffordabilityDataModel = _dataModel(
  answerAffordability(
    market: funchalMarket,
    profile: funchalProfile,
    price: funchalScenario.price,
  ),
);

final assumedAffordabilityDataModel = _dataModel(
  answerAffordability(market: stockholmMarket, profile: stockholmLoneProfile),
  (slice) => slice.copyWith(
    assumed: const {
      ProfileAssumption.adults,
      ProfileAssumption.children,
      ProfileAssumption.age,
      ProfileAssumption.debts,
      ProfileAssumption.takeHomePay,
    },
    takeHomeSource: Source(
      id: 'skatteverket-skattetabell-31-2026',
      publisher: 'Skatteverket',
      title:
          'Skattetabell 31 för månadslön 2026, kolumn 1: preliminary tax '
          "withheld from a month's pay",
      url:
          'https://skatteverket.entryscape.net/rowstore/dataset/'
          '88320397-5c32-4c16-ae79-d36d95b17b95',
      kind: SourceKind.taxAuthority,
      retrievedAt: CalendarDate.parse('2026-10-09'),
    ),
  ),
);

Map<String, Object?> _dataModel(
  AffordabilityAnswer answer, [
  AffordabilitySlice Function(AffordabilitySlice slice)? change,
]) {
  final slice = (answer as AffordabilityAnswered).slice;
  return {
    'affordability': jsonDecode(
      jsonEncode((change?.call(slice) ?? slice).toJson()),
    ),
  };
}
