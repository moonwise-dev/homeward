import 'package:logging/logging.dart';

import 'log_entry.dart';

Map<String, Object?> logFields(LogRecord record) => switch (record.object) {
  LogEntry(:final fields) => fields,
  _ => const {},
};
