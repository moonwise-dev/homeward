import 'package:common/common.dart';
import 'package:homeward_server/agent/actions/apply_action.dart';
import 'package:test/test.dart';

import '../../tools/tool_fixtures.dart';

void main() {
  final sweden = MarketId.parse('SE');

  ClientAction action(String name, [Map<String, Object?> context = const {}]) =>
      ClientAction(
        name: name,
        surfaceId: 't2-form',
        sourceComponentId: 'commit',
        context: context,
      );

  Map<String, Object?> scenarioWithDownPayment(int kronor) => {
    ...stockholmScenario.toJson(),
    'downPayment': {'minorUnits': kronor * 100, 'currency': 'SEK'},
  };

  test('selecting a market keeps the facts on the surface as a draft', () {
    final outcome = applyAction(
      action: action('select_market', {'marketId': 'se'}),
      surfaceData: {
        'profile': {
          'taxResidence': 'SE',
          'use': ['primary'],
        },
      },
      plan: Plan(scenarioDraft: stockholmScenario),
      markets: realMarkets,
    );

    expect(outcome.plan.marketId, sweden);
    expect(outcome.plan.scenarioDraft, isNull);
    expect(
      outcome.plan.profileDraft,
      BuyerProfile(
        taxResidence: CountryCode.parse('SE'),
        use: PropertyUse.primary,
      ),
    );
    expect(outcome.summary, {
      'action': 'select_market',
      'surfaceId': 't2-form',
      'applied': true,
      'marketId': 'SE',
      'coverage': 'curated',
    });
  });

  test('refuses a market that does not exist', () {
    final outcome = applyAction(
      action: action('select_market', {'marketId': 'XX'}),
      surfaceData: const {},
      plan: const Plan(),
      markets: realMarkets,
    );

    expect(outcome.plan, const Plan());
    expect(outcome.summary['applied'], isFalse);
  });

  test('committing a profile saves the form over earlier facts', () {
    final outcome = applyAction(
      action: action('commit_profile', {'profilePath': '/profile'}),
      surfaceData: {
        'profile': {
          'age': 35.0,
          'adults': 2,
          'childAges': <Object?>[],
          'taxResidence': 'Sweden',
        },
      },
      plan: Plan(
        marketId: sweden,
        profile: const BuyerProfile(borrowers: 2, age: 30),
        profileDraft: const BuyerProfile(age: 35),
      ),
      markets: realMarkets,
    );

    expect(
      outcome.plan.profile,
      const BuyerProfile(borrowers: 2, age: 35, adults: 2, childAges: []),
    );
    expect(outcome.plan.profileDraft, isNull);
    expect(outcome.summary['rejected'], [
      {'field': 'taxResidence', 'reason': isA<String>()},
    ]);
  });

  test('committing a scenario checks it against the loan-to-value limit', () {
    final plan = Plan(marketId: sweden, profile: stockholmProfile);

    Plan? committed(Map<String, Object?> scenario) {
      final outcome = applyAction(
        action: action('commit_scenario', {'scenarioPath': '/scenario'}),
        surfaceData: {'scenario': scenario},
        plan: plan.copyWith(scenarioDraft: stockholmScenario),
        markets: realMarkets,
      );
      return outcome.summary['applied'] == true ? outcome.plan : null;
    }

    expect(
      committed(scenarioWithDownPayment(450000))?.scenario?.downPayment,
      stockholmScenario.downPayment,
    );
    expect(committed(scenarioWithDownPayment(450000))?.scenarioDraft, isNull);
    expect(committed(scenarioWithDownPayment(449999)), isNull);
    expect(committed({'price': stockholmScenario.price.toJson()}), isNull);
  });

  test('a change reopens what it names', () {
    final planned = Plan(
      marketId: MarketId.parse('SE'),
      profile: stockholmProfile,
      scenario: stockholmScenario,
      scenarioDraft: stockholmScenario,
    );
    Plan reopened(String section) => applyAction(
      action: action('change', {'section': section}),
      surfaceData: const {},
      plan: planned,
      markets: realMarkets,
    ).plan;

    expect(reopened('scenario').scenario, isNull);
    expect(reopened('scenario').scenarioDraft, isNull);
    expect(reopened('scenario').marketId, MarketId.parse('SE'));
    expect(reopened('scenario').profile, stockholmProfile);
    expect(reopened('market').marketId, isNull);
    expect(reopened('market').scenario, isNull);
    expect(reopened('market').profile, stockholmProfile);
    expect(
      applyAction(
        action: action('change', {'section': 'costs'}),
        surfaceData: const {},
        plan: planned,
        markets: realMarkets,
      ).summary,
      containsPair('applied', false),
    );
  });

  test('passes other actions to the model with their context', () {
    final outcome = applyAction(
      action: action('explain', {
        'topic': 'affordability',
        'path': '/scenario',
      }),
      surfaceData: const {},
      plan: const Plan(),
      markets: realMarkets,
    );

    expect(outcome.plan, const Plan());
    expect(outcome.summary, {
      'action': 'explain',
      'surfaceId': 't2-form',
      'context': {'topic': 'affordability', 'path': '/scenario'},
    });
  });
}
