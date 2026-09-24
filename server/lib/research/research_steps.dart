abstract interface class ResearchSteps {
  Future<T> track<T>(
    String label,
    Future<T> Function() work, {
    bool Function(T result)? measured,
  });
}

final class SilentSteps implements ResearchSteps {
  const SilentSteps();

  @override
  Future<T> track<T>(
    String label,
    Future<T> Function() work, {
    bool Function(T result)? measured,
  }) => work();
}
