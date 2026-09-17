import 'package:flutter/material.dart';

import '../../../ui/app_text_styles.dart';

class PlanTile extends StatelessWidget {
  const PlanTile({
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(title, style: AppTextStyles.body),
    subtitle: Text(subtitle, style: AppTextStyles.caption),
    trailing: onTap == null ? null : const Icon(Icons.chevron_right),
    onTap: onTap,
  );
}
