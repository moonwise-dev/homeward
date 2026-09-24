import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/agent_turn_status.dart';
import '../../data/models/plan_conversation.dart';
import '../../data/models/transcript_entry.dart';

part 'journey_state.freezed.dart';

@freezed
abstract class JourneyState with _$JourneyState {
  const factory JourneyState({
    @Default(PlanConversation()) PlanConversation conversation,
    @Default('') String draft,
    StoryReason? reason,
    @Default('') String ownReason,
    @Default('') String story,
    int? chosenPage,
  }) = _JourneyState;

  const JourneyState._();

  List<AgentEntry> get pages => [
    for (final entry in conversation.entries)
      if (entry
          case AgentEntry(
            :final status,
            :final surfaceIds,
          )
          when status != AgentTurnStatus.streaming || surfaceIds.isNotEmpty)
        entry,
  ];

  int get page => (chosenPage ?? pages.length - 1).clamp(0, pages.length - 1);

  AgentEntry? get pending => switch (conversation.entries.lastOrNull) {
    final AgentEntry entry
        when entry.status == AgentTurnStatus.streaming &&
            entry.surfaceIds.isEmpty =>
      entry,
    _ => null,
  };

  bool get canStart => story.trim().isNotEmpty && !conversation.isRunning;
}
