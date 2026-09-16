import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

import '../markets/pack_fixtures.dart';
import '../support/money_helpers.dart';

void main() {
  const incomeTaxAct = 'Inkomstskattelag (1999:1229) 67 kap. 10 §';
  final rule = LendingRules.fromJson(
    jsonDecode(swedenLendingJson) as Map<String, Object?>,
  ).interestDeduction.single;

  const cases = <(int, int, int)>[
    (1012500, 2, 303750),
    (1012500, 1, 287625),
    (2362500, 2, 646125),
    (0, 2, 0),
  ];

  for (final (interest, borrowers, expected) in cases) {
    test('$incomeTaxAct: $interest monthly interest, $borrowers borrowers', () {
      expect(
        monthlyInterestDeduction(
          monthlyInterest: sek(interest),
          rule: rule,
          borrowers: borrowers,
        ),
        sek(expected),
      );
    });
  }

  test('rejects fewer than one borrower', () {
    expect(
      () => monthlyInterestDeduction(
        monthlyInterest: sek(1000),
        rule: rule,
        borrowers: 0,
      ),
      throwsArgumentError,
    );
  });
}
