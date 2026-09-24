abstract interface class ResearchCache {
  Future<Object?> read(String key);

  Future<void> write(String key, Object value);
}

final class NoResearchCache implements ResearchCache {
  const NoResearchCache();

  @override
  Future<Object?> read(String key) async => null;

  @override
  Future<void> write(String key, Object value) async {}
}
