import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'app_animated_figure.dart';
import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppFigureRow extends StatelessWidget {
  const AppFigureRow({
    required this.label,
    required String this.figure,
    this.isTotal = false,
    this.color = AppColors.text,
    super.key,
  }) : amount = null,
       locale = null;

  const AppFigureRow.amount({
    required this.label,
    required Money this.amount,
    required this.locale,
    this.isTotal = false,
    this.color = AppColors.text,
    super.key,
  }) : figure = null;

  final String label;
  final String? figure;
  final Money? amount;
  final LocaleTag? locale;
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
          switch (amount) {
            final amount? => AppAnimatedFigure(
              amount: amount,
              locale: locale,
              style: style,
              color: color,
            ),
            null => Text(figure!, style: style),
          },
        ],
      ),
    );
  }
}
