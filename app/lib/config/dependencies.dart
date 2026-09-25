import 'package:common/common.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/auth_repository.dart';
import '../data/services/development_server.dart';
import 'environment.dart';

part 'dependencies.g.dart';

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

@Riverpod(keepAlive: true)
HomewardClient homewardClient(Ref ref) => HomewardClient(
  httpClient: ref.watch(httpClientProvider),
  server: Uri.parse(kServerUrl),
  credentials: ref.watch(authRepositoryProvider).credentials,
);

@Riverpod(keepAlive: true)
DevelopmentServer developmentServer(Ref ref) =>
    DevelopmentServer(ref.watch(httpClientProvider), Uri.parse(kServerUrl));
