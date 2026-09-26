Iterable<String> childReferences(Map<String, Object?> component) sync* {
  for (final key in const ['child', 'trigger', 'content']) {
    if (component[key] case final String id) {
      yield id;
    }
  }
  switch (component['children']) {
    case final List<Object?> ids:
      yield* ids.whereType<String>();
    case {'componentId': final String id}:
      yield id;
  }
  if (component['tabs'] case final List<Object?> tabs) {
    for (final tab in tabs) {
      if (tab case {'child': final String id}) {
        yield id;
      }
    }
  }
}

Iterable<String> boundPaths(Object? json) sync* {
  switch (json) {
    case {'path': final String path} when json.length == 1:
      yield path;
    case {'componentId': String _, 'path': final String path}
        when json.length == 2:
      yield path;
    case final Map<String, Object?> map:
      for (final value in map.values) {
        yield* boundPaths(value);
      }
    case final List<Object?> list:
      for (final value in list) {
        yield* boundPaths(value);
      }
  }
}

Set<String> boundSlices(Object? json) => {
  for (final path in boundPaths(json))
    if (path.startsWith('/')) path.split('/')[1],
};

String? structureProblem(
  Map<String, Map<String, Object?>> components, {
  required Set<String> mustReach,
}) {
  if (!components.containsKey('root')) {
    return 'The surface needs a component with id "root"';
  }
  for (final component in components.values) {
    for (final child in childReferences(component)) {
      if (!components.containsKey(child)) {
        return '${component['id']} refers to missing component $child';
      }
    }
  }
  final reached = <String>{};
  final visiting = <String>{};
  String? visit(String id) {
    if (visiting.contains(id)) {
      return 'Components form a cycle through $id';
    }
    if (!reached.add(id)) {
      return null;
    }
    visiting.add(id);
    for (final child in childReferences(components[id]!)) {
      if (visit(child) case final problem?) {
        return problem;
      }
    }
    visiting.remove(id);
    return null;
  }

  if (visit('root') case final problem?) {
    return problem;
  }
  final orphans = mustReach.where((id) => !reached.contains(id));
  return orphans.isEmpty
      ? null
      : 'Components not reachable from root: ${orphans.join(', ')}';
}

bool resolvesForBinding(Map<String, Object?> dataModel, String path) {
  if (!path.startsWith('/')) {
    return true;
  }
  final segments = path.split('/').skip(1).toList();
  Object? current = dataModel;
  for (final (index, segment) in segments.indexed) {
    final isLast = index == segments.length - 1;
    if (current is Map<String, Object?>) {
      if (current.containsKey(segment)) {
        current = current[segment];
      } else {
        return isLast;
      }
    } else if (current is List<Object?>) {
      final position = int.tryParse(segment);
      if (position == null || position < 0 || position >= current.length) {
        return false;
      }
      current = current[position];
    } else {
      return false;
    }
  }
  return true;
}
