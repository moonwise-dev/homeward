// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefundRule _$RefundRuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RefundRule', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'when',
          'recomputeAs',
          'deadline',
          'claimWindow',
          'sourceId',
        ],
      );
      final val = _RefundRule(
        when: $checkedConvert(
          'when',
          (v) => BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        recomputeAs: $checkedConvert(
          'recomputeAs',
          (v) => BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        deadline: $checkedConvert(
          'deadline',
          (v) => const PeriodJsonConverter().fromJson(v as String),
        ),
        claimWindow: $checkedConvert(
          'claimWindow',
          (v) => const PeriodJsonConverter().fromJson(v as String),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$RefundRuleToJson(_RefundRule instance) =>
    <String, dynamic>{
      'when': instance.when.toJson(),
      'recomputeAs': instance.recomputeAs.toJson(),
      'deadline': const PeriodJsonConverter().toJson(instance.deadline),
      'claimWindow': const PeriodJsonConverter().toJson(instance.claimWindow),
      'sourceId': instance.sourceId,
    };
