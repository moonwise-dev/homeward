import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';

part 'bracket.freezed.dart';

@freezed
abstract class Bracket with _$Bracket {
  const factory Bracket({required Rate rate, Money? upTo, Money? deduction}) =
      _Bracket;
}

const _ppmPerWhole = 1000000;

Money marginalCharge({
  required Money base,
  required List<Bracket> brackets,
  required Rounding rounding,
}) {
  _checkBrackets(base, brackets);
  if (brackets.any((bracket) => bracket.deduction != null)) {
    throw ArgumentError.value(
      brackets,
      'brackets',
      'Marginal brackets carry no deduction',
    );
  }
  var lower = Money.zero(base.currency);
  var wholePart = 0;
  var fractionalNumerator = 0;
  for (final bracket in brackets) {
    if (base <= lower) {
      break;
    }
    final upTo = bracket.upTo;
    final upper = upTo == null || base < upTo ? base : upTo;
    final band = (upper - lower).minorUnits;
    wholePart += band ~/ _ppmPerWhole * bracket.rate.partsPerMillion;
    fractionalNumerator +=
        band.remainder(_ppmPerWhole) * bracket.rate.partsPerMillion;
    lower = upper;
  }
  return base.copyWith(
    minorUnits: rounding.roundFraction(
      wholePart + fractionalNumerator ~/ _ppmPerWhole,
      fractionalNumerator.remainder(_ppmPerWhole),
      _ppmPerWhole,
    ),
  );
}

Money deductionCharge({
  required Money base,
  required List<Bracket> brackets,
  required Rounding rounding,
}) {
  _checkBrackets(base, brackets);
  final bracket = brackets.firstWhere((bracket) {
    final upTo = bracket.upTo;
    return upTo == null || base <= upTo;
  });
  final ppm = bracket.rate.partsPerMillion;
  final fractionalNumerator = base.minorUnits.remainder(_ppmPerWhole) * ppm;
  final wholePart =
      base.minorUnits ~/ _ppmPerWhole * ppm +
      fractionalNumerator ~/ _ppmPerWhole -
      (bracket.deduction?.minorUnits ?? 0);
  if (wholePart < 0) {
    throw ArgumentError.value(
      bracket.deduction?.minorUnits,
      'deduction',
      'Exceeds the charge on ${base.minorUnits}',
    );
  }
  return base.copyWith(
    minorUnits: rounding.roundFraction(
      wholePart,
      fractionalNumerator.remainder(_ppmPerWhole),
      _ppmPerWhole,
    ),
  );
}

void _checkBrackets(Money base, List<Bracket> brackets) {
  if (base.isNegative) {
    throw ArgumentError.value(base.minorUnits, 'base', 'Must not be negative');
  }
  if (brackets.isEmpty) {
    throw ArgumentError.value(brackets, 'brackets', 'Must not be empty');
  }
  Money? previous;
  for (final (index, bracket) in brackets.indexed) {
    final upTo = bracket.upTo;
    final deduction = bracket.deduction;
    if (bracket.rate < Rate.zero ||
        (upTo == null && index != brackets.length - 1) ||
        (upTo != null && previous != null && upTo <= previous) ||
        (upTo != null && upTo.currency != base.currency) ||
        (deduction != null && deduction.currency != base.currency)) {
      throw ArgumentError.value(
        bracket,
        'brackets[$index]',
        'Brackets must ascend in the base currency with only the last open',
      );
    }
    previous = upTo;
  }
  final last = brackets.last.upTo;
  if (last != null && base > last) {
    throw ArgumentError.value(
      base.minorUnits,
      'base',
      'Above the last bracket',
    );
  }
}
