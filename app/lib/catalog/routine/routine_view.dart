import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../../ui/core/ui/app_text_field.dart';
import '../story_draft/pin_sheet.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({
    required this.label,
    required this.places,
    required this.center,
    required this.onChanged,
    super.key,
  });

  final String label;
  final List<RoutinePlace> places;
  final GeoPoint? center;
  final ValueChanged<List<RoutinePlace>> onChanged;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label.isNotEmpty) ...[
        Text(label, style: AppTextStyles.title),
        const SizedBox(height: AppSpacing.xs),
      ],
      for (final (index, place) in places.indexed)
        _PlaceRow(
          place: place,
          onDays: (days) => onChanged([
            for (final (at, other) in places.indexed)
              at == index ? other.copyWith(perWeek: days) : other,
          ]),
          onRemove: place.pin == null
              ? null
              : () => onChanged([...places]..removeAt(index)),
        ),
      _AddPlace(
        center: center,
        onAdd: (label, pin) => onChanged([
          ...places,
          RoutinePlace(
            id: 'r${places.length + 1}',
            label: label,
            pin: pin,
          ),
        ]),
      ),
    ],
  );
}

class _PlaceRow extends StatelessWidget {
  const _PlaceRow({
    required this.place,
    required this.onDays,
    required this.onRemove,
  });

  final RoutinePlace place;
  final ValueChanged<int> onDays;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              place.pin == null
                  ? Icons.place_outlined
                  : Icons.push_pin_outlined,
              size: 16,
              color: AppColors.accent,
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Text(
                place.label,
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              place.perWeek == 1
                  ? 'once a week'
                  : '${place.perWeek} days a week',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            if (onRemove case final onRemove?)
              IconButton(
                onPressed: onRemove,
                tooltip: 'Remove ${place.label}',
                icon: const Icon(Icons.close, size: 16),
                visualDensity: VisualDensity.compact,
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xxs),
        Wrap(
          spacing: AppSpacing.xxs,
          runSpacing: AppSpacing.xxs,
          children: [
            for (var days = 1; days <= 7; days++)
              _DayChip(
                days: days,
                selected: days == place.perWeek,
                onTap: () => onDays(days),
              ),
          ],
        ),
      ],
    ),
  );
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.days,
    required this.selected,
    required this.onTap,
  });

  final int days;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    selected: selected,
    label: days == 1 ? 'Once a week' : '$days days a week',
    child: InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 34,
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? AppColors.accent : AppColors.surface,
          border: Border.all(
            color: selected ? AppColors.accent : AppColors.border,
          ),
        ),
        child: Text(
          '$days',
          style: AppTextStyles.label.copyWith(
            color: selected ? AppColors.onAccent : AppColors.text,
          ),
        ),
      ),
    ),
  );
}

class _AddPlace extends HookWidget {
  const _AddPlace({required this.center, required this.onAdd});

  final GeoPoint? center;
  final void Function(String label, GeoPoint pin) onAdd;

  @override
  Widget build(BuildContext context) {
    final name = useState('');
    final generation = useState(0);
    final center = this.center;
    final named = name.value.trim();
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: AppTextField(
              key: ValueKey(generation.value),
              label: 'Another place in your week',
              hintText: 'A clinic, the gym, your parents',
              value: name.value,
              onChanged: (value) => name.value = value,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          AppButton(
            label: 'Place it',
            variant: AppButtonVariant.outlined,
            onPressed: named.isEmpty || center == null
                ? null
                : () async {
                    final picked = await showPinSheet(
                      context,
                      label: named,
                      center: LatLng(center.lat, center.lng),
                    );
                    if (picked == null) {
                      return;
                    }
                    onAdd(
                      named,
                      GeoPoint(lat: picked.latitude, lng: picked.longitude),
                    );
                    name.value = '';
                    generation.value++;
                  },
          ),
        ],
      ),
    );
  }
}
