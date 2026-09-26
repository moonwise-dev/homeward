import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppFigureRow extends StatelessWidget {
  const AppFigureRow({
    required this.label,
    required this.figure,
    this.isTotal = false,
    this.color = AppColors.text,
    super.key,
  });

  final String label;
  final String figure;
  final bool isTotal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.figure.copyWith(
      color: color,
      fontWeight: isTotal ? FontWeight.w600 : null,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            child: Text(
              label,
              style: isTotal
                  ? AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)
                  : AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(figure, style: style),
        ],
      ),
    );
  }
}
