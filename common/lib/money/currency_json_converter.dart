import 'package:json_annotation/json_annotation.dart';

import 'currency.dart';

class CurrencyJsonConverter implements JsonConverter<Currency, String> {
  const CurrencyJsonConverter();

  @override
  Currency fromJson(String json) => Currency.parse(json);

  @override
  String toJson(Currency currency) => currency.code;
}
