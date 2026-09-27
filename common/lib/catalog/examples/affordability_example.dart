import 'dart:convert';

import '../../affordability/affordability_answer.dart';
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

Map<String, Object?> _dataModel(AffordabilityAnswer answer) => {
  'affordability': jsonDecode(
    jsonEncode((answer as AffordabilityAnswered).slice.toJson()),
  ),
};
