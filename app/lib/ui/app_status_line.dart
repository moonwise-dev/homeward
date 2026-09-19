import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_loading_indicator.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppStatusLine extends StatelessWidget {
  const AppStatusLine({
    required this.text,
    this.icon,
    this.isBusy = false,
    this.color = AppColors.textTertiary,
    this.trailing,
    super.key,
  });

  final String text;
  final IconData? icon;
  final bool isBusy;
  final Color color;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isBusy)
          const AppLoadingIndicator(size: 14)
        else if (icon != null)
          Icon(icon, size: 16, color: color),
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: text),
                if (trailing case final trailing?)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: trailing,
                  ),
              ],
            ),
            style: AppTextStyles.caption.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
