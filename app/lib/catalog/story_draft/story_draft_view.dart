import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import 'pin_sheet.dart';
import 'story_answers.dart';

class StoryDraftView extends StatefulWidget {
  const StoryDraftView({
    required this.segments,
    required this.answers,
    required this.onMode,
    required this.onMaxMinutes,
    required this.onStance,
    required this.onPin,
    super.key,
  });

  static const minuteChoices = [10, 15, 20, 30, 45, 60];

  final List<StorySegment> segments;
  final StoryAnswers answers;
  final ValueChanged<TravelMode> onMode;
  final ValueChanged<int> onMaxMinutes;
  final void Function(CriterionKind kind, CriterionStance stance) onStance;
  final void Function(String id, StoryPin pin) onPin;

  @override
  State<StoryDraftView> createState() => _StoryDraftViewState();
}

class _StoryDraftViewState extends State<StoryDraftView> {
  final _touched = <int>{};

  @override
  Widget build(BuildContext context) {
    final guessesLeft = widget.segments.indexed.any(
      (entry) => entry.$2.assumed && !_touched.contains(entry.$1),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: AppTextStyles.title.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.7,
            ),
            children: [
              for (final (index, segment) in widget.segments.indexed)
                _span(context, index, segment),
            ],
          ),
        ),
        if (guessesLeft)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text(
              'Dotted words are my guesses. Tap any highlighted word to '
              'change it.',
              style: AppTextStyles.caption,
            ),
          ),
      ],
    );
  }

  InlineSpan _span(BuildContext context, int index, StorySegment segment) {
    final assumed = segment.assumed && !_touched.contains(index);
    void touch() => setState(() => _touched.add(index));
    final answers = widget.answers;
    return switch (segment.type) {
      StorySegmentType.text => TextSpan(text: segment.text ?? ''),
      StorySegmentType.mode => _slot(
        PopupMenuButton<TravelMode>(
          tooltip: '',
          padding: EdgeInsets.zero,
          onSelected: (mode) {
            touch();
            widget.onMode(mode);
          },
          itemBuilder: (context) => [
            for (final mode in TravelMode.values)
              CheckedPopupMenuItem(
                value: mode,
                checked: mode == answers.mode,
                child: Text(mode.phrase),
              ),
          ],
          child: _Slot(
            label: (answers.mode ?? TravelMode.transit).phrase,
            assumed: assumed,
          ),
        ),
      ),
      StorySegmentType.maxMinutes => _slot(
        PopupMenuButton<int>(
          tooltip: '',
          padding: EdgeInsets.zero,
          onSelected: (minutes) {
            touch();
            widget.onMaxMinutes(minutes);
          },
          itemBuilder: (context) => [
            for (final minutes in {
              ...StoryDraftView.minuteChoices,
              ?answers.maxMinutes,
            }.toList()..sort())
              CheckedPopupMenuItem(
                value: minutes,
                checked: minutes == answers.maxMinutes,
                child: Text('$minutes minutes'),
              ),
          ],
          child: _Slot(
            label: '${answers.maxMinutes ?? 30} minutes',
            assumed: assumed,
          ),
        ),
      ),
      StorySegmentType.criterion when segment.kind != null => _slot(
        _criterionSlot(segment.kind!, assumed, touch),
      ),
      StorySegmentType.place => _slot(
        _placeSlot(context, segment, assumed, touch),
      ),
      StorySegmentType.criterion => const TextSpan(),
    };
  }

  Widget _criterionSlot(CriterionKind kind, bool assumed, VoidCallback touch) {
    final stance = widget.answers.stanceOf(kind);
    return PopupMenuButton<CriterionStance>(
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (selected) {
        touch();
        widget.onStance(kind, selected);
      },
      itemBuilder: (context) => [
        for (final option in CriterionStance.values)
          CheckedPopupMenuItem(
            value: option,
            checked: option == stance,
            child: Text(switch (option) {
              CriterionStance.matters => 'Matters to me',
              CriterionStance.must => 'Must have',
              CriterionStance.leftOut => 'Leave it out',
            }),
          ),
      ],
      child: _Slot(
        label: kind.label.toLowerCase(),
        assumed: assumed,
        icon: stance == CriterionStance.must ? Icons.lock_outline : null,
        struck: stance == CriterionStance.leftOut,
      ),
    );
  }

  Widget _placeSlot(
    BuildContext context,
    StorySegment segment,
    bool assumed,
    VoidCallback touch,
  ) {
    final id = segment.id ?? segment.label ?? 'place';
    final label = segment.label ?? id;
    final placed = widget.answers.placeOf(id, label);
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadii.sm),
      onTap: () async {
        final center = widget.answers.mapCenter;
        final picked = await showPinSheet(
          context,
          label: label,
          center: center == null
              ? const LatLng(0, 0)
              : LatLng(center.lat, center.lng),
          placed: placed == null ? null : LatLng(placed.lat, placed.lng),
        );
        if (picked != null) {
          touch();
          widget.onPin(
            id,
            StoryPin(label: label, lat: picked.latitude, lng: picked.longitude),
          );
        }
      },
      child: _Slot(
        label: placed == null ? 'drop a pin' : label,
        assumed: assumed,
        icon: placed == null ? Icons.add_location_alt_outlined : Icons.place,
      ),
    );
  }

  InlineSpan _slot(Widget child) =>
      WidgetSpan(alignment: PlaceholderAlignment.middle, child: child);
}

class _Slot extends StatelessWidget {
  const _Slot({
    required this.label,
    required this.assumed,
    this.icon,
    this.struck = false,
  });

  final String label;
  final bool assumed;
  final IconData? icon;
  final bool struck;

  @override
  Widget build(BuildContext context) {
    final color = struck ? AppColors.textTertiary : AppColors.accent;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: struck ? AppColors.surfaceMuted : AppColors.accentSoft,
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: color),
            const SizedBox(width: AppSpacing.xxs),
          ],
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              fontSize: 17,
              fontWeight: assumed ? FontWeight.w400 : FontWeight.w600,
              color: color,
              decoration: struck
                  ? TextDecoration.lineThrough
                  : assumed
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationStyle: TextDecorationStyle.dotted,
              decorationColor: color,
            ),
          ),
        ],
      ),
    );
  }
}
