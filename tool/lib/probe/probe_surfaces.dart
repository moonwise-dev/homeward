import 'package:common/common.dart';

typedef ProbeAction = ({ClientAction action, Map<String, Object?> surfaceData});

typedef ProbeSurface = ({
  String surfaceId,
  List<Map<String, Object?>> components,
  Map<String, Object?> data,
});

final class ProbeSurfaces {
  final _data = <String, Map<String, Object?>>{};
  final _components = <String, List<Map<String, Object?>>>{};
  final _drawnInTurn = <String, int>{};
  var _turn = 0;

  void nextTurn() => _turn++;

  void record(Map<String, Object?> message) {
    switch (message) {
      case {
        'updateDataModel': {
          'surfaceId': final String id,
          'path': final String path,
          'value': final Object? value,
        },
      }:
        (_data[id] ??= {})[path.substring(1)] = value;
      case {
        'updateComponents': {
          'surfaceId': final String id,
          'components': final List<Object?> components,
        },
      }:
        _components[id] = [
          for (final component in components)
            if (component case final Map<String, Object?> json) json,
        ];
        _drawnInTurn[id] = _turn;
    }
  }

  ProbeSurface? get latest => switch (_components.keys.lastOrNull) {
    final String id => (
      surfaceId: id,
      components: _components[id]!,
      data: _data[id] ?? const {},
    ),
    null => null,
  };

  bool offers(String action, ProbeSurface surface) => surface.components.any(
    (component) => _eventNamed(component, action) != null,
  );

  ProbeAction? pick(String wanted) {
    final choice = _latest('Choice');
    if (choice == null) {
      return null;
    }
    final labels = [
      for (final option in choice.component['options'] as List<Object?>? ?? [])
        if (option case {'label': final String label}) label,
    ];
    final ordered = [
      ...labels.where((label) => label == choice.component['recommended']),
      ...labels.where((label) => label != choice.component['recommended']),
    ];
    final label = switch (int.tryParse(wanted)) {
      final index? when index >= 1 && index <= ordered.length =>
        ordered[index - 1],
      _ =>
        ordered
            .where(
              (label) => label.toLowerCase().contains(wanted.toLowerCase()),
            )
            .firstOrNull,
    };
    return label == null
        ? null
        : _tap(choice, 'answer', {'choice': label, 'label': label});
  }

  ProbeAction? fill(List<String> answers) {
    final questions = _latest('Questions');
    if (questions == null) {
      return null;
    }
    final fields = [
      for (final field
          in questions.component['fields'] as List<Object?>? ?? const [])
        if (field case {'id': final String id, 'label': final String label})
          (id: id, label: label),
    ];
    final keyed = [
      for (final answer in answers)
        if (answer.split('=') case [final key, final value])
          (words: key.trim().toLowerCase().split(' '), value: value.trim()),
    ];
    final given = {
      for (final (index, field) in fields.indexed)
        if (keyed.isEmpty)
          if (index < answers.length && answers[index] != '-')
            field: answers[index]
          else
            ...const <({String id, String label}), String>{}
        else
          field: ?keyed
              .where(
                (answer) => answer.words.every(
                  '${field.label} ${field.id}'.toLowerCase().contains,
                ),
              )
              .firstOrNull
              ?.value,
    };
    return _tap(questions, 'answer', {
      'answers': {
        for (final MapEntry(:key, :value) in given.entries) key.id: value,
      },
      'label': [
        for (final MapEntry(:key, :value) in given.entries)
          '${key.label}: $value',
      ].join('\n'),
    });
  }

  ({String surfaceId, Map<String, Object?> component})? _latest(String name) {
    for (final surfaceId in _components.keys.toList().reversed) {
      if (_drawnInTurn[surfaceId] != _turn) {
        continue;
      }
      for (final component in _components[surfaceId]!) {
        if (component['component'] == name) {
          return (surfaceId: surfaceId, component: component);
        }
      }
    }
    return null;
  }

  ProbeAction? _tap(
    ({String surfaceId, Map<String, Object?> component}) found,
    String property,
    Map<String, Object?> tapped,
  ) => switch (found.component[property]) {
    {'event': {'name': final String name}} => actionFor(
      name,
      const {},
      tapped: tapped,
    ),
    _ => null,
  };

  static Map<String, Object?>? _eventNamed(
    Map<String, Object?> component,
    String name,
  ) {
    for (final value in component.values) {
      if (value
          case {
            'event':
                {'name': final String eventName} &&
                final Map<String, Object?> event,
          }
          when eventName == name) {
        return event;
      }
    }
    return null;
  }

  ProbeAction? actionFor(
    String name,
    Map<String, Object?> overrides, {
    Map<String, Object?> tapped = const {},
  }) {
    for (final surfaceId in _components.keys.toList().reversed) {
      for (final component in _components[surfaceId]!) {
        if (_eventNamed(component, name) case final event?) {
          final data = {
            ...?_data[surfaceId],
            for (final MapEntry(:key, :value) in overrides.entries)
              key: switch ((_data[surfaceId]?[key], value)) {
                (
                  final Map<String, Object?> seeded,
                  final Map<String, Object?> changed,
                ) =>
                  {
                    ...seeded,
                    ...changed,
                  },
                _ => value,
              },
          };
          return (
            action: ClientAction(
              name: name,
              surfaceId: surfaceId,
              sourceComponentId: component['id']! as String,
              timestamp: DateTime.now().toIso8601String(),
              context: {
                for (final MapEntry(:key, :value)
                    in ((event['context'] as Map<String, Object?>?) ?? const {})
                        .entries)
                  key: switch (value) {
                    {'path': final String path} => _resolve(data, path),
                    _ => value,
                  },
                ...tapped,
              },
            ),
            surfaceData: data,
          );
        }
      }
    }
    return null;
  }

  Object? _resolve(Map<String, Object?> data, String path) {
    Object? current = data;
    for (final segment in path.split('/').skip(1)) {
      current = current is Map<String, Object?> ? current[segment] : null;
    }
    return current;
  }
}
