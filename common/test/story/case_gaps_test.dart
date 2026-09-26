import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  const student = Story(reason: StoryReason.study, city: 'Stockholm');

  test(
    'a student with no place yet opens with where they spend their days',
    () {
      expect(caseGaps(student).take(3), [
        CaseFacet.place,
        CaseFacet.household,
        CaseFacet.homeType,
      ]);
    },
  );

  test('a city with sample homes also needs an area and a price range', () {
    expect(
      caseGaps(student.copyWith(sampleCity: 'stockholm')),
      contains(CaseFacet.area),
    );
    expect(caseGaps(student), isNot(contains(CaseFacet.area)));
  });

  test('the questions close once the essentials are answered', () {
    final settled = student.copyWith(
      anchors: const [
        Anchor(
          id: 'a1',
          label: 'KTH',
          query: 'KTH',
          point: GeoPoint(lat: 59.35, lng: 18.07),
        ),
      ],
      adults: 2,
      childAges: const [6, 9],
      homeType: HomeType.house,
      sampleCity: 'stockholm',
      areaIds: const ['danderyd'],
    );

    expect(caseGaps(settled), contains(CaseFacet.routine));
    expect(
      caseQuestionsOpen(settled.answering({CaseFacet.routine})),
      isFalse,
    );
    expect(
      storyDecisions(settled.answering({CaseFacet.routine})).first,
      OpenDecision.caseSummary,
    );
  });

  test('the questions close after six, whatever is still open', () {
    expect(caseQuestionsOpen(student.copyWith(questions: 5)), isTrue);
    expect(caseQuestionsOpen(student.copyWith(questions: 6)), isFalse);
  });

  test('a remote worker with no daily place skips the place', () {
    expect(
      caseGaps(const Story(reason: StoryReason.lifestyle, city: 'Lisbon')),
      isNot(contains(CaseFacet.place)),
    );
  });

  test('a third adult or a move near family opens what the home needs', () {
    const three = Story(
      reason: StoryReason.lifestyle,
      adults: 3,
      childAges: [],
    );
    const family = Story(reason: StoryReason.family, adults: 2, childAges: []);

    expect(caseGaps(three), contains(CaseFacet.needs));
    expect(caseGaps(family), contains(CaseFacet.needs));
    expect(
      caseGaps(three.answering({CaseFacet.needs})),
      isNot(contains(CaseFacet.needs)),
    );
    expect(
      caseGaps(const Story(adults: 2, childAges: [6])),
      isNot(contains(CaseFacet.needs)),
    );
  });

  test('needs read as named needs, or none', () {
    expect(HomeNeed.parse('stepFree, lift'), [
      HomeNeed.stepFree,
      HomeNeed.lift,
    ]);
    expect(HomeNeed.parse(HomeNeed.none), isEmpty);
    expect(HomeNeed.parse('stepFree,sauna'), isNull);
    expect(HomeNeed.parse(''), isNull);
    expect(
      HomeNeed.parse(HomeNeed.answer(const [HomeNeed.pets])),
      [HomeNeed.pets],
    );
  });

  test('a swipe closes the kind of home, whatever it settled', () {
    const swiped = Story(answered: [CaseFacet.swipe]);

    expect(
      caseGaps(swiped),
      isNot(
        anyOf(
          contains(CaseFacet.homeType),
          contains(CaseFacet.outdoor),
          contains(CaseFacet.style),
        ),
      ),
    );
  });
}
