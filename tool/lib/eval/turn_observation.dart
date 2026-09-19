final class TurnObservation {
  const TurnObservation({
    required this.index,
    required this.messages,
    required this.text,
    required this.toolsCalled,
    required this.toolsRun,
    required this.rejections,
    required this.modelRounds,
    required this.corrections,
    required this.elapsed,
    required this.marketId,
    required this.coverage,
    required this.bindingConstraint,
    this.errorCode,
  });

  final int index;
  final List<Map<String, Object?>> messages;
  final String text;
  final List<String> toolsCalled;
  final Set<String> toolsRun;
  final List<String> rejections;
  final int modelRounds;
  final int corrections;
  final Duration elapsed;
  final String? marketId;
  final String? coverage;
  final String? bindingConstraint;
  final String? errorCode;

  List<String> get components => [
    for (final message in messages)
      if (message case {
        'updateComponents': {'components': final List<Object?> components},
      })
        for (final component in components)
          if (component case {'component': final String name}) name,
  ];

  Set<String> get boundPaths => {
    for (final message in messages)
      if (message['updateComponents'] case final Object? update)
        ..._pathsIn(update),
  };

  Set<String> get profileFieldsAsked => {
    for (final path in boundPaths)
      if (path.startsWith('/profile/')) path.split('/').last,
  };

  static Iterable<String> _pathsIn(Object? json) sync* {
    switch (json) {
      case {'path': final String path}:
        yield path;
      case final Map<String, Object?> map:
        for (final value in map.values) {
          yield* _pathsIn(value);
        }
      case final List<Object?> list:
        for (final value in list) {
          yield* _pathsIn(value);
        }
    }
  }
}
