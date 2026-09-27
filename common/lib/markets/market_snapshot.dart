import 'package:freezed_annotation/freezed_annotation.dart';

import '../affordability/affordability_answer.dart';
import '../affordability/scenario_payment.dart';
import '../affordability/stress_rate.dart';
import '../finance/rate_type.dart';
import '../money/currency.dart';
import '../money/currency_json_converter.dart';
import '../money/money.dart';
import '../money/ppm_json_converter.dart';
import '../money/rate.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import '../samples/listing.dart';
import '../samples/listing_inventory.dart';
import '../time/calendar_date.dart';
import '../time/calendar_date_json_converter.dart';
import 'applicability.dart';
import 'identified.dart';
import 'income_basis.dart';
import 'loan_type.dart';
import 'resolved_market.dart';
import 'rule_section.dart';
import 'source.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';

part 'market_snapshot.freezed.dart';
part 'market_snapshot.g.dart';

enum MarketRuleKind {
  loanToValue,
  loanToIncome,
  debtServiceToIncome,
  testedRate,
  amortization,
  interestDeduction,
}

@freezed
abstract class MarketRate with _$MarketRate {
  const factory MarketRate({
    required String loanTypeId,
    required String label,
    required RateType rateType,
    @Default(0) int fixedYears,
    @JsonKey(name: 'annualRatePpm')
    @PpmJsonConverter()
    required Rate annualRate,
    @CalendarDateJsonConverter() CalendarDate? asOf,
    Source? source,
  }) = _MarketRate;

  factory MarketRate.fromJson(Map<String, Object?> json) =>
      _$MarketRateFromJson(json);
}

@freezed
abstract class MarketRule with _$MarketRule {
  const factory MarketRule({
    required MarketRuleKind kind,
    @JsonKey(name: 'ratePpm') @PpmJsonConverter() Rate? rate,
    @ExactDecimalJsonConverter() ExactDecimal? multiple,
    IncomeBasis? incomeBasis,
    @JsonKey(name: 'whenLtvAbovePpm') @PpmJsonConverter() Rate? whenLtvAbove,
    Money? upTo,
    @JsonKey(name: 'rateAbovePpm') @PpmJsonConverter() Rate? rateAbove,
    @Default(false) bool perBorrower,
    Source? source,
  }) = _MarketRule;

  factory MarketRule.fromJson(Map<String, Object?> json) =>
      _$MarketRuleFromJson(json);
}

@freezed
abstract class AreaFigures with _$AreaFigures {
  const factory AreaFigures({
    required String areaId,
    required String areaName,
    required int homes,
    required Money pricePerM2,
    required String priceSource,
    required Money rentPerM2,
    required String rentSource,
  }) = _AreaFigures;

  factory AreaFigures.fromJson(Map<String, Object?> json) =>
      _$AreaFiguresFromJson(json);
}

@freezed
abstract class MarketSnapshot with _$MarketSnapshot {
  const factory MarketSnapshot({
    required String cityId,
    required String cityName,
    required String marketId,
    required String marketName,
    @Default(true) bool sample,
    @CurrencyJsonConverter() required Currency currency,
    required List<MarketRate> rates,
    required List<MarketRule> rules,
    @Default([]) List<ProfileField> waitingOn,
    required List<AreaFigures> areas,
  }) = _MarketSnapshot;

  factory MarketSnapshot.fromJson(Map<String, Object?> json) =>
      _$MarketSnapshotFromJson(json);
}

MarketSnapshot marketSnapshot({
  required ListingInventory city,
  required ResolvedMarket market,
}) {
  final zero = Money.zero(market.currency);
  final lending = market.lending;
  final term = termYearsFor(market, const BuyerProfile());
  Scenario scenarioFor(LoanType type) => Scenario(
    price: zero,
    downPayment: zero,
    termYears: term,
    loanTypeId: type.id,
    rateSpread: type.defaultSpread,
  );
  Source? sourceOf(Sourced rule) => market.sourceOf(rule.sourceId);
  final variable = market.loanTypes.first;
  final testedBy = <Sourced>[
    ...lending.leftToLiveOn,
    ...lending.stress.where(
      (rule) => matchesLoan(
        rule.appliesToLoan,
        rateType: variable.rateType,
        termYears: term,
      ),
    ),
  ];
  final byArea = <String, List<Listing>>{};
  for (final listing in city.listings) {
    (byArea[listing.areaId] ??= []).add(listing);
  }
  return MarketSnapshot(
    cityId: city.cityId,
    cityName: city.name,
    marketId: market.id.code,
    marketName: market.name,
    currency: market.currency,
    rates: [
      for (final type in market.loanTypes)
        MarketRate(
          loanTypeId: type.id,
          label: type.label,
          rateType: type.rateType,
          fixedYears: type.fixedYears,
          annualRate: scenarioRate(scenarioFor(type), market),
          asOf: market.referenceRates[type.referenceRateId]?.asOf,
          source:
              market.referenceRates[type.referenceRateId]?.source ??
              market.sourceOf(type.sourceId),
        ),
    ],
    rules: [
      for (final rule in lending.maxLtv)
        MarketRule(
          kind: MarketRuleKind.loanToValue,
          rate: rule.rate,
          source: sourceOf(rule),
        ),
      for (final rule in lending.maxLti)
        MarketRule(
          kind: MarketRuleKind.loanToIncome,
          multiple: rule.multiple,
          incomeBasis: rule.incomeBasis,
          source: sourceOf(rule),
        ),
      for (final rule in lending.maxDsti)
        MarketRule(
          kind: MarketRuleKind.debtServiceToIncome,
          rate: rule.rate,
          incomeBasis: rule.incomeBasis,
          source: sourceOf(rule),
        ),
      if (testedBy.isNotEmpty)
        MarketRule(
          kind: MarketRuleKind.testedRate,
          rate: stressTestRateFor(scenarioFor(variable), market),
          source: sourceOf(testedBy.first),
        ),
      for (final rule in [
        ...lending.amortization,
      ]..sort((a, b) => b.whenLtvAbove.compareTo(a.whenLtvAbove)))
        MarketRule(
          kind: MarketRuleKind.amortization,
          rate: rule.annualRate,
          whenLtvAbove: rule.whenLtvAbove,
          source: sourceOf(rule),
        ),
      for (final rule in lending.interestDeduction)
        if (rule.yearlyBrackets case [final first, ...final rest])
          MarketRule(
            kind: MarketRuleKind.interestDeduction,
            rate: first.rate,
            upTo: first.upTo?.toMoney(market.currency),
            rateAbove: rest.firstOrNull?.rate,
            perBorrower: rule.perBorrower,
            source: sourceOf(rule),
          ),
    ],
    waitingOn: [...market.missingFor(RuleSection.lending)],
    areas: [
      for (final MapEntry(key: areaId, value: listings) in byArea.entries)
        AreaFigures(
          areaId: areaId,
          areaName: listings.first.areaName,
          homes: listings.length,
          pricePerM2: listings.first.areaPricePerM2,
          priceSource: listings.first.priceSource,
          rentPerM2: listings.first.areaRentPerM2,
          rentSource: listings.first.rentSource,
        ),
    ],
  );
}
