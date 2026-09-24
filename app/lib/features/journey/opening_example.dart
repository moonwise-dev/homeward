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
