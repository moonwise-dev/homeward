import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../catalog/plan_sections.dart';
import '../../../catalog/surface_views.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class InlinePlan extends StatelessWidget {
  const InlinePlan({
    required this.sessionId,
    required this.isRunning,
    required this.changes,
    required this.focus,
    super.key,
  });

  final String sessionId;
  final bool isRunning;
  final List<PlanChange> changes;
  final ValueNotifier<String?> focus;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.sm,
        children: [
          Text('Your plan', style: styles.label),
          IgnorePointer(
            ignoring: isRunning,
            child: PlanMarks(
              changes: changes,
              focus: focus,
              child: PlanSurfaceView(
                sessionId: sessionId,
                surfaceId: planSurfaceId,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanPanel extends StatelessWidget {
  const PlanPanel({
    required this.sessionId,
    required this.hasPlan,
    required this.isRunning,
    required this.changes,
    required this.focus,
    super.key,
  });

  final String sessionId;
  final bool hasPlan;
  final bool isRunning;
  final List<PlanChange> changes;
  final ValueNotifier<String?> focus;

  static const _barHeight = 2.0;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Column(
      children: [
        SizedBox(
          height: _barHeight,
          child: isRunning
              ? LinearProgressIndicator(
                  minHeight: _barHeight,
                  color: colors.accent,
                  backgroundColor: colors.border,
                )
              : null,
        ),
        Expanded(
          child: hasPlan
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: AppSizes.contentWidth,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: IgnorePointer(
                          ignoring: isRunning,
                          child: PlanMarks(
                            changes: changes,
                            focus: focus,
                            child: PlanSurfaceView(
                              sessionId: sessionId,
                              surfaceId: planSurfaceId,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Text(
                      'Your plan appears here as Homeward learns about your '
                      'move and your money.',
                      style: styles.body,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
