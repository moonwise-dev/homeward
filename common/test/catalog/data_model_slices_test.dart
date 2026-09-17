import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  Set<String> names(DataSlice slice) => {
    for (final field in slice.fields) field.name,
  };

  test('slice names and field names are unique', () {
    expect(dataModelSlices.map((slice) => slice.name).toSet(), hasLength(5));
    for (final slice in dataModelSlices) {
      expect(names(slice), hasLength(slice.fields.length), reason: slice.name);
    }
  });

  test('the profile slice lists every buyer profile field', () {
    final complete = BuyerProfile(
      citizenship: CountryCode.parse('SE'),
      taxResidence: CountryCode.parse('SE'),
      formerResident: false,
      residencyIntent: ResidencyIntent.stay,
      use: PropertyUse.primary,
      firstTime: true,
      employment: Employment.employed,
      age: 40,
      netMonthlyIncome: sek(100),
      grossMonthlyIncome: sek(100),
      monthlyDebtPayments: sek(100),
      savings: sek(100),
      borrowers: 1,
      adults: 1,
      childAges: const [4],
    );

    expect(names(profileSlice), complete.toJson().keys.toSet());
  });

  test('the scenario slice lists every scenario field', () {
    final complete = Scenario(
      price: sek(100),
      downPayment: sek(100),
      termYears: 30,
      loanTypeId: 'variable-3m',
      rateSpread: const Rate.ppm(4100),
      rateShock: const Rate.ppm(10000),
      associationFee: sek(100),
    );

    expect(names(scenarioSlice), complete.toJson().keys.toSet());
  });

  test('choice values parse as buyer profile values', () {
    for (final field in profileSlice.fields) {
      for (final value in field.choiceValues) {
        expect(
          () => BuyerProfile.fromJson({field.name: value}),
          returnsNormally,
          reason: '${field.name}: $value',
        );
      }
    }
  });

  test('every pack profile field names profile keys, and every key is asked '
      'by some field', () {
    final keys = {
      for (final field in ProfileField.values) ...field.profileKeys,
    };

    expect(keys, names(profileSlice));
  });

  test('market and selection fields are in the example data model', () {
    for (final slice in [marketSlice, selectionSlice]) {
      final seeded = stockholmDataModel[slice.name]! as Map<String, Object?>;
      expect(seeded.keys, containsAll(names(slice)), reason: slice.name);
    }
  });

  test('paths join the slice and the field', () {
    expect(profileSlice.pathOf('savings'), '/profile/savings');
    expect(scenarioSlice.field('price').kind, FieldKind.money);
    expect(
      profileSlice.field('use').shape,
      'one of primary, secondary, investment',
    );
  });
}
