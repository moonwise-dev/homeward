import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../travel_text.dart';

class WeeklyTravelView extends StatelessWidget {
  const WeeklyTravelView({required this.week, super.key});

  final WeekTravel week;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Your week from ${week.fromName}', style: styles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          durationText(week.weeklyMinutes),
          style: styles.figureLarge,
        ),
        Text(
          week.measuredEveryTrip
              ? 'Travelling a week, there and back'
              : 'Travelling a week, there and back, for the trips measured',
          style: styles.caption,
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final trip in week.trips)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
            child: Row(
              children: [
                Icon(modeIcon(trip.mode), size: 20, color: colors.accent),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(trip.placeName, style: styles.body),
                      Text(
                        '${timesAWeekText(trip.perWeek)} ${byText(trip.mode)}',
                        style: styles.caption,
                      ),
                    ],
                  ),
                ),
                Text(
                  switch (trip.minutes) {
                    final minutes? => '${durationText(minutes)} each way',
                    null => 'Not measured',
                  },
                  style: styles.figure.copyWith(
                    color: trip.minutes == null
                        ? colors.textTertiary
                        : colors.text,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Measured one way with '
          '${measuredByText(week.trips.map((trip) => trip.mode))}.',
          style: styles.caption,
        ),
      ],
    );
  }
}
