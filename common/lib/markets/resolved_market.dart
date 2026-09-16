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
    required Map<String, Set<ProfileField>> pendingRules,
    required Set<ProfileField> requiredFields,
  }) = _ResolvedMarket;
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
  final pendingRules = <String, Set<ProfileField>>{};
  List<T> keep<T extends ConditionalRule>(List<T> rules) {
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
          pendingRules[rule.id] = missing;
      }
    }
    return kept;
  }

  final lending = pack.lending;
  final resolvedLending = LendingRules(
    maxLtv: keep(lending.maxLtv),
    maxDsti: keep(lending.maxDsti),
    maxLti: keep(lending.maxLti),
    stress: keep(lending.stress),
    maxTermYears: keep(lending.maxTermYears),
    maxAgeAtMaturity: keep(lending.maxAgeAtMaturity),
    incomeAdjustments: keep(lending.incomeAdjustments),
    amortization: keep(lending.amortization),
    leftToLiveOn: keep(lending.leftToLiveOn),
    interestDeduction: keep(lending.interestDeduction),
    repaymentStyle: lending.repaymentStyle,
  );
  final purchaseCosts = keep(pack.purchaseCosts);
  final recurringCosts = keep(pack.recurringCosts);
  final profileFields = keep(pack.profileFields);
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
      for (final missing in pendingRules.values) ...missing,
    },
  );
}
