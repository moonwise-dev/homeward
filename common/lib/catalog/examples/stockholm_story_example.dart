import 'dart:convert';

import '../../geo/geo_point.dart';
import '../../money/currency.dart';
import '../../money/money.dart';
import '../../story/anchor.dart';
import '../../story/assessment/assess_story.dart';
import '../../story/assessment/measurement.dart';
import '../../story/assessment/measurements.dart';
import '../../story/candidate.dart';
import '../../story/criterion.dart';
import '../../story/criterion_kind.dart';
import '../../story/story.dart';
import '../../story/story_reason.dart';
import '../../story/travel_mode.dart';

const _kth = GeoPoint(lat: 59.3498, lng: 18.0707);
const _odengatan = GeoPoint(lat: 59.3443, lng: 18.0560);
const _solna = GeoPoint(lat: 59.3589, lng: 17.9995);

final stockholmStory = Story(
  reason: StoryReason.work,
  city: 'Stockholm',
  anchors: const [
    Anchor(
      id: 'a1',
      label: 'KTH',
      query: 'KTH',
      point: _kth,
      mode: TravelMode.bike,
      maxMinutes: 20,
    ),
  ],
  candidates: [
    Candidate(
      id: 'c1',
      label: 'Odengatan',
      query: 'Odengatan 50',
      point: _odengatan,
      price: Money(minorUnits: 495000000, currency: Currency.parse('SEK')),
    ),
    const Candidate(
      id: 'c2',
      label: 'Solna',
      query: 'Solna centrum',
      point: _solna,
    ),
  ],
  criteria: const [
    Criterion(kind: CriterionKind.commute, anchorId: 'a1', mustHave: true),
    Criterion(kind: CriterionKind.schools, mustHave: true),
    Criterion(kind: CriterionKind.parks),
    Criterion(kind: CriterionKind.gym),
    Criterion(kind: CriterionKind.quiet),
    Criterion(kind: CriterionKind.transit),
    Criterion(kind: CriterionKind.noise),
  ],
  committed: true,
);

const stockholmStoryMeasurements = Measurements({
  ('c1', 'commute-a1'): Measurement.route(
    mode: TravelMode.bike,
    minutes: 10,
    meters: 2134,
    path: [
      _odengatan,
      GeoPoint(lat: 59.3452, lng: 18.0631),
      GeoPoint(lat: 59.3473, lng: 18.0690),
      _kth,
    ],
  ),
  ('c2', 'commute-a1'): Measurement.route(
    mode: TravelMode.bike,
    minutes: 26,
    meters: 6120,
    path: [
      _solna,
      GeoPoint(lat: 59.3530, lng: 18.0240),
      GeoPoint(lat: 59.3495, lng: 18.0480),
      _kth,
    ],
  ),
  ('c1', 'schools'): Measurement.nearest(
    meters: 60,
    name: 'Vasa International School',
    point: GeoPoint(lat: 59.3447, lng: 18.0565),
  ),
  ('c2', 'schools'): Measurement.nearest(
    meters: 340,
    name: 'Skytteholmsskolan',
    point: GeoPoint(lat: 59.3610, lng: 18.0030),
  ),
  ('c1', 'parks'): Measurement.nearest(
    meters: 60,
    point: GeoPoint(lat: 59.3439, lng: 18.0553),
  ),
  ('c2', 'parks'): Measurement.nearest(
    meters: 40,
    name: 'Skytteholmsparken',
    point: GeoPoint(lat: 59.3592, lng: 17.9990),
  ),
  ('c1', 'gym'): Measurement.nearest(meters: 60, name: 'Itrim'),
  ('c2', 'gym'): Measurement.nearest(meters: 160, name: 'Friskis & Svettis'),
  ('c1', 'quiet'): Measurement.count(count: 10),
  ('c2', 'quiet'): Measurement.count(count: 1),
  ('c1', 'transit'): Measurement.nearest(meters: 20, name: 'Stadsbiblioteket'),
  ('c2', 'transit'): Measurement.nearest(meters: 30, name: 'Solna centrum'),
  ('c1', 'noise'): Measurement.none(),
  ('c2', 'noise'): Measurement.none(),
});

final stockholmStoryDataModel = jsonDecode(
  jsonEncode({
    'story': {
      'markers': [
        for (final marker in assessStory(
          stockholmStory,
          stockholmStoryMeasurements,
        ).markers)
          if (marker.kind.name != 'place') marker.toJson(),
      ],
      'mode': ['bike'],
      'maxMinutes': 20,
      'picks': {
        'schools': ['schools'],
        'activities': ['parks', 'gym'],
        'evenings': ['quiet'],
        'gettingAround': ['transit'],
        'downsides': ['noise'],
      },
      'mustHaves': ['commute', 'schools'],
    },
    'assessment': assessStory(
      stockholmStory,
      stockholmStoryMeasurements,
    ).toJson(),
  }),
) as Map<String, Object?>;
