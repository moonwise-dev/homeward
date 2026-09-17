import 'dart:convert';

import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/keys/keys_handler.dart';
import 'package:homeward_server/request/request_values.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  final now = DateTime.utc(2026, 9, 17, 12);
  final request = Request(
    'POST',
    Uri.parse('http://localhost/api/keys/verify'),
  ).withGeminiKey('AQ.key');

  Future<(int, Map<String, Object?>)> verifyWith(
    GeminiException? error,
  ) async {
    final handler = KeysHandler((_) async {
      if (error != null) {
        throw error;
      }
    }, now: () => now);
    final response = await handler.verify(request);
    return (
      response.statusCode,
      jsonDecode(await response.readAsString()) as Map<String, Object?>,
    );
  }

  test('accepts a key Gemini accepts', () async {
    final (status, body) = await verifyWith(null);

    expect(status, 200);
    expect(body, {'ok': true, 'data': <String, Object?>{}});
  });

  test('passes the key it was given to the verifier', () async {
    final keys = <String>[];
    await KeysHandler((key) async => keys.add(key)).verify(request);

    expect(keys, ['AQ.key']);
  });

  test('refuses a request without a key', () async {
    final response = await KeysHandler(
      (_) async {},
    ).verify(Request('POST', Uri.parse('http://localhost/api/keys/verify')));

    expect(response.statusCode, 400);
    expect(
      (jsonDecode(await response.readAsString()) as Map)['error'],
      containsPair('code', 'gemini_key_missing'),
    );
  });

  test('maps Gemini failures to statuses and envelope errors', () async {
    final (invalidStatus, invalid) = await verifyWith(
      const GeminiKeyInvalid('bad'),
    );
    final (quotaStatus, quota) = await verifyWith(
      GeminiQuotaExhausted('quota', resetsAt: DateTime.utc(2026, 9, 18, 7)),
    );

    expect(invalidStatus, 422);
    expect(invalid, {
      'ok': false,
      'error': {
        'code': 'gemini_key_invalid',
        'message': 'Gemini did not accept your API key',
      },
    });
    expect(quotaStatus, 429);
    expect(quota['error'], {
      'code': 'gemini_quota_exhausted',
      'message': 'Your Gemini key has used up its requests for today',
      'retryAfterSeconds': 68400,
    });
    expect((await verifyWith(const GeminiCreditsDepleted('prepaid'))).$1, 402);
    expect((await verifyWith(const GeminiUnavailable('busy'))).$1, 503);
    expect((await verifyWith(const GeminiRequestInvalid('404'))).$1, 500);
  });
}
