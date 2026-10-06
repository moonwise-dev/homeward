import 'dart:io';

import 'package:homeward_server/config/server_config.dart';
import 'package:homeward_server/development/development_environment.dart';
import 'package:homeward_server/development/development_handler.dart';
import 'package:homeward_server/run_server.dart';
import 'package:hotreloader/hotreloader.dart';

Future<void> main() async {
  final environment = developmentEnvironment(
    Platform.environment,
    dotenv: _read('.env'),
    firebaserc: _read('.firebaserc'),
  );
  await HotReloader.create();
  await runServer(
    ServerConfig.fromEnvironment(environment),
    development: developmentHandler(environment),
  );
}

String? _read(String path) {
  final file = File(path);
  return file.existsSync() ? file.readAsStringSync() : null;
}
