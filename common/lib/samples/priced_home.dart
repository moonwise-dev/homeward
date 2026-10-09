import 'package:freezed_annotation/freezed_annotation.dart';

import '../affordability/affordability_slice.dart';
import '../money/money.dart';
import '../money/ppm_json_converter.dart';
import '../money/rate.dart';
import '../rent/rent_figure.dart';
import 'listing.dart';

part 'priced_home.freezed.dart';
part 'priced_home.g.dart';

@freezed
abstract class PricedHome with _$PricedHome {
  const factory PricedHome({
    required Listing listing,
    HomeCost? cost,
    RentFigure? rent,
    @Default(false) bool kept,
  }) = _PricedHome;

  factory PricedHome.fromJson(Map<String, Object?> json) =>
      _$PricedHomeFromJson(json);
}

@freezed
abstract class HomeCost with _$HomeCost {
  const factory HomeCost({
    required Money downPayment,
    required Money loan,
    required Money maxLoan,
    Money? cashNeeded,
    Money? savings,
    @JsonKey(name: 'annualRatePpm')
    @PpmJsonConverter()
    required Rate annualRate,
    required String loanType,
    required int termYears,
    required MonthlyFigures monthly,
  }) = _HomeCost;

  const HomeCost._();

  factory HomeCost.fromJson(Map<String, Object?> json) =>
      _$HomeCostFromJson(json);

  factory HomeCost.of(AffordabilitySlice slice) => HomeCost(
    downPayment: slice.downPayment,
    loan: slice.loan,
    maxLoan: slice.maxLoan,
    cashNeeded: slice.cashNeeded,
    savings: slice.savings,
    annualRate: slice.annualRate,
    loanType: slice.loanType,
    termYears: slice.termYears,
    monthly: slice.monthly,
  );

  bool get withinRules => loan <= maxLoan;

  bool? get withinSavings => switch ((cashNeeded, savings)) {
    (final cash?, final saved?) => cash <= saved,
    _ => null,
  };

  Money? get overLimit => withinRules ? null : loan - maxLoan;

  Money? get shortOfSavings => switch ((cashNeeded, savings)) {
    (final cash?, final saved?) when cash > saved => cash - saved,
    _ => null,
  };

  bool get withinReach => overLimit == null && shortOfSavings == null;
}
