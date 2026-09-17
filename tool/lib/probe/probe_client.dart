import 'dart:convert';

import 'package:common/common.dart';
import 'package:http/http.dart' as http;

final class ProbeClient {
  ProbeClient({required this.httpClient, required this.server});

  final http.Client httpClient;
  final Uri server;

  Future<String> anonymousIdToken(String firebaseWebApiKey) async {
    final response = await httpClient.post(
      Uri.https('identitytoolkit.googleapis.com', '/v1/accounts:signUp', {
        'key': firebaseWebApiKey,
      }),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({'returnSecureToken': true}),
    );
    return _json(response, 'Anonymous sign-in')['idToken']! as String;
  }

  Future<String> createSession(String idToken) async {
    final response = await httpClient.post(
      server.resolve('api/sessions'),
      headers: {'authorization': 'Bearer $idToken'},
    );
    final data = _json(response, 'Session creation')['data']! as Map;
    return data['sessionId']! as String;
  }

  Stream<Map<String, Object?>> streamTurn({
    required String idToken,
    required String geminiKey,
    required String sessionId,
    required List<A2aPart> parts,
    Map<String, Object?>? metadata,
  }) async* {
    final request = http.Request('POST', server.resolve('a2a'))
      ..headers.addAll({
        'authorization': 'Bearer $idToken',
        'content-type': 'application/json',
        'accept': 'text/event-stream',
        'x-homeward-gemini-key': geminiKey,
        A2uiExtension.header: A2uiExtension.uri,
      })
      ..body = jsonEncode(
        JsonRpcRequest(
          jsonrpc: '2.0',
          id: 1,
          method: 'message/stream',
          params: MessageSendParams(
            message: A2aMessage(
              role: A2aRole.user,
              parts: parts,
              metadata: metadata,
              messageId: DateTime.now().microsecondsSinceEpoch.toString(),
              contextId: sessionId,
            ),
          ).toJson(),
        ),
      );
    final response = await httpClient.send(request);
    if (response.headers['content-type'] != 'text/event-stream') {
      yield jsonDecode(await response.stream.bytesToString())
          as Map<String, Object?>;
      return;
    }
    await for (final event in decodeSse(response.stream)) {
      yield jsonDecode(event.data) as Map<String, Object?>;
    }
  }

  Map<String, Object?> _json(http.Response response, String step) {
    if (response.statusCode >= 300) {
      throw StateError('$step failed with HTTP ${response.statusCode}');
    }
    return jsonDecode(response.body) as Map<String, Object?>;
  }
}
