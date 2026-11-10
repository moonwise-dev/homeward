import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/motion.dart';
import '../themes/text_styles.dart';

class AppMeter extends StatelessWidget {
  const AppMeter({
    required this.value,
    required this.limit,
    required this.valueLabel,
    required this.limitLabel,
    this.color,
    super.key,
  });

  final double value;
  final double limit;
  final String valueLabel;
  final String limitLabel;
  final Color? color;

  static const _height = 8.0;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final scale = value > limit ? value : limit;
    final filled = scale <= 0 ? 0.0 : (value / scale).clamp(0.0, 1.0);
    final mark = scale <= 0 ? 1.0 : (limit / scale).clamp(0.0, 1.0);
    final over = value > limit;
    final fill = color ?? (over ? colors.alert : colors.brand);
    final ink = color ?? (over ? colors.warning : colors.accent);
    return Semantics(
      label: '$valueLabel against $limitLabel',
      excludeSemantics: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.xxs,
        children: [
          LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              height: _height + 6,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: _height,
                    decoration: BoxDecoration(
                      color: colors.surfaceMuted,
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween(end: filled),
                    duration: AppMotion.of(context, AppMotion.page),
                    curve: AppMotion.curve,
                    builder: (context, share, _) => Container(
                      width: constraints.maxWidth * share,
                      height: _height,
                      decoration: BoxDecoration(
                        color: fill,
                        borderRadius: BorderRadius.circular(AppRadii.pill),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (constraints.maxWidth * mark - 1).clamp(
                      0,
                      constraints.maxWidth - 2,
                    ),
                    child: Container(
                      width: 2,
                      height: _height + 6,
                      color: colors.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  valueLabel,
                  style: styles.caption.copyWith(color: ink),
                ),
              ),
              Text(
                limitLabel,
                style: styles.caption.copyWith(color: colors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
