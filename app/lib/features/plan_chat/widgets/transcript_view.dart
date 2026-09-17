import 'package:flutter/material.dart';

import '../../../catalog/plan_surface_view.dart';
import '../../../data/models/transcript_entry.dart';
import '../../../display/surface_action_label.dart';
import '../../../ui/app_chat_bubble.dart';
import '../../../ui/app_spacing.dart';
import 'agent_message.dart';
import 'buyer_action_note.dart';

class TranscriptView extends StatelessWidget {
  const TranscriptView({
    required this.sessionId,
    required this.entries,
    required this.onRetry,
    super.key,
  });

  final String sessionId;
  final List<TranscriptEntry> entries;
  final ValueChanged<String> onRetry;

  @override
  Widget build(BuildContext context) => ListView.separated(
    reverse: true,
    padding: const EdgeInsets.all(AppSpacing.md),
    itemCount: entries.length,
    separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
    itemBuilder: (context, index) =>
        switch (entries[entries.length - 1 - index]) {
          BuyerEntry(:final id, :final text) => AppChatBubble(
            key: ValueKey(id),
            text: text,
          ),
          BuyerActionEntry(:final id, :final actionName) => BuyerActionNote(
            key: ValueKey(id),
            label: surfaceActionLabel(actionName),
          ),
          AgentEntry(
            :final id,
            :final text,
            :final status,
            :final surfaceIds,
            :final error,
          ) =>
            AgentMessage(
              key: ValueKey(id),
              text: text,
              status: status,
              errorText: error?.humanMessage,
              onRetry: () => onRetry(id),
              surfaces: [
                for (final surfaceId in surfaceIds)
                  PlanSurfaceView(
                    key: ValueKey(surfaceId),
                    sessionId: sessionId,
                    surfaceId: surfaceId,
                  ),
              ],
            ),
        },
  );
}
