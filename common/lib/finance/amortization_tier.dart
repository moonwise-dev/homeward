import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';
import '../money/rate.dart';
import 'share.dart';

part 'amortization_tier.freezed.dart';

@freezed
abstract class AmortizationTier with _$AmortizationTier {
  const factory AmortizationTier({
    required Rate whenLtvAbove,
    required Rate annualRate,
  }) = _AmortizationTier;
}

Rate requiredAmortizationRate({
  required Money loan,
  required Money value,
  required Iterable<AmortizationTier> tiers,
}) => tiers
    .where(
      (tier) =>
          exceedsShare(part: loan, whole: value, share: tier.whenLtvAbove),
    )
    .map((tier) => tier.annualRate)
    .fold(Rate.zero, (highest, rate) => rate > highest ? rate : highest);
