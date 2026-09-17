import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/currency.dart';
import '../money/currency_json_converter.dart';
import '../time/calendar_date.dart';
import '../time/calendar_date_json_converter.dart';
import 'cost_rule.dart';
import 'identified.dart';
import 'lending_rules.dart';
import 'loan_type.dart';
import 'locale_tag.dart';
import 'locale_tag_json_converter.dart';
import 'market_id.dart';
import 'market_id_json_converter.dart';
import 'profile_field_requirement.dart';
import 'source.dart';

part 'market_rule_pack.freezed.dart';
part 'market_rule_pack.g.dart';

@freezed
abstract class MarketRulePack with _$MarketRulePack {
  const factory MarketRulePack({
    @MarketIdJsonConverter() required MarketId id,
    @MarketIdJsonConverter() MarketId? parent,
    required String name,
    @CurrencyJsonConverter() Currency? currency,
    @LocaleTagJsonConverter() LocaleTag? locale,
    required int version,
    @CalendarDateJsonConverter() required CalendarDate effectiveFrom,
    @CalendarDateJsonConverter() CalendarDate? reviewedAt,
    String? reviewedBy,
    @Default([]) List<ProfileFieldRequirement> profileFields,
    @Default(LendingRules()) LendingRules lending,
    @Default([]) List<CostRule> purchaseCosts,
    @Default([]) List<CostRule> recurringCosts,
    @Default([]) List<LoanType> loanTypes,
    @Default([]) List<String> removedRuleIds,
    @Default([]) List<Source> sources,
  }) = _MarketRulePack;

  const MarketRulePack._();

  factory MarketRulePack.fromJson(Map<String, Object?> json) =>
      _$MarketRulePackFromJson(json);

  static const reviewValidityDays = 180;

  CalendarDate? get expiresAt => reviewedAt?.plusDays(reviewValidityDays);

  List<Identified> get entries => [
    ...profileFields,
    ...lending.maxLtv,
    ...lending.maxDsti,
    ...lending.maxLti,
    ...lending.stress,
    ...lending.maxTermYears,
    ...lending.maxAgeAtMaturity,
    ...lending.incomeAdjustments,
    ...lending.amortization,
    ...lending.leftToLiveOn,
    ...lending.interestDeduction,
    ...purchaseCosts,
    ...recurringCosts,
    ...loanTypes,
    ...sources,
  ];
}
