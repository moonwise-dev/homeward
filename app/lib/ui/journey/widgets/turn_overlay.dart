import 'package:flutter/material.dart';

import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import 'working_card.dart';

class TurnOverlay extends StatelessWidget {
  const TurnOverlay({required this.entry, required this.onStop, super.key});

  final AgentEntry entry;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: AppColors.background.withValues(alpha: 0.78),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.overlayCard),
          child: WorkingCard(entry: entry, onStop: onStop),
        ),
      ),
    ),
  );
}
