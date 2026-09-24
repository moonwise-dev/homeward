import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/app_status_line.dart';

class ResearchStepLine extends StatelessWidget {
  const ResearchStepLine({required this.step, super.key});

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
