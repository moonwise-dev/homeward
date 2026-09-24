import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../catalog/surface_views.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class PlanBoardPane extends StatelessWidget {
  const PlanBoardPane({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.sm,
        ),
        child: Text('Your plan', style: AppTextStyles.title),
      ),
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.md,
          ),
          child: PlanSurfaceView(
            sessionId: sessionId,
            surfaceId: InlineSurfaces.boardId,
          ),
        ),
      ),
    ],
  );
}

Future<void> showPlanBoardSheet(BuildContext context, String sessionId) =>
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.background,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.85,
        child: SafeArea(child: PlanBoardPane(sessionId: sessionId)),
      ),
    );
