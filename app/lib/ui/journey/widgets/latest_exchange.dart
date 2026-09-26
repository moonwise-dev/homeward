import 'package:flutter/material.dart';

import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_chat_bubble.dart';
import '../../core/ui/app_reveal.dart';
import '../../core/ui/app_status_line.dart';
import 'action_label.dart';
import 'working_card.dart';

class LatestExchange extends StatelessWidget {
  const LatestExchange({
    required this.entry,
    required this.showsWork,
    required this.onRetry,
    required this.onStop,
    this.prompt,
    super.key,
  });

  final AgentEntry entry;
  final TranscriptEntry? prompt;
  final bool showsWork;
  final VoidCallback onRetry;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final prompt = _promptText(this.prompt);
    return AppReveal(
      alignment: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (prompt != null)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: AppChatBubble(text: prompt),
            ),
          if (entry.text.isNotEmpty)
            SelectableText(entry.text, style: AppTextStyles.body),
          if (showsWork && entry.status == AgentTurnStatus.streaming)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: WorkingCard(entry: entry, onStop: onStop),
            ),
          ..._ending(),
        ],
      ),
    );
  }

  List<Widget> _ending() => switch (entry.status) {
    AgentTurnStatus.failed => [
      const SizedBox(height: AppSpacing.sm),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.xs,
        children: [
          AppStatusLine(
            text: entry.error?.humanMessage ?? 'This step failed',
            icon: Icons.error_outline,
            color: AppColors.danger,
          ),
          AppButton(
            label: 'Retry',
            icon: Icons.refresh,
            variant: AppButtonVariant.text,
            onPressed: onRetry,
          ),
        ],
      ),
    ],
    AgentTurnStatus.canceled => [
      const SizedBox(height: AppSpacing.sm),
      const AppStatusLine(text: 'Stopped', icon: Icons.stop_circle_outlined),
    ],
    AgentTurnStatus.streaming || AgentTurnStatus.completed => const [],
  };
}

String? _promptText(TranscriptEntry? prompt) => switch (prompt) {
  BuyerEntry(:final text) => text.trim(),
  BuyerActionEntry(:final label?) => label,
  BuyerActionEntry(:final actionName) => actionLabel(actionName),
  _ => null,
};
