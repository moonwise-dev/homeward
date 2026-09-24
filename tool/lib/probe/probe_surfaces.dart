import 'package:common/common.dart';

typedef ProbeAction = ({ClientAction action, Map<String, Object?> surfaceData});

final class ProbeSurfaces {
  final _data = <String, Map<String, Object?>>{};
  final _components = <String, List<Map<String, Object?>>>{};

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
    }
  }

  ProbeAction? actionFor(
    String name,
    Map<String, Object?> overrides, {
    Map<String, Object?> tapped = const {},
  }) {
    for (final surfaceId in _components.keys.toList().reversed) {
      for (final component in _components[surfaceId]!) {
        if (component['action'] ?? component['choose']
            case {
              'event':
                  {'name': final String eventName} &&
                  final Map<String, Object?> event,
            }
            when eventName == name) {
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
