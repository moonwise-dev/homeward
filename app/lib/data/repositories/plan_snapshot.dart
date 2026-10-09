import 'dart:collection';
import 'dart:convert';

import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../../domain/models/plan_conversation.dart';

typedef PlanSection = ({String type, String signature});

typedef PlanSnapshot = Map<String, PlanSection>;

const _rootId = 'root';
const _childKeys = {'child', 'children', 'tabs', 'trigger', 'content'};
const _containers = {'Card', 'Column', 'Row', 'List'};

PlanSnapshot planSnapshot(SurfaceContext surface) {
  final components = surface.definition.value?.components;
  final root = components?[_rootId];
  if (components == null || root == null) {
    return const {};
  }
  final sectionIds = switch (root.properties) {
    {'children': final List<Object?> ids} when root.type == 'Column' => [
      for (final id in ids)
        if (id is String &&
            id != planMoreId &&
            components[id]?.type != 'Divider')
          id,
    ],
    _ => [_rootId],
  };
  return {
    for (final id in sectionIds)
      if (components.containsKey(id))
        id: _section(id, components, surface.dataModel),
  };
}

List<PlanChange> planChanges(PlanSnapshot before, PlanSnapshot after) => [
  for (final MapEntry(key: id, value: section) in after.entries)
    if (before[id]?.signature != section.signature)
      PlanChange(
        sectionId: id,
        type: section.type,
        isNew: !before.containsKey(id),
      ),
];

PlanSection _section(
  String sectionId,
  Map<String, Component> components,
  DataModel data,
) {
  final seen = <String>{};
  final parts = <Object?>[];
  String? type;

  void visit(String id) {
    final component = components[id];
    if (component == null || !seen.add(id)) {
      return;
    }
    if (!_containers.contains(component.type)) {
      type ??= component.type;
    }
    parts.add([component.type, _sorted(component.properties)]);
    _walk(
      component.properties,
      onChild: visit,
      onPath: (path) => parts.add([
        path,
        _sorted(data.getValue<Object?>(DataPath(path))),
      ]),
    );
  }

  visit(sectionId);
  return (
    type: type ?? components[sectionId]!.type,
    signature: jsonEncode(parts),
  );
}

void _walk(
  Object? json, {
  required void Function(String id) onChild,
  required void Function(String path) onPath,
  bool namesChildren = false,
}) {
  switch (json) {
    case final String id when namesChildren:
      onChild(id);
    case final Map<Object?, Object?> map:
      if (map['path'] case final String path when path.startsWith('/')) {
        onPath(path);
      }
      for (final MapEntry(:key, :value) in map.entries) {
        _walk(
          value,
          onChild: onChild,
          onPath: onPath,
          namesChildren: namesChildren || _childKeys.contains(key),
        );
      }
    case final List<Object?> list:
      for (final item in list) {
        _walk(
          item,
          onChild: onChild,
          onPath: onPath,
          namesChildren: namesChildren,
        );
      }
  }
}

Object? _sorted(Object? json) => switch (json) {
  final Map<Object?, Object?> map => SplayTreeMap<String, Object?>.of({
    for (final MapEntry(:key, :value) in map.entries) '$key': _sorted(value),
  }),
  final List<Object?> list => [for (final item in list) _sorted(item)],
  _ => json,
};
