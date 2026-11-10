import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.outlined = false,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Material(
      color: outlined ? colors.surface : colors.surfaceMuted,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.lg),
        side: outlined ? BorderSide(color: colors.border) : BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(padding: padding, child: child),
    );
  }
}
