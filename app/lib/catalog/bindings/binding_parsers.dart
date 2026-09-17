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

int? integerOf(Object? value) => switch (value) {
  final int number => number,
  final double number when number == number.truncateToDouble() =>
    number.toInt(),
  _ => null,
};

List<int>? integersOf(Object? value) => switch (value) {
  final List<Object?> items
      when items.every((item) => integerOf(item) != null) =>
    [for (final item in items) integerOf(item)!],
  _ => null,
};

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
