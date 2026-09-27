import 'dart:convert';

import '../validation/validation_failure.dart';

String correctionInput(List<ValidationFailure> failures) => [
  'These A2UI messages were rejected and not shown to the buyer:',
  for (final failure in failures) jsonEncode(failure.toJson()),
  'Send only the rejected messages again, corrected. Accepted messages are '
      'already shown; do not repeat them. When a reason names a tool to call '
      'first, call it, then send the message.',
].join('\n');
