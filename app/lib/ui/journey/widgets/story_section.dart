import 'package:flutter/material.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/agent_repository.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_chat_bubble.dart';
import '../../core/ui/app_reveal.dart';
import '../../core/ui/app_status_line.dart';
import '../../core/ui/app_surface_entry.dart';
import '../view_model/journey_view_model.dart';
import 'action_label.dart';

class StorySection extends ConsumerWidget {
  const StorySection({
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
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (prompt != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: AppChatBubble(text: prompt),
                  ),
                _SectionContent(
                  entry: entry,
                  surfaces: [
                    for (final surfaceId in entry.surfaceIds)
                      agent.surfaceContext(sessionId, surfaceId),
                  ],
                  onRetry: onRetry,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionContent extends StatelessWidget {
  const _SectionContent({
    required this.entry,
    required this.surfaces,
    required this.onRetry,
  });

  final AgentEntry entry;
  final List<SurfaceContext> surfaces;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (entry.text.isNotEmpty)
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
            child: SelectableText(entry.text, style: AppTextStyles.body),
          ),
        ),
      for (final surface in surfaces)
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.md),
          child: AppSurfaceEntry(
            key: ValueKey(surface.surfaceId),
            child: AppCard(child: Surface(surfaceContext: surface)),
          ),
        ),
      ..._ending(),
    ],
  );

  List<Widget> _ending() => switch (entry.status) {
    AgentTurnStatus.failed => [
      const SizedBox(height: AppSpacing.md),
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
      const SizedBox(height: AppSpacing.md),
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
