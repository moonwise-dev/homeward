import 'package:freezed_annotation/freezed_annotation.dart';

import 'log_format.dart';

part 'server_config.freezed.dart';

@freezed
abstract class ServerConfig with _$ServerConfig {
  const factory ServerConfig({
    required int port,
    required LogFormat logFormat,
    required Uri publicUrl,
    String? projectId,
  }) = _ServerConfig;

  factory ServerConfig.fromEnvironment(Map<String, String> environment) =>
      ServerConfig(
        port: int.parse(environment['PORT'] ?? '8080'),
        logFormat: LogFormat.values.byName(
          environment['HOMEWARD_LOG_FORMAT'] ?? LogFormat.text.name,
        ),
        publicUrl: Uri.parse(
          environment['HOMEWARD_PUBLIC_URL'] ?? 'http://localhost:8080',
        ),
        projectId: environment['GOOGLE_CLOUD_PROJECT'],
      );
}
