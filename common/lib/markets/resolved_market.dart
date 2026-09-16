import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/currency.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import 'applicability.dart';
import 'cost_rule.dart';
import 'identified.dart';
import 'lending_rules.dart';
import 'loan_type.dart';
import 'market_id.dart';
import 'market_rule_pack.dart';
import 'rule_section.dart';
import 'source.dart';

part 'resolved_market.freezed.dart';

@freezed
abstract class ResolvedMarket with _$ResolvedMarket {
  const factory ResolvedMarket({
    required MarketId id,
    required String name,
    required Currency currency,
    required LendingRules lending,
    required List<CostRule> purchaseCosts,
    required List<CostRule> recurringCosts,
    required List<LoanType> loanTypes,
    required List<Source> sources,
    required Map<String, PendingRule> pendingRules,
    required Set<ProfileField> requiredFields,
  }) = _ResolvedMarket;

  const ResolvedMarket._();

  Set<ProfileField> missingFor(RuleSection section) => {
    for (final rule in pendingRules.values)
      if (rule.section == section) ...rule.missing,
  };
}

@freezed
abstract class PendingRule with _$PendingRule {
  const factory PendingRule({
    required RuleSection section,
    required Set<ProfileField> missing,
  }) = _PendingRule;
}

ResolvedMarket resolveForBuyer(MarketRulePack pack, BuyerProfile profile) {
  final currency = pack.currency;
  if (pack.parent != null || currency == null) {
    throw ArgumentError.value(
      pack.id.code,
      'pack',
      'Resolve the pack chain before resolving for a buyer',
    );
  }
  final pendingRules = <String, PendingRule>{};
  List<T> keep<T extends ConditionalRule>(List<T> rules, RuleSection section) {
    final kept = <T>[];
    for (final rule in rules) {
      switch (applicabilityOf(
        rule.appliesTo,
        profile: profile,
        market: pack.id,
      )) {
        case Applies():
          kept.add(rule);
        case DoesNotApply():
          break;
        case Pending(:final missing):
          pendingRules[rule.id] = PendingRule(
            section: section,
            missing: missing,
          );
      }
    }
    return kept;
  }

  final lending = pack.lending;
  final resolvedLending = LendingRules(
    maxLtv: keep(lending.maxLtv, RuleSection.lending),
    maxDsti: keep(lending.maxDsti, RuleSection.lending),
    maxLti: keep(lending.maxLti, RuleSection.lending),
    stress: keep(lending.stress, RuleSection.lending),
    maxTermYears: keep(lending.maxTermYears, RuleSection.lending),
    maxAgeAtMaturity: keep(lending.maxAgeAtMaturity, RuleSection.lending),
    incomeAdjustments: keep(lending.incomeAdjustments, RuleSection.lending),
    amortization: keep(lending.amortization, RuleSection.lending),
    leftToLiveOn: keep(lending.leftToLiveOn, RuleSection.lending),
    interestDeduction: keep(lending.interestDeduction, RuleSection.lending),
    repaymentStyle: lending.repaymentStyle,
  );
  final purchaseCosts = keep(pack.purchaseCosts, RuleSection.purchaseCosts);
  final recurringCosts = keep(
    pack.recurringCosts,
    RuleSection.recurringCosts,
  );
  final profileFields = keep(pack.profileFields, RuleSection.profileFields);
  return ResolvedMarket(
    id: pack.id,
    name: pack.name,
    currency: currency,
    lending: resolvedLending,
    purchaseCosts: purchaseCosts,
    recurringCosts: recurringCosts,
    loanTypes: pack.loanTypes,
    sources: pack.sources,
    pendingRules: pendingRules,
    requiredFields: {
      for (final requirement in profileFields) requirement.field,
      for (final pending in pendingRules.values) ...pending.missing,
    },
  );
}
