import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';

Rate shareOf({
  required Money part,
  required Money whole,
  required Rounding rounding,
}) {
  if (part.currency != whole.currency) {
    throw ArgumentError.value(
      part.currency.code,
      'part',
      'Expected ${whole.currency.code}',
    );
  }
  if (whole.isZero) {
    throw ArgumentError.value(whole.minorUnits, 'whole', 'Must not be zero');
  }
  return Rate.ppm(
    rounding.scale(
      part.minorUnits,
      Rate.hundredPercent.partsPerMillion,
      whole.minorUnits,
    ),
  );
}

bool exceedsShare({
  required Money part,
  required Money whole,
  required Rate share,
}) => part > whole.applyRate(share, rounding: Rounding.down);
