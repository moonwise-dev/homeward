import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../display/money_format.dart';
import 'app_colors.dart';
import 'app_motion.dart';
import 'app_text_styles.dart';

class AppAnimatedFigure extends StatelessWidget {
  const AppAnimatedFigure({
    required this.amount,
    required this.locale,
    this.style,
    this.color = AppColors.text,
    super.key,
  });

  final Money amount;
  final LocaleTag? locale;
  final TextStyle? style;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final format = moneyFormatFor(amount.currency, locale);
    return TweenAnimationBuilder<double>(
      tween: Tween(end: majorUnitsOf(amount)),
      duration: AppMotion.of(context, AppMotion.figure),
      curve: AppMotion.curve,
      builder: (context, value, _) => Text(
        format.format(value),
        style: (style ?? AppTextStyles.figure).copyWith(color: color),
      ),
    );
  }
}
