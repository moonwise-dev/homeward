import 'package:common/common.dart';

import 'sample_data.dart';
import 'swipe_deck.dart';

final class SampleDirectory {
  const SampleDirectory(this._data);

  final SampleData _data;

  SampleCity? city(String? id) => id == null ? null : _data.cities[id];

  SampleCity? cityNamed(String place) =>
      _data.cities.values.where((city) => city.isNamed(place)).firstOrNull;

  List<Listing> listingsIn(String cityId) => _data.listings[cityId] ?? const [];

  Photo? photo(String id) => _data.photos.photoWith(id);

  List<Listing> swipeDeckOf(String? cityId) =>
      cityId == null ? const [] : swipeDeck(listingsIn(cityId));

  Map<String, List<Photo>> lineupsOf(String? cityId) => {
    for (final MapEntry(key: name, value: ids)
        in city(cityId)?.lineups.entries ??
            const <MapEntry<String, List<String>>>[])
      if (ids.isNotEmpty) name: [for (final id in ids) ?photo(id)],
  };
}
