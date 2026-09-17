import 'package:firebase_admin_sdk/auth.dart';

import 'identity_verifier.dart';

final class FirebaseIdentityVerifier implements IdentityVerifier {
  const FirebaseIdentityVerifier(this.auth);

  final Auth auth;

  @override
  Future<String?> uidFor(String idToken) async {
    try {
      return (await auth.verifyIdToken(idToken)).uid;
    } on FirebaseAuthAdminException {
      return null;
    }
  }
}
