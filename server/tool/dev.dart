import 'dart:io';

import 'package:homeward_server/config/server_config.dart';
import 'package:homeward_server/run_server.dart';
import 'package:hotreloader/hotreloader.dart';

Future<void> main() async {
  final reloader = await HotReloader.create();
  await runServer(ServerConfig.fromEnvironment(Platform.environment));
  await reloader.stop();
}
