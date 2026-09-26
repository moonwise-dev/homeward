import 'package:common/common.dart';

final class SamplePick {
  const SamplePick({
    required this.homes,
    required this.considered,
    required this.ruledOut,
    required this.fitLessWell,
    required this.relaxed,
  });

  final List<Listing> homes;
  final int considered;
  final Map<String, int> ruledOut;
  final int fitLessWell;
  final List<String> relaxed;

  Map<String, Object?> toSummary() => {
    'considered': considered,
    'ruledOut': ruledOut,
    'fitLessWell': fitLessWell,
    'kept': homes.length,
    if (relaxed.isNotEmpty) 'relaxed': relaxed,
  };
}

typedef _Pass = ({
  List<String> relaxed,
  double stretch,
  bool area,
  bool type,
  bool rooms,
  bool needs,
});

const _passes = <_Pass>[
  (relaxed: [], stretch: 1.1, area: true, type: true, rooms: true, needs: true),
  (
    relaxed: ['price'],
    stretch: 1.25,
    area: true,
    type: true,
    rooms: true,
    needs: true,
  ),
  (
    relaxed: ['price', 'area'],
    stretch: 1.25,
    area: false,
    type: true,
    rooms: true,
    needs: true,
  ),
  (
    relaxed: ['price', 'area', 'rooms'],
    stretch: 1.25,
    area: false,
    type: true,
    rooms: false,
    needs: true,
  ),
  (
    relaxed: ['price', 'area', 'rooms', 'type'],
    stretch: double.infinity,
    area: false,
    type: false,
    rooms: false,
    needs: true,
  ),
  (
    relaxed: ['price', 'area', 'rooms', 'type', 'needs'],
    stretch: double.infinity,
    area: false,
    type: false,
    rooms: false,
    needs: false,
  ),
];

const _perArea = 2;

SamplePick pickSampleHomes(
  Story story,
  List<Listing> listings, {
  int keep = 3,
}) {
  final verdicts = {
    for (final read in story.readings)
      (read.listingId, read.need): read.verdict,
  };
  bool fails(Listing listing) => story.needs.any(
    (need) => verdicts[(listing.id, need)] == ReadVerdict.fails,
  );
  String? missed(Listing listing, _Pass pass) {
    if (pass.type &&
        story.homeType != null &&
        listing.homeType != story.homeType) {
      return 'type';
    }
    if (pass.area &&
        story.areaIds.isNotEmpty &&
        !story.areaIds.contains(listing.areaId)) {
      return 'area';
    }
    if (story.priceMax case final max?
        when listing.price.minorUnits > max.minorUnits * pass.stretch) {
      return 'price';
    }
    if (pass.rooms && story.rooms != null && listing.rooms < story.rooms!) {
      return 'rooms';
    }
    if (pass.needs && fails(listing)) {
      return 'needs';
    }
    return null;
  }

  var pass = _passes.first;
  var survivors = <Listing>[];
  for (pass in _passes) {
    survivors = [
      for (final listing in listings)
        if (missed(listing, pass) == null) listing,
    ];
    if (survivors.length >= keep) {
      break;
    }
  }
  final ruledOut = <String, int>{};
  for (final listing in listings) {
    if (missed(listing, pass) case final reason?) {
      ruledOut[reason] = (ruledOut[reason] ?? 0) + 1;
    }
  }
  final scores = {
    for (final listing in survivors)
      listing.id:
          _score(story, listing) +
          _needsScore(story.needs, (need) => verdicts[(listing.id, need)]),
  };
  survivors.sort((a, b) => scores[b.id]!.compareTo(scores[a.id]!));
  final kept = <Listing>[];
  for (final listing in survivors) {
    if (kept.where((home) => home.areaId == listing.areaId).length < _perArea) {
      kept.add(listing);
    }
    if (kept.length == keep) {
      break;
    }
  }
  for (final listing in survivors) {
    if (kept.length == keep) {
      break;
    }
    if (!kept.contains(listing)) {
      kept.add(listing);
    }
  }
  return SamplePick(
    homes: kept,
    considered: listings.length,
    ruledOut: ruledOut,
    fitLessWell: survivors.length - kept.length,
    relaxed: [
      for (final filter in pass.relaxed)
        if (switch (filter) {
          'price' => story.priceMax != null,
          'area' => story.areaIds.isNotEmpty,
          'type' => story.homeType != null,
          'needs' => story.needs.isNotEmpty,
          _ => story.rooms != null,
        })
          filter,
    ],
  );
}

double _score(Story story, Listing listing) {
  var score = 0.0;
  if (story.rooms case final rooms?) {
    score += listing.rooms == rooms
        ? 2
        : listing.rooms > rooms
        ? 1
        : -2;
  }
  if (story.outdoor case final outdoor?) {
    score += listing.outdoor.satisfies(outdoor) ? 2 : -1;
  }
  if (story.style case final style?) {
    score += listing.style == style ? 1 : 0;
  }
  if (story.areaIds.contains(listing.areaId)) {
    score += 1;
  }
  if (story.priceMax case final max?) {
    score += listing.price.minorUnits <= max.minorUnits ? 1 : -1;
  }
  final anchor = story.anchors
      .where((anchor) => anchor.point != null)
      .firstOrNull;
  if (anchor != null) {
    final minutes = estimatedMinutes(listing.point, anchor.point!, anchor.mode);
    score += minutes <= anchor.maxMinutes
        ? 2
        : -(minutes - anchor.maxMinutes) / 5;
  }
  return score - listing.percentFromAreaMedian / 20;
}

double _needsScore(
  List<HomeNeed> needs,
  ReadVerdict? Function(HomeNeed need) verdictOf,
) => needs.fold(
  0,
  (score, need) =>
      score +
      switch (verdictOf(need)) {
        ReadVerdict.meets => 2,
        ReadVerdict.fails => -3,
        ReadVerdict.silent || null => -1,
      },
);

int estimatedMinutes(GeoPoint from, GeoPoint to, TravelMode mode) {
  final meters = from.metersTo(to) * 1.3;
  return switch (mode) {
    TravelMode.walk => meters / 80,
    TravelMode.bike => meters / 250,
    TravelMode.car => 5 + meters / 450,
    TravelMode.transit => 8 + meters / 350,
  }.round();
}
