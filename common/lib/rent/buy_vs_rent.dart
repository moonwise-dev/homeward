import 'package:freezed_annotation/freezed_annotation.dart';

import '../affordability/affordability_slice.dart';
import '../affordability/loan_months.dart';
import '../finance/monthly_amount.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../money/ppm_json_converter.dart';
import '../money/rate.dart';
import 'rent_figure.dart';

part 'buy_vs_rent.freezed.dart';
part 'buy_vs_rent.g.dart';

const buyVsRentYears = 30;

const assumedStayYears = 10;

@freezed
abstract class BuyRentYear with _$BuyRentYear {
  const factory BuyRentYear({
    required int year,
    required Money buying,
    required Money renting,
    required Money equity,
  }) = _BuyRentYear;

  factory BuyRentYear.fromJson(Map<String, Object?> json) =>
      _$BuyRentYearFromJson(json);
}

@freezed
abstract class BuyVsRentSlice with _$BuyVsRentSlice {
  const factory BuyVsRentSlice({
    required String marketName,
    @Default(true) bool sample,
    String? homeId,
    String? homeName,
    required Money price,
    required Money downPayment,
    required Money loan,
    @JsonKey(name: 'annualRatePpm')
    @PpmJsonConverter()
    required Rate annualRate,
    required String loanType,
    required Money purchaseCosts,
    Money? fee,
    required bool deducts,
    required RentFigure rent,
    required int years,
    @Default(false) bool yearsAssumed,
    required List<BuyRentYear> points,
    int? breakEvenYear,
  }) = _BuyVsRentSlice;

  const BuyVsRentSlice._();

  factory BuyVsRentSlice.fromJson(Map<String, Object?> json) =>
      _$BuyVsRentSliceFromJson(json);

  BuyRentYear at(int year) => points.firstWhere(
    (point) => point.year == year,
    orElse: () => points.last,
  );
}

BuyVsRentSlice compareBuyAndRent({
  required AffordabilitySlice home,
  required ResolvedMarket market,
  required RentFigure rent,
  int? years,
}) {
  final zero = Money.zero(home.price.currency);
  var buying = home.purchaseCostsTotal ?? zero;
  var renting = zero;
  final points = [
    BuyRentYear(
      year: 0,
      buying: buying,
      renting: renting,
      equity: home.downPayment,
    ),
  ];
  for (final month in loanMonths(
    home: home,
    market: market,
  ).take(buyVsRentYears * monthsPerYear)) {
    buying += month.interest - month.deduction + (home.monthly.fee ?? zero);
    renting += rent.monthly;
    if (month.month % monthsPerYear == 0) {
      points.add(
        BuyRentYear(
          year: month.month ~/ monthsPerYear,
          buying: buying,
          renting: renting,
          equity: home.price - month.balance,
        ),
      );
    }
  }
  return BuyVsRentSlice(
    marketName: home.marketName,
    homeId: home.homeId,
    homeName: home.homeName,
    price: home.price,
    downPayment: home.downPayment,
    loan: home.loan,
    annualRate: home.annualRate,
    loanType: home.loanType,
    purchaseCosts: home.purchaseCostsTotal ?? zero,
    fee: home.monthly.fee,
    deducts: home.monthly.afterDeduction != null,
    rent: rent,
    years: (years ?? assumedStayYears).clamp(1, buyVsRentYears),
    yearsAssumed: years == null,
    points: points,
    breakEvenYear: points
        .where((point) => point.year > 0 && point.buying <= point.renting)
        .firstOrNull
        ?.year,
  );
}
