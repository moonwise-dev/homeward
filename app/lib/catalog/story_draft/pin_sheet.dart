import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../map_tiles.dart';

Future<LatLng?> showPinSheet(
  BuildContext context, {
  required String label,
  required LatLng center,
  LatLng? placed,
}) => showModalBottomSheet<LatLng>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (context) => _PinSheet(label: label, center: center, placed: placed),
);

class _PinSheet extends HookWidget {
  const _PinSheet({required this.label, required this.center, this.placed});

  final String label;
  final LatLng center;
  final LatLng? placed;

  @override
  Widget build(BuildContext context) {
    final chosen = useState(placed);
    final height = min(420.0, MediaQuery.sizeOf(context).height * 0.5);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          0,
          AppSpacing.md,
          AppSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Where is $label?', style: AppTextStyles.title),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadii.md),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: placed ?? center,
                    initialZoom: placed == null ? 13 : 15,
                    onTap: (_, point) => chosen.value = point,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                    ),
                  ),
                  children: [
                    const MapTiles(),
                    if (chosen.value case final point?)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: point,
                            width: 40,
                            height: 40,
                            alignment: Alignment.topCenter,
                            child: const Icon(
                              Icons.location_on,
                              size: 40,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                    const MapAttribution(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Tap the map to drop the pin, and again to move it.',
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: 'Use this place',
              icon: Icons.check,
              onPressed: chosen.value == null
                  ? null
                  : () => Navigator.of(context).pop(chosen.value),
            ),
          ],
        ),
      ),
    );
  }
}
