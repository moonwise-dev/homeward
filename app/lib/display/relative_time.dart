import 'package:intl/intl.dart';

String relativeTime(DateTime at, DateTime now) {
  final elapsed = now.difference(at);
  return switch (elapsed) {
    Duration(inMinutes: < 1) => 'Just now',
    Duration(inHours: < 1, :final inMinutes) => '$inMinutes min ago',
    Duration(inDays: < 1, :final inHours) => '$inHours h ago',
    _ => DateFormat.MMMd().format(at),
  };
}
