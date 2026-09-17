import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppChatBubble extends StatelessWidget {
  const AppChatBubble({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.accentSoft,
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: SelectableText(text, style: AppTextStyles.body),
        ),
      ),
    ),
  );
}
