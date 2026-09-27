// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YearRange _$YearRangeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_YearRange', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['min', 'max']);
      final val = _YearRange(
        min: $checkedConvert('min', (v) => (v as num?)?.toInt()),
        max: $checkedConvert('max', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$YearRangeToJson(_YearRange instance) =>
    <String, dynamic>{'min': ?instance.min, 'max': ?instance.max};
