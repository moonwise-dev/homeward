import 'dart:convert';

import '../validation/validation_failure.dart';

String correctionInput(List<ValidationFailure> failures) => [
  'These A2UI messages were rejected and not shown to the buyer:',
  for (final failure in failures) jsonEncode(failure.toJson()),
  'Send only the rejected messages again, corrected, in an a2ui block. '
      'Accepted messages are already shown; do not repeat them.',
].join('\n');
