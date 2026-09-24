import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import 'app_loading_indicator.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final onPressed = isLoading ? null : this.onPressed;
    final child = _content();
    final button = switch (variant) {
      AppButtonVariant.filled => FilledButton(
        onPressed: onPressed,
        child: child,
      ),
      AppButtonVariant.outlined => OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
      AppButtonVariant.text => TextButton(onPressed: onPressed, child: child),
    };
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  Widget _content() {
    final leading = isLoading
        ? AppLoadingIndicator(
            size: 18,
            color: variant == AppButtonVariant.filled
                ? AppColors.onAccent
                : AppColors.accent,
          )
        : icon == null
        ? null
        : Icon(icon, size: 20);
    if (leading == null) {
      return Text(label);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        leading,
        const SizedBox(width: AppSpacing.xs),
        Flexible(child: Text(label)),
      ],
    );
  }
}

enum AppButtonVariant { filled, outlined, text }
