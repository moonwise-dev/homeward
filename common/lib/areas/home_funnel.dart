import '../samples/home_type.dart';
import '../samples/listing.dart';
import '../samples/outdoor_space.dart';
import 'city_homes.dart';

enum MustHaveKind {
  bedrooms('bedrooms at least', takesNumber: true),
  size('square metres at least', takesNumber: true),
  balcony('a balcony or a garden'),
  garden('a garden'),
  house('a house'),
  flat('a flat'),
  lift('a lift'),
  builtAfter('built in this year or later', takesNumber: true);

  const MustHaveKind(this.meaning, {this.takesNumber = false});

  final String meaning;
  final bool takesNumber;

  static MustHaveKind? fromWire(Object? name) {
    for (final kind in values) {
      if (kind.name == name) {
        return kind;
      }
    }
    return null;
  }
}

final class MustHaveRule {
  const MustHaveRule(this.kind, {this.atLeast});

  final MustHaveKind kind;
  final int? atLeast;

  bool keeps(Listing listing) => switch (kind) {
    MustHaveKind.bedrooms => listing.bedrooms >= (atLeast ?? 1),
    MustHaveKind.size => listing.sizeM2 >= (atLeast ?? 0),
    MustHaveKind.balcony => listing.outdoor.satisfies(OutdoorSpace.balcony),
    MustHaveKind.garden => listing.outdoor == OutdoorSpace.garden,
    MustHaveKind.house => listing.homeType == HomeType.house,
    MustHaveKind.flat => listing.homeType == HomeType.flat,
    MustHaveKind.lift => listing.lift ?? false,
    MustHaveKind.builtAfter => (listing.yearBuilt ?? 0) >= (atLeast ?? 0),
  };

  @override
  bool operator ==(Object other) =>
      other is MustHaveRule && other.kind == kind && other.atLeast == atLeast;

  @override
  int get hashCode => Object.hash(kind, atLeast);
}

final class Narrowing {
  const Narrowing({this.maxMinutes, this.mustHaves = const {}});

  final int? maxMinutes;
  final Set<MustHaveRule> mustHaves;

  Narrowing withLimit(int? minutes) =>
      Narrowing(maxMinutes: minutes, mustHaves: mustHaves);

  Narrowing toggled(MustHaveRule mustHave) => Narrowing(
    maxMinutes: maxMinutes,
    mustHaves: mustHaves.contains(mustHave)
        ? {...mustHaves}.difference({mustHave})
        : {...mustHaves, mustHave},
  );

  Narrowing including(MustHaveRule mustHave) =>
      Narrowing(maxMinutes: maxMinutes, mustHaves: {...mustHaves, mustHave});
}

typedef FunnelCounts = ({int city, int budget, int week, int mustHaves});

extension HomeFunnel on CityHomes {
  List<MapHome> get affordable => [
    for (final home in homes)
      if (home.withinBudget != false) home,
  ];

  bool withinTravel(MapHome home, int? maxMinutes) {
    final place = mainPlace;
    if (maxMinutes == null || place == null) {
      return true;
    }
    final minutes = minutesTo(home, place.id);
    return minutes != null && minutes <= maxMinutes;
  }

  bool keepsAll(MapHome home, Iterable<MustHaveRule> mustHaves) =>
      mustHaves.every((mustHave) => mustHave.keeps(home.listing));

  List<MapHome> narrowed(Narrowing narrowing) => ranked([
    for (final home in affordable)
      if (withinTravel(home, narrowing.maxMinutes) &&
          keepsAll(home, narrowing.mustHaves))
        home,
  ]);

  int keeps(Narrowing narrowing, MustHaveRule mustHave) =>
      narrowed(narrowing.including(mustHave)).length;

  FunnelCounts counts(Narrowing narrowing) {
    final budget = affordable;
    final week = [
      for (final home in budget)
        if (withinTravel(home, narrowing.maxMinutes)) home,
    ];
    return (
      city: homes.length,
      budget: budget.length,
      week: week.length,
      mustHaves: week
          .where((home) => keepsAll(home, narrowing.mustHaves))
          .length,
    );
  }

  List<MapHome> ranked(Iterable<MapHome> homes) => [...homes]
    ..sort((a, b) {
      final byWeek = _compareNullable(weeklyMinutes(a), weeklyMinutes(b));
      if (byWeek != 0) {
        return byWeek;
      }
      return _compareNullable(
        a.monthly?.minorUnits ?? a.price.minorUnits,
        b.monthly?.minorUnits ?? b.price.minorUnits,
      );
    });

  ({int least, int most})? get minutesRange {
    final place = mainPlace;
    if (place == null) {
      return null;
    }
    final minutes = [
      for (final area in areas) ?area.minutes[place.id],
    ];
    if (minutes.isEmpty) {
      return null;
    }
    minutes.sort();
    return (least: minutes.first, most: minutes.last);
  }
}

int _compareNullable(int? a, int? b) => switch ((a, b)) {
  (null, null) => 0,
  (null, _) => 1,
  (_, null) => -1,
  (final a?, final b?) => a.compareTo(b),
};
