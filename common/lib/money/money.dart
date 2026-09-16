import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency.dart';
import 'currency_json_converter.dart';
import 'rate.dart';
import 'rounding.dart';

part 'money.freezed.dart';
part 'money.g.dart';

@freezed
abstract class Money with _$Money {
  const factory Money({
    required int minorUnits,
    @CurrencyJsonConverter() required Currency currency,
  }) = _Money;

  const Money._();

  factory Money.zero(Currency currency) =>
      Money(minorUnits: 0, currency: currency);

  factory Money.fromJson(Map<String, Object?> json) => _$MoneyFromJson(json);

  bool get isZero => minorUnits == 0;

  bool get isNegative => minorUnits < 0;

  Money operator +(Money other) =>
      copyWith(minorUnits: minorUnits + _unitsOf(other));

  Money operator -(Money other) =>
      copyWith(minorUnits: minorUnits - _unitsOf(other));

  Money operator -() => copyWith(minorUnits: -minorUnits);

  Money operator *(int factor) => copyWith(minorUnits: minorUnits * factor);

  bool operator <(Money other) => minorUnits < _unitsOf(other);

  bool operator <=(Money other) => minorUnits <= _unitsOf(other);

  bool operator >(Money other) => minorUnits > _unitsOf(other);

  bool operator >=(Money other) => minorUnits >= _unitsOf(other);

  int compareTo(Money other) => minorUnits.compareTo(_unitsOf(other));

  Money applyRate(Rate rate, {required Rounding rounding}) => copyWith(
    minorUnits: rounding.scale(
      minorUnits,
      rate.partsPerMillion,
      Rate.hundredPercent.partsPerMillion,
    ),
  );

  int _unitsOf(Money other) {
    if (other.currency != currency) {
      throw ArgumentError.value(
        other.currency.code,
        'other',
        'Expected ${currency.code}',
      );
    }
    return other.minorUnits;
  }
}
