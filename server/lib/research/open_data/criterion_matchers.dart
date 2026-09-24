import 'package:common/common.dart';

import 'osm_matcher.dart';

const _bars = OsmMatcher('amenity', ['bar', 'pub', 'nightclub']);

const criterionMatchers = <CriterionKind, List<OsmMatcher>>{
  CriterionKind.schools: [
    OsmMatcher('amenity', ['school']),
  ],
  CriterionKind.preschool: [
    OsmMatcher('amenity', ['kindergarten', 'childcare']),
  ],
  CriterionKind.groceries: [
    OsmMatcher('shop', ['supermarket', 'convenience', 'greengrocer']),
  ],
  CriterionKind.pharmacy: [
    OsmMatcher('amenity', ['pharmacy']),
  ],
  CriterionKind.healthcare: [
    OsmMatcher('amenity', ['doctors', 'clinic', 'hospital']),
  ],
  CriterionKind.gym: [
    OsmMatcher('leisure', ['fitness_centre']),
  ],
  CriterionKind.swimming: [
    OsmMatcher('leisure', ['swimming_pool', 'water_park']),
    OsmMatcher('sport', ['swimming']),
  ],
  CriterionKind.parks: [
    OsmMatcher('leisure', ['park', 'nature_reserve']),
  ],
  CriterionKind.running: [
    OsmMatcher('leisure', ['track', 'park', 'nature_reserve']),
  ],
  CriterionKind.playground: [
    OsmMatcher('leisure', ['playground']),
  ],
  CriterionKind.water: [
    OsmMatcher('natural', ['water', 'beach']),
    OsmMatcher('leisure', ['beach_resort', 'marina']),
  ],
  CriterionKind.restaurants: [
    OsmMatcher('amenity', ['restaurant']),
  ],
  CriterionKind.cafes: [
    OsmMatcher('amenity', ['cafe']),
  ],
  CriterionKind.nightlife: [_bars],
  CriterionKind.quiet: [_bars],
  CriterionKind.transit: [
    OsmMatcher('highway', ['bus_stop']),
    OsmMatcher('railway', ['station', 'halt', 'tram_stop', 'subway_entrance']),
  ],
  CriterionKind.parking: [
    OsmMatcher('amenity', ['parking']),
  ],
  CriterionKind.charging: [
    OsmMatcher('amenity', ['charging_station']),
  ],
};

const noiseMatchers = [
  OsmMatcher('highway', ['motorway', 'trunk', 'primary']),
  OsmMatcher('railway', ['rail']),
];

final _notForChildren = RegExp(
  'make ?up|beauty|driving|trafikskola|körskola|dance|dans|music|musik|'
  'language|språk|yoga|art school|konst|adult|vuxen|university|universitet|'
  'college|folkhögskola|academy for',
  caseSensitive: false,
);

bool excludedFeature(CriterionKind kind, Map<String, String> tags) =>
    switch (kind) {
      CriterionKind.schools || CriterionKind.preschool =>
        _notForChildren.hasMatch(tags['name'] ?? '') ||
            tags['school'] == 'driving' ||
            tags['amenity'] == 'driving_school',
      _ => false,
    };
