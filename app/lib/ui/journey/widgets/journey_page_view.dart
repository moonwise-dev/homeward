import 'package:flutter/material.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../catalog/surface_views.dart';
import '../../../data/repositories/agent_repository.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_status_line.dart';
import '../../core/ui/app_surface_entry.dart';

class JourneyPageView extends ConsumerWidget {
  const JourneyPageView({
    required this.sessionId,
    required this.entry,
    required this.onRetry,
    super.key,
  });

  final String sessionId;
  final AgentEntry entry;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agent = ref.watch(agentRepositoryProvider);
    final surfaces = [
      for (final surfaceId in entry.surfaceIds)
        agent.surfaceContext(sessionId, surfaceId),
    ];
    return ListenableBuilder(
      listenable: Listenable.merge([
        for (final surface in surfaces) surface.definition,
      ]),
      builder: (context, child) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  surfaces.any(
                    (surface) => isWideSurface(surface.definition.value),
                  )
                  ? AppSizes.widePage
                  : AppSizes.contentWidth,
            ),
            child: child,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (entry.text.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppSizes.contentWidth,
                ),
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
      ),
    );
  }

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
