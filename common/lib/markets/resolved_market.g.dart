// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolved_market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResolvedMarket _$ResolvedMarketFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ResolvedMarket', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'name',
      'currency',
      'lending',
      'purchaseCosts',
      'recurringCosts',
      'loanTypes',
      'referenceRates',
      'livingCosts',
      'sources',
      'pendingRules',
      'requiredFields',
    ],
  );
  final val = _ResolvedMarket(
    id: $checkedConvert(
      'id',
      (v) => const MarketIdJsonConverter().fromJson(v as String),
    ),
    name: $checkedConvert('name', (v) => v as String),
    currency: $checkedConvert(
      'currency',
      (v) => const CurrencyJsonConverter().fromJson(v as String),
    ),
    lending: $checkedConvert(
      'lending',
      (v) => LendingRules.fromJson(v as Map<String, dynamic>),
    ),
    purchaseCosts: $checkedConvert(
      'purchaseCosts',
      (v) => (v as List<dynamic>)
          .map((e) => CostRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    recurringCosts: $checkedConvert(
      'recurringCosts',
      (v) => (v as List<dynamic>)
          .map((e) => CostRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    loanTypes: $checkedConvert(
      'loanTypes',
      (v) => (v as List<dynamic>)
          .map((e) => LoanType.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    referenceRates: $checkedConvert(
      'referenceRates',
      (v) =>
          (v as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, ReferenceRate.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    ),
    livingCosts: $checkedConvert(
      'livingCosts',
      (v) => v == null ? null : LivingCosts.fromJson(v as Map<String, dynamic>),
    ),
    sources: $checkedConvert(
      'sources',
      (v) => (v as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    pendingRules: $checkedConvert(
      'pendingRules',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, PendingRule.fromJson(e as Map<String, dynamic>)),
      ),
    ),
    requiredFields: $checkedConvert(
      'requiredFields',
      (v) => (v as List<dynamic>)
          .map((e) => $enumDecode(_$ProfileFieldEnumMap, e))
          .toSet(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ResolvedMarketToJson(
  _ResolvedMarket instance,
) => <String, dynamic>{
  'id': const MarketIdJsonConverter().toJson(instance.id),
  'name': instance.name,
  'currency': const CurrencyJsonConverter().toJson(instance.currency),
  'lending': instance.lending.toJson(),
  'purchaseCosts': instance.purchaseCosts.map((e) => e.toJson()).toList(),
  'recurringCosts': instance.recurringCosts.map((e) => e.toJson()).toList(),
  'loanTypes': instance.loanTypes.map((e) => e.toJson()).toList(),
  'referenceRates': instance.referenceRates.map(
    (k, e) => MapEntry(k, e.toJson()),
  ),
  'livingCosts': ?instance.livingCosts?.toJson(),
  'sources': instance.sources.map((e) => e.toJson()).toList(),
  'pendingRules': instance.pendingRules.map((k, e) => MapEntry(k, e.toJson())),
  'requiredFields': instance.requiredFields
      .map((e) => _$ProfileFieldEnumMap[e]!)
      .toList(),
};

const _$ProfileFieldEnumMap = {
  ProfileField.citizenship: 'citizenship',
  ProfileField.residency: 'residency',
  ProfileField.formerResident: 'formerResident',
  ProfileField.residencyIntent: 'residencyIntent',
  ProfileField.use: 'use',
  ProfileField.firstTime: 'firstTime',
  ProfileField.employment: 'employment',
  ProfileField.netMonthlyIncome: 'netMonthlyIncome',
  ProfileField.grossMonthlyIncome: 'grossMonthlyIncome',
  ProfileField.incomeCurrency: 'incomeCurrency',
  ProfileField.savings: 'savings',
  ProfileField.monthlyDebtPayments: 'monthlyDebtPayments',
  ProfileField.age: 'age',
  ProfileField.household: 'household',
  ProfileField.borrowers: 'borrowers',
};

_PendingRule _$PendingRuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PendingRule', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['section', 'missing']);
      final val = _PendingRule(
        section: $checkedConvert(
          'section',
          (v) => $enumDecode(_$RuleSectionEnumMap, v),
        ),
        missing: $checkedConvert(
          'missing',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$ProfileFieldEnumMap, e))
              .toSet(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PendingRuleToJson(
  _PendingRule instance,
) => <String, dynamic>{
  'section': _$RuleSectionEnumMap[instance.section]!,
  'missing': instance.missing.map((e) => _$ProfileFieldEnumMap[e]!).toList(),
};

const _$RuleSectionEnumMap = {
  RuleSection.profileFields: 'profileFields',
  RuleSection.lending: 'lending',
  RuleSection.purchaseCosts: 'purchaseCosts',
  RuleSection.recurringCosts: 'recurringCosts',
};
