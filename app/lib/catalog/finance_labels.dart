import 'package:common/common.dart';

import 'foreign_buyer_obstacles/foreign_buyer_obstacles_view.dart';

String constraintKindLabel(ConstraintKind kind) => switch (kind) {
  ConstraintKind.loanToValue => 'loan-to-value cap',
  ConstraintKind.loanToIncome => 'income multiple cap',
  ConstraintKind.debtServiceToIncome => 'debt-service limit',
  ConstraintKind.leftToLiveOn => 'left-to-live-on calculation',
};

String profileFieldLabel(ProfileField field) => switch (field) {
  ProfileField.citizenship => 'citizenship',
  ProfileField.residency => 'tax residence',
  ProfileField.formerResident => 'whether you lived there before',
  ProfileField.residencyIntent => 'whether you will move there',
  ProfileField.use => 'how you will use the home',
  ProfileField.firstTime => 'whether this is your first home',
  ProfileField.employment => 'employment',
  ProfileField.netMonthlyIncome => 'net monthly income',
  ProfileField.grossMonthlyIncome => 'gross monthly income',
  ProfileField.incomeCurrency => 'income currency',
  ProfileField.savings => 'savings',
  ProfileField.monthlyDebtPayments => 'monthly debt payments',
  ProfileField.age => 'age',
  ProfileField.household => 'household',
  ProfileField.borrowers => 'number of borrowers',
};

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
