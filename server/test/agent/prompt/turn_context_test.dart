import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/turn_context.dart';
import 'package:test/test.dart';

import '../../tools/tool_fixtures.dart';

void main() {
  test('a new plan is open from the target market', () {
    expect(turnContext(turn: 1, plan: const Plan(), markets: realMarkets), {
      'turn': 1,
      'openDecisions': [
        'targetMarket',
        'profileFields',
        'scenario',
        'scenarioCommit',
      ],
      'profile': {
        'facts': <String, Object?>{},
        'amountsGiven': <String>[],
        'draftPending': false,
      },
      'scenario': {'committed': false, 'draftPending': false},
      'surfacesUsed': <String>[],
    });
  });

  test('a covered market lists missing fields with their paths and never '
      'amounts', () {
    final plan = Plan(
      marketId: MarketId.parse('SE'),
      profile: stockholmProfile.copyWith(childAges: null),
      profileDraft: stockholmProfile,
    );

    final context = turnContext(
      turn: 4,
      plan: plan,
      markets: realMarkets,
      surfacesUsed: {'t1-market', 't2-profile'},
      preRun: {
        'load_market': {'coverage': 'curated'},
      },
    );

    expect(context['openDecisions'], [
      'profileFields',
      'scenario',
      'scenarioCommit',
    ]);
    expect(context['market'], {
      'marketId': 'SE',
      'name': 'Sweden',
      'coverage': 'curated',
    });
    expect(context['profile'], {
      'facts': {'taxResidence': 'SE', 'age': 34, 'borrowers': 2, 'adults': 2},
      'amountsGiven': [
        'netMonthlyIncome',
        'grossMonthlyIncome',
        'monthlyDebtPayments',
        'savings',
      ],
      'missing': [
        {
          'field': 'household',
          'paths': ['/profile/adults', '/profile/childAges'],
        },
      ],
      'draftPending': true,
    });
    expect(context['surfacesUsed'], ['t1-market', 't2-profile']);
    expect(context['preRun'], {
      'load_market': {'coverage': 'curated'},
    });
    expect(context.toString(), isNot(contains('6200000')));
  });

  test('an uncovered market leaves only coverage open', () {
    final context = turnContext(
      turn: 2,
      plan: Plan(marketId: MarketId.parse('PT-30')),
      markets: realMarkets,
    );

    expect(context['openDecisions'], ['marketCoverage']);
    expect(context['market'], {
      'marketId': 'PT-30',
      'name': 'Madeira, Portugal',
      'coverage': 'uncovered',
    });
    expect(context['profile'], isNot(contains('missing')));
  });
}
