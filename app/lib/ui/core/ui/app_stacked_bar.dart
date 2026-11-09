import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

typedef AppBarPart = ({String label, String figure, double value, Color color});

class AppStackedBar extends StatelessWidget {
  const AppStackedBar({required this.parts, super.key});

  final List<AppBarPart> parts;

  static const _height = 12.0;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final shown = [
      for (final part in parts)
        if (part.value > 0) part,
    ];
    return Semantics(
      label: [
        for (final part in shown) '${part.label} ${part.figure}',
      ].join(', '),
      excludeSemantics: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.xs,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.pill),
            child: SizedBox(
              height: _height,
              child: Row(
                spacing: 2,
                children: [
                  for (final part in shown)
                    Expanded(
                      flex: (part.value * 1000).round().clamp(1, 1 << 30),
                      child: ColoredBox(color: part.color),
                    ),
                ],
              ),
            ),
          ),
          for (final part in shown)
            Row(
              spacing: AppSpacing.xs,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: part.color,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    part.label,
                    style: styles.body.copyWith(color: colors.textSecondary),
                  ),
                ),
                Text(part.figure, style: styles.figure),
              ],
            ),
        ],
      ),
    );
  }
}
