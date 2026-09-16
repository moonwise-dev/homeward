import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';

part 'monthly_payment.freezed.dart';

@freezed
abstract class MonthlyPayment with _$MonthlyPayment {
  const factory MonthlyPayment({
    required Money interest,
    required Money amortization,
  }) = _MonthlyPayment;

  const MonthlyPayment._();

  Money get total => interest + amortization;
}
