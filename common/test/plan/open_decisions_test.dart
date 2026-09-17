import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  final sweden = MarketId.parse('SE');

  test('a new plan opens with the target market', () {
    expect(openDecisions(const Plan(), null), [
      OpenDecision.targetMarket,
      OpenDecision.profileFields,
      OpenDecision.scenario,
      OpenDecision.scenarioCommit,
    ]);
  });

  test('an uncovered market leaves only its coverage open', () {
    expect(openDecisions(Plan(marketId: MarketId.parse('PT-30')), null), [
      OpenDecision.marketCoverage,
    ]);
  });

  test('a covered market asks for the facts its rules need', () {
    final plan = Plan(marketId: sweden);

    expect(openDecisions(plan, stockholmMarket), [
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

    expect(openDecisions(profiled, stockholmMarket), [
      OpenDecision.scenario,
      OpenDecision.scenarioCommit,
    ]);
    expect(
      openDecisions(
        profiled.copyWith(scenario: stockholmScenario),
        stockholmMarket,
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
