import 'package:common/common.dart';
import 'package:homeward_server/tools/get_obstacles_tool.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  const tool = GetObstaclesTool();
  final madeira = MarketId.parse('PT-30');

  Plan planFor(BuyerProfile profile) =>
      Plan(marketId: madeira, profile: profile);

  test('names what stands in this buyer\'s way, by severity', () {
    final result = tool.run(
      {},
      contextWith(
        plan: planFor(
          BuyerProfile(
            citizenship: CountryCode.parse('SE'),
            taxResidence: CountryCode.parse('SE'),
          ),
        ),
      ),
    );

    expect(result.modelResult, {
      'obstacles': [
        {
          'id': 'tax-number',
          'severity': 'blocker',
          'title': 'Portuguese tax number',
        },
        {
          'id': 'account-with-the-lender',
          'severity': 'effort',
          'title': 'An account with the lender',
        },
      ],
      'pendingFacts': <String>[],
    });
    expect(result.seeds, isEmpty);
  });

  test('a buyer taxed outside the EEA needs a fiscal representative', () {
    final result = tool.run(
      {},
      contextWith(
        plan: planFor(
          BuyerProfile(
            citizenship: CountryCode.parse('BR'),
            taxResidence: CountryCode.parse('BR'),
          ),
        ),
      ),
    );

    expect(
      [
        for (final obstacle
            in result.modelResult['obstacles']! as List<Object?>)
          (obstacle! as Map<String, Object?>)['id'],
      ],
      [
        'tax-number',
        'fiscal-representative',
        'account-with-the-lender',
        'golden-visa-not-for-housing',
      ],
    );
  });

  test('says which facts still settle an obstacle', () {
    final result = tool.run(
      {},
      contextWith(plan: planFor(const BuyerProfile())),
    );

    expect(result.modelResult['obstacles'], isEmpty);
    expect(result.modelResult['pendingFacts'], ['residency', 'citizenship']);
  });

  test('needs a covered market first', () {
    expect(tool.run({}, contextWith()).modelResult, {
      'status': 'needsCoveredMarket',
    });
    expect(tool.settledArguments(contextWith()), isNull);
    expect(
      tool.settledArguments(contextWith(plan: Plan(marketId: madeira))),
      const <String, Object?>{},
    );
  });
}
