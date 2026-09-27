import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  test('finds the largest allowed amount in minor units', () {
    expect(
      largestLoanWhere(
        upper: sek(1000000),
        allows: (loan) => loan <= sek(333333),
      ),
      sek(333333),
    );
  });

  test(
    'returns zero when nothing is allowed and the upper bound when all is',
    () {
      expect(
        largestLoanWhere(upper: sek(1000), allows: (loan) => false),
        sek(0),
      );
      expect(
        largestLoanWhere(upper: sek(1000), allows: (loan) => true),
        sek(1000),
      );
    },
  );
}
