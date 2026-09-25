import 'package:homeward_tool/dev/development_server.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  test('a server that answers its health check is up', () async {
    final server = DevelopmentServer(
      client: MockClient((request) async {
        expect(request.url, Uri.parse('http://localhost:8080/health'));
        return http.Response('{"status":"ok"}', 200);
      }),
    );

    expect(await server.isUp, isTrue);
  });

  test(
    'a server that refuses connections or answers badly is not up',
    () async {
      final refusing = DevelopmentServer(
        client: MockClient((request) => throw http.ClientException('refused')),
      );
      final failing = DevelopmentServer(
        client: MockClient((request) async => http.Response('', 500)),
      );

      expect(await refusing.isUp, isFalse);
      expect(await failing.isUp, isFalse);
    },
  );
}
