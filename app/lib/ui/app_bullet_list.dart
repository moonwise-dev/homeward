import 'package:flutter/material.dart';

import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppBulletList extends StatelessWidget {
  const AppBulletList({required this.items, super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (final item in items)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('•', style: AppTextStyles.label),
              const SizedBox(width: AppSpacing.xs),
              Expanded(child: Text(item, style: AppTextStyles.label)),
            ],
          ),
        ),
    ],
  );
}
