import 'package:homeward_tool/eval/eval_case.dart';
import 'package:homeward_tool/eval/eval_score.dart';
import 'package:homeward_tool/eval/turn_observation.dart';
import 'package:test/test.dart';

void main() {
  TurnObservation observed({
    List<Map<String, Object?>> messages = const [],
    String text = '',
    List<String> toolsCalled = const [],
    Set<String> toolsRun = const {},
    List<String> rejections = const [],
    int modelRounds = 1,
    int corrections = 0,
    String? marketId,
    String? coverage,
    String? bindingConstraint,
    String? errorCode,
  }) => TurnObservation(
    index: 1,
    messages: messages,
    text: text,
    toolsCalled: toolsCalled,
    toolsRun: toolsRun,
    rejections: rejections,
    modelRounds: modelRounds,
    corrections: corrections,
    elapsed: const Duration(seconds: 4),
    marketId: marketId,
    coverage: coverage,
    bindingConstraint: bindingConstraint,
    errorCode: errorCode,
  );

  Map<String, Object?> drew(List<String> components) => {
    'updateComponents': {
      'surfaceId': 't1-market',
      'components': [
        for (final (index, component) in components.indexed)
          {'id': 'c$index', 'component': component},
      ],
    },
  };

  Map<String, bool> marks(Iterable<Score> scores) => {
    for (final score in scores) score.name: score.passed,
  };

  test('a turn that does everything the case asks for passes', () {
    final scores = scoreTurn(
      const EvalExpectations(
        toolsCalled: ['resolve_market', 'load_market'],
        market: 'PT-30',
        coverage: 'curated',
        componentsInclude: ['MarketSnapshotCard'],
        componentsExclude: ['StressTestChart'],
      ),
      observed(
        messages: [
          drew(['Column', 'MarketSnapshotCard']),
        ],
        text: 'Madeira it is. Tell me about the household.',
        toolsCalled: ['resolve_market', 'load_market'],
        marketId: 'PT-30',
        coverage: 'curated',
      ),
    );

    expect(scores.every((score) => score.passed), isTrue);
  });

  test('it names the tool that was missing and the one nobody asked for', () {
    final scored = marks(
      scoreTurn(
        const EvalExpectations(
          toolsCalled: ['resolve_market'],
          toolsAllowed: ['propose_profile'],
        ),
        observed(
          toolsCalled: ['propose_profile', 'get_obstacles'],
          toolsRun: const {'propose_profile', 'get_obstacles'},
        ),
      ),
    );

    expect(scored['called the tools the turn needs'], isFalse);
    expect(scored['called no tool it did not need'], isFalse);
  });

  test('a tool the server settled counts as called', () {
    final scored = marks(
      scoreTurn(
        const EvalExpectations(toolsCalled: ['resolve_market', 'load_market']),
        observed(
          toolsCalled: ['resolve_market'],
          toolsRun: const {'resolve_market', 'load_market'},
        ),
      ),
    );

    expect(scored['called the tools the turn needs'], isTrue);
    expect(scored['called no tool it did not need'], isTrue);
  });

  test('a rejection says why the turn needed a correction', () {
    final scores = scoreTurn(
      const EvalExpectations(),
      observed(
        corrections: 1,
        rejections: const ['/components/2: AmountSlider needs bounds'],
      ),
    );

    expect(
      scores
          .firstWhere((score) => score.name == 'validated without a correction')
          .detail,
      '/components/2: AmountSlider needs bounds',
    );
  });

  test('a component the buyer has no facts for fails the turn', () {
    final scored = marks(
      scoreTurn(
        const EvalExpectations(
          componentsInclude: ['MarketSnapshotCard'],
          componentsExclude: ['StressTestChart'],
        ),
        observed(
          messages: [
            drew(['MarketSnapshotCard', 'StressTestChart']),
          ],
        ),
      ),
    );

    expect(scored['drew the components the turn calls for'], isTrue);
    expect(scored['left out the components it has no facts for'], isFalse);
  });

  test('an amount in the prose fails, a plain sentence does not', () {
    expect(
      marks(
        scoreTurn(
          const EvalExpectations(),
          observed(text: 'You could borrow about €245,000 over 30 years.'),
        ),
      )['kept amounts out of the prose'],
      isFalse,
    );
    expect(
      marks(
        scoreTurn(
          const EvalExpectations(),
          observed(text: 'The loan-to-value cap is what holds you back.'),
        ),
      )['kept amounts out of the prose'],
      isTrue,
    );
  });

  test('corrections, rounds, and a failed turn all show', () {
    final scored = marks(
      scoreTurn(
        const EvalExpectations(),
        observed(corrections: 1, modelRounds: 5, errorCode: 'internal'),
      ),
    );

    expect(scored['the turn finished'], isFalse);
    expect(scored['validated without a correction'], isFalse);
    expect(scored['stayed within 4 model rounds'], isFalse);
  });

  test('the profile fields a form binds are the ones it asked for', () {
    final scored = marks(
      scoreTurn(
        const EvalExpectations(profileFieldsAsked: ['age', 'savings']),
        observed(
          messages: [
            {
              'updateComponents': {
                'surfaceId': 't1-profile',
                'components': [
                  {
                    'id': 'age',
                    'component': 'TextField',
                    'value': {'path': '/profile/age'},
                  },
                  {
                    'id': 'savings',
                    'component': 'MoneyInput',
                    'amount': {'path': '/profile/savings'},
                  },
                ],
              },
            },
          ],
        ),
      ),
    );

    expect(scored['asked for the facts the rules need'], isTrue);
  });
}
