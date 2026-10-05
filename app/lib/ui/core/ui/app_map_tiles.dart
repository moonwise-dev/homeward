import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/map_tint.dart';
import '../themes/text_styles.dart';

class AppMapTiles extends StatelessWidget {
  const AppMapTiles({super.key});

  static const _openStreetMap =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const _package = 'se.moonwise.homeward';

  @override
  Widget build(BuildContext context) => ColorFiltered(
    colorFilter: AppMapTint.of(context),
    child: TileLayer(
      urlTemplate: _openStreetMap,
      userAgentPackageName: _package,
    ),
  );
}

class AppMapAttribution extends StatelessWidget {
  const AppMapAttribution({super.key});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomRight,
    child: Container(
      margin: const EdgeInsets.all(AppSpacing.xxs),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
      color: AppColors.of(context).surface.withValues(alpha: 0.8),
      child: Text(
        '© OpenStreetMap contributors',
        style: AppTextStyles.of(context).caption,
      ),
    ),
  );
}
