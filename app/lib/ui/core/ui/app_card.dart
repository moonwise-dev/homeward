import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadii.md),
      border: Border.all(color: AppColors.border),
    ),
    child: Padding(padding: padding, child: child),
  );
}
