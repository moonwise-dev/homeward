import 'dart:io';

import 'package:logging/logging.dart';

import '../config/log_format.dart';
import '../config/server_config.dart';
import 'format_cloud_logging_json.dart';
import 'format_text_log_line.dart';

void configureLogging(ServerConfig config) {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen(
    (record) => stdout.writeln(switch (config.logFormat) {
      LogFormat.json => formatCloudLoggingJson(
        record,
        projectId: config.projectId,
      ),
      LogFormat.text => formatTextLogLine(record),
    }),
  );
}
