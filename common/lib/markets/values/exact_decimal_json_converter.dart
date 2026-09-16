import 'package:json_annotation/json_annotation.dart';

import 'exact_decimal.dart';

class ExactDecimalJsonConverter implements JsonConverter<ExactDecimal, String> {
  const ExactDecimalJsonConverter();

  @override
  ExactDecimal fromJson(String json) => ExactDecimal.parse(json);

  @override
  String toJson(ExactDecimal decimal) => decimal.text;
}
