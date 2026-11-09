import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../catalog/plan_areas.dart';
import '../../../catalog/plan_sections.dart';
import '../../../catalog/surface_views.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../view_model/journey_view_model.dart';
import 'overview_header.dart';

class AreaView extends StatelessWidget {
  const AreaView({
    required this.sessionId,
    required this.area,
    required this.state,
    required this.focus,
    super.key,
  });

  final String sessionId;
  final PlanArea area;
  final JourneyState state;
  final ValueNotifier<String?> focus;

  static const _barHeight = 2.0;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final isRunning = state.conversation.isRunning;
    return ColoredBox(
      color: colors.surfaceMuted,
      child: Column(
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppSizes.contentWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppSpacing.xs,
                          bottom: AppSpacing.md,
                        ),
                        child: Text(area.label, style: styles.display),
                      ),
                      if (area == PlanArea.overview)
                        OverviewHeader(sessionId: sessionId),
                      if (state.hasPlan)
                        IgnorePointer(
                          ignoring: isRunning,
                          child: PlanMarks(
                            changes: state.latestChanges,
                            focus: focus,
                            child: PlanAreaScope(
                              area: area,
                              child: PlanSurfaceView(
                                sessionId: sessionId,
                                surfaceId: planSurfaceId,
                              ),
                            ),
                          ),
                        )
                      else
                        _BeforeThePlan(area: area),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BeforeThePlan extends StatelessWidget {
  const _BeforeThePlan({required this.area});

  final PlanArea area;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final areas = area == PlanArea.overview ? PlanArea.values : [area];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.sm,
      children: [
        if (area == PlanArea.overview)
          Text(
            'Tell the assistant about your move. Homeward works out the rest '
            'and fills in each part of the app for your household.',
            style: styles.body.copyWith(color: colors.textSecondary),
          ),
        for (final shown in areas)
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppRadii.md),
              border: Border.all(color: colors.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                spacing: AppSpacing.sm,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: colors.accentSoft,
                    child: Icon(shown.icon, color: colors.accent, size: 20),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shown.label, style: styles.label),
                        Text(
                          shown.empty,
                          style: styles.caption.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
