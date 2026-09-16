import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/rate_type.dart';
import 'year_range.dart';

part 'loan_predicate.freezed.dart';
part 'loan_predicate.g.dart';

@freezed
abstract class LoanPredicate with _$LoanPredicate {
  const factory LoanPredicate({RateType? rateType, YearRange? termYears}) =
      _LoanPredicate;

  factory LoanPredicate.fromJson(Map<String, Object?> json) =>
      _$LoanPredicateFromJson(json);
}
