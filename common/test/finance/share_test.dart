import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  group('shareOf', () {
    test('rounds the share to parts per million', () {
      expect(
        shareOf(
          part: sek(270000000),
          whole: sek(300000000),
          rounding: Rounding.halfUp,
        ),
        const Rate.ppm(900000),
      );
      expect(
        shareOf(part: sek(2), whole: sek(3), rounding: Rounding.halfUp),
        const Rate.ppm(666667),
      );
      expect(
        shareOf(part: sek(2), whole: sek(3), rounding: Rounding.down),
        const Rate.ppm(666666),
      );
    });

    test('rejects different currencies and a zero whole', () {
      expect(
        () => shareOf(part: eur(1), whole: sek(3), rounding: Rounding.halfUp),
        throwsArgumentError,
      );
      expect(
        () => shareOf(part: sek(1), whole: sek(0), rounding: Rounding.halfUp),
        throwsArgumentError,
      );
    });
  });

  group('exceedsShare', () {
    test('is exact at the limit', () {
      expect(
        exceedsShare(
          part: sek(270000000),
          whole: sek(300000000),
          share: const Rate.ppm(900000),
        ),
        isFalse,
      );
      expect(
        exceedsShare(
          part: sek(270000001),
          whole: sek(300000000),
          share: const Rate.ppm(900000),
        ),
        isTrue,
      );
    });

    test('is exact when the limit falls between minor units', () {
      expect(
        exceedsShare(
          part: sek(500000),
          whole: sek(1000001),
          share: const Rate.ppm(500000),
        ),
        isFalse,
      );
      expect(
        exceedsShare(
          part: sek(500001),
          whole: sek(1000001),
          share: const Rate.ppm(500000),
        ),
        isTrue,
      );
    });
  });
}
