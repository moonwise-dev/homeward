Map<String, Object?> block(
  String id,
  String component, [
  Map<String, Object?> properties = const {},
]) => {'id': id, 'component': component, ...properties};

Map<String, Object?> boundTo(String path) => {'path': path};

Map<String, Object?> sends(String action) => {
  'event': {'name': action, 'context': const <String, Object?>{}},
};

const handedCardKeys = {'draw', 'drawWhenAsked'};

const drawNote =
    'draw lists cards that are ready: to show one, add its id to the '
    "children of root in the plan's updateComponents. Send root only; "
    "never send a card's own component, the server has it.";
