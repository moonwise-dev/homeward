import 'package:flutter/material.dart';

import '../themes/colors.dart';

class AppPhoto extends StatelessWidget {
  const AppPhoto({required this.id, this.semanticLabel, super.key});

  final String id;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) => Image.asset(
    'assets/photos/$id.webp',
    fit: BoxFit.cover,
    semanticLabel: semanticLabel,
    excludeFromSemantics: semanticLabel == null,
    errorBuilder: (context, error, stackTrace) => const ColoredBox(
      color: AppColors.surfaceMuted,
      child: Center(
        child: Icon(Icons.image_outlined, color: AppColors.textTertiary),
      ),
    ),
  );
}
