import 'package:common/common.dart';
import 'package:homeward_server/tools/estimate_purchase_costs_tool.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  const tool = EstimatePurchaseCostsTool();
  final madeira = MarketId.parse('PT-30');
  final euro = Currency.parse('EUR');
  Money amount(int units) => Money(minorUnits: units * 100, currency: euro);

  final scenario = Scenario(
    price: amount(350000),
    downPayment: amount(105000),
    termYears: 30,
    loanTypeId: 'euribor-6m',
    rateSpread: const Rate.ppm(16000),
  );
  final nonResident = BuyerProfile(
    taxResidence: CountryCode.parse('SE'),
    formerResident: false,
    residencyIntent: ResidencyIntent.becomeResident,
    use: PropertyUse.secondary,
  );

  Plan planFor(BuyerProfile profile) =>
      Plan(marketId: madeira, profile: profile, scenarioDraft: scenario);

  test('names the charges and the refund terms, never an amount', () {
    final result = tool.run({}, contextWith(plan: planFor(nonResident)));

    expect(result.modelResult, {
      'status': 'estimated',
      'charges': [
        {
          'ruleId': 'imt-nonresident',
          'label': 'Property transfer tax for a non-resident buyer',
          'localTerm': 'IMT',
          'refund': {'deadline': 'P2Y', 'claimWindow': 'P6M'},
        },
        {
          'ruleId': 'stamp-duty-purchase',
          'label': 'Stamp duty on the purchase',
          'localTerm': 'Imposto do Selo, verba 1.1',
        },
        {
          'ruleId': 'stamp-duty-loan',
          'label': 'Stamp duty on the loan',
          'localTerm': 'Imposto do Selo, verba 17.1',
        },
      ],
    });
    expect(result.seeds, isEmpty);
    expect(result.modelResult.toString(), isNot(contains('26250')));
  });

  test('asks for the facts that pick the charge', () {
    final result = tool.run(
      {},
      contextWith(
        plan: planFor(BuyerProfile(taxResidence: CountryCode.parse('PT'))),
      ),
    );

    expect(result.modelResult, {
      'status': 'incomplete',
      'missingFacts': ['use'],
    });
  });

  test('needs a covered market and a scenario first', () {
    expect(tool.run({}, contextWith()).modelResult, {
      'status': 'needsCoveredMarket',
    });
    expect(
      tool.run({}, contextWith(plan: Plan(marketId: madeira))).modelResult,
      {'status': 'needsScenario'},
    );
  });

  test('runs without the model once a covered market has a scenario', () {
    expect(tool.settledArguments(contextWith()), isNull);
    expect(
      tool.settledArguments(contextWith(plan: Plan(marketId: madeira))),
      isNull,
    );
    expect(
      tool.settledArguments(contextWith(plan: planFor(nonResident))),
      const <String, Object?>{},
    );
  });
}
