import 'package:logging/logging.dart';

import 'log_fields.dart';

String formatTextLogLine(LogRecord record) {
  final fields = logFields(record).entries
      .map((field) => '${field.key}=${field.value}');
  return [
    [
      record.time.toIso8601String().substring(11, 23),
      record.level.name.padRight(7),
      '${record.loggerName}:',
      record.message,
      ...fields,
    ].join(' '),
    ?record.error,
    ?record.stackTrace,
  ].join('\n');
}
