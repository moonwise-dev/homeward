import 'package:json_annotation/json_annotation.dart';

import '../../money/rate.dart';
import 'exact_decimal.dart';

class PercentJsonConverter implements JsonConverter<Rate, String> {
  const PercentJsonConverter();

  static const _placesInPercent = 4;

  @override
  Rate fromJson(String json) {
    if (!json.endsWith('%')) {
      throw FormatException('Expected a percentage such as 7.5%', json);
    }
    return Rate.ppm(
      ExactDecimal.parse(
        json.substring(0, json.length - 1),
      ).scaledBy(_placesInPercent),
    );
  }

  @override
  String toJson(Rate rate) =>
      '${ExactDecimal.fromScaled(rate.partsPerMillion, _placesInPercent).text}%';
}
