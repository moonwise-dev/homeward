import 'package:firebase_admin_sdk/app_check.dart';

import 'app_check_verifier.dart';

final class FirebaseAppCheckVerifier implements AppCheckVerifier {
  const FirebaseAppCheckVerifier(this.appCheck);

  final AppCheck appCheck;

  @override
  Future<bool> verify(String token) async {
    try {
      await appCheck.verifyToken(token);
      return true;
    } on FirebaseAppCheckException {
      return false;
    }
  }
}
