import 'package:common/common.dart';
import 'package:homeward_server/tools/propose_profile_tool.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  const tool = ProposeProfileTool();
  final sweden = MarketId.parse('SE');

  test('accepts stated facts and amounts in the market currency', () {
    final result = tool.run({
      'taxResidence': 'SE',
      'age': 34,
      'netMonthlyIncome': {'amount': 62000},
      'savings': {'amount': 900000.5},
      'childAges': [3],
    }, contextWith(plan: Plan(marketId: sweden)));

    expect(result.modelResult, {
      'accepted': [
        'taxResidence',
        'age',
        'netMonthlyIncome',
        'savings',
        'childAges',
      ],
      'rejected': <Object?>[],
    });
    final draft = result.plan!.profileDraft!;
    expect(
      draft.netMonthlyIncome,
      Money(minorUnits: 6200000, currency: Currency.parse('SEK')),
    );
    expect(draft.savings?.minorUnits, 90000050);
    expect(result.seeds['profile'], draft.toJson());
    expect(result.plan!.profile, const BuyerProfile());
  });

  test('money waits while the case is open', () {
    final open = contextWith(
      plan: const Plan(story: Story(city: 'Stockholm')),
    );

    expect(tool.isOffered(open), isFalse);
    expect(tool.run({'age': 34}, open).modelResult, contains('error'));
    expect(
      tool.isOffered(contextWith(plan: Plan(story: stockholmChosen))),
      isTrue,
    );
    expect(tool.isOffered(contextWith()), isTrue);
  });

  test('rejects facts that are not valid and keeps the rest', () {
    final result = tool.run({
      'taxResidence': 'Sweden',
      'use': 'holiday',
      'age': 40,
      'grossMonthlyIncome': {'amount': 85000, 'currency': 'XYZ'},
    }, contextWith(plan: Plan(marketId: sweden)));

    expect(result.modelResult['accepted'], ['age']);
    expect(
      (result.modelResult['rejected']! as List<Object?>).map(
        (entry) => (entry! as Map<String, Object?>)['field'],
      ),
      ['taxResidence', 'use', 'grossMonthlyIncome'],
    );
  });

  test('asks for a currency before a market is chosen', () {
    final result = tool.run({
      'netMonthlyIncome': {'amount': 62000},
    }, contextWith());

    expect(
      (result.modelResult['rejected']! as List<Object?>).single,
      {
        'field': 'netMonthlyIncome',
        'reason': 'Say which currency the amount is in',
      },
    );
  });

  test('adds to an earlier draft', () {
    final result = tool.run(
      {'adults': 2},
      contextWith(
        plan: Plan(
          marketId: sweden,
          profileDraft: const BuyerProfile(age: 34),
        ),
      ),
    );

    expect(result.plan!.profileDraft, const BuyerProfile(age: 34, adults: 2));
  });
}
