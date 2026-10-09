import 'package:a2ui_core/a2ui_core.dart';

import 'validation_failure.dart';

sealed class ValidationOutcome {
  const ValidationOutcome();
}

final class Accepted extends ValidationOutcome {
  const Accepted(this.message, {this.created});

  final A2uiMessage message;
  final CreateSurfaceMessage? created;
}

final class Unchanged extends ValidationOutcome {
  const Unchanged();
}

final class Rejected extends ValidationOutcome {
  const Rejected(this.failure);

  final ValidationFailure failure;
}
