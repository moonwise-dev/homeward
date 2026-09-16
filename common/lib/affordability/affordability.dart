import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/monthly_payment.dart';
import '../money/currency.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../profile/profile_field.dart';
import 'constraint_check.dart';
import 'down_payment_bounds.dart';

part 'affordability.freezed.dart';

@freezed
sealed class Affordability with _$Affordability {
  const factory Affordability.incomplete({
    required Set<ProfileField> missing,
    required Set<Currency> unconvertedCurrencies,
  }) = IncompleteAffordability;

  const factory Affordability.assessed({
    required Money loan,
    required Rate annualRate,
    required MonthlyPayment payment,
    Money? paymentAfterDeduction,
    required List<ConstraintCheck> checks,
    ConstraintCheck? binding,
    required Money maxLoan,
    required DownPaymentBounds downPaymentBounds,
  }) = AssessedAffordability;
}
