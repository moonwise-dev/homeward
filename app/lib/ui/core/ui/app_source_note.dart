import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppSourceNote extends StatelessWidget {
  const AppSourceNote({required this.lines, super.key});

  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.xs,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Icon(
            Icons.info_outline,
            size: 14,
            color: colors.textTertiary,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.xxs,
            children: [
              for (final line in lines)
                Text(
                  line,
                  style: styles.caption.copyWith(color: colors.textTertiary),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
