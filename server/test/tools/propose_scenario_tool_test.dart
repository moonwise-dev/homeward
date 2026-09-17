import 'package:common/common.dart';
import 'package:homeward_server/tools/propose_scenario_tool.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  const tool = ProposeScenarioTool();
  final sek = Currency.parse('SEK');
  Money kronor(int amount) => Money(minorUnits: amount * 100, currency: sek);
  final planInSweden = Plan(marketId: MarketId.parse('SE'));

  test('fills what the buyer did not say from the market', () {
    final result = tool.run({
      'price': {'amount': 4500000},
    }, contextWith(plan: planInSweden));

    expect(result.modelResult, {
      'accepted': ['price'],
      'defaulted': ['loanTypeId', 'downPayment', 'termYears'],
      'rejected': <Object?>[],
    });
    expect(
      result.plan!.scenarioDraft,
      Scenario(
        price: kronor(4500000),
        downPayment: kronor(450000),
        termYears: 30,
        loanTypeId: 'variable-3m',
        rateSpread: const Rate.ppm(4100),
      ),
    );
    expect(result.seeds['scenario'], result.plan!.scenarioDraft!.toJson());
  });

  test('keeps stated values and rejects impossible ones', () {
    final result = tool.run({
      'price': {'amount': 4500000},
      'downPayment': {'amount': 5000000},
      'termYears': 25,
      'associationFee': {'amount': 3500},
    }, contextWith(plan: planInSweden));

    expect(result.modelResult['rejected'], [
      {
        'field': 'downPayment',
        'reason': 'The down payment cannot exceed the price',
      },
    ]);
    final scenario = result.plan!.scenarioDraft!;
    expect(scenario.downPayment, kronor(450000));
    expect(scenario.termYears, 25);
    expect(scenario.associationFee, kronor(3500));
  });

  test('needs a covered market and a price in its currency', () {
    expect(
      tool.run({
        'price': {'amount': 350000},
      }, contextWith()).modelResult,
      {'error': 'Select a covered market first'},
    );
    expect(
      tool.run(
        {
          'price': {'amount': 350000},
        },
        contextWith(plan: Plan(marketId: MarketId.parse('PT-20'))),
      ).modelResult,
      {'error': 'Select a covered market first'},
    );
    expect(
      tool.run(
        {
          'price': {'amount': 350000, 'currency': 'EUR'},
        },
        contextWith(plan: planInSweden),
      ).modelResult,
      {
        'rejected': [
          {'field': 'price', 'reason': 'Enter a price in SEK'},
        ],
      },
    );
  });
}
