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
    'components $id: ${[for (final component in components)
      if (component case {'component': final String name}) name].join(', ')}',
  _ => null,
};
