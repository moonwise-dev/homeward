Map<String, Object?> block(
  String id,
  String component, [
  Map<String, Object?> properties = const {},
]) => {'id': id, 'component': component, ...properties};

Map<String, Object?> boundTo(String path) => {'path': path};

Map<String, Object?> sends(String action) => {
  'event': {'name': action, 'context': const <String, Object?>{}},
};

Map<String, Object?> homeCard(String id) => block('home-$id', 'HomeCard', {
  'home': boundTo('/homes/$id'),
  'choose': sends('work_out_home'),
  'keep': sends('keep_home'),
});

const shownOnTopKey = 'draw';
const shownUnderKey = 'drawUnder';
const handedCardKeys = {shownOnTopKey, shownUnderKey, 'drawWhenAsked'};

const drawNote =
    'The cards under draw are on the plan already, so send nothing to '
    'show them, and say in your text what they mean.';
