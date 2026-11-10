import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';

class AppShimmer extends HookWidget {
  const AppShimmer({required this.child, super.key});

  final Widget child;

  static const _period = Duration(milliseconds: 1400);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final still = MediaQuery.disableAnimationsOf(context);
    final controller = useAnimationController(duration: _period);
    useEffect(() {
      if (!still) {
        controller.repeat();
      }
      return null;
    }, [still]);
    if (still) {
      return child;
    }
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) => ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [colors.surfaceMuted, colors.surface, colors.surfaceMuted],
          stops: const [0.25, 0.5, 0.75],
          transform: _Slide(controller.value),
        ).createShader(bounds),
        child: child,
      ),
    );
  }
}

class _Slide extends GradientTransform {
  const _Slide(this.progress);

  final double progress;

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) =>
      Matrix4.translationValues(bounds.width * (progress * 2 - 1), 0, 0);
}

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({
    this.width,
    this.height = 14,
    this.radius = AppRadii.sm,
    super.key,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: AppColors.of(context).surfaceMuted,
      borderRadius: BorderRadius.circular(radius),
    ),
  );
}
