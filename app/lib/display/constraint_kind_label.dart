import 'package:common/common.dart';

String constraintKindLabel(ConstraintKind kind) => switch (kind) {
  ConstraintKind.loanToValue => 'loan-to-value cap',
  ConstraintKind.loanToIncome => 'income multiple cap',
  ConstraintKind.debtServiceToIncome => 'debt-service limit',
  ConstraintKind.leftToLiveOn => 'left-to-live-on calculation',
};
