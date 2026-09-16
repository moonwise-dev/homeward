// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bracket_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BracketRule _$BracketRuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BracketRule', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['upTo', 'rate', 'deduction']);
      final val = _BracketRule(
        upTo: $checkedConvert(
          'upTo',
          (v) => _$JsonConverterFromJson<String, ExactDecimal>(
            v,
            const ExactDecimalJsonConverter().fromJson,
          ),
        ),
        rate: $checkedConvert(
          'rate',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        deduction: $checkedConvert(
          'deduction',
          (v) => _$JsonConverterFromJson<String, ExactDecimal>(
            v,
            const ExactDecimalJsonConverter().fromJson,
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BracketRuleToJson(_BracketRule instance) =>
    <String, dynamic>{
      'upTo': ?_$JsonConverterToJson<String, ExactDecimal>(
        instance.upTo,
        const ExactDecimalJsonConverter().toJson,
      ),
      'rate': const PercentJsonConverter().toJson(instance.rate),
      'deduction': ?_$JsonConverterToJson<String, ExactDecimal>(
        instance.deduction,
        const ExactDecimalJsonConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
