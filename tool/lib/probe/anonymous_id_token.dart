import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> anonymousIdToken(
  http.Client httpClient,
  String firebaseWebApiKey,
) async {
  final response = await httpClient.post(
    Uri.https('identitytoolkit.googleapis.com', '/v1/accounts:signUp', {
      'key': firebaseWebApiKey,
    }),
    headers: {'content-type': 'application/json'},
    body: jsonEncode({'returnSecureToken': true}),
  );
  if (response.statusCode >= 300) {
    throw StateError(
      'Anonymous sign-in failed with HTTP ${response.statusCode}',
    );
  }
  return (jsonDecode(response.body) as Map<String, Object?>)['idToken']!
      as String;
}
