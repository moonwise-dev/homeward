import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  const story = Story(
    anchors: [
      Anchor(
        id: 'a1',
        label: 'KTH',
        query: 'KTH',
        point: GeoPoint(lat: 59.3498, lng: 18.0707),
        mode: TravelMode.bike,
        maxMinutes: 25,
      ),
    ],
    candidates: [
      Candidate(
        id: 'c1',
        label: 'Odengatan',
        query: 'Odengatan',
        point: GeoPoint(lat: 59.3431, lng: 18.0490),
      ),
      Candidate(
        id: 'c2',
        label: 'Solna',
        query: 'Solna',
        point: GeoPoint(lat: 59.3600, lng: 18.0000),
      ),
      Candidate(id: 'c3', label: 'Nowhere yet', query: 'somewhere'),
    ],
    criteria: [
      Criterion(kind: CriterionKind.commute, anchorId: 'a1', mustHave: true),
      Criterion(kind: CriterionKind.schools),
    ],
  );

  const measurements = Measurements({
    ('c1', 'commute-a1'): Measurement.route(
      mode: TravelMode.bike,
      minutes: 12,
      meters: 2600,
      path: [
        GeoPoint(lat: 59.3431, lng: 18.0490),
        GeoPoint(lat: 59.3498, lng: 18.0707),
      ],
    ),
    ('c2', 'commute-a1'): Measurement.route(
      mode: TravelMode.bike,
      minutes: 40,
      meters: 7000,
    ),
    ('c1', 'schools'): Measurement.nearest(
      meters: 450,
      name: 'Karlbergsskolan',
      point: GeoPoint(lat: 59.344, lng: 18.041),
    ),
    ('c2', 'schools'): Measurement.nearest(
      meters: 300,
      name: 'Solna skola',
    ),
  });

  final assessment = assessStory(story, measurements);

  test('rows follow the criteria, one cell per located home', () {
    expect(assessment.rows.map((row) => row.label), ['To KTH', 'Schools']);
    expect(assessment.rows.first.cells.map((cell) => cell.candidateId), [
      'c1',
      'c2',
    ]);
  });

  test('a home that misses a must-have ranks below one that keeps it', () {
    final [odengatan, solna] = assessment.candidates;

    expect(odengatan.rank, 1);
    expect(odengatan.score, 100);
    expect(solna.rank, 2);
    expect(solna.missesMustHave, isTrue);
    expect(solna.cons, ['To KTH: 40 min by bike, 15 min over your 25']);
    expect(solna.pros, ['Schools: Solna skola · 300\u00a0m']);
  });

  test('the map carries the anchor, the homes, the places, and the routes', () {
    expect(
      assessment.markers.map((marker) => (marker.id, marker.kind)),
      containsAll([
        ('a1', MapMarkerKind.anchor),
        ('c1', MapMarkerKind.candidate),
        ('c2', MapMarkerKind.candidate),
        ('c1-schools', MapMarkerKind.place),
      ]),
    );
    expect(assessment.routes.map((route) => (route.candidateId, route.label)), [
      ('c1', '12 min'),
      ('c2', '40 min'),
    ]);
    expect(assessment.routes.first.path, hasLength(2));
  });

  test(
    'a sample home says why it fits and where it falls short, with sources',
    () {
      final sek = Currency.parse('SEK');
      final villa = Listing(
        id: 'sto-09',
        areaId: 'danderyd',
        areaName: 'Danderyd',
        name: 'Villa',
        title: 'A pink villa',
        blurb: 'A villa.',
        description:
            'A ramp runs up beside the front steps. All bedrooms are upstairs.',
        address: 'Edsviksvägen 20',
        point: const GeoPoint(lat: 59.3431, lng: 18.0490),
        homeType: HomeType.house,
        rooms: 5,
        bedrooms: 4,
        sizeM2: 158,
        outdoor: OutdoorSpace.garden,
        style: HomeStyle.classic,
        price: Money(minorUnits: 1400000000, currency: sek),
        pricePerM2: Money(minorUnits: 8800000, currency: sek),
        areaPricePerM2: Money(minorUnits: 9000000, currency: sek),
        priceSource: 'Svensk Mäklarstatistik',
        photos: const [],
      );
      final withListing = story.copyWith(
        candidates: [story.candidates.first.copyWith(listing: villa)],
        outdoor: OutdoorSpace.garden,
        areaIds: const ['danderyd'],
        needs: const [
          HomeNeed.stepFree,
          HomeNeed.entryLevelBedroom,
          HomeNeed.pets,
        ],
        readings: const [
          ListingRead(
            listingId: 'sto-09',
            need: HomeNeed.stepFree,
            verdict: ReadVerdict.meets,
            quote: 'A ramp runs up beside the front steps',
          ),
          ListingRead(
            listingId: 'sto-09',
            need: HomeNeed.entryLevelBedroom,
            verdict: ReadVerdict.fails,
            quote: 'All bedrooms are upstairs',
          ),
          ListingRead(
            listingId: 'sto-09',
            need: HomeNeed.pets,
            verdict: ReadVerdict.silent,
          ),
        ],
      );

      final home = assessStory(withListing, measurements).candidates.single;

      expect(home.why.map((reason) => (reason.text, reason.source)).take(3), [
        ('Step-free entry', ReasonSource.listing),
        ('A garden', ReasonSource.buyer),
        ('In Danderyd', ReasonSource.buyer),
      ]);
      expect(home.why.first.quote, 'A ramp runs up beside the front steps');
      expect(
        home.why.skip(3).map((reason) => reason.source),
        everyElement(ReasonSource.measured),
      );
      expect(home.shortfalls.take(2).map((reason) => reason.status), [
        FitStatus.misses,
        FitStatus.close,
      ]);
      expect(home.shortfalls.first.quote, 'All bedrooms are upstairs');
    },
  );

  test('a week in travel is every trip there and back, as often as the '
      'buyer goes', () {
    final threeDays = story.copyWith(
      anchors: [story.anchors.single.copyWith(perWeek: 3)],
    );
    final assessed = assessStory(threeDays, measurements);
    final byId = {for (final home in assessed.candidates) home.id: home};

    expect(byId['c1']!.weeklyMinutes, 2 * 12 * 3);
    expect(byId['c2']!.weeklyMinutes, 2 * 40 * 3);
    expect(
      assessed.routes.firstWhere((route) => route.candidateId == 'c1'),
      isA<MapRoute>()
          .having((route) => route.perWeek, 'perWeek', 3)
          .having((route) => route.destination.label, 'destination', 'KTH')
          .having((route) => route.origin.label, 'origin', 'Odengatan'),
    );
  });
}
