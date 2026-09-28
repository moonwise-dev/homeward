final class ModelCircuits {
  ModelCircuits({
    required List<String> models,
    required this.cooldown,
    DateTime Function()? now,
  }) : models = List.unmodifiable(models),
       _now = now ?? DateTime.now;

  final List<String> models;
  final Duration cooldown;
  final DateTime Function() _now;
  final _openUntil = <String, DateTime>{};

  List<String> get healthyModels => [
    for (final model in models)
      if (!_isOpen(model)) model,
  ];

  List<String> get candidates => switch (healthyModels) {
    [] => [
      models.reduce(
        (soonest, model) =>
            _openUntil[model]!.isBefore(_openUntil[soonest]!) ? model : soonest,
      ),
    ],
    final healthy => healthy,
  };

  List<String> get cooling => [
    for (final model in models)
      if (_isOpen(model)) model,
  ]..sort((a, b) => _openUntil[a]!.compareTo(_openUntil[b]!));

  void open(String model) => _openUntil[model] = _now().add(cooldown);

  bool _isOpen(String model) => switch (_openUntil[model]) {
    final until? => _now().isBefore(until),
    null => false,
  };
}
