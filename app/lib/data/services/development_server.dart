import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DevelopmentServerUnreachable implements Exception {
  const DevelopmentServerUnreachable(this.server);

  final Uri server;
}

class DevelopmentServer {
  DevelopmentServer(this._client, this._server);

  final http.Client _client;
  final Uri _server;

  Future<List<String>> geminiKeys() async {
    final http.Response response;
    try {
      response = await _client
          .get(_server.resolve('/dev/config'))
          .timeout(const Duration(seconds: 5));
    } on http.ClientException {
      throw DevelopmentServerUnreachable(_server);
    } on TimeoutException {
      throw DevelopmentServerUnreachable(_server);
    }
    if (response.statusCode != 200) {
      return const [];
    }
    final config = jsonDecode(response.body) as Map<String, Object?>;
    return [for (final key in config['geminiKeys']! as List<Object?>) '$key'];
  }
}
