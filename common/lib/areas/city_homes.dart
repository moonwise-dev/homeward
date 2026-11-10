import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo_point.dart';
import '../geo/travel_mode.dart';
import '../money/money.dart';
import '../profile/profile_assumption.dart';
import '../rent/rent_figure.dart';
import '../samples/priced_home.dart';
import '../samples/listing.dart';

part 'city_homes.freezed.dart';
part 'city_homes.g.dart';

@freezed
abstract class CityHomes with _$CityHomes {
  const factory CityHomes({
    required String cityId,
    required String cityName,
    required GeoPoint centre,
    @Default(false) bool renting,
    Money? highestPrice,
    MapHousehold? household,
    @Default([]) List<MapPlace> places,
    @Default([]) List<MapArea> areas,
    @Default([]) List<MapHome> homes,
  }) = _HomeMap;

  const CityHomes._();

  factory CityHomes.fromJson(Map<String, Object?> json) =>
      _$CityHomesFromJson(json);

  MapPlace? get mainPlace => places.isEmpty
      ? null
      : places.reduce((a, b) => b.perWeek > a.perWeek ? b : a);

  MapArea? areaOf(MapHome home) {
    for (final area in areas) {
      if (area.areaId == home.listing.areaId) {
        return area;
      }
    }
    return null;
  }

  int? minutesTo(MapHome home, String placeId) =>
      areaOf(home)?.minutes[placeId];

  int? weeklyMinutes(MapHome home) {
    if (places.isEmpty) {
      return null;
    }
    var total = 0;
    for (final place in places) {
      final minutes = minutesTo(home, place.id);
      if (minutes == null) {
        return null;
      }
      total += minutes * place.perWeek * 2;
    }
    return total;
  }

  MapHome? home(String id) {
    for (final home in homes) {
      if (home.listing.id == id) {
        return home;
      }
    }
    return null;
  }
}

@freezed
abstract class MapHousehold with _$MapHousehold {
  const factory MapHousehold({
    int? adults,
    List<int>? childAges,
    Money? grossMonthlyIncome,
    Money? savings,
    Money? maxRent,
    @Default({}) Set<ProfileAssumption> assumed,
  }) = _MapHousehold;

  factory MapHousehold.fromJson(Map<String, Object?> json) =>
      _$MapHouseholdFromJson(json);
}

@freezed
abstract class MapPlace with _$MapPlace {
  const factory MapPlace({
    required String id,
    required String name,
    required GeoPoint point,
    required int perWeek,
    required TravelMode mode,
    @Default(false) bool assumed,
  }) = _MapPlace;

  factory MapPlace.fromJson(Map<String, Object?> json) =>
      _$MapPlaceFromJson(json);
}

@freezed
abstract class MapArea with _$MapArea {
  const factory MapArea({
    required String areaId,
    required String areaName,
    required GeoPoint centre,
    @Default({}) Map<String, int> minutes,
    @Default({}) Map<String, String> routes,
  }) = _MapArea;

  factory MapArea.fromJson(Map<String, Object?> json) =>
      _$MapAreaFromJson(json);
}

@freezed
abstract class MapHome with _$MapHome {
  const factory MapHome({
    required Listing listing,
    HomeCost? cost,
    RentFigure? rent,
    Money? ifRatesRise,
    bool? withinBudget,
    String? why,
  }) = _MapHome;

  const MapHome._();

  factory MapHome.fromJson(Map<String, Object?> json) =>
      _$MapHomeFromJson(json);

  Money? get monthly => cost?.monthly.totalWithFee ?? rent?.monthly;

  Money get price => rent?.monthly ?? listing.price;
}
