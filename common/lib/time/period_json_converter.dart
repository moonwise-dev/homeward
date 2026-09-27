import 'package:json_annotation/json_annotation.dart';

import 'period.dart';

class PeriodJsonConverter implements JsonConverter<Period, String> {
  const PeriodJsonConverter();

  @override
  Period fromJson(String json) => Period.parse(json);

  @override
  String toJson(Period period) => period.iso;
}
