import 'dart:convert';

import 'package:logging/logging.dart';

import '../request/request_context.dart';
import 'log_fields.dart';

const _errorEventType =
    'type.googleapis.com/google.devtools.clouderrorreporting.v1beta1.ReportedErrorEvent';

String formatCloudLoggingJson(LogRecord record, {String? projectId}) {
  final context = record.zone == null ? null : RequestContext.of(record.zone!);
  final traceId = context?.traceId;
  return jsonEncode({
    'severity': _severity(record.level),
    'message': _message(record),
    'time': record.time.toUtc().toIso8601String(),
    'logger': record.loggerName,
    if (record.error != null) '@type': _errorEventType,
    if (context != null) 'requestId': context.requestId,
    if (traceId != null && projectId != null)
      'logging.googleapis.com/trace': 'projects/$projectId/traces/$traceId',
    if (context?.spanId != null)
      'logging.googleapis.com/spanId': context!.spanId,
    ...logFields(record),
  }, toEncodable: (value) => value.toString());
}

String _severity(Level level) {
  if (level >= Level.SHOUT) {
    return 'CRITICAL';
  }
  if (level >= Level.SEVERE) {
    return 'ERROR';
  }
  if (level >= Level.WARNING) {
    return 'WARNING';
  }
  if (level >= Level.INFO) {
    return 'INFO';
  }
  return 'DEBUG';
}

String _message(LogRecord record) => [
  record.message,
  ?record.error,
  ?record.stackTrace,
].join('\n');
