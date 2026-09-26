import 'dart:convert';

import 'package:common/common.dart';

final _catalog = homewardCatalogDocument();

final _commonDefs =
    (jsonDecode(a2uiCommonTypesJson) as Map<String, Object?>)[r'$defs']!
        as Map<String, Object?>;

const _optionalExtras = {'accessibility', 'checks', 'weight'};

Map<String, Object?> catalogResponseSchema(Set<String> components) {
  final catalogComponents = _catalog['components']! as Map<String, Object?>;
  final offered = [
    for (final name in catalogComponents.keys)
      if (components.contains(name)) name,
  ];
  final defs =
      _enforceable({
            ..._commonDefs,
            ...{..._catalog[r'$defs']! as Map<String, Object?>}
              ..remove('anyFunction'),
            'FunctionCall': _functionCall(
              (_catalog['functions']! as Map<String, Object?>).keys,
            ),
            'anyComponent': {
              'oneOf': [
                for (final name in offered) {r'$ref': '#/components/$name'},
              ],
            },
            for (final name in offered)
              'component_$name': catalogComponents[name],
            'message': _message,
          })!
          as Map<String, Object?>;
  for (final name in offered) {
    defs['component_$name'] = _flattened(
      defs['component_$name']! as Map<String, Object?>,
      defs,
    );
  }
  final root = {
    'type': 'object',
    'properties': {
      'messages': {
        'type': 'array',
        'items': {r'$ref': r'#/$defs/message'},
      },
    },
    'required': ['messages'],
  };
  return {
    ...root,
    r'$defs': {
      for (final name in _reachable(root, defs)) name: defs[name],
    },
  };
}

Map<String, Object?> _functionCall(Iterable<String> names) => {
  'type': 'object',
  'description': 'Invokes a named function on the client.',
  'properties': {
    'call': {'type': 'string', 'enum': names.toList()},
    'args': {'type': 'object'},
    'returnType': {
      'type': 'string',
      'enum': ['string', 'number', 'boolean', 'array', 'object', 'any', 'void'],
    },
  },
  'required': ['call'],
};

final _message = {
  'oneOf': [
    _envelope(
      'createSurface',
      {
        'surfaceId': {'type': 'string'},
        'catalogId': {'const': homewardCatalogId},
        'sendDataModel': {'type': 'boolean'},
      },
      required: ['surfaceId', 'catalogId'],
    ),
    _envelope(
      'updateComponents',
      {
        'surfaceId': {'type': 'string'},
        'components': {
          'type': 'array',
          'items': {r'$ref': '#/\$defs/anyComponent'},
        },
      },
      required: ['surfaceId', 'components'],
    ),
  ],
};

Map<String, Object?> _envelope(
  String kind,
  Map<String, Object?> properties, {
  required List<String> required,
}) => {
  'type': 'object',
  'properties': {
    'version': {'const': A2uiExtension.version},
    kind: {'type': 'object', 'properties': properties, 'required': required},
  },
  'required': ['version', kind],
};

Object? _enforceable(Object? json) => switch (json) {
  final Map<String, Object?> map => {
    for (final MapEntry(:key, :value) in map.entries)
      ...switch ((key, value)) {
        (r'$schema' || r'$id', _) => const <String, Object?>{},
        ('additionalProperties', Map()) => const <String, Object?>{},
        ('const', final String value) => {
          'type': 'string',
          'enum': [value],
        },
        ('const', _) => {
          'enum': [value],
        },
        (r'$ref', final String ref) => {r'$ref': _localRef(ref)},
        _ => {key: _enforceable(value)},
      },
  },
  final List<Object?> list => [for (final item in list) _enforceable(item)],
  _ => json,
};

String _localRef(String ref) =>
    switch (ref.substring(ref.indexOf('#')).split('/')) {
      ['#', 'components', final name] => '#/\$defs/component_$name',
      ['#', r'$defs', final name] => '#/\$defs/$name',
      _ => throw ArgumentError.value(ref, 'ref', 'Not a catalog reference'),
    };

Map<String, Object?> _flattened(
  Map<String, Object?> component,
  Map<String, Object?> defs,
) {
  final parts = [
    component,
    for (final part in component['allOf'] as List<Object?>? ?? const [])
      _resolved(part, defs),
  ];
  final properties = <String, Object?>{
    for (final part in parts)
      ...part['properties'] as Map<String, Object?>? ?? const {},
  }..removeWhere((name, _) => _optionalExtras.contains(name));
  final required = {
    for (final part in parts)
      ...(part['required'] as List<Object?>? ?? const []).cast<String>(),
  }.difference(_optionalExtras);
  return {
    'type': 'object',
    'description': ?component['description'],
    'properties': properties,
    'required': required.toList(),
  };
}

Map<String, Object?> _resolved(Object? part, Map<String, Object?> defs) =>
    switch (part) {
      {r'$ref': final String ref} => _resolved(defs[ref.split('/').last], defs),
      final Map<String, Object?> schema => schema,
      _ => const {},
    };

Iterable<String> _reachable(Object? root, Map<String, Object?> defs) {
  final seen = <String>{};
  void walk(Object? json) {
    switch (json) {
      case {r'$ref': final String ref}:
        final name = ref.split('/').last;
        if (seen.add(name)) {
          walk(defs[name]);
        }
      case final Map<String, Object?> map:
        map.values.forEach(walk);
      case final List<Object?> list:
        list.forEach(walk);
    }
  }

  walk(root);
  return seen;
}
