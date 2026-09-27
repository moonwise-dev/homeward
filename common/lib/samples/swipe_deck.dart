import 'dart:math';

import 'home_style.dart';
import 'home_type.dart';
import 'listing.dart';
import 'outdoor_space.dart';

List<Listing> swipeDeck(List<Listing> listings, {int count = 6}) {
  final groups = <(HomeType, OutdoorSpace, HomeStyle), List<Listing>>{};
  for (final listing in listings) {
    groups
        .putIfAbsent(
          (listing.homeType, listing.outdoor, listing.style),
          () => [],
        )
        .add(listing);
  }
  final queues = [
    for (final group in groups.values)
      [...group]..sort((a, b) => a.sizeM2.compareTo(b.sizeM2)),
  ];
  final deck = <Listing>[];
  for (var round = 0; deck.length < count; round++) {
    final picked = [
      for (final queue in queues)
        if (round < queue.length) queue[round],
    ];
    if (picked.isEmpty) {
      break;
    }
    deck.addAll(picked.take(count - deck.length));
  }
  final flats = [
    for (final home in deck)
      if (home.homeType == HomeType.flat) home,
  ];
  final houses = [
    for (final home in deck)
      if (home.homeType == HomeType.house) home,
  ];
  return [
    for (var index = 0; index < max(flats.length, houses.length); index++) ...[
      if (index < flats.length) flats[index],
      if (index < houses.length) houses[index],
    ],
  ];
}

typedef SwipeReading = ({
  HomeType? homeType,
  OutdoorSpace? outdoor,
  HomeStyle? style,
});

SwipeReading readSwipe(List<Listing> kept, List<Listing> passed) {
  T? shared<T>(T Function(Listing listing) trait) {
    if (kept.isEmpty) {
      return null;
    }
    final value = trait(kept.first);
    return kept.every((home) => trait(home) == value) &&
            passed.any((home) => trait(home) != value)
        ? value
        : null;
  }

  final least = kept.isEmpty
      ? null
      : kept
            .map((home) => home.outdoor)
            .reduce((a, b) => a.index <= b.index ? a : b);
  return (
    homeType: shared((home) => home.homeType),
    outdoor:
        least != null &&
            least != OutdoorSpace.none &&
            passed.any((home) => home.outdoor.index < least.index)
        ? least
        : null,
    style: shared((home) => home.style),
  );
}
