// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AreaOption _$AreaOptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AreaOption', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'areaId',
          'areaName',
          'character',
          'homeType',
          'rooms',
          'sizeM2',
          'price',
          'pricePerM2',
          'priceSource',
          'minutes',
          'mode',
          'anchorLabel',
        ],
      );
      final val = _AreaOption(
        id: $checkedConvert('id', (v) => v as String),
        areaId: $checkedConvert('areaId', (v) => v as String),
        areaName: $checkedConvert('areaName', (v) => v as String),
        character: $checkedConvert('character', (v) => v as String),
        homeType: $checkedConvert(
          'homeType',
          (v) => $enumDecode(_$HomeTypeEnumMap, v),
        ),
        rooms: $checkedConvert('rooms', (v) => (v as num).toInt()),
        sizeM2: $checkedConvert('sizeM2', (v) => (v as num).toInt()),
        price: $checkedConvert(
          'price',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        pricePerM2: $checkedConvert(
          'pricePerM2',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        priceSource: $checkedConvert('priceSource', (v) => v as String),
        minutes: $checkedConvert('minutes', (v) => (v as num?)?.toInt()),
        mode: $checkedConvert(
          'mode',
          (v) => $enumDecodeNullable(_$TravelModeEnumMap, v),
        ),
        anchorLabel: $checkedConvert('anchorLabel', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AreaOptionToJson(_AreaOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'areaId': instance.areaId,
      'areaName': instance.areaName,
      'character': instance.character,
      'homeType': _$HomeTypeEnumMap[instance.homeType]!,
      'rooms': instance.rooms,
      'sizeM2': instance.sizeM2,
      'price': instance.price.toJson(),
      'pricePerM2': instance.pricePerM2.toJson(),
      'priceSource': instance.priceSource,
      'minutes': ?instance.minutes,
      'mode': ?_$TravelModeEnumMap[instance.mode],
      'anchorLabel': ?instance.anchorLabel,
    };

const _$HomeTypeEnumMap = {HomeType.flat: 'flat', HomeType.house: 'house'};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.bike: 'bike',
  TravelMode.car: 'car',
  TravelMode.transit: 'transit',
};
