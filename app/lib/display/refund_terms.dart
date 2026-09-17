import 'package:common/common.dart';

import 'period_format.dart';

String refundTerms(RefundRule refund) {
  final conditions = [
    if (refund.recomputeAs.residency == Residency.resident)
      'become a tax resident',
    if (refund.recomputeAs.use == PropertyUse.primary)
      'make it your permanent home',
  ];
  final claim = 'claimed within ${formatPeriod(refund.claimWindow)}';
  return conditions.isEmpty
      ? 'Refundable, $claim.'
      : 'Comes back if you ${conditions.join(' and ')} within '
            '${formatPeriod(refund.deadline)}, $claim.';
}
