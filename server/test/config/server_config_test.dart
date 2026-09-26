import 'package:homeward_server/config/log_format.dart';
import 'package:homeward_server/config/server_config.dart';
import 'package:homeward_server/config/session_store.dart';
import 'package:test/test.dart';

void main() {
  test('defaults suit local development with production safeguards on', () {
    expect(
      ServerConfig.fromEnvironment({}),
      ServerConfig(
        port: 8080,
        logFormat: LogFormat.text,
        publicUrl: Uri.parse('http://localhost:8080'),
        turnModels: const [
          'gemini-3.5-flash-lite',
          'gemini-3.5-flash',
          'gemini-3.8-flash',
        ],
        thinkingLevel: 'low',
        headersDeadline: const Duration(seconds: 10),
        firstStepDeadline: const Duration(seconds: 20),
        modelCooldown: const Duration(minutes: 5),
        maxCorrections: 2,
        allowedOrigins: const [
          'https://homeward-genui.web.app',
          'https://homeward-genui.firebaseapp.com',
          'http://localhost:*',
        ],
        appCheckEnforced: true,
        promptsDirectory: 'server/prompts',
        sessionStore: SessionStore.memory,
      ),
    );
  });

  test('keeps sessions where the environment can hold them', () {
    expect(
      ServerConfig.fromEnvironment({'K_SERVICE': 'homeward-server'})
          .sessionStore,
      SessionStore.firestore,
    );
    expect(
      ServerConfig.fromEnvironment({
        'FIRESTORE_EMULATOR_HOST': 'localhost:8081',
      }).sessionStore,
      SessionStore.firestore,
    );
    expect(
      ServerConfig.fromEnvironment({
        'K_SERVICE': 'homeward-server',
        'HOMEWARD_SESSION_STORE': 'memory',
      }).sessionStore,
      SessionStore.memory,
    );
  });

  test('reads Cloud Run and Homeward variables', () {
    final config = ServerConfig.fromEnvironment({
      'PORT': '9090',
      'HOMEWARD_LOG_FORMAT': 'json',
      'GOOGLE_CLOUD_PROJECT': 'homeward-genui',
      'HOMEWARD_PUBLIC_URL': 'https://homeward.example.run.app',
      'HOMEWARD_TURN_MODELS': 'gemini-3.5-flash',
      'HOMEWARD_HEADERS_DEADLINE': '5',
      'HOMEWARD_MAX_CORRECTIONS': '1',
      'HOMEWARD_ALLOWED_ORIGINS': 'https://a.example, https://b.example',
      'HOMEWARD_APP_CHECK_ENFORCED': 'false',
      'HOMEWARD_PROMPTS_DIR': '/app/prompts',
    });

    expect(config.port, 9090);
    expect(config.logFormat, LogFormat.json);
    expect(config.projectId, 'homeward-genui');
    expect(config.turnModels, ['gemini-3.5-flash']);
    expect(config.headersDeadline, const Duration(seconds: 5));
    expect(config.maxCorrections, 1);
    expect(config.allowedOrigins, ['https://a.example', 'https://b.example']);
    expect(config.appCheckEnforced, isFalse);
    expect(config.promptsDirectory, '/app/prompts');
  });
}
