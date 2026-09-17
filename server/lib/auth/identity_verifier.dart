abstract interface class IdentityVerifier {
  Future<String?> uidFor(String idToken);
}
