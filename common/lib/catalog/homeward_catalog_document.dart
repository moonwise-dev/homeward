import 'dart:convert';

import '../a2ui/generated/a2ui_v09_schemas.dart';
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
      if (component.agentVisible) component.name: component.schema.value,
  };
  final functionSchemas = <String, Object?>{
    ...basic['functions']! as Map<String, Object?>,
    for (final function in functions)
      function.name: {
        'type': 'object',
        'description': function.description,
        'properties': {
          'call': {'const': function.name},
          'args': function.argumentSchema.value,
          'returnType': {'const': function.returnType.jsonValue},
        },
        'required': ['call', 'args'],
        'unevaluatedProperties': false,
      },
  };
  return {
    r'$schema': basic[r'$schema'],
    r'$id': homewardCatalogId,
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
