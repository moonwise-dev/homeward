// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_calculation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlatRateCalculation _$FlatRateCalculationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FlatRateCalculation', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['rate', 'type']);
      final val = FlatRateCalculation(
        rate: $checkedConvert(
          'rate',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$FlatRateCalculationToJson(
  FlatRateCalculation instance,
) => <String, dynamic>{
  'rate': const PercentJsonConverter().toJson(instance.rate),
  'type': instance.$type,
};

BracketsCalculation _$BracketsCalculationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BracketsCalculation', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['brackets', 'marginal', 'type']);
      final val = BracketsCalculation(
        brackets: $checkedConvert(
          'brackets',
          (v) => (v as List<dynamic>)
              .map((e) => BracketRule.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        marginal: $checkedConvert('marginal', (v) => v as bool),
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$BracketsCalculationToJson(
  BracketsCalculation instance,
) => <String, dynamic>{
  'brackets': instance.brackets.map((e) => e.toJson()).toList(),
  'marginal': instance.marginal,
  'type': instance.$type,
};

FixedCalculation _$FixedCalculationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FixedCalculation', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['amount', 'type']);
      final val = FixedCalculation(
        amount: $checkedConvert(
          'amount',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
        $type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$FixedCalculationToJson(FixedCalculation instance) =>
    <String, dynamic>{
      'amount': const ExactDecimalJsonConverter().toJson(instance.amount),
      'type': instance.$type,
    };

PercentWithMinCalculation _$PercentWithMinCalculationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PercentWithMinCalculation', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['rate', 'min', 'type']);
  final val = PercentWithMinCalculation(
    rate: $checkedConvert(
      'rate',
      (v) => const PercentJsonConverter().fromJson(v as String),
    ),
    min: $checkedConvert(
      'min',
      (v) => const ExactDecimalJsonConverter().fromJson(v as String),
    ),
    $type: $checkedConvert('type', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {r'$type': 'type'});

Map<String, dynamic> _$PercentWithMinCalculationToJson(
  PercentWithMinCalculation instance,
) => <String, dynamic>{
  'rate': const PercentJsonConverter().toJson(instance.rate),
  'min': const ExactDecimalJsonConverter().toJson(instance.min),
  'type': instance.$type,
};
