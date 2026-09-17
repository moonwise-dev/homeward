import 'locale_tag.dart';
import 'locale_tag_json_converter.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'cost_precedence.dart';
import 'coverage.dart';
import '../money/currency.dart';
import '../money/currency_json_converter.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import 'applicability.dart';
import 'cost_rule.dart';
import 'identified.dart';
import 'lending_rules.dart';
import 'living_costs.dart';
import 'loan_type.dart';
import 'market_id.dart';
import 'market_id_json_converter.dart';
import 'market_rule_pack.dart';
import 'profile_field_requirement.dart';
import 'reference_rate.dart';
import 'rule_section.dart';
import 'source.dart';

part 'resolved_market.freezed.dart';
part 'resolved_market.g.dart';

@freezed
abstract class ResolvedMarket with _$ResolvedMarket {
  const factory ResolvedMarket({
    @MarketIdJsonConverter() required MarketId id,
    required String name,
    @Default(Coverage.curated) Coverage coverage,
    @CurrencyJsonConverter() required Currency currency,
    @LocaleTagJsonConverter() required LocaleTag locale,
    required LendingRules lending,
    required List<CostRule> purchaseCosts,
    required List<CostRule> recurringCosts,
    required List<LoanType> loanTypes,
    @Default([]) List<ProfileFieldRequirement> profileFields,
    @Default({}) Map<String, ReferenceRate> referenceRates,
    LivingCosts? livingCosts,
    required List<Source> sources,
    required Map<String, PendingRule> pendingRules,
    required Set<ProfileField> requiredFields,
  }) = _ResolvedMarket;

  const ResolvedMarket._();

  factory ResolvedMarket.fromJson(Map<String, Object?> json) =>
      _$ResolvedMarketFromJson(json);

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

  factory PendingRule.fromJson(Map<String, Object?> json) =>
      _$PendingRuleFromJson(json);
}

ResolvedMarket resolveForBuyer(
  MarketRulePack pack,
  BuyerProfile profile, {
  Map<String, ReferenceRate> referenceRates = const {},
  LivingCosts? livingCosts,
}) {
  final currency = pack.currency;
  final locale = pack.locale;
  if (pack.parent != null || currency == null || locale == null) {
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
  final purchaseCosts = costsByPrecedence(
    keep(pack.purchaseCosts, RuleSection.purchaseCosts),
  );
  final recurringCosts = costsByPrecedence(
    keep(pack.recurringCosts, RuleSection.recurringCosts),
  );
  final profileFields = keep(pack.profileFields, RuleSection.profileFields);
  return ResolvedMarket(
    id: pack.id,
    name: pack.name,
    currency: currency,
    locale: locale,
    lending: resolvedLending,
    purchaseCosts: purchaseCosts,
    recurringCosts: recurringCosts,
    loanTypes: pack.loanTypes,
    profileFields: profileFields,
    referenceRates: {
      for (final loanType in pack.loanTypes)
        loanType.referenceRateId: ?referenceRates[loanType.referenceRateId],
    },
    livingCosts: resolvedLending.leftToLiveOn.isEmpty ? null : livingCosts,
    sources: pack.sources,
    pendingRules: pendingRules,
    requiredFields: {
      for (final requirement in profileFields) requirement.field,
      for (final pending in pendingRules.values) ...pending.missing,
    },
  );
}
