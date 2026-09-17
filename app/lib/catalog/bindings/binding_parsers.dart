import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

T? jsonModelOf<T>(
  Object? value,
  T Function(Map<String, Object?> json) fromJson,
) {
  if (value is! Map<String, Object?>) {
    return null;
  }
  try {
    return fromJson(value);
  } on CheckedFromJsonException {
    return null;
  }
}

Money? moneyOf(Object? value) => jsonModelOf(value, Money.fromJson);

Currency? currencyOf(Object? value) => _parsed(value, Currency.parse);

LocaleTag? localeOf(Object? value) => _parsed(value, LocaleTag.parse);

T? _parsed<T>(Object? value, T Function(String text) parse) {
  if (value is! String) {
    return null;
  }
  try {
    return parse(value);
  } on FormatException {
    return null;
  }
}
