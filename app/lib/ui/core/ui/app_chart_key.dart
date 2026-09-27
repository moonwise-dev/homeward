import 'package:flutter/material.dart';

import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppChartKey extends StatelessWidget {
  const AppChartKey({required this.label, required this.color, super.key});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 12,
        height: 3,
        child: ColoredBox(color: color),
      ),
      const SizedBox(width: AppSpacing.xxs),
      Text(label, style: AppTextStyles.caption),
    ],
  );
}
