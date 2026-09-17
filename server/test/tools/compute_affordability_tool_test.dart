import 'package:common/common.dart';
import 'package:homeward_server/tools/compute_affordability_tool.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  const tool = ComputeAffordabilityTool();
  final sweden = MarketId.parse('SE');

  test('names the binding limit and seeds the figures', () {
    final result = tool.run(
      {},
      contextWith(
        plan: Plan(
          marketId: sweden,
          profile: stockholmProfile,
          scenarioDraft: stockholmScenario,
        ),
      ),
    );

    expect(result.modelResult, {
      'status': 'assessed',
      'bindingLimit': 'loanToValue',
      'headroom': 'atLimit',
    });
    expect(result.modelResult.toString(), isNot(contains('4050000')));
    final derived = result.seeds['derived']! as Map<String, Object?>;
    expect(derived.keys, [
      for (final field in derivedSlice.fields) field.name,
    ]);
    expect(
      derived['downPaymentBounds'],
      (stockholmDataModel['derived']!
          as Map<String, Object?>)['downPaymentBounds'],
    );
    expect((derived['payment']! as Map<String, Object?>)['total'], {
      'minorUnits': 1738125,
      'currency': 'SEK',
    });
  });

  test('lists missing facts until the profile is complete', () {
    final result = tool.run(
      {},
      contextWith(
        plan: Plan(
          marketId: sweden,
          profile: const BuyerProfile(age: 34),
          scenarioDraft: stockholmScenario,
        ),
      ),
    );

    expect(result.modelResult['status'], 'incomplete');
    expect(
      result.modelResult['missingFacts'],
      containsAll(['netMonthlyIncome', 'household']),
    );
    expect(result.seeds, {
      'derived': {
        'downPaymentBounds': loanToValueBounds(
          price: stockholmScenario.price,
          lending: stockholmMarket.lending,
        ).toJson(),
      },
    });
  });

  test('needs a covered market and a scenario first', () {
    expect(tool.run({}, contextWith()).modelResult, {
      'status': 'needsCoveredMarket',
    });
    expect(
      tool.run({}, contextWith(plan: Plan(marketId: sweden))).modelResult,
      {'status': 'needsScenario'},
    );
  });

  test('runs without the model once a covered market has a scenario', () {
    expect(
      tool.settledArguments(contextWith(plan: Plan(marketId: sweden))),
      isNull,
    );
    expect(
      tool.settledArguments(
        contextWith(
          plan: Plan(
            marketId: MarketId.parse('PT-20'),
            scenarioDraft: stockholmScenario,
          ),
        ),
      ),
      isNull,
    );
    expect(
      tool.settledArguments(
        contextWith(
          plan: Plan(marketId: sweden, scenarioDraft: stockholmScenario),
        ),
      ),
      <String, Object?>{},
    );
  });
}
