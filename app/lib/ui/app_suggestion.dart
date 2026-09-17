import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppSuggestion extends StatelessWidget {
  const AppSuggestion({required this.text, required this.onPressed, super.key});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.md),
      side: const BorderSide(color: AppColors.border),
    );
    return Material(
      color: AppColors.surface,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Text(text, style: AppTextStyles.body),
        ),
      ),
    );
  }
}
