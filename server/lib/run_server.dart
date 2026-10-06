import 'dart:io';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'a2a/task_registry.dart';
import 'app.dart';
import 'config/server_config.dart';
import 'data/providers/providers.dart';
import 'logging/configure_logging.dart';
import 'logging/log_entry.dart';

final _log = Logger('server');

const _shutdownGrace = Duration(seconds: 8);
const _drainCheckInterval = Duration(milliseconds: 100);

Future<Never> runServer(ServerConfig config, {Handler? development}) async {
  configureLogging(config);
  final providers = Providers.production(config, http.Client());
  final server = await shelf_io.serve(
    buildApp(providers, development: development),
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
  await _drain(server, providers.tasks);
  exit(0);
}

Future<void> _drain(HttpServer server, TaskRegistry tasks) async {
  final waited = Stopwatch()..start();
  while (server.connectionsInfo().total > 0 || tasks.running.isNotEmpty) {
    if (waited.elapsed >= _shutdownGrace) {
      _log.warning(
        LogEntry(
          'Shutdown grace ended with work in flight',
          fields: {
            'connections': server.connectionsInfo().total,
            'runningTasks': tasks.running.length,
          },
        ),
      );
      return;
    }
    await Future<void>.delayed(_drainCheckInterval);
  }
}
