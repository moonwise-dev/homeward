import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../catalog/surface_views.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_surface_entry.dart';

class LivingScreen extends StatelessWidget {
  const LivingScreen({
    required this.sessionId,
    required this.isRunning,
    super.key,
  });

  final String sessionId;
  final bool isRunning;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(AppSpacing.md),
    child: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
        child: IgnorePointer(
          ignoring: isRunning,
          child: AppSurfaceEntry(
            child: AppCard(
              child: PlanSurfaceView(
                sessionId: sessionId,
                surfaceId: planSurfaceId,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
