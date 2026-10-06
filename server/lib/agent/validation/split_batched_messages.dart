import 'dart:convert';

const _envelopes = {
  'createSurface',
  'updateComponents',
  'updateDataModel',
  'deleteSurface',
};

List<String> splitBatchedMessages(String source, {String? lastSurfaceId}) {
  final Object? json;
  try {
    json = jsonDecode(source);
  } on FormatException {
    return _commaJoined(source, lastSurfaceId) ?? [source];
  }
  return switch (json) {
    [...] when json.every((item) => item is Map<String, Object?>) => [
      for (final item in json)
        ...splitBatchedMessages(jsonEncode(item), lastSurfaceId: lastSurfaceId),
    ],
    final Map<String, Object?> message =>
      _split(message, lastSurfaceId) ?? [source],
    _ => [source],
  };
}

List<String>? _commaJoined(String source, String? lastSurfaceId) {
  final Object? json;
  try {
    json = jsonDecode('[$source]');
  } on FormatException {
    return null;
  }
  return json is List<Object?> &&
          json.length > 1 &&
          json.every((item) => item is Map<String, Object?>)
      ? [
          for (final item in json)
            ...splitBatchedMessages(
              jsonEncode(item),
              lastSurfaceId: lastSurfaceId,
            ),
        ]
      : null;
}

List<String>? _split(Map<String, Object?> message, String? lastSurfaceId) {
  final batched = message.entries
      .where((entry) => _envelopes.contains(entry.key) && entry.value is List)
      .toList();
  if (batched.length != 1) {
    return null;
  }
  final MapEntry(:key, :value) = batched.single;
  final items = value! as List<Object?>;
  if (items.isEmpty || !items.every((item) => item is Map<String, Object?>)) {
    return null;
  }
  final components = items.every(
    (item) => (item! as Map<String, Object?>).containsKey('component'),
  );
  if (components) {
    return key == 'updateComponents' && lastSurfaceId != null
        ? [
            jsonEncode({
              for (final entry in message.entries)
                if (entry.key != key) entry.key: entry.value,
              key: {'surfaceId': lastSurfaceId, 'components': items},
            }),
          ]
        : null;
  }
  if (!items.every(
    (item) => (item! as Map<String, Object?>).containsKey('surfaceId'),
  )) {
    return null;
  }
  return [
    for (final item in items)
      jsonEncode({
        for (final entry in message.entries)
          if (entry.key != key) entry.key: entry.value,
        key: item,
      }),
  ];
}
