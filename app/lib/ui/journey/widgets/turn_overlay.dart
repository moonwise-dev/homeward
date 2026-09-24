import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_status_line.dart';
import '../../core/ui/app_surface_entry.dart';

class TurnOverlay extends StatelessWidget {
  const TurnOverlay({required this.entry, required this.onStop, super.key});

  final AgentEntry entry;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final steps = entry.progress.steps;
    final measured = steps.every(
      (step) => step.state != ResearchStepState.running,
    );
    return ColoredBox(
      color: AppColors.background.withValues(alpha: 0.78),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSizes.overlayCard),
            child: AppSurfaceEntry(
              child: AppCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      steps.isEmpty ? 'Thinking it through' : 'Measuring',
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    for (final step in steps)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                        child: _ResearchStepLine(step: step),
                      ),
                    if (measured)
                      AppStatusLine(
                        text: steps.isEmpty
                            ? 'Reading what you said'
                            : 'Putting the page together',
                        isBusy: true,
                        color: AppColors.text,
                      ),
                    if (entry.text.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        child: Text(
                          entry.text,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.caption,
                        ),
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppButton(
                        label: 'Stop',
                        icon: Icons.stop,
                        variant: AppButtonVariant.text,
                        onPressed: onStop,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ResearchStepLine extends StatelessWidget {
  const _ResearchStepLine({required this.step});

  final ResearchStep step;

  @override
  Widget build(BuildContext context) => switch (step.state) {
    ResearchStepState.running => AppStatusLine(
      text: step.label,
      isBusy: true,
      color: AppColors.text,
    ),
    ResearchStepState.done => AppStatusLine(
      text: step.label,
      icon: Icons.check_circle,
      color: AppColors.positive,
    ),
    ResearchStepState.unavailable => AppStatusLine(
      text: '${step.label} · not available right now',
      icon: Icons.remove_circle_outline,
    ),
  };
}
