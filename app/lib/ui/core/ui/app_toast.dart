import 'package:flutter/material.dart';

import '../messages/app_message.dart';
import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppToast extends StatelessWidget {
  const AppToast({
    required this.type,
    required this.message,
    required this.onDismiss,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final AppMessageType type;
  final String message;
  final VoidCallback onDismiss;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final (color, icon) = switch (type) {
      AppMessageType.info => (AppColors.info, Icons.info_outline),
      AppMessageType.error => (AppColors.danger, Icons.error_outline),
    };
    final actionLabel = this.actionLabel;
    final onAction = this.onAction;
    return Semantics(
      container: true,
      liveRegion: true,
      child: GestureDetector(
        onTap: onDismiss,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadii.md),
            border: Border.all(color: color.withValues(alpha: 0.5)),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            child: Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    message,
                    style: AppTextStyles.body,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (actionLabel != null && onAction != null)
                  TextButton(onPressed: onAction, child: Text(actionLabel)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
