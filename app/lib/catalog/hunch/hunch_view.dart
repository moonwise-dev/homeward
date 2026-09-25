import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../story_draft/pin_sheet.dart';

typedef HunchOption = ({String label, String value, bool pin});

class HunchView extends HookWidget {
  const HunchView({
    required this.hunch,
    required this.options,
    required this.onAnswer,
    this.because,
    this.center,
    super.key,
  });

  final String hunch;
  final String? because;
  final List<HunchOption> options;
  final GeoPoint? center;
  final void Function(HunchOption option, GeoPoint? pin) onAnswer;

  @override
  Widget build(BuildContext context) {
    final chosen = useState<int?>(null);
    final because = this.because;
    Future<void> choose(int index) async {
      final option = options[index];
      GeoPoint? pin;
      if (option.pin) {
        final picked = await showPinSheet(
          context,
          label: option.label,
          center: LatLng(center?.lat ?? 0, center?.lng ?? 0),
        );
        if (picked == null) {
          return;
        }
        pin = GeoPoint(lat: picked.latitude, lng: picked.longitude);
      }
      chosen.value = index;
      onAnswer(option, pin);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (because != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              children: [
                const Icon(Icons.search, size: 16, color: AppColors.accent),
                const SizedBox(width: AppSpacing.xxs),
                Flexible(
                  child: Text(
                    because,
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        Text(hunch, style: AppTextStyles.title),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final (index, option) in options.indexed)
              _Choice(
                label: option.label,
                icon: option.pin ? Icons.add_location_alt_outlined : null,
                isHunch: index == 0,
                isChosen: chosen.value == index,
                onPressed: chosen.value == null ? () => choose(index) : null,
              ),
          ],
        ),
      ],
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice({
    required this.label,
    required this.isHunch,
    required this.isChosen,
    this.icon,
    this.onPressed,
  });

  final String label;
  final IconData? icon;
  final bool isHunch;
  final bool isChosen;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final icon = isChosen ? Icons.check : this.icon;
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18),
          const SizedBox(width: AppSpacing.xxs),
        ],
        Text(label),
      ],
    );
    return isHunch || isChosen
        ? FilledButton(
            onPressed: onPressed ?? (isChosen ? () {} : null),
            child: child,
          )
        : OutlinedButton(onPressed: onPressed, child: child);
  }
}
