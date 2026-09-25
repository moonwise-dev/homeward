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

    expect(caseQuestionsOpen(settled), isFalse);
    expect(storyDecisions(settled).first, OpenDecision.caseSummary);
  });

  test('the questions close after five, whatever is still open', () {
    expect(caseQuestionsOpen(student), isTrue);
    expect(caseQuestionsOpen(student.copyWith(questions: 5)), isFalse);
  });

  test('a remote worker with no daily place skips the place', () {
    expect(
      caseGaps(const Story(reason: StoryReason.lifestyle, city: 'Lisbon')),
      isNot(contains(CaseFacet.place)),
    );
  });
}
