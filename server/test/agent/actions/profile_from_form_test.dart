import 'package:common/common.dart';
import 'package:homeward_server/agent/actions/profile_from_form.dart';
import 'package:test/test.dart';

void main() {
  test('reads values the way basic inputs write them', () {
    final form = profileFromForm({
      'use': ['primary'],
      'employment': <Object?>[],
      'age': 34.0,
      'adults': '2',
      'childAges': [3.0, 7],
      'taxResidence': 'se',
      'firstTime': true,
      'netMonthlyIncome': {'minorUnits': 6200000, 'currency': 'SEK'},
      'notAField': 'ignored',
    });

    expect(form.rejected, isEmpty);
    expect(
      form.profile,
      BuyerProfile(
        use: PropertyUse.primary,
        age: 34,
        adults: 2,
        childAges: const [3, 7],
        taxResidence: CountryCode.parse('SE'),
        firstTime: true,
        netMonthlyIncome: Money(
          minorUnits: 6200000,
          currency: Currency.parse('SEK'),
        ),
      ),
    );
  });

  test('keeps valid facts and reports the rest', () {
    final form = profileFromForm({
      'taxResidence': 'Sweden',
      'age': 'thirty',
      'use': ['holiday'],
      'borrowers': 2,
    });

    expect(form.profile, const BuyerProfile(borrowers: 2));
    expect(form.rejected.map((entry) => entry['field']), [
      'taxResidence',
      'use',
      'age',
    ]);
  });
}
