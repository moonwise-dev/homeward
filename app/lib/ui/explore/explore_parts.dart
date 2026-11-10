import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../catalog/money_text.dart';
import '../../catalog/travel_text.dart';
import '../core/themes/colors.dart';
import '../core/themes/dimens.dart';
import '../core/themes/motion.dart';
import '../core/themes/text_styles.dart';
import '../core/ui/app_photo.dart';
import '../core/ui/app_pressable.dart';
import '../core/ui/app_shimmer.dart';
import '../journey/widgets/generated_frame.dart';

class FunnelCounter extends StatelessWidget {
  const FunnelCounter({
    required this.homes,
    required this.narrowing,
    super.key,
  });

  final CityHomes homes;
  final Narrowing narrowing;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final counts = homes.counts(narrowing);
    final place = homes.mainPlace;
    final stages = [
      ('${counts.city}', 'in ${homes.cityName}'),
      if (homes.highestPrice != null ||
          homes.household?.grossMonthlyIncome != null)
        ('${counts.budget}', 'in budget'),
      if (narrowing.maxMinutes != null && place != null)
        ('${counts.week}', 'near ${place.name}'),
      if (narrowing.mustHaves.isNotEmpty)
        ('${counts.mustHaves}', 'with your must-haves'),
    ];
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(AppRadii.lg),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(end: counts.mustHaves.toDouble()),
                duration: AppMotion.of(
                  context,
                  const Duration(milliseconds: 700),
                ),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) => Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  spacing: AppSpacing.xs,
                  children: [
                    Text(
                      '${value.round()}',
                      style: styles.figureLarge.copyWith(
                        fontSize: 40,
                        height: 1,
                        color: counts.mustHaves == 0
                            ? colors.alert
                            : colors.text,
                      ),
                    ),
                    Text(
                      value.round() == 1 ? 'home left' : 'homes left',
                      style: styles.lead.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxs),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.xxs,
            children: [
              for (final (index, (count, label)) in stages.indexed) ...[
                if (index > 0)
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 14,
                    color: colors.textTertiary,
                  ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$count ',
                        style: styles.caption.copyWith(
                          color: colors.text,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: label),
                    ],
                  ),
                  style: styles.caption.copyWith(color: colors.textSecondary),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class TravelLimit extends StatelessWidget {
  const TravelLimit({
    required this.homes,
    required this.maxMinutes,
    required this.onChanged,
    super.key,
  });

  final CityHomes homes;
  final int? maxMinutes;
  final ValueChanged<int?> onChanged;

  static const _step = 5;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final place = homes.mainPlace;
    final range = homes.minutesRange;
    if (place == null || range == null) {
      return const SizedBox.shrink();
    }
    final least = (range.least ~/ _step) * _step;
    final most = ((range.most + _step - 1) ~/ _step) * _step;
    if (most - least < _step) {
      return const SizedBox.shrink();
    }
    final value = (maxMinutes ?? most).clamp(least, most);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(modeIcon(place.mode), size: 18, color: colors.textSecondary),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'To ${place.name} within '),
                    TextSpan(
                      text: maxMinutes == null
                          ? 'any time'
                          : durationText(value),
                      style: styles.label.copyWith(color: colors.text),
                    ),
                  ],
                ),
                style: styles.body.copyWith(color: colors.textSecondary),
              ),
            ),
            if (maxMinutes != null)
              TextButton(
                onPressed: () => onChanged(null),
                child: const Text('Clear'),
              ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: colors.accent,
            thumbColor: colors.accent,
            inactiveTrackColor: colors.surfaceMuted,
            overlayColor: colors.accent.withValues(alpha: 0.12),
          ),
          child: Slider(
            min: least.toDouble(),
            max: most.toDouble(),
            divisions: (most - least) ~/ _step,
            value: value.toDouble(),
            label: durationText(value),
            onChanged: (picked) => onChanged(
              picked.round() >= most ? null : picked.round(),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeRow extends StatelessWidget {
  const HomeRow({
    required this.home,
    required this.homes,
    required this.isKept,
    required this.isSelected,
    required this.onOpen,
    required this.onKeep,
    super.key,
  });

  final MapHome home;
  final CityHomes homes;
  final bool isKept;
  final bool isSelected;
  final VoidCallback onOpen;
  final VoidCallback onKeep;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final listing = home.listing;
    final place = homes.mainPlace;
    final minutes = place == null ? null : homes.minutesTo(home, place.id);
    final why = home.why;
    return AppPressable(
      label: '${listing.address}, ${listing.areaName}',
      onTap: onOpen,
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: AnimatedContainer(
        duration: AppMotion.of(context, AppMotion.surface),
        padding: const EdgeInsets.all(AppSpacing.xs),
        decoration: BoxDecoration(
          color: isSelected ? colors.accentSoft : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.sm,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.md),
              child: SizedBox(
                width: 76,
                height: 76,
                child: listing.photos.isEmpty
                    ? ColoredBox(color: colors.surfaceMuted)
                    : AppPhoto(id: listing.photos.first),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: moneyText(home.monthly ?? home.price),
                          style: styles.figure.copyWith(color: colors.text),
                        ),
                        if (home.monthly != null)
                          TextSpan(
                            text: ' a month',
                            style: styles.caption.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    '${listing.address}, ${listing.areaName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: styles.body,
                  ),
                  if (why != null) WhyText(why: why),
                  Text(
                    [
                      '${listing.bedrooms} bd',
                      '${listing.sizeM2} m²',
                      if (listing.outdoor != OutdoorSpace.none)
                        listing.outdoor.name,
                      if (minutes != null && place != null)
                        '${durationText(minutes)} to ${place.name}',
                    ].join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: styles.caption.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: isKept ? 'Kept' : 'Keep',
              onPressed: onKeep,
              icon: Icon(
                isKept ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: isKept ? colors.alert : colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhyText extends StatelessWidget {
  const WhyText({required this.why, super.key});

  final String why;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final marked = GeneratedOutline.of(context);
    return Row(
      spacing: AppSpacing.xxs,
      children: [
        Icon(Icons.auto_awesome_rounded, size: 13, color: colors.accent),
        Flexible(
          child: Text(
            why,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: styles.label.copyWith(
              color: colors.accent,
              decoration: marked ? TextDecoration.underline : null,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: colors.brand,
            ),
          ),
        ),
      ],
    );
  }
}

class HomeRowSkeleton extends StatelessWidget {
  const HomeRowSkeleton({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.all(AppSpacing.xs),
    child: Row(
      spacing: AppSpacing.sm,
      children: [
        AppSkeleton(width: 76, height: 76, radius: AppRadii.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.xs,
            children: [
              AppSkeleton(width: 140, height: 18),
              AppSkeleton(width: 200),
              AppSkeleton(width: 120, height: 12),
            ],
          ),
        ),
      ],
    ),
  );
}
