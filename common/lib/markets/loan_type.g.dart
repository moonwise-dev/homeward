// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoanType _$LoanTypeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LoanType', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'label',
          'rateType',
          'referenceRateId',
          'typicalSpread',
          'fixedYears',
          'sourceId',
        ],
      );
      final val = _LoanType(
        id: $checkedConvert('id', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        rateType: $checkedConvert(
          'rateType',
          (v) => $enumDecode(_$RateTypeEnumMap, v),
        ),
        referenceRateId: $checkedConvert('referenceRateId', (v) => v as String),
        typicalSpread: $checkedConvert(
          'typicalSpread',
          (v) => RateRange.fromJson(v as Map<String, dynamic>),
        ),
        fixedYears: $checkedConvert(
          'fixedYears',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$LoanTypeToJson(_LoanType instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'rateType': _$RateTypeEnumMap[instance.rateType]!,
  'referenceRateId': instance.referenceRateId,
  'typicalSpread': instance.typicalSpread.toJson(),
  'fixedYears': instance.fixedYears,
  'sourceId': instance.sourceId,
};

const _$RateTypeEnumMap = {
  RateType.variable: 'variable',
  RateType.mixed: 'mixed',
  RateType.fixed: 'fixed',
};
