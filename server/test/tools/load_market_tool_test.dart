import 'package:common/common.dart';
import 'package:homeward_server/tools/load_market_tool.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  const tool = LoadMarketTool();

  test('loads a curated market with the facts its form needs', () {
    final result = tool.run({'marketId': 'SE'}, contextWith());

    expect(result.modelResult['coverage'], 'curated');
    expect(result.modelResult['currency'], 'SEK');
    expect(
      (result.modelResult['profileFields']! as List<Object?>).map(
        (field) => (field! as Map<String, Object?>)['field'],
      ),
      [
        'netMonthlyIncome',
        'grossMonthlyIncome',
        'monthlyDebtPayments',
        'age',
        'household',
        'borrowers',
        'savings',
      ],
    );
    expect(
      (result.modelResult['profileFields']! as List<Object?>).firstWhere(
        (field) => (field! as Map<String, Object?>)['field'] == 'household',
      ),
      {
        'field': 'household',
        'paths': ['/profile/adults', '/profile/childAges'],
        'reason': isA<String>(),
      },
    );
    expect(result.modelResult['lendingRules'], [
      'loanToValue',
      'loanToIncome',
      'amortizationRequirement',
      'leftToLiveOn',
      'interestDeduction',
    ]);
    expect(result.modelResult.toString(), isNot(contains('90%')));

    final market = ResolvedMarket.fromJson(
      result.seeds['market']! as Map<String, Object?>,
    );
    expect(market.referenceRates.keys, ['SE.AVG_VARIABLE_3M']);
    expect(market.livingCosts?.year, 2026);
  });

  test('seeds an uncovered market as a snapshot with the curated ones', () {
    final result = tool.run({'marketId': 'PT-20'}, contextWith());
    const curated = [
      {'marketId': 'PT-30', 'name': 'Madeira, Portugal', 'coverage': 'curated'},
      {'marketId': 'PT', 'name': 'Portugal', 'coverage': 'curated'},
      {'marketId': 'SE', 'name': 'Sweden', 'coverage': 'curated'},
    ];

    expect(result.modelResult, {
      'marketId': 'PT-20',
      'name': 'Azores, Portugal',
      'coverage': 'uncovered',
      'curatedMarkets': ['Madeira, Portugal', 'Portugal', 'Sweden'],
    });
    expect(result.seeds, {
      'market': {
        'id': 'PT-20',
        'name': 'Azores, Portugal',
        'coverage': 'uncovered',
      },
      'selection': {'candidates': curated},
    });
  });

  test('refuses ids that are malformed or unknown', () {
    for (final id in ['Sweden', 'XX']) {
      expect(
        tool.run({'marketId': id}, contextWith()).modelResult,
        {'error': 'Unknown market id'},
      );
    }
  });

  test('is pre-runnable because its input comes from the plan', () {
    expect(tool.settledArguments(contextWith()), isNull);
    expect(
      tool.settledArguments(
        contextWith(plan: Plan(marketId: MarketId.parse('SE'))),
      ),
      {'marketId': 'SE'},
    );
  });
}
