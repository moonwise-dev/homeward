// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferenceRate _$ReferenceRateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ReferenceRate', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'rate', 'asOf', 'source']);
      final val = _ReferenceRate(
        id: $checkedConvert('id', (v) => v as String),
        rate: $checkedConvert(
          'rate',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        asOf: $checkedConvert(
          'asOf',
          (v) => const CalendarDateJsonConverter().fromJson(v as String),
        ),
        source: $checkedConvert(
          'source',
          (v) => Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ReferenceRateToJson(_ReferenceRate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': const PercentJsonConverter().toJson(instance.rate),
      'asOf': const CalendarDateJsonConverter().toJson(instance.asOf),
      'source': instance.source.toJson(),
    };
