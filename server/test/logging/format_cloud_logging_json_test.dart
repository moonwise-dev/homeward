import 'dart:async';
import 'dart:convert';

import 'package:homeward_server/logging/format_cloud_logging_json.dart';
import 'package:homeward_server/logging/log_entry.dart';
import 'package:homeward_server/request/request_context.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void main() {
  Map<String, Object?> format(
    LogRecord record, {
    String? projectId = 'homeward-staging',
  }) =>
      jsonDecode(formatCloudLoggingJson(record, projectId: projectId))
          as Map<String, Object?>;

  LogRecord record(
    Level level, {
    Object? object,
    Object? error,
    StackTrace? stackTrace,
    Zone? zone,
  }) => LogRecord(
    level,
    object?.toString() ?? 'message',
    'test',
    error,
    stackTrace,
    zone,
    object,
  );

  const severities = [
    (Level.FINE, 'DEBUG'),
    (Level.INFO, 'INFO'),
    (Level.WARNING, 'WARNING'),
    (Level.SEVERE, 'ERROR'),
    (Level.SHOUT, 'CRITICAL'),
  ];

  for (final (level, severity) in severities) {
    test('maps ${level.name} to $severity', () {
      expect(format(record(level))['severity'], severity);
    });
  }

  test('merges structured fields from a log entry', () {
    final json = format(
      record(
        Level.INFO,
        object: const LogEntry('done', fields: {'durationMs': 12}),
      ),
    );

    expect(json['message'], 'done');
    expect(json['durationMs'], 12);
  });

  test('links the request trace when the project is known', () {
    final zone = Zone.current.fork(
      zoneValues: {
        RequestContext.zoneKey: const RequestContext(
          requestId: 'r-1',
          traceId: '4bf92f3577b34da6a3ce929d0e0e4736',
          spanId: '00f067aa0ba902b7',
        ),
      },
    );

    final json = format(record(Level.INFO, zone: zone));

    expect(json['requestId'], 'r-1');
    expect(
      json['logging.googleapis.com/trace'],
      'projects/homeward-staging/traces/4bf92f3577b34da6a3ce929d0e0e4736',
    );
    expect(json['logging.googleapis.com/spanId'], '00f067aa0ba902b7');
    expect(
      format(record(Level.INFO, zone: zone), projectId: null),
      isNot(contains('logging.googleapis.com/trace')),
    );
  });

  test('reports errors with their stack trace to Error Reporting', () {
    final json = format(
      record(
        Level.SEVERE,
        error: StateError('boom'),
        stackTrace: StackTrace.fromString('#0 main'),
      ),
    );

    expect(json['@type'], contains('ReportedErrorEvent'));
    expect(json['message'], 'message\nBad state: boom\n#0 main');
  });
}
