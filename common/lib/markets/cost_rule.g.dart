// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CostRule _$CostRuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CostRule', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'group',
          'label',
          'localTerm',
          'appliesTo',
          'base',
          'calculation',
          'recurrence',
          'rounding',
          'refund',
          'sourceId',
        ],
      );
      final val = _CostRule(
        id: $checkedConvert('id', (v) => v as String),
        group: $checkedConvert('group', (v) => v as String?),
        label: $checkedConvert('label', (v) => v as String),
        localTerm: $checkedConvert('localTerm', (v) => v as String?),
        appliesTo: $checkedConvert(
          'appliesTo',
          (v) => v == null
              ? null
              : BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        base: $checkedConvert('base', (v) => $enumDecode(_$CostBaseEnumMap, v)),
        calculation: $checkedConvert(
          'calculation',
          (v) => CostCalculation.fromJson(v as Map<String, dynamic>),
        ),
        recurrence: $checkedConvert(
          'recurrence',
          (v) => $enumDecode(_$RecurrenceEnumMap, v),
        ),
        rounding: $checkedConvert(
          'rounding',
          (v) => v == null
              ? Rounding.halfUp
              : Rounding.fromJson(v as Map<String, dynamic>),
        ),
        refund: $checkedConvert(
          'refund',
          (v) =>
              v == null ? null : RefundRule.fromJson(v as Map<String, dynamic>),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CostRuleToJson(_CostRule instance) => <String, dynamic>{
  'id': instance.id,
  'group': ?instance.group,
  'label': instance.label,
  'localTerm': ?instance.localTerm,
  'appliesTo': ?instance.appliesTo?.toJson(),
  'base': _$CostBaseEnumMap[instance.base]!,
  'calculation': instance.calculation.toJson(),
  'recurrence': _$RecurrenceEnumMap[instance.recurrence]!,
  'rounding': instance.rounding.toJson(),
  'refund': ?instance.refund?.toJson(),
  'sourceId': instance.sourceId,
};

const _$CostBaseEnumMap = {
  CostBase.price: 'price',
  CostBase.loan: 'loan',
  CostBase.pledgedAmount: 'pledgedAmount',
  CostBase.fixed: 'fixed',
};

const _$RecurrenceEnumMap = {
  Recurrence.once: 'once',
  Recurrence.monthly: 'monthly',
  Recurrence.yearly: 'yearly',
};
