import 'package:intl/intl.dart';

String quotaResetMessage(Duration? retryAfter, DateTime now) {
  const exhausted = 'Your free Gemini key has reached its daily limit.';
  if (retryAfter == null) {
    return '$exhausted It resets at midnight Pacific time.';
  }
  final resetsAt = DateFormat.jm().format(now.add(retryAfter));
  return '$exhausted It resets at $resetsAt.';
}
