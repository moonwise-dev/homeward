Map<String, Object?> block(
  String id,
  String component, [
  Map<String, Object?> properties = const {},
]) => {'id': id, 'component': component, ...properties};

Map<String, Object?> boundTo(String path) => {'path': path};

Map<String, Object?> sends(String action) => {
  'event': {'name': action, 'context': const <String, Object?>{}},
};

const drawNote =
    'draw holds components ready to send as they are: put them in '
    'updateComponents for the plan and add their IDs to the children of '
    'root, without reading their docs first.';
