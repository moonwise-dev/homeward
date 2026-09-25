import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../catalog/surface_stage.dart';
import '../../../catalog/surface_views.dart';
import '../../../data/repositories/agent_repository.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/motion.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_reveal.dart';
import '../../core/ui/app_status_line.dart';
import '../../core/ui/app_surface_entry.dart';
import '../view_model/journey_view_model.dart';
import 'action_label.dart';
import 'section_recap.dart';

class StorySection extends HookConsumerWidget {
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
    final surfaces = [
      for (final surfaceId in entry.surfaceIds)
        agent.surfaceContext(sessionId, surfaceId),
    ];
    final opened = useState(false);
    final isOpen = isLatest || opened.value;
    return AppReveal(
      enabled: isLatest,
      alignment: 0.08,
      child: ListenableBuilder(
        listenable: Listenable.merge([
          for (final surface in surfaces) surface.definition,
        ]),
        builder: (context, child) {
          final definitions = [
            for (final surface in surfaces) surface.definition.value,
          ];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isOpen && definitions.any(isWideSurface)
                      ? AppSizes.widePage
                      : AppSizes.contentWidth,
                ),
                child: AnimatedSize(
                  duration: AppMotion.of(context, AppMotion.surface),
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!isLatest)
                        SectionRecap(
                          title:
                              surfaceStageTitle(definitions) ??
                              _fallbackTitle(entry),
                          answer: _answerText(section.answer),
                          isOpen: isOpen,
                          onPressed: () => opened.value = !opened.value,
                        ),
                      if (isOpen)
                        Padding(
                          padding: EdgeInsets.only(
                            top: isLatest ? 0 : AppSpacing.sm,
                          ),
                          child: _SectionContent(
                            entry: entry,
                            surfaces: surfaces,
                            onRetry: onRetry,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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

String _fallbackTitle(AgentEntry entry) => switch (entry.status) {
  AgentTurnStatus.failed => 'That did not finish',
  AgentTurnStatus.canceled => 'Stopped',
  AgentTurnStatus.streaming ||
  AgentTurnStatus.completed => _firstSentence(entry.text) ?? 'Earlier',
};

String? _firstSentence(String text) {
  final sentence = text.trim().split(RegExp(r'(?<=[.!?])\s')).first.trim();
  return sentence.isEmpty ? null : sentence;
}

String? _answerText(TranscriptEntry? answer) => switch (answer) {
  BuyerEntry(:final text) => '“${text.replaceAll(RegExp(r'\s+'), ' ')}”',
  BuyerActionEntry(:final actionName) => surfaceActionLabel(actionName),
  _ => null,
};
