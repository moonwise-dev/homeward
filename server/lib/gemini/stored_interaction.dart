final class StoredInteraction {
  const StoredInteraction({this.status, this.model, this.steps = const []});

  factory StoredInteraction.fromJson(Map<String, Object?> json) =>
      StoredInteraction(
        status: json['status'] as String?,
        model: json['model'] as String?,
        steps: [
          for (final step in json['steps'] as List<Object?>? ?? const [])
            if (step case {'type': final String type}) type,
        ],
      );

  final String? status;
  final String? model;
  final List<String> steps;
}
