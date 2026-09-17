import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/rate_type.dart';
import '../profile/buyer_profile.dart';
import '../profile/citizenship.dart';
import '../profile/profile_field.dart';
import '../profile/residency.dart';
import 'buyer_predicate.dart';
import 'european_economic_area.dart';
import 'loan_predicate.dart';
import 'market_id.dart';

part 'applicability.freezed.dart';

@freezed
sealed class Applicability with _$Applicability {
  const factory Applicability.applies() = Applies;

  const factory Applicability.doesNotApply() = DoesNotApply;

  const factory Applicability.pending(Set<ProfileField> missing) = Pending;
}

Applicability applicabilityOf(
  BuyerPredicate? predicate, {
  required BuyerProfile profile,
  required MarketId market,
}) {
  if (predicate == null) {
    return const Applicability.applies();
  }
  final conditions = [
    _condition(
      ProfileField.residency,
      predicate.residency,
      _residencyIn(market, profile),
    ),
    _condition(
      ProfileField.formerResident,
      predicate.formerResident,
      profile.formerResident,
    ),
    _condition(
      ProfileField.residencyIntent,
      predicate.residencyIntent,
      profile.residencyIntent,
    ),
    _condition(
      ProfileField.citizenship,
      predicate.citizenship,
      _citizenshipIn(market, profile),
    ),
    _condition(ProfileField.use, predicate.use, profile.use),
    _condition(ProfileField.firstTime, predicate.firstTime, profile.firstTime),
    _condition(
      ProfileField.employment,
      predicate.employment,
      profile.employment,
    ),
    if (predicate.age case final range?)
      (
        field: ProfileField.age,
        matches: switch (profile.age) {
          final age? => range.contains(age),
          null => null,
        },
      ),
  ].nonNulls;
  if (conditions.any((condition) => condition.matches == false)) {
    return const Applicability.doesNotApply();
  }
  final missing = {
    for (final condition in conditions)
      if (condition.matches == null) condition.field,
  };
  return missing.isEmpty
      ? const Applicability.applies()
      : Applicability.pending(missing);
}

bool matchesLoan(
  LoanPredicate? predicate, {
  required RateType rateType,
  required int termYears,
}) =>
    predicate == null ||
    ((predicate.rateTypes?.contains(rateType) ?? true) &&
        (predicate.termYears?.contains(termYears) ?? true));

({ProfileField field, bool? matches})? _condition<T>(
  ProfileField field,
  T? expected,
  T? actual,
) => expected == null
    ? null
    : (field: field, matches: actual == null ? null : actual == expected);

Residency? _residencyIn(MarketId market, BuyerProfile profile) =>
    switch (profile.taxResidence) {
      null => null,
      final country when country == market.countryCode => Residency.resident,
      _ => Residency.nonResident,
    };

Citizenship? _citizenshipIn(MarketId market, BuyerProfile profile) =>
    switch (profile.citizenship) {
      null => null,
      final country when country == market.countryCode => Citizenship.domestic,
      final country
          when europeanEconomicAreaCountryCodes.contains(country.code) &&
              europeanEconomicAreaCountryCodes.contains(
                market.countryCode.code,
              ) =>
        Citizenship.regional,
      _ => Citizenship.foreign,
    };
