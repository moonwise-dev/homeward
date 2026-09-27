import 'package:freezed_annotation/freezed_annotation.dart';

import 'listing.dart';

part 'listing_inventory.freezed.dart';
part 'listing_inventory.g.dart';

@freezed
abstract class ListingInventory with _$ListingInventory {
  const factory ListingInventory({
    required String cityId,
    required String name,
    required String marketId,
    required List<Listing> listings,
  }) = _ListingInventory;

  const ListingInventory._();

  factory ListingInventory.fromJson(Map<String, Object?> json) =>
      _$ListingInventoryFromJson(json);

  List<String> get areaNames => [
    ...{for (final listing in listings) listing.areaName},
  ];
}
