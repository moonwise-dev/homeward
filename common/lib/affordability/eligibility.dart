import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/resolved_market.dart';
import '../markets/rule_section.dart';
import '../markets/source_kind.dart';
import '../money/money.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import 'affordability.dart';
import 'assess_affordability.dart';
import 'constraint_kind.dart';

part 'eligibility.freezed.dart';

enum EligibilityStatus { pass, warn, fail }

enum TermLimit { marketMaximum, ageAtMaturity }

@freezed
sealed class EligibilityItem with _$EligibilityItem {
  const factory EligibilityItem.loan({
    required String ruleId,
    required EligibilityStatus status,
    required ConstraintKind kind,
    required Money maxLoan,
    required Money leastDownPayment,
  }) = LoanEligibility;

  const factory EligibilityItem.term({
    required String ruleId,
    required EligibilityStatus status,
    required TermLimit limit,
    required int allowedYears,
  }) = TermEligibility;
}

@freezed
abstract class Eligibility with _$Eligibility {
  const factory Eligibility({
    required List<EligibilityItem> items,
    required Set<ProfileField> missing,
  }) = _Eligibility;

  const Eligibility._();

  bool get passes =>
      missing.isEmpty &&
      items.every((item) => item.status == EligibilityStatus.pass);
}

Eligibility eligibilityFor({
  required Scenario scenario,
  required ResolvedMarket market,
  required BuyerProfile profile,
}) {
  final affordability = assessAffordability(
    scenario: scenario,
    market: market,
    profile: profile,
  );
  final lending = market.lending;
  EligibilityStatus statusOf({required bool allowed, required String source}) {
    if (allowed) {
      return EligibilityStatus.pass;
    }
    return switch (market.sourceOf(source)?.kind) {
      SourceKind.lenderNorm || SourceKind.secondary => EligibilityStatus.warn,
      _ => EligibilityStatus.fail,
    };
  }

  final age = profile.age;
  return Eligibility(
    items: [
      if (affordability case AssessedAffordability(:final checks, :final loan))
        for (final check in checks)
          EligibilityItem.loan(
            ruleId: check.ruleId,
            status: statusOf(
              allowed: check.allows(loan),
              source: check.sourceId,
            ),
            kind: check.kind,
            maxLoan: check.maxLoan,
            leastDownPayment: scenario.price - check.maxLoan,
          ),
      for (final rule in lending.maxTermYears)
        EligibilityItem.term(
          ruleId: rule.id,
          status: statusOf(
            allowed: scenario.termYears <= rule.years,
            source: rule.sourceId,
          ),
          limit: TermLimit.marketMaximum,
          allowedYears: rule.years,
        ),
      if (age != null)
        for (final rule in lending.maxAgeAtMaturity)
          EligibilityItem.term(
            ruleId: rule.id,
            status: statusOf(
              allowed: age + scenario.termYears <= rule.years,
              source: rule.sourceId,
            ),
            limit: TermLimit.ageAtMaturity,
            allowedYears: rule.years - age,
          ),
    ],
    missing: {
      ...market.missingFor(RuleSection.lending),
      if (affordability case IncompleteAffordability(:final missing))
        ...missing,
    },
  );
}
