import 'package:common/common.dart';

import '../ui/app_status.dart';
import 'constraint_kind_label.dart';

AppStatus appStatusOf(EligibilityStatus status) => switch (status) {
  EligibilityStatus.pass => AppStatus.pass,
  EligibilityStatus.warn => AppStatus.warn,
  EligibilityStatus.fail => AppStatus.fail,
};

String eligibilityTitle(EligibilityItem item) => switch (item) {
  LoanEligibility(:final status, :final kind) =>
    status == EligibilityStatus.pass
        ? 'Passes the ${constraintKindLabel(kind)}'
        : 'Above the ${constraintKindLabel(kind)}',
  TermEligibility(
    :final status,
    :final limit,
    :final allowedYears,
  ) =>
    switch ((status, limit)) {
      (EligibilityStatus.pass, TermLimit.marketMaximum) =>
        'Term within the $allowedYears year maximum',
      (EligibilityStatus.pass, TermLimit.ageAtMaturity) =>
        'Term ends before the age limit',
      (_, TermLimit.marketMaximum) =>
        'Term longer than the $allowedYears year maximum',
      (_, TermLimit.ageAtMaturity) =>
        'Term runs past the age limit, $allowedYears years at most',
    },
};
