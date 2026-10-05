import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../catalog/surface_views.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_card.dart';
import '../../core/ui/app_surface_entry.dart';

class PlanPanel extends StatelessWidget {
  const PlanPanel({
    required this.sessionId,
    required this.hasPlan,
    required this.isRunning,
    super.key,
  });

  final String sessionId;
  final bool hasPlan;
  final bool isRunning;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    return hasPlan
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
            ),
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                'Your plan appears here as Homeward learns about your move '
                'and your money.',
                style: styles.body,
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
