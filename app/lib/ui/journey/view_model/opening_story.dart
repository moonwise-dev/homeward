import 'package:common/common.dart';

typedef OpeningExample = ({String title, StoryReason reason, String story});

const openingExamples = <OpeningExample>[
  (
    title: 'Stockholm family',
    reason: StoryReason.study,
    story:
        "We're moving to Stockholm, I start at KTH in January. Two kids, six "
        "and nine. We're looking at a flat on Odengatan and one in Solna.",
  ),
  (
    title: 'Lisbon surfer',
    reason: StoryReason.lifestyle,
    story: 'Lisbon. I work remotely, I surf, and I want quiet evenings.',
  ),
];

String openingMessage({
  required StoryReason? reason,
  required String ownReason,
  required String story,
}) {
  final why = switch (reason) {
    null => '',
    StoryReason.other => ownReason.trim(),
    final picked => storyReasonLabel(picked).toLowerCase(),
  };
  return [
    if (why.isNotEmpty) 'Reason for the move: $why.',
    story.trim(),
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
