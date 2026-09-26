import 'dart:convert';

import '../a2ui/generated/a2ui_v09_schemas.dart';
import 'agent_visible_basic_components.dart';
import 'core_components.dart';
import 'homeward_catalog.dart';
import 'homeward_catalog_document.dart';

const commonTypesFile = 'common_types.json';

final _commonTypesId =
    (jsonDecode(a2uiCommonTypesJson) as Map<String, Object?>)[r'$id']!
        as String;

final _document = homewardCatalogDocument();

final _components = _document['components']! as Map<String, Object?>;

Iterable<String> get catalogComponentNames => _components.keys;

String compactCatalogJson(Object? json) =>
    jsonEncode(json).replaceAll(_commonTypesId, commonTypesFile);

Map<String, String> componentIndex() => {
  for (final MapEntry(:key, :value) in basicComponentSummaries.entries)
    if (!coreComponents.contains(key)) key: value,
  for (final component in homewardComponents)
    if (component.agentVisible && !coreComponents.contains(component.name))
      component.name: component.description,
};

Map<String, Object?> coreCatalogDocument() {
  final core = [
    for (final name in _components.keys)
      if (coreComponents.contains(name)) name,
  ];
  return {
    ..._document,
    'components': {for (final name in core) name: _components[name]},
    r'$defs': {
      ..._document[r'$defs']! as Map<String, Object?>,
      'anyComponent': {
        'oneOf': [
          for (final name in core) {r'$ref': '#/components/$name'},
        ],
      },
    },
  };
}

String? componentDocs(String name) {
  final schema = _components[name];
  if (schema == null) {
    return null;
  }
  return compactCatalogJson({
    'schema': schema,
    'examples': [
      for (final component in homewardComponents)
        if (component.name == name)
          for (final example in component.examples)
            {'name': example.name, 'components': example.components},
    ],
  });
}
