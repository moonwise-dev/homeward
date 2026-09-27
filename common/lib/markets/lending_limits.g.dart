// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lending_limits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LtvLimit _$LtvLimitFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_LtvLimit', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'appliesTo', 'rate', 'typicalRange', 'sourceId'],
  );
  final val = _LtvLimit(
    id: $checkedConvert('id', (v) => v as String),
    appliesTo: $checkedConvert(
      'appliesTo',
      (v) =>
          v == null ? null : BuyerPredicate.fromJson(v as Map<String, dynamic>),
    ),
    rate: $checkedConvert(
      'rate',
      (v) => const PercentJsonConverter().fromJson(v as String),
    ),
    typicalRange: $checkedConvert(
      'typicalRange',
      (v) => v == null ? null : RateRange.fromJson(v as Map<String, dynamic>),
    ),
    sourceId: $checkedConvert('sourceId', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$LtvLimitToJson(_LtvLimit instance) => <String, dynamic>{
  'id': instance.id,
  'appliesTo': ?instance.appliesTo?.toJson(),
  'rate': const PercentJsonConverter().toJson(instance.rate),
  'typicalRange': ?instance.typicalRange?.toJson(),
  'sourceId': instance.sourceId,
};

_DstiLimit _$DstiLimitFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DstiLimit', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'appliesTo',
          'rate',
          'incomeBasis',
          'exceptionQuota',
          'sourceId',
        ],
      );
      final val = _DstiLimit(
        id: $checkedConvert('id', (v) => v as String),
        appliesTo: $checkedConvert(
          'appliesTo',
          (v) => v == null
              ? null
              : BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        rate: $checkedConvert(
          'rate',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        incomeBasis: $checkedConvert(
          'incomeBasis',
          (v) => $enumDecode(_$IncomeBasisEnumMap, v),
        ),
        exceptionQuota: $checkedConvert(
          'exceptionQuota',
          (v) => _$JsonConverterFromJson<String, Rate>(
            v,
            const PercentJsonConverter().fromJson,
          ),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$DstiLimitToJson(_DstiLimit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appliesTo': ?instance.appliesTo?.toJson(),
      'rate': const PercentJsonConverter().toJson(instance.rate),
      'incomeBasis': _$IncomeBasisEnumMap[instance.incomeBasis]!,
      'exceptionQuota': ?_$JsonConverterToJson<String, Rate>(
        instance.exceptionQuota,
        const PercentJsonConverter().toJson,
      ),
      'sourceId': instance.sourceId,
    };

const _$IncomeBasisEnumMap = {
  IncomeBasis.net: 'net',
  IncomeBasis.gross: 'gross',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_LtiLimit _$LtiLimitFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LtiLimit', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'appliesTo',
          'multiple',
          'incomeBasis',
          'typicalRange',
          'sourceId',
        ],
      );
      final val = _LtiLimit(
        id: $checkedConvert('id', (v) => v as String),
        appliesTo: $checkedConvert(
          'appliesTo',
          (v) => v == null
              ? null
              : BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        multiple: $checkedConvert(
          'multiple',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
        incomeBasis: $checkedConvert(
          'incomeBasis',
          (v) => $enumDecode(_$IncomeBasisEnumMap, v),
        ),
        typicalRange: $checkedConvert(
          'typicalRange',
          (v) =>
              v == null ? null : RateRange.fromJson(v as Map<String, dynamic>),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$LtiLimitToJson(_LtiLimit instance) => <String, dynamic>{
  'id': instance.id,
  'appliesTo': ?instance.appliesTo?.toJson(),
  'multiple': const ExactDecimalJsonConverter().toJson(instance.multiple),
  'incomeBasis': _$IncomeBasisEnumMap[instance.incomeBasis]!,
  'typicalRange': ?instance.typicalRange?.toJson(),
  'sourceId': instance.sourceId,
};

_StressRule _$StressRuleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_StressRule', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'appliesTo',
      'appliesToLoan',
      'kind',
      'rate',
      'sourceId',
    ],
  );
  final val = _StressRule(
    id: $checkedConvert('id', (v) => v as String),
    appliesTo: $checkedConvert(
      'appliesTo',
      (v) =>
          v == null ? null : BuyerPredicate.fromJson(v as Map<String, dynamic>),
    ),
    appliesToLoan: $checkedConvert(
      'appliesToLoan',
      (v) =>
          v == null ? null : LoanPredicate.fromJson(v as Map<String, dynamic>),
    ),
    kind: $checkedConvert('kind', (v) => $enumDecode(_$StressKindEnumMap, v)),
    rate: $checkedConvert(
      'rate',
      (v) => const PercentJsonConverter().fromJson(v as String),
    ),
    sourceId: $checkedConvert('sourceId', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$StressRuleToJson(_StressRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appliesTo': ?instance.appliesTo?.toJson(),
      'appliesToLoan': ?instance.appliesToLoan?.toJson(),
      'kind': _$StressKindEnumMap[instance.kind]!,
      'rate': const PercentJsonConverter().toJson(instance.rate),
      'sourceId': instance.sourceId,
    };

const _$StressKindEnumMap = {
  StressKind.fixedRate: 'fixedRate',
  StressKind.shock: 'shock',
};

_YearsLimit _$YearsLimitFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_YearsLimit', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['id', 'appliesTo', 'years', 'sourceId']);
  final val = _YearsLimit(
    id: $checkedConvert('id', (v) => v as String),
    appliesTo: $checkedConvert(
      'appliesTo',
      (v) =>
          v == null ? null : BuyerPredicate.fromJson(v as Map<String, dynamic>),
    ),
    years: $checkedConvert('years', (v) => (v as num).toInt()),
    sourceId: $checkedConvert('sourceId', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$YearsLimitToJson(_YearsLimit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appliesTo': ?instance.appliesTo?.toJson(),
      'years': instance.years,
      'sourceId': instance.sourceId,
    };

_IncomeAdjustment _$IncomeAdjustmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_IncomeAdjustment', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'appliesTo',
          'whenAgeAtMaturityAbove',
          'reduction',
          'weightedByTermShare',
          'exceptRetired',
          'sourceId',
        ],
      );
      final val = _IncomeAdjustment(
        id: $checkedConvert('id', (v) => v as String),
        appliesTo: $checkedConvert(
          'appliesTo',
          (v) => v == null
              ? null
              : BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        whenAgeAtMaturityAbove: $checkedConvert(
          'whenAgeAtMaturityAbove',
          (v) => (v as num).toInt(),
        ),
        reduction: $checkedConvert(
          'reduction',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        weightedByTermShare: $checkedConvert(
          'weightedByTermShare',
          (v) => v as bool,
        ),
        exceptRetired: $checkedConvert('exceptRetired', (v) => v as bool),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$IncomeAdjustmentToJson(_IncomeAdjustment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appliesTo': ?instance.appliesTo?.toJson(),
      'whenAgeAtMaturityAbove': instance.whenAgeAtMaturityAbove,
      'reduction': const PercentJsonConverter().toJson(instance.reduction),
      'weightedByTermShare': instance.weightedByTermShare,
      'exceptRetired': instance.exceptRetired,
      'sourceId': instance.sourceId,
    };

_AmortizationRule _$AmortizationRuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AmortizationRule', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'appliesTo',
          'whenLtvAbove',
          'annualRate',
          'sourceId',
        ],
      );
      final val = _AmortizationRule(
        id: $checkedConvert('id', (v) => v as String),
        appliesTo: $checkedConvert(
          'appliesTo',
          (v) => v == null
              ? null
              : BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        whenLtvAbove: $checkedConvert(
          'whenLtvAbove',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        annualRate: $checkedConvert(
          'annualRate',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AmortizationRuleToJson(
  _AmortizationRule instance,
) => <String, dynamic>{
  'id': instance.id,
  'appliesTo': ?instance.appliesTo?.toJson(),
  'whenLtvAbove': const PercentJsonConverter().toJson(instance.whenLtvAbove),
  'annualRate': const PercentJsonConverter().toJson(instance.annualRate),
  'sourceId': instance.sourceId,
};
