import 'catalog_component.dart';
import 'data_model/data_model_slices.dart';

enum ParameterKind { binding, input, action, text, number, flag, choice, list }

final class ComponentParameter {
  const ComponentParameter({
    required this.name,
    required this.kind,
    required this.required,
    this.description,
    this.path,
    this.seededBy,
    this.choices = const [],
  });

  final String name;
  final ParameterKind kind;
  final bool required;
  final String? description;
  final String? path;
  final String? seededBy;
  final List<String> choices;
}

List<ComponentParameter> componentParameters(CatalogComponent component) => [
  for (final MapEntry(key: name, value: schema) in component.properties.entries)
    _parameter(component, name, schema.value),
];

ComponentParameter _parameter(
  CatalogComponent component,
  String name,
  Map<String, Object?> schema,
) {
  final bound = component.boundProperties.contains(name);
  final path = _pathOf(schema) ?? _examplePath(component, name);
  final kind = switch (schema) {
    _ when bound => ParameterKind.binding,
    _ when _isAction(schema) => ParameterKind.action,
    {'properties': {'path': _}} => ParameterKind.input,
    {'enum': _} => ParameterKind.choice,
    {'type': 'array'} => ParameterKind.list,
    {'type': 'number' || 'integer'} => ParameterKind.number,
    {'type': 'boolean'} => ParameterKind.flag,
    _ => ParameterKind.text,
  };
  return ComponentParameter(
    name: name,
    kind: kind,
    required: component.requiredProperties.contains(name),
    description: switch (schema['description']) {
      final String text when !text.startsWith('REF:') => text,
      _ => null,
    },
    path: bound || kind == ParameterKind.input ? path : null,
    seededBy: bound ? _seededBy(path) : null,
    choices: [
      for (final choice in switch (schema) {
        {'enum': final List<Object?> values} => values,
        {'items': {'enum': final List<Object?> values}} => values,
        _ => const <Object?>[],
      })
        '$choice',
    ],
  );
}

bool _isAction(Map<String, Object?> schema) => switch (schema) {
  {'description': final String text} when text.endsWith(r'$defs/Action') =>
    true,
  {'properties': {'event': _}} => true,
  _ => false,
};

final _describedPath = RegExp(r'\{ "path": "([^"]+)" \}');

String? _pathOf(Map<String, Object?> schema) => switch (schema) {
  {'properties': {'path': {'const': final String path}}} => path,
  {'description': final String text} =>
    _describedPath.firstMatch(text)?.group(1),
  _ => null,
};

String? _examplePath(CatalogComponent component, String name) {
  for (final example in component.examples) {
    for (final json in example.components) {
      if (json['component'] != component.name) {
        continue;
      }
      switch (json[name]) {
        case {'path': final String path}:
          return path;
        case [{'path': final String path}, ...]:
          return path;
      }
    }
  }
  return null;
}

String? _seededBy(String? path) {
  final slice = path?.split('/').where((part) => part.isNotEmpty).firstOrNull;
  return dataModelSlices
      .where((candidate) => candidate.name == slice)
      .firstOrNull
      ?.seededBy;
}
