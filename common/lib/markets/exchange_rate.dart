import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/currency.dart';
import '../money/currency_json_converter.dart';
import '../money/money.dart';
import '../money/rounding.dart';
import '../time/calendar_date.dart';
import '../time/calendar_date_json_converter.dart';
import 'source.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';

part 'exchange_rate.freezed.dart';
part 'exchange_rate.g.dart';

@freezed
abstract class ExchangeRate with _$ExchangeRate {
  const factory ExchangeRate({
    @CurrencyJsonConverter() required Currency from,
    @CurrencyJsonConverter() required Currency to,
    @ExactDecimalJsonConverter() required ExactDecimal rate,
    @CalendarDateJsonConverter() required CalendarDate asOf,
    required Source source,
  }) = _ExchangeRate;

  const ExchangeRate._();

  factory ExchangeRate.fromJson(Map<String, Object?> json) =>
      _$ExchangeRateFromJson(json);

  static const _places = 8;

  Money convert(Money amount, {Rounding rounding = Rounding.halfUp}) {
    if (amount.currency != from) {
      throw ArgumentError.value(
        amount.currency.code,
        'amount',
        'Expected ${from.code}',
      );
    }
    final numerator = rate.scaledBy(_places) * _powerOfTen(to.minorDigits);
    final denominator = _powerOfTen(from.minorDigits) * _powerOfTen(_places);
    final common = _greatestCommonDivisor(numerator, denominator);
    return Money(
      minorUnits: rounding.scale(
        amount.minorUnits,
        numerator ~/ common,
        denominator ~/ common,
      ),
      currency: to,
    );
  }
}

@freezed
abstract class ExchangeRateTable with _$ExchangeRateTable {
  const factory ExchangeRateTable({
    @CurrencyJsonConverter() required Currency base,
    @CalendarDateJsonConverter() required CalendarDate asOf,
    required Map<String, String> rates,
    required Source source,
  }) = _ExchangeRateTable;

  const ExchangeRateTable._();

  factory ExchangeRateTable.fromJson(Map<String, Object?> json) =>
      _$ExchangeRateTableFromJson(json);

  bool holds(Currency currency) =>
      currency == base || rates.containsKey(currency.code);

  ExchangeRate? between(Currency from, Currency to) {
    final perBaseFrom = _perBase(from);
    final perBaseTo = _perBase(to);
    if (perBaseFrom == null || perBaseTo == null) {
      return null;
    }
    final scale = BigInt.from(_powerOfTen(ExchangeRate._places));
    final numerator =
        BigInt.from(perBaseTo.scaledBy(ExchangeRate._places)) * scale;
    final denominator = BigInt.from(
      perBaseFrom.scaledBy(ExchangeRate._places),
    );
    return ExchangeRate(
      from: from,
      to: to,
      rate: ExactDecimal.fromScaled(
        ((numerator + denominator ~/ BigInt.two) ~/ denominator).toInt(),
        ExchangeRate._places,
      ),
      asOf: asOf,
      source: source,
    );
  }

  ExactDecimal? _perBase(Currency currency) => currency == base
      ? ExactDecimal.parse('1')
      : switch (rates[currency.code]) {
          final rate? => ExactDecimal.parse(rate),
          null => null,
        };
}

int _greatestCommonDivisor(int a, int b) =>
    b == 0 ? a : _greatestCommonDivisor(b, a.remainder(b));

int _powerOfTen(int exponent) {
  var value = 1;
  for (var index = 0; index < exponent; index++) {
    value *= 10;
  }
  return value;
}
