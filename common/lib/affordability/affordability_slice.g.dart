// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affordability_slice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AffordabilitySlice _$AffordabilitySliceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AffordabilitySlice', json, ($checkedConvert) {
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
      'loanTypeId',
      'monthly',
      'binding',
      'checks',
      'exchangeRates',
      'stress',
      'purchaseCosts',
      'purchaseCostsTotal',
      'whatIf',
      'mortgageOptions',
      'profile',
      'downPaymentStated',
      'homeId',
      'homeName',
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
    loanTypeId: $checkedConvert('loanTypeId', (v) => v as String?),
    monthly: $checkedConvert(
      'monthly',
      (v) => MonthlyFigures.fromJson(v as Map<String, dynamic>),
    ),
    binding: $checkedConvert(
      'binding',
      (v) => v == null ? null : RuleCheck.fromJson(v as Map<String, dynamic>),
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
    stress: $checkedConvert(
      'stress',
      (v) => v == null ? null : StressCurve.fromJson(v as Map<String, dynamic>),
    ),
    purchaseCosts: $checkedConvert(
      'purchaseCosts',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => CostLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    purchaseCostsTotal: $checkedConvert(
      'purchaseCostsTotal',
      (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
    ),
    whatIf: $checkedConvert(
      'whatIf',
      (v) => v == null
          ? null
          : DownPaymentWhatIf.fromJson(v as Map<String, dynamic>),
    ),
    mortgageOptions: $checkedConvert(
      'mortgageOptions',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => MortgageOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    profile: $checkedConvert(
      'profile',
      (v) =>
          v == null ? null : BuyerProfile.fromJson(v as Map<String, dynamic>),
    ),
    downPaymentStated: $checkedConvert(
      'downPaymentStated',
      (v) => v as bool? ?? false,
    ),
    homeId: $checkedConvert('homeId', (v) => v as String?),
    homeName: $checkedConvert('homeName', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'annualRate': 'annualRatePpm'});

Map<String, dynamic> _$AffordabilitySliceToJson(
  _AffordabilitySlice instance,
) => <String, dynamic>{
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
  'loanTypeId': ?instance.loanTypeId,
  'monthly': instance.monthly.toJson(),
  'binding': ?instance.binding?.toJson(),
  'checks': instance.checks.map((e) => e.toJson()).toList(),
  'exchangeRates': instance.exchangeRates.map((e) => e.toJson()).toList(),
  'stress': ?instance.stress?.toJson(),
  'purchaseCosts': instance.purchaseCosts.map((e) => e.toJson()).toList(),
  'purchaseCostsTotal': ?instance.purchaseCostsTotal?.toJson(),
  'whatIf': ?instance.whatIf?.toJson(),
  'mortgageOptions': instance.mortgageOptions.map((e) => e.toJson()).toList(),
  'profile': ?instance.profile?.toJson(),
  'downPaymentStated': instance.downPaymentStated,
  'homeId': ?instance.homeId,
  'homeName': ?instance.homeName,
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
          'amortizationRatePpm',
          'fee',
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
        amortizationRate: $checkedConvert(
          'amortizationRatePpm',
          (v) => _$JsonConverterFromJson<int, Rate>(
            v,
            const PpmJsonConverter().fromJson,
          ),
        ),
        fee: $checkedConvert(
          'fee',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'amortizationRate': 'amortizationRatePpm'});

Map<String, dynamic> _$MonthlyFiguresToJson(_MonthlyFigures instance) =>
    <String, dynamic>{
      'interest': instance.interest.toJson(),
      'amortization': instance.amortization.toJson(),
      'total': instance.total.toJson(),
      'afterDeduction': ?instance.afterDeduction?.toJson(),
      'amortizationRatePpm': ?_$JsonConverterToJson<int, Rate>(
        instance.amortizationRate,
        const PpmJsonConverter().toJson,
      ),
      'fee': ?instance.fee?.toJson(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

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

_CostLine _$CostLineFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CostLine', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'label',
          'localTerm',
          'amount',
          'refundable',
          'refund',
          'source',
        ],
      );
      final val = _CostLine(
        label: $checkedConvert('label', (v) => v as String),
        localTerm: $checkedConvert('localTerm', (v) => v as String?),
        amount: $checkedConvert(
          'amount',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        refundable: $checkedConvert(
          'refundable',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        refund: $checkedConvert(
          'refund',
          (v) =>
              v == null ? null : RefundRule.fromJson(v as Map<String, dynamic>),
        ),
        source: $checkedConvert(
          'source',
          (v) => v == null ? null : Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CostLineToJson(_CostLine instance) => <String, dynamic>{
  'label': instance.label,
  'localTerm': ?instance.localTerm,
  'amount': instance.amount.toJson(),
  'refundable': ?instance.refundable?.toJson(),
  'refund': ?instance.refund?.toJson(),
  'source': ?instance.source?.toJson(),
};

_DownPaymentWhatIf _$DownPaymentWhatIfFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DownPaymentWhatIf', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['step', 'steps']);
      final val = _DownPaymentWhatIf(
        step: $checkedConvert(
          'step',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        steps: $checkedConvert(
          'steps',
          (v) => (v as List<dynamic>)
              .map((e) => WhatIfStep.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DownPaymentWhatIfToJson(_DownPaymentWhatIf instance) =>
    <String, dynamic>{
      'step': instance.step.toJson(),
      'steps': instance.steps.map((e) => e.toJson()).toList(),
    };

_WhatIfStep _$WhatIfStepFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WhatIfStep', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'downPayment',
          'loan',
          'monthly',
          'cashNeeded',
          'withinRules',
        ],
      );
      final val = _WhatIfStep(
        downPayment: $checkedConvert(
          'downPayment',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        loan: $checkedConvert(
          'loan',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        monthly: $checkedConvert(
          'monthly',
          (v) => MonthlyFigures.fromJson(v as Map<String, dynamic>),
        ),
        cashNeeded: $checkedConvert(
          'cashNeeded',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        withinRules: $checkedConvert('withinRules', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$WhatIfStepToJson(_WhatIfStep instance) =>
    <String, dynamic>{
      'downPayment': instance.downPayment.toJson(),
      'loan': instance.loan.toJson(),
      'monthly': instance.monthly.toJson(),
      'cashNeeded': ?instance.cashNeeded?.toJson(),
      'withinRules': instance.withinRules,
    };

_MortgageOption _$MortgageOptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MortgageOption', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'loanTypeId',
          'label',
          'rateType',
          'fixedYears',
          'annualRatePpm',
          'monthly',
          'withinRules',
          'source',
        ],
      );
      final val = _MortgageOption(
        loanTypeId: $checkedConvert('loanTypeId', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        rateType: $checkedConvert(
          'rateType',
          (v) => $enumDecode(_$RateTypeEnumMap, v),
        ),
        fixedYears: $checkedConvert(
          'fixedYears',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        annualRate: $checkedConvert(
          'annualRatePpm',
          (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
        ),
        monthly: $checkedConvert(
          'monthly',
          (v) => MonthlyFigures.fromJson(v as Map<String, dynamic>),
        ),
        withinRules: $checkedConvert('withinRules', (v) => v as bool),
        source: $checkedConvert(
          'source',
          (v) => v == null ? null : Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'annualRate': 'annualRatePpm'});

Map<String, dynamic> _$MortgageOptionToJson(_MortgageOption instance) =>
    <String, dynamic>{
      'loanTypeId': instance.loanTypeId,
      'label': instance.label,
      'rateType': _$RateTypeEnumMap[instance.rateType]!,
      'fixedYears': instance.fixedYears,
      'annualRatePpm': const PpmJsonConverter().toJson(instance.annualRate),
      'monthly': instance.monthly.toJson(),
      'withinRules': instance.withinRules,
      'source': ?instance.source?.toJson(),
    };

const _$RateTypeEnumMap = {
  RateType.variable: 'variable',
  RateType.mixed: 'mixed',
  RateType.fixed: 'fixed',
};
