import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/turn_context.dart';
import 'package:test/test.dart';

import '../../tools/tool_fixtures.dart';

void main() {
  const storyOpen = ['story', 'caseQuestions', 'homeChoice'];

  test('a new plan is open from the story, then the target market', () {
    expect(turnContext(turn: 1, plan: const Plan(), markets: realMarkets), {
      'turn': 1,
      'openDecisions': [
        ...storyOpen,
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
      'story': {
        'anchors': <Object?>[],
        'homes': <Object?>[],
        'criteria': <String>[],
        'mustHaves': <String>[],
        'committed': false,
      },
      'case': {
        'questionsAsked': 0,
        'maxQuestions': maxCaseQuestions,
        'mustAsk': ['household', 'homeType'],
        'open': ['household', 'homeType', 'outdoor', 'style'],
        'answered': <String>[],
        'known': {'priceRangeSet': false},
      },
      'scenario': {'committed': false, 'draftPending': false},
      'surfacesUsed': <String>[],
    });
  });

  test('without the deal the context holds only the story', () {
    final context = turnContext(
      turn: 1,
      plan: Plan(marketId: MarketId.parse('SE')),
      markets: realMarkets,
      deal: false,
    );

    expect(context['openDecisions'], storyOpen);
    expect(
      context.keys,
      isNot(
        anyOf(contains('market'), contains('profile'), contains('scenario')),
      ),
    );
  });

  test('a city with sample homes lists its areas and lineups', () {
    final context = turnContext(
      turn: 2,
      plan: const Plan(
        story: Story(
          reason: StoryReason.study,
          city: 'Stockholm',
          sampleCity: 'stockholm',
        ),
      ),
      markets: realMarkets,
    );
    final caseBlock = context['case']! as Map<String, Object?>;
    final samples = caseBlock['sampleHomes']! as Map<String, Object?>;

    expect(caseBlock['open'], containsAllInOrder(['place', 'household']));
    expect(caseBlock['open'], contains('area'));
    expect(caseBlock['mustAsk'], ['place', 'household', 'homeType', 'area']);
    expect(samples['city'], 'Stockholm');
    expect(
      [
        for (final area in samples['areas']! as List<Object?>)
          (area! as Map)['id'],
      ],
      containsAll(['vasastan', 'danderyd']),
    );
  });

  test('the story says what was placed and what the chosen home costs', () {
    final context = turnContext(
      turn: 3,
      plan: Plan(story: stockholmStory.copyWith(chosenCandidateId: 'c1')),
      markets: realMarkets,
    );

    expect(context['story'], {
      'reason': 'work',
      'city': 'Stockholm',
      'anchors': [
        {
          'id': 'a1',
          'label': 'KTH',
          'placed': true,
          'mode': 'bike',
          'maxMinutes': 20,
          'perWeek': 5,
        },
      ],
      'homes': [
        {'id': 'c1', 'label': 'Odengatan', 'placed': true, 'priceGiven': true},
        {'id': 'c2', 'label': 'Solna', 'placed': true, 'priceGiven': false},
      ],
      'criteria': [
        'commute-a1',
        'schools',
        'parks',
        'gym',
        'quiet',
        'transit',
        'noise',
      ],
      'mustHaves': ['commute-a1', 'schools'],
      'committed': true,
      'chosenHome': {
        'id': 'c1',
        'label': 'Odengatan',
        'price': {'minorUnits': 495000000, 'currency': 'SEK'},
      },
    });
    expect(context['openDecisions'], isNot(contains('homeChoice')));
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
      ...storyOpen,
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
      plan: Plan(marketId: MarketId.parse('PT-20')),
      markets: realMarkets,
    );

    expect(context['openDecisions'], [...storyOpen, 'marketCoverage']);
    expect(context['market'], {
      'marketId': 'PT-20',
      'name': 'Azores, Portugal',
      'coverage': 'uncovered',
    });
    expect(context['profile'], isNot(contains('missing')));
  });
}
