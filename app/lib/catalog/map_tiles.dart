import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../ui/core/themes/colors.dart';
import '../ui/core/themes/dimens.dart';
import '../ui/core/themes/text_styles.dart';

final _calmTiles = _softened(saturation: 0.35, lift: 12);

ColorFilter _softened({required double saturation, required double lift}) {
  const luminance = [0.2126, 0.7152, 0.0722];
  final grey = 1 - saturation;
  return ColorFilter.matrix([
    for (var channel = 0; channel < 3; channel++) ...[
      for (var source = 0; source < 3; source++)
        grey * luminance[source] + (source == channel ? saturation : 0),
      0,
      lift,
    ],
    0,
    0,
    0,
    1,
    0,
  ]);
}

class MapTiles extends StatelessWidget {
  const MapTiles({super.key});

  @override
  Widget build(BuildContext context) => ColorFiltered(
    colorFilter: _calmTiles,
    child: TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'se.moonwise.homeward',
    ),
  );
}

class MapAttribution extends StatelessWidget {
  const MapAttribution({super.key});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomRight,
    child: Container(
      margin: const EdgeInsets.all(AppSpacing.xxs),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
      color: AppColors.surface.withValues(alpha: 0.8),
      child: Text(
        '© OpenStreetMap contributors',
        textAlign: TextAlign.right,
        style: AppTextStyles.caption.copyWith(fontSize: 10),
      ),
    ),
  );
}
