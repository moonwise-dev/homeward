import 'dart:convert';

import '../../affordability/affordability_answer.dart';
import 'stockholm_example.dart';

final affordabilityDataModel = {
  'affordability': jsonDecode(
    jsonEncode(
      (answerAffordability(
        market: stockholmMarket,
        profile: stockholmProfile,
      ) as AffordabilityAnswered).slice.toJson(),
    ),
  ),
};
