import 'package:common/common.dart';

String storyReasonLabel(StoryReason reason) => switch (reason) {
  StoryReason.work => 'A new job',
  StoryReason.study => 'Studies',
  StoryReason.family => 'To be near family',
  StoryReason.lifestyle => 'A change of lifestyle',
  StoryReason.retirement => 'Retirement',
  StoryReason.investment => 'An investment',
  StoryReason.other => 'Something else',
};
