import 'package:homeward_server/config/log_format.dart';
import 'package:homeward_server/config/server_config.dart';
import 'package:test/test.dart';

void main() {
  test('defaults to port 8080 and text logs', () {
    expect(
      ServerConfig.fromEnvironment({}),
      const ServerConfig(port: 8080, logFormat: LogFormat.text),
    );
  });

  test('reads Cloud Run and Homeward variables', () {
    expect(
      ServerConfig.fromEnvironment({
        'PORT': '9090',
        'HOMEWARD_LOG_FORMAT': 'json',
        'GOOGLE_CLOUD_PROJECT': 'homeward-genui',
      }),
      const ServerConfig(
        port: 9090,
        logFormat: LogFormat.json,
        projectId: 'homeward-genui',
      ),
    );
  });
}
