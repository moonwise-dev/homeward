String? describeA2uiMessage(Map<String, Object?> message) => switch (message) {
  {'createSurface': {'surfaceId': final String id}} => 'create $id',
  {
    'updateDataModel': {
      'surfaceId': final String id,
      'path': final String path,
    },
  } =>
    'seed $id $path',
  {
    'updateComponents': {
      'surfaceId': final String id,
      'components': final List<Object?> components,
    },
  } =>
    [
      'components $id:',
      for (final component in components)
        if (component case final Map<String, Object?> json)
          '  ${_describeComponent(json)}',
    ].join('\n'),
  _ => null,
};

String _describeComponent(Map<String, Object?> component) => [
  '${component['id']}: ${component['component']}',
  for (final MapEntry(:key, :value) in component.entries)
    if (value case {'path': final String path}) '$key=$path',
  for (final value in component.values)
    if (value case {'event': {'name': final String name}}) 'action=$name',
].join(' ');
