import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/data/repositories/gemini_key_repository.dart';
import 'package:homeward/data/services/development_server.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class _SavedKey implements GeminiKeyRepository {
  _SavedKey(this.key);

  String? key;

  @override
  bool get canForget => true;

  @override
  Future<String?> read() async => key;

  @override
  Future<void> save(String key, {required bool remember}) async =>
      this.key = key;

  @override
  Future<void> remove() async => key = null;

  @override
  Future<bool> useNextKey() async => false;
}

void main() {
  DevelopmentGeminiKeyRepository repositoryFor(
    _SavedKey saved,
    http.Client client,
  ) => DevelopmentGeminiKeyRepository(
    saved,
    DevelopmentServer(client, Uri.parse('http://localhost:8080')),
  );

  final serving = MockClient(
    (request) async => http.Response(
      jsonEncode({
        'geminiKeys': ['first', 'second'],
      }),
      200,
    ),
  );

  test('uses the local server keys while no key is saved', () async {
    final repository = repositoryFor(_SavedKey(null), serving);

    expect(await repository.read(), 'first');
  });

  test('moves to the next key when one runs out, then stops', () async {
    final repository = repositoryFor(_SavedKey(null), serving);

    expect(await repository.useNextKey(), isTrue);
    expect(await repository.read(), 'second');
    expect(await repository.useNextKey(), isFalse);
  });

  test('a key the buyer saved wins and is never rotated', () async {
    final repository = repositoryFor(_SavedKey('mine'), serving);

    expect(await repository.read(), 'mine');
    expect(await repository.useNextKey(), isFalse);
  });

  test('a server without a development config leaves the key screen', () async {
    final repository = repositoryFor(
      _SavedKey(null),
      MockClient((request) async => http.Response('Not found', 404)),
    );

    expect(await repository.read(), isNull);
  });

  test('a server that is not running is reported, and asked again', () async {
    var running = false;
    final repository = repositoryFor(
      _SavedKey(null),
      MockClient((request) async {
        if (!running) {
          throw http.ClientException('refused');
        }
        return http.Response(
          jsonEncode({
            'geminiKeys': ['first'],
          }),
          200,
        );
      }),
    );

    await expectLater(
      repository.read(),
      throwsA(isA<DevelopmentServerUnreachable>()),
    );
    running = true;
    expect(await repository.read(), 'first');
  });
}
