import 'package:json_annotation/json_annotation.dart';

import 'country_code.dart';

class CountryCodeJsonConverter implements JsonConverter<CountryCode, String> {
  const CountryCodeJsonConverter();

  @override
  CountryCode fromJson(String json) => CountryCode.parse(json);

  @override
  String toJson(CountryCode country) => country.code;
}
