import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppCoverageBadge extends StatelessWidget {
  const AppCoverageBadge({required this.isCurated, super.key});

  final bool isCurated;

  @override
  Widget build(BuildContext context) {
    final color = isCurated ? AppColors.accent : AppColors.warning;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xxs / 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isCurated ? Icons.check : Icons.hourglass_empty,
              size: 14,
              color: color,
            ),
            const SizedBox(width: AppSpacing.xxs),
            Text(
              isCurated ? 'Curated' : 'Not covered yet',
              style: AppTextStyles.caption.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
