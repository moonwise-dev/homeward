import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';

enum PlanStepState { done, now, next }

typedef PlanStep = ({String title, PlanStepState state, String? note});

class PlanOverviewView extends StatelessWidget {
  const PlanOverviewView({required this.story, required this.steps, super.key});

  final String story;
  final List<PlanStep> steps;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final current = steps.indexWhere(
      (step) => step.state == PlanStepState.now,
    );
    final finished = steps
        .where((step) => step.state == PlanStepState.done)
        .length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text('Your plan', style: styles.label)),
            if (steps.isNotEmpty)
              Text(
                current == -1
                    ? '$finished of ${steps.length} done'
                    : 'Step ${current + 1} of ${steps.length}',
                style: styles.caption,
              ),
          ],
        ),
        if (story.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(story, style: styles.body),
        ],
        const SizedBox(height: AppSpacing.md),
        for (final (index, step) in steps.indexed)
          _Step(step: step, isLast: index == steps.length - 1),
      ],
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({required this.step, required this.isLast});

  final PlanStep step;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final note = step.note;
    final title = switch (step.state) {
      PlanStepState.done => styles.body.copyWith(color: colors.textSecondary),
      PlanStepState.now => styles.body.copyWith(fontWeight: FontWeight.w600),
      PlanStepState.next => styles.body.copyWith(color: colors.textTertiary),
    };
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 20,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Icon(
                    switch (step.state) {
                      PlanStepState.done => Icons.check_circle,
                      PlanStepState.now => Icons.radio_button_checked,
                      PlanStepState.next => Icons.radio_button_unchecked,
                    },
                    size: 20,
                    color: step.state == PlanStepState.next
                        ? colors.borderStrong
                        : colors.accent,
                    semanticLabel: switch (step.state) {
                      PlanStepState.done => 'Done',
                      PlanStepState.now => 'Now',
                      PlanStepState.next => 'Next',
                    },
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xxs,
                      ),
                      color: step.state == PlanStepState.done
                          ? colors.accent
                          : colors.border,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(step.title, style: title),
                  if (note != null && note.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        note,
                        style: step.state == PlanStepState.now
                            ? styles.label.copyWith(color: colors.accent)
                            : styles.caption,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
