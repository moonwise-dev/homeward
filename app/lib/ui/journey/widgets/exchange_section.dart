import 'package:flutter/material.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/agent_repository.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/motion.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_chat_bubble.dart';
import '../../core/ui/app_reveal.dart';
import '../../core/ui/app_status_line.dart';
import '../../core/ui/app_surface_entry.dart';
import '../view_model/journey_view_model.dart';
import 'action_label.dart';

class ExchangeSection extends ConsumerWidget {
  const ExchangeSection({
    required this.sessionId,
    required this.section,
    required this.isLatest,
    required this.onRetry,
    super.key,
  });

  final String sessionId;
  final JourneySection section;
  final bool isLatest;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agent = ref.watch(agentRepositoryProvider);
    final entry = section.entry;
    final prompt = _promptText(section.prompt);
    return AppReveal(
      enabled: isLatest,
      alignment: 0.08,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (prompt != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: AppChatBubble(text: prompt),
              ),
            if (entry.text.isNotEmpty)
              SelectableText(entry.text, style: AppTextStyles.body),
            for (final surfaceId in inlineSurfaceIds(entry))
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.md),
                child: IgnorePointer(
                  ignoring: !isLatest,
                  child: AnimatedOpacity(
                    opacity: isLatest ? 1 : 0.6,
                    duration: AppMotion.of(context, AppMotion.surface),
                    child: AppSurfaceEntry(
                      key: ValueKey(surfaceId),
                      child: AppCard(
                        child: Surface(
                          surfaceContext: agent.surfaceContext(
                            sessionId,
                            surfaceId,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ..._ending(),
          ],
        ),
      ),
    );
  }

  List<Widget> _ending() => switch (section.entry.status) {
    AgentTurnStatus.failed => [
      const SizedBox(height: AppSpacing.sm),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.xs,
        children: [
          AppStatusLine(
            text: section.entry.error?.humanMessage ?? 'This step failed',
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
