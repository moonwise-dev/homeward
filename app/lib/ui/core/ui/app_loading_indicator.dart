import 'package:flutter/material.dart';

import '../themes/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    this.size = 28,
    this.color = AppColors.accent,
    super.key,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: size,
    child: CircularProgressIndicator(
      strokeWidth: size / 10,
      valueColor: AlwaysStoppedAnimation(color),
    ),
  );
}
