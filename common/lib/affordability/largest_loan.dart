import '../money/money.dart';

Money largestLoanWhere({
  required Money upper,
  required bool Function(Money loan) allows,
}) {
  final zero = Money.zero(upper.currency);
  if (!allows(zero)) {
    return zero;
  }
  if (allows(upper)) {
    return upper;
  }
  var allowed = 0;
  var refused = upper.minorUnits;
  while (refused - allowed > 1) {
    final middle = allowed + (refused - allowed) ~/ 2;
    if (allows(upper.copyWith(minorUnits: middle))) {
      allowed = middle;
    } else {
      refused = middle;
    }
  }
  return upper.copyWith(minorUnits: allowed);
}
