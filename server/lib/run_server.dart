import 'dart:io';

import 'package:async/async.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'app.dart';
import 'config/server_config.dart';
import 'logging/configure_logging.dart';
import 'logging/log_entry.dart';

final _log = Logger('server');

Future<void> runServer(ServerConfig config) async {
  configureLogging(config);
  final server = await shelf_io.serve(
    buildApp(config),
    InternetAddress.anyIPv4,
    config.port,
    poweredByHeader: null,
  );
  _log.info(
    LogEntry('Listening on port ${server.port}', fields: {'port': server.port}),
  );
  await StreamGroup.merge([
    ProcessSignal.sigterm.watch(),
    ProcessSignal.sigint.watch(),
  ]).first;
  _log.info('Shutting down');
  await server.close();
}
