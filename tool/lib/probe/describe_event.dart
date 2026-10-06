String? describeA2uiMessage(
  Map<String, Object?> message, {
  bool detail = false,
}) => switch (message) {
  {'createSurface': {'surfaceId': final String id}} => 'create $id',
  {
    'updateDataModel': {
      'surfaceId': final String id,
      'path': final String path,
    },
  } =>
    [
      'seed $id $path',
      if (detail && path == '/brief')
        if (message['updateDataModel'] case {
          'value': final Map<String, Object?> items,
        })
          for (final item in items.values)
            if (item case {
              'text': final String text,
              'source': final String source,
            })
              '      ($source, ${item['kind']}) $text',
    ].join('\n'),
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
          '  ${_describeComponent(json)}${detail ? _wordsOf(json) : ''}',
    ].join('\n'),
  _ => null,
};

String _describeComponent(Map<String, Object?> component) {
  final line = [
    '${component['id']}: ${component['component']}',
    for (final MapEntry(:key, :value) in component.entries)
      if (value case {'path': final String path}) '$key=$path',
    for (final key in const ['focus', 'zoom', 'travelMode'])
      if (component[key] case final Object value) '$key=$value',
    for (final value in component.values)
      if (value case {'event': {'name': final String name}})
        switch (value['event']) {
          {'context': final Map<String, Object?> context}
              when context.isNotEmpty =>
            'action=$name$context',
          _ => 'action=$name',
        },
  ].join(' ');
  return switch (component) {
    {'segments': final List<Object?> segments} =>
      '$line\n    ${_sentence(segments)}',
    {'hunch': final String hunch, 'options': final List<Object?> options} =>
      '$line\n    ${[if (component['because'] case final String because) '($because)', hunch].join(' ')}'
          '\n    ${component['facet']}: ${[
            for (final option in options)
              if (option case {'label': final String label}) '$label=${option['pin'] == true ? 'pin' : option['value']}',
          ].join(' | ')}',
    _ => line,
  };
}

String _sentence(List<Object?> segments) => [
  for (final segment in segments)
    if (segment
        case {'type': final String type} && final Map<String, Object?> json)
      type == 'text'
          ? '${json['text']}'
          : '[${[type, ?json['kind'], ?json['label']].join(' ')}'
                '${json['assumed'] == true ? '?' : ''}]',
].join();

String _wordsOf(Map<String, Object?> component) => [
  for (final key in const [
    'text',
    'question',
    'label',
    'title',
    'story',
    'send',
    'recommended',
    'because',
    'kinds',
    'child',
    'children',
  ])
    if (component[key] case final Object value when value is! Map)
      '\n      $key: $value',
  if (component['steps'] case final List<Object?> steps)
    for (final step in steps)
      if (step case {'title': final String title})
        '\n      [${step['state']}] $title${switch (step['note']) {
          final String note => ': $note',
          _ => '',
        }}',
  if (component['fields'] case final List<Object?> fields)
    for (final field in fields)
      if (field case {'label': final String label})
        '\n      ? $label (${[field['kind'], ?field['currency'], ?field['period'], if (field['options'] case final List<Object?> options) options.join(' / '), ?field['hint']].join(', ')})',
  if (component['options'] case final List<Object?> options)
    for (final option in options)
      if (option case {'label': final String label})
        '\n      - $label${switch (option['detail']) {
          final String detail => ' ($detail)',
          _ => '',
        }}',
].join();
