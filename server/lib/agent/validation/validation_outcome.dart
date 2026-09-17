import 'package:a2ui_core/a2ui_core.dart';

import 'validation_failure.dart';

sealed class ValidationOutcome {
  const ValidationOutcome();
}

final class Accepted extends ValidationOutcome {
  const Accepted(this.message);

  final A2uiMessage message;
}

final class Rejected extends ValidationOutcome {
  const Rejected(this.failure);

  final ValidationFailure failure;
}
