// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stress_curve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StressCurve _$StressCurveFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_StressCurve',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'points',
        'todayRatePpm',
        'stressRatePpm',
        'afterDeduction',
        'limit',
        'limitKind',
      ],
    );
    final val = _StressCurve(
      points: $checkedConvert(
        'points',
        (v) => (v as List<dynamic>)
            .map((e) => StressPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      todayRate: $checkedConvert(
        'todayRatePpm',
        (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
      ),
      stressRate: $checkedConvert(
        'stressRatePpm',
        (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
      ),
      afterDeduction: $checkedConvert('afterDeduction', (v) => v as bool),
      limit: $checkedConvert(
        'limit',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
      limitKind: $checkedConvert(
        'limitKind',
        (v) => $enumDecodeNullable(_$ConstraintKindEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'todayRate': 'todayRatePpm',
    'stressRate': 'stressRatePpm',
  },
);

Map<String, dynamic> _$StressCurveToJson(_StressCurve instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
      'todayRatePpm': const PpmJsonConverter().toJson(instance.todayRate),
      'stressRatePpm': const PpmJsonConverter().toJson(instance.stressRate),
      'afterDeduction': instance.afterDeduction,
      'limit': ?instance.limit?.toJson(),
      'limitKind': ?_$ConstraintKindEnumMap[instance.limitKind],
    };

const _$ConstraintKindEnumMap = {
  ConstraintKind.loanToValue: 'loanToValue',
  ConstraintKind.loanToIncome: 'loanToIncome',
  ConstraintKind.debtServiceToIncome: 'debtServiceToIncome',
  ConstraintKind.leftToLiveOn: 'leftToLiveOn',
};

_StressPoint _$StressPointFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StressPoint', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['annualRatePpm', 'cost']);
      final val = _StressPoint(
        annualRate: $checkedConvert(
          'annualRatePpm',
          (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
        ),
        cost: $checkedConvert(
          'cost',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'annualRate': 'annualRatePpm'});

Map<String, dynamic> _$StressPointToJson(_StressPoint instance) =>
    <String, dynamic>{
      'annualRatePpm': const PpmJsonConverter().toJson(instance.annualRate),
      'cost': instance.cost.toJson(),
    };
