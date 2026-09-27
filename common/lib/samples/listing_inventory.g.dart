// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListingInventory _$ListingInventoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ListingInventory', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['cityId', 'name', 'marketId', 'listings'],
      );
      final val = _ListingInventory(
        cityId: $checkedConvert('cityId', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        marketId: $checkedConvert('marketId', (v) => v as String),
        listings: $checkedConvert(
          'listings',
          (v) => (v as List<dynamic>)
              .map((e) => Listing.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListingInventoryToJson(_ListingInventory instance) =>
    <String, dynamic>{
      'cityId': instance.cityId,
      'name': instance.name,
      'marketId': instance.marketId,
      'listings': instance.listings.map((e) => e.toJson()).toList(),
    };
