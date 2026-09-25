import 'dart:developer';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../../config/environment.dart';

part 'app_check_repository.g.dart';

abstract interface class AppCheckRepository {
  Future<void> activate();

  Future<String?> token();
}

class FirebaseAppCheckRepository implements AppCheckRepository {
  FirebaseAppCheckRepository(
    this._appCheck, {
    required this.recaptchaSiteKey,
    this.debugToken,
  });

  final FirebaseAppCheck _appCheck;
  final String recaptchaSiteKey;
  final String? debugToken;

  @override
  Future<void> activate() => _appCheck.activate(
    providerWeb: ReCaptchaEnterpriseProvider(recaptchaSiteKey),
    providerAndroid: AndroidDebugProvider(debugToken: debugToken),
    providerApple: AppleDebugProvider(debugToken: debugToken),
  );

  @override
  Future<String?> token() async {
    try {
      return await _appCheck.getToken();
    } on Object catch (error, stackTrace) {
      log('App Check token unavailable', error: error, stackTrace: stackTrace);
      return null;
    }
  }
}

class UnenforcedAppCheckRepository implements AppCheckRepository {
  const UnenforcedAppCheckRepository();

  @override
  Future<void> activate() async {}

  @override
  Future<String?> token() async => null;
}

@Riverpod(keepAlive: true)
AppCheckRepository appCheckRepository(Ref ref) =>
    kReleaseMode || kAppCheckDebugToken.isNotEmpty
    ? FirebaseAppCheckRepository(
        ref.watch(firebaseAppCheckProvider),
        recaptchaSiteKey: kRecaptchaSiteKey,
        debugToken: kAppCheckDebugToken.isEmpty ? null : kAppCheckDebugToken,
      )
    : const UnenforcedAppCheckRepository();
