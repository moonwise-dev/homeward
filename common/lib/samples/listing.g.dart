// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Listing _$ListingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Listing', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'areaId',
          'areaName',
          'name',
          'title',
          'blurb',
          'address',
          'point',
          'homeType',
          'rooms',
          'bedrooms',
          'sizeM2',
          'floor',
          'yearBuilt',
          'outdoor',
          'style',
          'price',
          'monthlyFee',
          'pricePerM2',
          'areaPricePerM2',
          'priceSource',
          'photos',
          'photoCredit',
        ],
      );
      final val = _Listing(
        id: $checkedConvert('id', (v) => v as String),
        areaId: $checkedConvert('areaId', (v) => v as String),
        areaName: $checkedConvert('areaName', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        blurb: $checkedConvert('blurb', (v) => v as String),
        address: $checkedConvert('address', (v) => v as String),
        point: $checkedConvert(
          'point',
          (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
        ),
        homeType: $checkedConvert(
          'homeType',
          (v) => $enumDecode(_$HomeTypeEnumMap, v),
        ),
        rooms: $checkedConvert('rooms', (v) => (v as num).toInt()),
        bedrooms: $checkedConvert('bedrooms', (v) => (v as num).toInt()),
        sizeM2: $checkedConvert('sizeM2', (v) => (v as num).toInt()),
        floor: $checkedConvert('floor', (v) => (v as num?)?.toInt()),
        yearBuilt: $checkedConvert('yearBuilt', (v) => (v as num?)?.toInt()),
        outdoor: $checkedConvert(
          'outdoor',
          (v) => $enumDecode(_$OutdoorSpaceEnumMap, v),
        ),
        style: $checkedConvert(
          'style',
          (v) => $enumDecode(_$HomeStyleEnumMap, v),
        ),
        price: $checkedConvert(
          'price',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        monthlyFee: $checkedConvert(
          'monthlyFee',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        pricePerM2: $checkedConvert(
          'pricePerM2',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        areaPricePerM2: $checkedConvert(
          'areaPricePerM2',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        priceSource: $checkedConvert('priceSource', (v) => v as String),
        photos: $checkedConvert(
          'photos',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        photoCredit: $checkedConvert('photoCredit', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ListingToJson(_Listing instance) => <String, dynamic>{
  'id': instance.id,
  'areaId': instance.areaId,
  'areaName': instance.areaName,
  'name': instance.name,
  'title': instance.title,
  'blurb': instance.blurb,
  'address': instance.address,
  'point': instance.point.toJson(),
  'homeType': _$HomeTypeEnumMap[instance.homeType]!,
  'rooms': instance.rooms,
  'bedrooms': instance.bedrooms,
  'sizeM2': instance.sizeM2,
  'floor': ?instance.floor,
  'yearBuilt': ?instance.yearBuilt,
  'outdoor': _$OutdoorSpaceEnumMap[instance.outdoor]!,
  'style': _$HomeStyleEnumMap[instance.style]!,
  'price': instance.price.toJson(),
  'monthlyFee': ?instance.monthlyFee?.toJson(),
  'pricePerM2': instance.pricePerM2.toJson(),
  'areaPricePerM2': instance.areaPricePerM2.toJson(),
  'priceSource': instance.priceSource,
  'photos': instance.photos,
  'photoCredit': ?instance.photoCredit,
};

const _$HomeTypeEnumMap = {HomeType.flat: 'flat', HomeType.house: 'house'};

const _$OutdoorSpaceEnumMap = {
  OutdoorSpace.none: 'none',
  OutdoorSpace.balcony: 'balcony',
  OutdoorSpace.garden: 'garden',
};

const _$HomeStyleEnumMap = {
  HomeStyle.classic: 'classic',
  HomeStyle.modern: 'modern',
};
