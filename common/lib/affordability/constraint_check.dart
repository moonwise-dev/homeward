import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';
import 'constraint_kind.dart';

part 'constraint_check.freezed.dart';

@freezed
abstract class ConstraintCheck with _$ConstraintCheck {
  const factory ConstraintCheck({
    required ConstraintKind kind,
    required String ruleId,
    required String sourceId,
    required Money maxLoan,
  }) = _ConstraintCheck;

  const ConstraintCheck._();

  bool allows(Money loan) => loan <= maxLoan;
}
