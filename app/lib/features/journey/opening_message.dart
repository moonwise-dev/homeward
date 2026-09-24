import 'package:common/common.dart';

import '../../display/story_reason_label.dart';

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
