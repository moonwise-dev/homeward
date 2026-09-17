import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dependency_providers.g.dart';

const kServerUrl = String.fromEnvironment(
  'HOMEWARD_SERVER_URL',
  defaultValue: 'http://localhost:8080',
);

const kRecaptchaSiteKey = '6LdSUL8tAAAAAB5vqNCPVjeRWmE8nvwNDSg8QSg3';

const kAppCheckDebugToken = String.fromEnvironment(
  'HOMEWARD_APP_CHECK_DEBUG_TOKEN',
);

const kGeminiKeyUrl = 'https://aistudio.google.com/apikey';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
FirebaseAppCheck firebaseAppCheck(Ref ref) => FirebaseAppCheck.instance;

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => const FlutterSecureStorage(
  mOptions: MacOsOptions(usesDataProtectionKeychain: false),
);

@Riverpod(keepAlive: true)
http.Client httpClient(Ref ref) {
  final client = http.Client();
  ref.onDispose(client.close);
  return client;
}
