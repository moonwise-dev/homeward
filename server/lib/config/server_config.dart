import 'package:freezed_annotation/freezed_annotation.dart';

import 'log_format.dart';
import 'session_store.dart';

part 'server_config.freezed.dart';

@freezed
abstract class ServerConfig with _$ServerConfig {
  const factory ServerConfig({
    required int port,
    required LogFormat logFormat,
    required Uri publicUrl,
    String? projectId,
    required List<String> turnModels,
    required String thinkingLevel,
    required Duration headersDeadline,
    required Duration firstStepDeadline,
    required Duration modelCooldown,
    required int maxCorrections,
    required bool deal,
    required List<String> allowedOrigins,
    required bool appCheckEnforced,
    required String promptsDirectory,
    required String marketsDirectory,
    required SessionStore sessionStore,
  }) = _ServerConfig;

  factory ServerConfig.fromEnvironment(Map<String, String> environment) {
    String read(String key, String fallback) => environment[key] ?? fallback;
    List<String> list(String key, String fallback) => [
      for (final item in read(key, fallback).split(','))
        if (item.trim().isNotEmpty) item.trim(),
    ];
    Duration seconds(String key, int fallback) =>
        Duration(seconds: int.parse(read(key, '$fallback')));

    return ServerConfig(
      port: int.parse(read('PORT', '8080')),
      logFormat: LogFormat.values.byName(
        read('HOMEWARD_LOG_FORMAT', LogFormat.text.name),
      ),
      publicUrl: Uri.parse(
        read('HOMEWARD_PUBLIC_URL', 'http://localhost:8080'),
      ),
      projectId: environment['GOOGLE_CLOUD_PROJECT'],
      turnModels: list(
        'HOMEWARD_TURN_MODELS',
        'gemini-3.5-flash-lite,gemini-3.5-flash,gemini-3.8-flash',
      ),
      thinkingLevel: read('HOMEWARD_THINKING_LEVEL', 'low'),
      headersDeadline: seconds('HOMEWARD_HEADERS_DEADLINE', 10),
      firstStepDeadline: seconds('HOMEWARD_FIRST_STEP_DEADLINE', 20),
      modelCooldown: seconds('HOMEWARD_MODEL_COOLDOWN', 300),
      maxCorrections: int.parse(read('HOMEWARD_MAX_CORRECTIONS', '2')),
      deal: read('HOMEWARD_DEAL', 'off') == 'on',
      allowedOrigins: list(
        'HOMEWARD_ALLOWED_ORIGINS',
        'https://homeward-genui.web.app,'
            'https://homeward-genui.firebaseapp.com,'
            'http://localhost:*',
      ),
      appCheckEnforced: read('HOMEWARD_APP_CHECK_ENFORCED', 'true') == 'true',
      promptsDirectory: read('HOMEWARD_PROMPTS_DIR', 'server/prompts'),
      marketsDirectory: read('HOMEWARD_MARKETS_DIR', 'markets'),
      sessionStore: SessionStore.values.byName(
        read('HOMEWARD_SESSION_STORE', _storeFor(environment).name),
      ),
    );
  }
}

SessionStore _storeFor(Map<String, String> environment) =>
    environment.containsKey('FIRESTORE_EMULATOR_HOST') ||
        environment.containsKey('K_SERVICE')
    ? SessionStore.firestore
    : SessionStore.memory;
