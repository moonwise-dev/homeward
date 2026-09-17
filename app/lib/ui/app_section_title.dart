import 'package:flutter/material.dart';

import 'app_button.dart';
import 'app_button_variant.dart';
import 'app_text_styles.dart';

class AppSectionTitle extends StatelessWidget {
  const AppSectionTitle({required this.title, this.onExplain, super.key});

  final String title;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: Text(title, style: AppTextStyles.title)),
      if (onExplain != null)
        AppButton(
          label: 'Why?',
          variant: AppButtonVariant.text,
          onPressed: onExplain,
        ),
    ],
  );
}
