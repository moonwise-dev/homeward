import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  test('round trips facts, money, and household', () {
    final profile = BuyerProfile(
      citizenship: CountryCode.parse('SE'),
      taxResidence: CountryCode.parse('SE'),
      age: 34,
      netMonthlyIncome: sek(6200000),
      grossMonthlyIncome: sek(8500000),
      monthlyDebtPayments: sek(0),
      savings: sek(60000000),
      borrowers: 2,
      adults: 2,
      childAges: const [3],
    );

    expect(profile.toJson()['taxResidence'], 'SE');
    expect(profile.toJson()['netMonthlyIncome'], {
      'minorUnits': 6200000,
      'currency': 'SEK',
    });
    expect(BuyerProfile.fromJson(profile.toJson()), profile);
  });

  test('omits unknown facts from JSON', () {
    expect(const BuyerProfile(age: 40).toJson(), {'age': 40});
  });
}
