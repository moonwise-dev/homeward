import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppDemoHeader extends StatelessWidget {
  const AppDemoHeader({required this.child, super.key});

  static const text =
      'This is a demo project by Moonwise to showcase A2UI apps.';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: Color.alphaBlend(colors.accentSoft, colors.background),
          child: SafeArea(
            bottom: false,
            child: Semantics(
              header: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: styles.caption.copyWith(color: colors.text),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: child,
          ),
        ),
      ],
    );
  }
}
