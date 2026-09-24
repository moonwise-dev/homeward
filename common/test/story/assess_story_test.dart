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
}
