import 'dart:io';

import 'package:homeward_server/config/server_config.dart';
import 'package:homeward_server/run_server.dart';

Future<void> main() =>
    runServer(ServerConfig.fromEnvironment(Platform.environment));
