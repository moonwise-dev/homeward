abstract interface class Researcher {
  Future<Map<String, Object?>> answer({
    required String instruction,
    required String question,
    required Map<String, Object?> schema,
  });
}
