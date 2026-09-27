import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import '../money/money.dart';
import 'home_style.dart';
import 'home_type.dart';
import 'outdoor_space.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@freezed
abstract class Listing with _$Listing {
  const factory Listing({
    required String id,
    required String areaId,
    required String areaName,
    required String name,
    required String title,
    required String blurb,
    @Default('') String description,
    required String address,
    required GeoPoint point,
    required HomeType homeType,
    required int rooms,
    required int bedrooms,
    required int sizeM2,
    int? floor,
    int? yearBuilt,
    required OutdoorSpace outdoor,
    required HomeStyle style,
    required Money price,
    Money? monthlyFee,
    required Money pricePerM2,
    required Money areaPricePerM2,
    required String priceSource,
    required List<String> photos,
    String? photoCredit,
  }) = _Listing;

  const Listing._();

  factory Listing.fromJson(Map<String, Object?> json) =>
      _$ListingFromJson(json);

  int get percentFromAreaMedian =>
      ((pricePerM2.minorUnits - areaPricePerM2.minorUnits) *
              100 /
              areaPricePerM2.minorUnits)
          .round();
}
