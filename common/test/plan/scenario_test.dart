import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  final json = <String, Object?>{
    'price': {'minorUnits': 450000000, 'currency': 'SEK'},
    'downPayment': {'minorUnits': 45000000, 'currency': 'SEK'},
    'termYears': 50,
    'loanTypeId': 'variable-3m',
    'rateSpreadPpm': 0,
    'associationFee': {'minorUnits': 350000, 'currency': 'SEK'},
  };

  test('reads the data model shape with parts per million', () {
    final scenario = Scenario.fromJson(json);

    expect(scenario.loan, sek(405000000));
    expect(scenario.months, 600);
    expect(scenario.rateShock, Rate.zero);
    expect(scenario.associationFee, sek(350000));
    expect(scenario.toJson()['rateShockPpm'], 0);
    expect(Scenario.fromJson(scenario.toJson()), scenario);
  });

  test('rejects unknown keys and a term that is not positive', () {
    expect(
      () => Scenario.fromJson({...json, 'rate': 1}),
      throwsA(isA<CheckedFromJsonException>()),
    );
    expect(
      () => Scenario.fromJson({...json, 'termYears': 0}),
      throwsA(isA<CheckedFromJsonException>()),
    );
  });
}
