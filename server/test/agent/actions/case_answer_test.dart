import 'package:common/common.dart';
import 'package:homeward_server/agent/actions/apply_action.dart';
import 'package:test/test.dart';

import '../../tools/tool_fixtures.dart';

void main() {
  const student = Story(
    reason: StoryReason.study,
    city: 'Stockholm',
    sampleCity: 'stockholm',
    anchors: [
      Anchor(
        id: 'a1',
        label: 'KTH',
        query: 'KTH',
        point: GeoPoint(lat: 59.3498, lng: 18.0707),
      ),
    ],
  );

  ClientAction answer(Map<String, Object?> context) => ClientAction(
    name: 'answer',
    surfaceId: 't2-clue',
    sourceComponentId: 'root',
    context: context,
  );

  ({Story story, Map<String, Object?> summary}) apply(
    Map<String, Object?> context, {
    Story story = student,
    Map<String, Object?> surfaceData = const {},
  }) {
    final outcome = applyAction(
      action: answer(context),
      surfaceData: surfaceData,
      plan: Plan(story: story),
      markets: realMarkets,
    );
    return (story: outcome.plan.story, summary: outcome.summary);
  }

  test('a travel mode moves every anchor and counts as a question', () {
    final result = apply({
      'facet': 'mode',
      'value': 'bike',
      'label': 'By bike',
    });

    expect(result.story.mode, TravelMode.bike);
    expect(result.story.anchors.single.mode, TravelMode.bike);
    expect(result.story.answered, contains(CaseFacet.mode));
    expect(result.story.questions, 1);
    expect(result.summary, containsPair('applied', true));
    expect(result.summary['stillOpen'], contains('household'));
  });

  test('a photo applies the traits the server holds for it', () {
    final story = apply({
      'facet': 'photo',
      'value': 'sto-11-1',
      'label': 'A wooden house with a garden',
    }).story;

    expect(story.homeType, HomeType.house);
    expect(story.outdoor, OutdoorSpace.garden);
    expect(story.style, HomeStyle.classic);
    expect(
      story.answered,
      containsAll([CaseFacet.photo, CaseFacet.homeType, CaseFacet.outdoor]),
    );
  });

  test('a life photo adds what matters and the areas it points at', () {
    final story = apply({'facet': 'photo', 'value': 'sto-life-1'}).story;

    expect(
      story.criteria.map((criterion) => criterion.kind),
      contains(CriterionKind.water),
    );
    expect(story.areaIds, contains('lidingo'));
  });

  test('a trade-off pick sets the area, the home, and a price range', () {
    final option = AreaOption(
      id: 'o1',
      areaId: 'danderyd',
      areaName: 'Danderyd',
      character: 'Leafy villas',
      homeType: HomeType.house,
      rooms: 5,
      sizeM2: 150,
      price: Money(minorUnits: 1380000000, currency: Currency.parse('SEK')),
      pricePerM2: Money(minorUnits: 9220400, currency: Currency.parse('SEK')),
      priceSource: 'Svensk Mäklarstatistik',
    );
    final story = apply(
      {'facet': 'area', 'value': 'o1'},
      story: student.copyWith(areaOptions: [option]),
    ).story;

    expect(story.areaIds, ['danderyd']);
    expect(story.homeType, HomeType.house);
    expect(story.rooms, 5);
    expect(story.priceMax?.minorUnits, 1518000000);
    expect(story.answered, containsAll([CaseFacet.area, CaseFacet.homeType]));
  });

  test('the household comes from the surface', () {
    final story = apply(
      {'facet': 'household', 'storyPath': '/story'},
      surfaceData: {
        'story': {
          'adults': 2,
          'childAges': [6, 9],
        },
      },
    ).story;

    expect(story.adults, 2);
    expect(story.childAges, [6, 9]);
    expect(
      story.criteria.map((criterion) => criterion.kind),
      containsAll([CriterionKind.schools, CriterionKind.playground]),
    );
  });

  test('a dropped pin becomes an anchor where it was dropped', () {
    final story = apply(
      {
        'facet': 'place',
        'value': '',
        'label': 'Work',
        'pin': {'lat': 59.33, 'lng': 18.06},
      },
      story: const Story(reason: StoryReason.work, city: 'Stockholm'),
    ).story;

    expect(story.anchors.single.label, 'Work');
    expect(story.anchors.single.point, const GeoPoint(lat: 59.33, lng: 18.06));
  });

  test('a named place is left for the map to find', () {
    final outcome = applyAction(
      action: answer({'facet': 'place', 'value': 'KTH', 'label': 'KTH'}),
      surfaceData: const {},
      plan: const Plan(story: Story(city: 'Stockholm')),
      markets: realMarkets,
    );

    expect(outcome.placeToFind, (label: 'KTH', query: 'KTH'));
  });

  test('a value that does not fit its facet is refused', () {
    final result = apply({'facet': 'homeType', 'value': 'castle'});

    expect(result.summary, containsPair('applied', false));
    expect(result.story.questions, 0);
  });

  test('confirming a case in a sample city picks three sample homes', () {
    final outcome = applyAction(
      action: const ClientAction(
        name: 'commit_story',
        surfaceId: 't5-case',
        sourceComponentId: 'find',
        context: {'storyPath': '/story'},
      ),
      surfaceData: const {
        'story': {
          'mode': ['bike'],
          'maxMinutes': 25,
          'picks': {
            'schools': ['schools'],
          },
        },
      },
      plan: Plan(
        story: student.copyWith(
          homeType: HomeType.house,
          outdoor: OutdoorSpace.garden,
        ),
      ),
      markets: realMarkets,
    );
    final homes = outcome.plan.story.candidates;

    expect(homes, hasLength(3));
    expect(
      homes.every((home) => home.listing?.homeType == HomeType.house),
      isTrue,
    );
    expect(homes.map((home) => home.id), ['c1', 'c2', 'c3']);
    expect(outcome.summary['sampleHomes'], containsPair('kept', 3));
  });

  test('needs name what the home must have, and none clears them', () {
    final needs = apply({
      'facet': 'needs',
      'value': 'stepFree,entryLevelShower',
      'label': 'Step-free, with a shower on the entry floor',
    });
    final none = apply({
      'facet': 'needs',
      'value': 'none',
    }, story: needs.story);
    final wrong = apply({'facet': 'needs', 'value': 'stepFree,sauna'});

    expect(needs.story.needs, [HomeNeed.stepFree, HomeNeed.entryLevelShower]);
    expect(needs.story.answered, contains(CaseFacet.needs));
    expect(none.story.needs, isEmpty);
    expect(wrong.summary['applied'], isFalse);
  });

  test('the routine sets how often and adds the places the buyer pinned', () {
    final result = apply(
      {'facet': 'routine', 'storyPath': '/story'},
      surfaceData: {
        'story': {
          'routine': [
            {'id': 'a1', 'label': 'KTH', 'perWeek': 3},
            {
              'id': 'r1',
              'label': 'The clinic',
              'perWeek': 1,
              'pin': {'lat': 59.35, 'lng': 18.03},
            },
            {'id': 'r2', 'label': 'Nowhere', 'perWeek': 2},
          ],
        },
      },
    );

    expect(
      result.story.anchors.map((anchor) => (anchor.label, anchor.perWeek)),
      [
        ('KTH', 3),
        ('The clinic', 1),
      ],
    );
    expect(
      result.story.anchors.last.point,
      const GeoPoint(lat: 59.35, lng: 18.03),
    );
    expect(result.story.answered, contains(CaseFacet.routine));
  });

  test('a swipe sets what every kept home shares and tells the pattern', () {
    final result = apply({
      'facet': 'swipe',
      'value': 'sto-07,sto-09',
      'label': 'Kept 2 of 5',
      'kept': ['sto-07', 'sto-09'],
      'passed': ['sto-01', 'sto-02', 'sto-06'],
    });

    expect(result.story.homeType, HomeType.house);
    expect(result.story.outdoor, OutdoorSpace.garden);
    expect(
      result.story.answered,
      containsAll([CaseFacet.swipe, CaseFacet.homeType, CaseFacet.outdoor]),
    );
    expect(result.summary['pattern'], {
      'kept': 2,
      'passed': 3,
      'everyKeptHome': {'homeType': 'house', 'outdoor': 'garden'},
      'keptAreas': ['Solna', 'Danderyd'],
    });
  });
}
