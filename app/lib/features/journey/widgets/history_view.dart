import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/transcript_entry.dart';
import '../../../display/surface_action_label.dart';
import '../../../ui/app_chat_bubble.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/app_spacing.dart';
import '../../../ui/app_text_styles.dart';
import '../journey_controller.dart';
import 'agent_message.dart';
import 'buyer_action_note.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = journeyControllerProvider(sessionId);
    final entries = ref.watch(provider).conversation.entries;
    final controller = ref.read(provider.notifier);
    return ListView.separated(
      reverse: true,
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: entries.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.md),
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
            AgentEntry(:final id, :final text, :final status, :final error) =>
              AgentMessage(
                key: ValueKey(id),
                text: text,
                status: status,
                errorText: error?.humanMessage,
                onRetry: () => controller.retry(id),
              ),
          },
    );
  }
}

Future<void> showHistorySheet(BuildContext context, String sessionId) =>
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.background,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.85,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text('History', style: AppTextStyles.title),
              ),
              Expanded(child: HistoryView(sessionId: sessionId)),
            ],
          ),
        ),
      ),
    );
