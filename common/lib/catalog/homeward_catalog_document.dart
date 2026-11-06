import 'dart:convert';

import '../a2ui/generated/a2ui_v10_schemas.dart';
import 'agent_visible_basic_components.dart';
import 'catalog_component.dart';
import 'functions/catalog_function.dart';
import 'homeward_catalog.dart';

Map<String, Object?> homewardCatalogDocument({
  List<CatalogComponent> components = homewardComponents,
  List<CatalogFunction> functions = homewardFunctions,
}) {
  final basic = jsonDecode(a2uiBasicCatalogJson) as Map<String, Object?>;
  final basicComponents = basic['components']! as Map<String, Object?>;
  final componentSchemas = <String, Object?>{
    for (final name in agentVisibleBasicComponents) name: basicComponents[name],
    for (final component in components)
      if (component.agentVisible)
        component.name: _withCommonTypeRefs(component.schema.value),
  };
  final functionSchemas = <String, Object?>{
    ...basic['functions']! as Map<String, Object?>,
    for (final function in functions)
      function.name: {
        'type': 'object',
        'description': function.description,
        'returnType': function.returnType.jsonValue,
        'properties': {
          '@call': {'const': function.name},
          'args': _withCommonTypeRefs(function.argumentSchema.value),
        },
        'required': ['@call', 'args'],
        'unevaluatedProperties': false,
      },
  };
  return {
    r'$schema': basic[r'$schema'],
    r'$id': homewardCatalogId,
    'protocolVersion': basic['protocolVersion'],
    'catalogId': homewardCatalogId,
    'components': componentSchemas,
    'functions': functionSchemas,
    r'$defs': {
      ...basic[r'$defs']! as Map<String, Object?>,
      'anyComponent': {
        'oneOf': [
          for (final name in componentSchemas.keys)
            {r'$ref': '#/components/$name'},
        ],
      },
      'anyFunction': {
        'oneOf': [
          for (final name in functionSchemas.keys)
            {r'$ref': '#/functions/$name'},
        ],
      },
    },
  };
}

Object? _withCommonTypeRefs(Object? json) => switch (json) {
  {'commonTypesRef': final String reference} => {
    r'$ref': reference,
    if (json['description'] case final String description)
      'description': description,
  },
  final Map<String, Object?> map => {
    for (final MapEntry(:key, :value) in map.entries)
      key: _withCommonTypeRefs(value),
  },
  final List<Object?> list => [
    for (final item in list) _withCommonTypeRefs(item),
  ],
  _ => json,
};
