// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListingInventory _$ListingInventoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ListingInventory', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['cityId', 'listings']);
      final val = _ListingInventory(
        cityId: $checkedConvert('cityId', (v) => v as String),
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
      'listings': instance.listings.map((e) => e.toJson()).toList(),
    };
