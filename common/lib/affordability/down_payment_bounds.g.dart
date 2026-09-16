// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'down_payment_bounds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownPaymentBounds _$DownPaymentBoundsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DownPaymentBounds', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['min', 'max', 'step']);
      final val = _DownPaymentBounds(
        min: $checkedConvert(
          'min',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        max: $checkedConvert(
          'max',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        step: $checkedConvert(
          'step',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DownPaymentBoundsToJson(_DownPaymentBounds instance) =>
    <String, dynamic>{
      'min': instance.min.toJson(),
      'max': instance.max.toJson(),
      'step': instance.step.toJson(),
    };
