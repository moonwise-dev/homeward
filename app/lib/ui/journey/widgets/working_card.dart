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

class WorkingCard extends StatelessWidget {
  const WorkingCard({required this.entry, required this.onStop, super.key});

  final AgentEntry entry;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final steps = entry.progress.steps;
    final measured = steps.every(
      (step) => step.state != ResearchStepState.running,
    );
    return AppSurfaceEntry(
      child: AppCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              steps.isEmpty ? 'Thinking it through' : 'Measuring',
              style: styles.title,
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
                color: colors.text,
              ),
            if (entry.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.sm),
                child: Text(
                  entry.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: styles.caption,
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
    );
  }
}

class _ResearchStepLine extends StatelessWidget {
  const _ResearchStepLine({required this.step});

  final ResearchStep step;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return switch (step.state) {
      ResearchStepState.running => AppStatusLine(
        text: step.label,
        isBusy: true,
        color: colors.text,
      ),
      ResearchStepState.done => AppStatusLine(
        text: step.label,
        icon: Icons.check_circle,
        color: colors.positive,
      ),
      ResearchStepState.unavailable => AppStatusLine(
        text: '${step.label} · not available right now',
        icon: Icons.remove_circle_outline,
      ),
    };
  }
}
