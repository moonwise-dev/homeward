// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affordability_slice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AffordabilitySlice _$AffordabilitySliceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AffordabilitySlice', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'marketId',
          'marketName',
          'sample',
          'price',
          'maxPrice',
          'loan',
          'maxLoan',
          'downPayment',
          'cashNeeded',
          'savings',
          'annualRatePpm',
          'termYears',
          'loanType',
          'monthly',
          'binding',
          'checks',
          'exchangeRates',
        ],
      );
      final val = _AffordabilitySlice(
        marketId: $checkedConvert('marketId', (v) => v as String),
        marketName: $checkedConvert('marketName', (v) => v as String),
        sample: $checkedConvert('sample', (v) => v as bool? ?? true),
        price: $checkedConvert(
          'price',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        maxPrice: $checkedConvert(
          'maxPrice',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        loan: $checkedConvert(
          'loan',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        maxLoan: $checkedConvert(
          'maxLoan',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        downPayment: $checkedConvert(
          'downPayment',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        cashNeeded: $checkedConvert(
          'cashNeeded',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        savings: $checkedConvert(
          'savings',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        annualRate: $checkedConvert(
          'annualRatePpm',
          (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
        ),
        termYears: $checkedConvert('termYears', (v) => (v as num).toInt()),
        loanType: $checkedConvert('loanType', (v) => v as String),
        monthly: $checkedConvert(
          'monthly',
          (v) => MonthlyFigures.fromJson(v as Map<String, dynamic>),
        ),
        binding: $checkedConvert(
          'binding',
          (v) =>
              v == null ? null : RuleCheck.fromJson(v as Map<String, dynamic>),
        ),
        checks: $checkedConvert(
          'checks',
          (v) => (v as List<dynamic>)
              .map((e) => RuleCheck.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        exchangeRates: $checkedConvert(
          'exchangeRates',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => ExchangeRate.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
      );
      return val;
    }, fieldKeyMap: const {'annualRate': 'annualRatePpm'});

Map<String, dynamic> _$AffordabilitySliceToJson(_AffordabilitySlice instance) =>
    <String, dynamic>{
      'marketId': instance.marketId,
      'marketName': instance.marketName,
      'sample': instance.sample,
      'price': instance.price.toJson(),
      'maxPrice': ?instance.maxPrice?.toJson(),
      'loan': instance.loan.toJson(),
      'maxLoan': instance.maxLoan.toJson(),
      'downPayment': instance.downPayment.toJson(),
      'cashNeeded': ?instance.cashNeeded?.toJson(),
      'savings': ?instance.savings?.toJson(),
      'annualRatePpm': const PpmJsonConverter().toJson(instance.annualRate),
      'termYears': instance.termYears,
      'loanType': instance.loanType,
      'monthly': instance.monthly.toJson(),
      'binding': ?instance.binding?.toJson(),
      'checks': instance.checks.map((e) => e.toJson()).toList(),
      'exchangeRates': instance.exchangeRates.map((e) => e.toJson()).toList(),
    };

_MonthlyFigures _$MonthlyFiguresFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MonthlyFigures', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'interest',
          'amortization',
          'total',
          'afterDeduction',
        ],
      );
      final val = _MonthlyFigures(
        interest: $checkedConvert(
          'interest',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        amortization: $checkedConvert(
          'amortization',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        total: $checkedConvert(
          'total',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        afterDeduction: $checkedConvert(
          'afterDeduction',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MonthlyFiguresToJson(_MonthlyFigures instance) =>
    <String, dynamic>{
      'interest': instance.interest.toJson(),
      'amortization': instance.amortization.toJson(),
      'total': instance.total.toJson(),
      'afterDeduction': ?instance.afterDeduction?.toJson(),
    };

_RuleCheck _$RuleCheckFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RuleCheck', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'kind',
          'ruleId',
          'maxLoan',
          'allows',
          'marketName',
          'source',
        ],
      );
      final val = _RuleCheck(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$ConstraintKindEnumMap, v),
        ),
        ruleId: $checkedConvert('ruleId', (v) => v as String),
        maxLoan: $checkedConvert(
          'maxLoan',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        allows: $checkedConvert('allows', (v) => v as bool),
        marketName: $checkedConvert('marketName', (v) => v as String),
        source: $checkedConvert(
          'source',
          (v) => v == null ? null : Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RuleCheckToJson(_RuleCheck instance) =>
    <String, dynamic>{
      'kind': _$ConstraintKindEnumMap[instance.kind]!,
      'ruleId': instance.ruleId,
      'maxLoan': instance.maxLoan.toJson(),
      'allows': instance.allows,
      'marketName': instance.marketName,
      'source': ?instance.source?.toJson(),
    };

const _$ConstraintKindEnumMap = {
  ConstraintKind.loanToValue: 'loanToValue',
  ConstraintKind.loanToIncome: 'loanToIncome',
  ConstraintKind.debtServiceToIncome: 'debtServiceToIncome',
  ConstraintKind.leftToLiveOn: 'leftToLiveOn',
};
