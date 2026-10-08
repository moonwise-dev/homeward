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
import 'plan_receipt.dart';

class ExchangeSection extends ConsumerWidget {
  const ExchangeSection({
    required this.sessionId,
    required this.section,
    required this.isLatest,
    required this.onRetry,
    required this.onShowOnPlan,
    super.key,
  });

  final String sessionId;
  final JourneySection section;
  final bool isLatest;
  final VoidCallback onRetry;
  final ValueChanged<String> onShowOnPlan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = AppTextStyles.of(context);
    final agent = ref.watch(agentRepositoryProvider);
    final entry = section.entry;
    final prompt = promptText(section.prompt);
    final changes = receiptChanges(entry);
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
              SelectableText(entry.text, style: styles.body),
            if (changes.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.sm),
                child: PlanReceipt(changes: changes, onShow: onShowOnPlan),
              ),
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
            ..._ending(AppColors.of(context)),
          ],
        ),
      ),
    );
  }

  List<Widget> _ending(AppColors colors) => switch (section.entry.status) {
    AgentTurnStatus.failed => [
      const SizedBox(height: AppSpacing.sm),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.xs,
        children: [
          AppStatusLine(
            text: failureText(section.entry.error, DateTime.now()),
            icon: Icons.cloud_off_outlined,
            color: colors.textSecondary,
          ),
          AppButton(
            label: 'Try again',
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
