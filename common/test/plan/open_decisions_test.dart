import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  final sweden = MarketId.parse('SE');

  test('a new plan opens with the target market', () {
    expect(financeDecisions(const Plan(), null), [
      OpenDecision.targetMarket,
      OpenDecision.profileFields,
      OpenDecision.scenario,
      OpenDecision.scenarioCommit,
    ]);
  });

  test('an uncovered market leaves only its coverage open', () {
    expect(financeDecisions(Plan(marketId: MarketId.parse('PT-30')), null), [
      OpenDecision.marketCoverage,
    ]);
  });

  test('a covered market asks for the facts its rules need', () {
    final plan = Plan(marketId: sweden);

    expect(financeDecisions(plan, stockholmMarket), [
      OpenDecision.profileFields,
      OpenDecision.scenario,
      OpenDecision.scenarioCommit,
    ]);
    expect(
      missingProfileFields(plan.profile, stockholmMarket),
      stockholmMarket.requiredFields,
    );
  });

  test('a committed profile opens the scenario, and committing it closes '
      'every M1 decision', () {
    final profiled = Plan(marketId: sweden, profile: stockholmProfile);

    expect(financeDecisions(profiled, stockholmMarket), [
      OpenDecision.scenario,
      OpenDecision.scenarioCommit,
    ]);
    expect(
      financeDecisions(
        profiled.copyWith(scenario: stockholmScenario),
        stockholmMarket,
      ),
      isEmpty,
    );
  });

  test('a new plan starts with the story, and the money follows', () {
    expect(openDecisions(const Plan(), null).take(4), [
      OpenDecision.story,
      OpenDecision.caseQuestions,
      OpenDecision.homeChoice,
      OpenDecision.targetMarket,
    ]);
  });

  test('the story closes one decision at a time', () {
    const named = Story(
      candidates: [Candidate(id: 'c1', label: 'Odengatan', query: 'Odengatan')],
    );

    expect(storyDecisions(named), [
      OpenDecision.caseQuestions,
      OpenDecision.homeChoice,
    ]);
    expect(storyDecisions(named.copyWith(committed: true)), [
      OpenDecision.homeChoice,
    ]);
    expect(
      storyDecisions(
        named.copyWith(committed: true, chosenCandidateId: 'c1'),
      ),
      isEmpty,
    );
  });

  test('a field is answered only when every profile key it names is', () {
    final withoutChildren = stockholmProfile.copyWith(childAges: null);

    expect(missingProfileFields(withoutChildren, stockholmMarket), {
      ProfileField.household,
    });
  });
}
