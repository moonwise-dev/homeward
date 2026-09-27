import 'package:freezed_annotation/freezed_annotation.dart';

import '../affordability/affordability_slice.dart';
import '../money/money.dart';
import '../time/calendar_date.dart';
import '../time/calendar_date_json_converter.dart';

part 'savings_plan.freezed.dart';
part 'savings_plan.g.dart';

@freezed
abstract class SavingsPlanSlice with _$SavingsPlanSlice {
  const factory SavingsPlanSlice({
    required String marketName,
    @Default(true) bool sample,
    String? homeId,
    String? homeName,
    required Money price,
    required Money downPayment,
    @Default(false) bool downPaymentChosen,
    required Money cashNeeded,
    @Default(true) bool costsIncluded,
    required Money saved,
    required Money monthlySaving,
    required Money toSave,
    required int months,
    @CalendarDateJsonConverter() required CalendarDate from,
    @CalendarDateJsonConverter() required CalendarDate reachedIn,
  }) = _SavingsPlanSlice;

  const SavingsPlanSlice._();

  factory SavingsPlanSlice.fromJson(Map<String, Object?> json) =>
      _$SavingsPlanSliceFromJson(json);

  bool get covered => months == 0;
}

SavingsPlanSlice? planSavings({
  required AffordabilitySlice home,
  required Money monthlySaving,
  required CalendarDate today,
}) {
  final saved = home.savings;
  if (saved == null || monthlySaving.minorUnits <= 0) {
    return null;
  }
  final minimum = home.whatIf?.steps.first;
  final chosen = home.downPaymentStated || minimum == null;
  final downPayment = chosen ? home.downPayment : minimum.downPayment;
  final cash = chosen ? home.cashNeeded : minimum.cashNeeded;
  final cashNeeded = cash ?? downPayment;
  final toSave = cashNeeded > saved
      ? cashNeeded - saved
      : Money.zero(cashNeeded.currency);
  final months =
      (toSave.minorUnits + monthlySaving.minorUnits - 1) ~/
      monthlySaving.minorUnits;
  return SavingsPlanSlice(
    marketName: home.marketName,
    homeId: home.homeId,
    homeName: home.homeName,
    price: home.price,
    downPayment: downPayment,
    downPaymentChosen: home.downPaymentStated,
    cashNeeded: cashNeeded,
    costsIncluded: cash != null,
    saved: saved,
    monthlySaving: monthlySaving,
    toSave: toSave,
    months: months,
    from: today.monthStartIn(0),
    reachedIn: today.monthStartIn(months),
  );
}
