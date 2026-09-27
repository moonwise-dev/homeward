// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_figure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RentFigure _$RentFigureFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RentFigure', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['monthly', 'stated', 'perM2', 'sizeM2', 'source'],
      );
      final val = _RentFigure(
        monthly: $checkedConvert(
          'monthly',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        stated: $checkedConvert('stated', (v) => v as bool),
        perM2: $checkedConvert(
          'perM2',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        sizeM2: $checkedConvert('sizeM2', (v) => (v as num?)?.toInt()),
        source: $checkedConvert('source', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RentFigureToJson(_RentFigure instance) =>
    <String, dynamic>{
      'monthly': instance.monthly.toJson(),
      'stated': instance.stated,
      'perM2': ?instance.perM2?.toJson(),
      'sizeM2': ?instance.sizeM2,
      'source': ?instance.source,
    };
