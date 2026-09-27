import 'dart:math';

import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  const circular = 'Ofício Circulado 40129/2026';
  const incomeTaxAct = 'Inkomstskattelag (1999:1229) 67 kap. 10 §';

  final tableI = [
    _eurBracket(10634600, 0),
    _eurBracket(14547000, 20000, 212692),
    _eurBracket(19834700, 50000, 649102),
    _eurBracket(33053900, 70000, 1045796),
    _eurBracket(66098200, 80000, 1376335),
    _eurBracket(115085300, 60000),
    _eurBracket(null, 75000),
  ];
  final tableIII = [
    _eurBracket(10634600, 10000),
    _eurBracket(14547000, 20000, 106346),
    _eurBracket(19834700, 50000, 542756),
    _eurBracket(33053900, 70000, 939450),
    _eurBracket(63393100, 80000, 1269989),
    _eurBracket(115085300, 60000),
    _eurBracket(null, 75000),
  ];
  final tableIV = [
    _eurBracket(13293300, 0),
    _eurBracket(18183800, 20000, 265866),
    _eurBracket(24793400, 50000, 811380),
    _eurBracket(41317400, 70000, 1307248),
    _eurBracket(82622800, 80000, 1720422),
    _eurBracket(143856600, 60000),
    _eurBracket(null, 75000),
  ];

  group('deductionCharge', () {
    final cases = <(String, List<Bracket>, int, int)>[
      ('$circular table IV', tableIV, 35000000, 1142752),
      ('$circular table IV', tableIV, 13293300, 0),
      ('$circular table IV', tableIV, 15000000, 34134),
      ('$circular table IV', tableIV, 82622900, 4957374),
      ('$circular table IV', tableIV, 150000000, 11250000),
      ('$circular table I', tableI, 33053900, 1267977),
      ('$circular table I', tableI, 20000000, 354204),
      ('$circular table I', tableI, 66098300, 3965898),
      ('$circular table III', tableIII, 10634600, 106346),
      ('$circular table III', tableIII, 63393200, 3803592),
    ];

    for (final (source, brackets, base, expected) in cases) {
      test('$source: $base', () {
        expect(
          deductionCharge(
            base: eur(base),
            brackets: brackets,
            rounding: Rounding.halfUp,
          ),
          eur(expected),
        );
      });
    }

    test('published deductions equal the marginal bands they replace', () {
      final random = Random(40129);
      for (final (table, progressiveCount) in [
        (tableI, 5),
        (tableIII, 5),
        (tableIV, 5),
      ]) {
        final progressive = table.take(progressiveCount).toList();
        final bands = [
          for (final bracket in progressive)
            Bracket(rate: bracket.rate, upTo: bracket.upTo),
        ];
        final top = progressive.last.upTo!.minorUnits;
        for (var i = 0; i < 500; i++) {
          final base = eur(random.nextInt(top + 1));
          expect(
            deductionCharge(
              base: base,
              brackets: progressive,
              rounding: Rounding.halfUp,
            ),
            marginalCharge(
              base: base,
              brackets: bands,
              rounding: Rounding.halfUp,
            ),
            reason: '${base.minorUnits}',
          );
        }
      }
    });

    test('rejects a deduction larger than the charge', () {
      expect(
        () => deductionCharge(
          base: eur(100),
          brackets: [_eurBracket(null, 10000, 50)],
          rounding: Rounding.halfUp,
        ),
        throwsArgumentError,
      );
    });
  });

  group('marginalCharge', () {
    final interestDeduction = [
      Bracket(rate: const Rate.ppm(300000), upTo: sek(10000000)),
      const Bracket(rate: Rate.ppm(210000)),
    ];
    const cases = <(int, int)>[
      (8000000, 2400000),
      (10000000, 3000000),
      (15000000, 4050000),
      (0, 0),
    ];

    for (final (interest, expected) in cases) {
      test('$incomeTaxAct: reduction on $interest of interest', () {
        expect(
          marginalCharge(
            base: sek(interest),
            brackets: interestDeduction,
            rounding: Rounding.halfUp,
          ),
          sek(expected),
        );
      });
    }

    test('rounds once on the exact sum of the bands', () {
      expect(
        marginalCharge(
          base: eur(3),
          brackets: [
            _eurBracket(1, 500000),
            _eurBracket(2, 500000),
            _eurBracket(null, 500000),
          ],
          rounding: Rounding.down,
        ),
        eur(1),
      );
    });

    test('rejects brackets with a deduction', () {
      expect(
        () => marginalCharge(
          base: eur(100),
          brackets: [_eurBracket(null, 10000, 1)],
          rounding: Rounding.halfUp,
        ),
        throwsArgumentError,
      );
    });
  });

  group('bracket validation', () {
    final invalid = <(String, Money, List<Bracket>)>[
      ('empty', eur(1), []),
      ('negative base', eur(-1), [_eurBracket(null, 10000)]),
      ('descending', eur(1), [_eurBracket(10, 0), _eurBracket(5, 0)]),
      ('open before last', eur(1), [_eurBracket(null, 0), _eurBracket(5, 0)]),
      ('base above last', eur(11), [_eurBracket(10, 0)]),
      (
        'other currency',
        eur(1),
        [
          Bracket(rate: Rate.zero, upTo: sek(10)),
        ],
      ),
    ];

    for (final (name, base, brackets) in invalid) {
      test('rejects $name', () {
        expect(
          () => deductionCharge(
            base: base,
            brackets: brackets,
            rounding: Rounding.halfUp,
          ),
          throwsArgumentError,
        );
      });
    }
  });
}

Bracket _eurBracket(int? upTo, int ratePpm, [int? deduction]) => Bracket(
  rate: Rate.ppm(ratePpm),
  upTo: upTo == null ? null : eur(upTo),
  deduction: deduction == null ? null : eur(deduction),
);
