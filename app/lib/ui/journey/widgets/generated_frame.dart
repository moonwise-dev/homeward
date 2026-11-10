import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class GeneratedOutline extends InheritedWidget {
  const GeneratedOutline({
    required this.isShown,
    required super.child,
    super.key,
  });

  final bool isShown;

  static bool of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GeneratedOutline>()?.isShown ??
      false;

  @override
  bool updateShouldNotify(GeneratedOutline oldWidget) =>
      isShown != oldWidget.isShown;
}

class GeneratedFrame extends StatelessWidget {
  const GeneratedFrame({
    required this.child,
    this.label = 'Composed by Gemini · A2UI',
    super.key,
  });

  final Widget child;
  final String label;

  static const _inset = AppSpacing.sm;

  @override
  Widget build(BuildContext context) {
    if (!GeneratedOutline.of(context)) {
      return child;
    }
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          foregroundPainter: _DashedOutline(color: colors.brand),
          child: Padding(padding: const EdgeInsets.all(_inset), child: child),
        ),
        Positioned(
          top: -9,
          right: AppSpacing.sm,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.brand,
              borderRadius: BorderRadius.circular(AppRadii.pill),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: 1,
              ),
              child: Text(
                label,
                style: styles.caption.copyWith(
                  color: colors.onBrand,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DashedOutline extends CustomPainter {
  const _DashedOutline({required this.color});

  final Color color;

  static const _dash = 6.0;
  static const _gap = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final outline = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          const Radius.circular(AppRadii.lg),
        ),
      );
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    for (final PathMetric metric in outline.computeMetrics()) {
      for (var at = 0.0; at < metric.length; at += _dash + _gap) {
        canvas.drawPath(metric.extractPath(at, at + _dash), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedOutline oldDelegate) => color != oldDelegate.color;
}
