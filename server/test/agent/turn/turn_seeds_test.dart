import 'package:common/common.dart';
import 'package:homeward_server/agent/turn/turn_seeds.dart';
import 'package:test/test.dart';

void main() {
  test('the profile seed takes who moves from the case', () {
    final seeds = turnSeeds(
      const Plan(
        story: Story(adults: 2, childAges: [8]),
        profileDraft: BuyerProfile(),
      ),
      const [],
    );

    expect(
      seeds['profile'],
      allOf(containsPair('adults', 2), containsPair('childAges', [8])),
    );
  });

  test('what the profile says about who moves wins over the case', () {
    final seeds = turnSeeds(
      const Plan(
        story: Story(adults: 2, childAges: [8]),
        profile: BuyerProfile(adults: 1, childAges: []),
      ),
      const [],
    );

    expect(
      seeds['profile'],
      allOf(containsPair('adults', 1), containsPair('childAges', isEmpty)),
    );
  });
}
