import 'package:freezed_annotation/freezed_annotation.dart';

import 'listing.dart';

part 'listing_inventory.freezed.dart';
part 'listing_inventory.g.dart';

@freezed
abstract class ListingInventory with _$ListingInventory {
  const factory ListingInventory({
    required String cityId,
    required List<Listing> listings,
  }) = _ListingInventory;

  factory ListingInventory.fromJson(Map<String, Object?> json) =>
      _$ListingInventoryFromJson(json);
}
