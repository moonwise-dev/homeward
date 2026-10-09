import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppFigureRow extends StatelessWidget {
  const AppFigureRow({
    required this.label,
    required this.figure,
    this.isTotal = false,
    this.color,
    this.note,
    super.key,
  });

  final String label;
  final String figure;
  final bool isTotal;
  final Color? color;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final style = styles.figure.copyWith(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: isTotal
                      ? styles.body.copyWith(fontWeight: FontWeight.w600)
                      : styles.body.copyWith(color: colors.textSecondary),
                ),
                if (note case final note?)
                  Text(
                    note,
                    style: styles.caption.copyWith(color: colors.accent),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(figure, style: style),
        ],
      ),
    );
  }
}
