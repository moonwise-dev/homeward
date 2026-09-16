import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/currency.dart';
import '../money/currency_json_converter.dart';
import '../money/money.dart';
import 'source.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';

part 'living_costs.freezed.dart';
part 'living_costs.g.dart';

@freezed
abstract class LivingCosts with _$LivingCosts {
  const factory LivingCosts({
    required String id,
    @CurrencyJsonConverter() required Currency currency,
    required int year,
    required List<IndividualCost> individual,
    required List<HouseholdCost> household,
    required Source source,
  }) = _LivingCosts;

  const LivingCosts._();

  factory LivingCosts.fromJson(Map<String, Object?> json) =>
      _$LivingCostsFromJson(json);

  Money monthlyFor({
    required int adultAge,
    required int adults,
    required List<int> childAges,
  }) {
    if (adults < 1 || childAges.any((age) => age < 0)) {
      throw ArgumentError('A household needs an adult and non-negative ages');
    }
    final ages = [for (var i = 0; i < adults; i++) adultAge, ...childAges];
    final people = ages.length;
    final shared = household.lastWhere(
      (cost) => cost.persons <= people,
      orElse: () =>
          throw ArgumentError.value(people, 'people', 'No household cost'),
    );
    return ages
        .map((age) => _individualFor(age).monthly.toMoney(currency))
        .fold(shared.monthly.toMoney(currency), (total, cost) => total + cost);
  }

  IndividualCost _individualFor(int age) => individual.firstWhere(
    (cost) => age >= cost.ageFrom && (cost.ageTo == null || age <= cost.ageTo!),
    orElse: () => throw ArgumentError.value(age, 'age', 'No individual cost'),
  );
}

@freezed
abstract class IndividualCost with _$IndividualCost {
  const factory IndividualCost({
    required int ageFrom,
    int? ageTo,
    @ExactDecimalJsonConverter() required ExactDecimal monthly,
  }) = _IndividualCost;

  factory IndividualCost.fromJson(Map<String, Object?> json) =>
      _$IndividualCostFromJson(json);
}

@freezed
abstract class HouseholdCost with _$HouseholdCost {
  const factory HouseholdCost({
    required int persons,
    @ExactDecimalJsonConverter() required ExactDecimal monthly,
  }) = _HouseholdCost;

  factory HouseholdCost.fromJson(Map<String, Object?> json) =>
      _$HouseholdCostFromJson(json);
}
