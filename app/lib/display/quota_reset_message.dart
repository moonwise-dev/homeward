import 'package:intl/intl.dart';

String quotaResetMessage(Duration? retryAfter, DateTime now) {
  const limited =
      'Your free Gemini key has hit a request limit. Try again in a minute; '
      'if it persists, the daily limit';
  if (retryAfter == null) {
    return '$limited resets at midnight Pacific time.';
  }
  final resetsAt = DateFormat.jm().format(now.add(retryAfter));
  return '$limited resets at $resetsAt.';
}
