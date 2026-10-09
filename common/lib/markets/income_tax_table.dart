import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/currency.dart';
import '../money/currency_json_converter.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import 'source.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';
import 'values/percent_json_converter.dart';

part 'income_tax_table.freezed.dart';
part 'income_tax_table.g.dart';

@freezed
abstract class IncomeTaxTable with _$IncomeTaxTable {
  const factory IncomeTaxTable({
    required String id,
    @CurrencyJsonConverter() required Currency currency,
    required int year,
    required String basis,
    required List<TaxPoint> points,
    required List<TaxBand> above,
    required Source source,
  }) = _IncomeTaxTable;

  const IncomeTaxTable._();

  bool get isReadable => points.length > 1 && above.isNotEmpty;

  factory IncomeTaxTable.fromJson(Map<String, Object?> json) =>
      _$IncomeTaxTableFromJson(json);

  Money takeHome(Money monthlyPay) => monthlyPay - taxOn(monthlyPay);

  Money taxOn(Money monthlyPay) {
    if (monthlyPay.currency != currency || monthlyPay.isNegative) {
      throw ArgumentError.value(
        monthlyPay,
        'monthlyPay',
        'Expected a positive amount in ${currency.code}',
      );
    }
    final last = points.last.monthlyPay.toMoney(currency);
    if (monthlyPay > last) {
      final band = above.firstWhere(
        (band) => switch (band.upTo) {
          final upTo? => monthlyPay <= upTo.toMoney(currency),
          null => true,
        },
        orElse: () => above.last,
      );
      return monthlyPay.applyRate(band.rate, rounding: Rounding.down);
    }
    final upper = points.indexWhere(
      (point) => monthlyPay <= point.monthlyPay.toMoney(currency),
    );
    if (upper <= 0) {
      return points.first.tax.toMoney(currency);
    }
    final from = points[upper - 1];
    final to = points[upper];
    final fromPay = from.monthlyPay.toMoney(currency);
    final fromTax = from.tax.toMoney(currency);
    final span = to.monthlyPay.toMoney(currency) - fromPay;
    final rise = to.tax.toMoney(currency) - fromTax;
    return fromTax.copyWith(
      minorUnits:
          fromTax.minorUnits +
          Rounding.halfUp.scale(
            (monthlyPay - fromPay).minorUnits,
            rise.minorUnits,
            span.minorUnits,
          ),
    );
  }
}

@freezed
abstract class TaxPoint with _$TaxPoint {
  const factory TaxPoint({
    @ExactDecimalJsonConverter() required ExactDecimal monthlyPay,
    @ExactDecimalJsonConverter() required ExactDecimal tax,
  }) = _TaxPoint;

  factory TaxPoint.fromJson(Map<String, Object?> json) =>
      _$TaxPointFromJson(json);
}

@freezed
abstract class TaxBand with _$TaxBand {
  const factory TaxBand({
    @ExactDecimalJsonConverter() ExactDecimal? upTo,
    @PercentJsonConverter() required Rate rate,
  }) = _TaxBand;

  factory TaxBand.fromJson(Map<String, Object?> json) =>
      _$TaxBandFromJson(json);
}
