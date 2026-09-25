import 'package:common/common.dart';

typedef OpeningExample = ({String title, StoryReason reason, String location});

const openingExamples = <OpeningExample>[
  (title: 'Stockholm family', reason: StoryReason.study, location: 'Stockholm'),
  (title: 'Lisbon surfer', reason: StoryReason.lifestyle, location: 'Lisbon'),
];

String openingMessage({
  required StoryReason? reason,
  required String ownReason,
  required String location,
}) {
  final why = switch (reason) {
    null => '',
    StoryReason.other => ownReason.trim(),
    final picked => storyReasonLabel(picked).toLowerCase(),
  };
  return [
    if (why.isNotEmpty) 'Reason for the move: $why.',
    'Moving to: ${location.trim()}.',
  ].join('\n\n');
}

String storyReasonLabel(StoryReason reason) => switch (reason) {
  StoryReason.work => 'A new job',
  StoryReason.study => 'Studies',
  StoryReason.family => 'To be near family',
  StoryReason.lifestyle => 'A change of lifestyle',
  StoryReason.retirement => 'Retirement',
  StoryReason.investment => 'An investment',
  StoryReason.other => 'Something else',
};
