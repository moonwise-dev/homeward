// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateRange _$RateRangeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RateRange', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['min', 'max']);
      final val = _RateRange(
        min: $checkedConvert(
          'min',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        max: $checkedConvert(
          'max',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RateRangeToJson(_RateRange instance) =>
    <String, dynamic>{
      'min': const PercentJsonConverter().toJson(instance.min),
      'max': const PercentJsonConverter().toJson(instance.max),
    };
