import 'package:freezed_annotation/freezed_annotation.dart';

import 'market_id.dart';
import 'market_id_json_converter.dart';
import 'source.dart';

part 'place_directory.freezed.dart';
part 'place_directory.g.dart';

enum PlaceKind { region, island, municipality }

@freezed
abstract class Place with _$Place {
  const factory Place({
    required String name,
    @Default([]) List<String> aliases,
    required PlaceKind kind,
    @MarketIdJsonConverter() required List<MarketId> marketIds,
  }) = _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}

@freezed
abstract class PlaceDirectory with _$PlaceDirectory {
  const factory PlaceDirectory({
    required Source source,
    required List<Place> places,
  }) = _PlaceDirectory;

  const PlaceDirectory._();

  factory PlaceDirectory.fromJson(Map<String, Object?> json) =>
      _$PlaceDirectoryFromJson(json);

  List<MarketId> marketsNamed(String name) {
    final wanted = normalizePlaceName(name);
    return {
      for (final place in places)
        if ([
          place.name,
          ...place.aliases,
        ].map(normalizePlaceName).contains(wanted))
          ...place.marketIds,
    }.toList();
  }

  Set<MarketId> get distinctRuleRegions => {
    for (final place in places)
      for (final marketId in place.marketIds)
        if (marketId.isRegion) marketId,
  };
}

String normalizePlaceName(String name) => name
    .trim()
    .toLowerCase()
    .replaceAll(RegExp(r'\s+'), ' ')
    .split('')
    .map((character) => _foldedCharacters[character] ?? character)
    .join();

const _foldedCharacters = {
  'á': 'a',
  'à': 'a',
  'â': 'a',
  'ã': 'a',
  'ä': 'a',
  'å': 'a',
  'ç': 'c',
  'é': 'e',
  'è': 'e',
  'ê': 'e',
  'ë': 'e',
  'í': 'i',
  'ì': 'i',
  'î': 'i',
  'ï': 'i',
  'ñ': 'n',
  'ó': 'o',
  'ò': 'o',
  'ô': 'o',
  'õ': 'o',
  'ö': 'o',
  'ø': 'o',
  'ú': 'u',
  'ù': 'u',
  'û': 'u',
  'ü': 'u',
  'ý': 'y',
  'ÿ': 'y',
};
