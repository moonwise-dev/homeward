abstract interface class AppCheckVerifier {
  Future<bool> verify(String token);
}
