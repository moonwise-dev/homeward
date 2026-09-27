import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../travel_text.dart';

class RouteSummaryView extends StatelessWidget {
  const RouteSummaryView({required this.trip, super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final minutes = trip.minutes;
    final meters = trip.meters;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.accentSoft,
          child: Icon(modeIcon(trip.mode), color: AppColors.accent),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('To ${trip.placeName}', style: AppTextStyles.label),
              Text(
                minutes == null
                    ? 'Not measured ${byText(trip.mode)}'
                    : '${durationText(minutes)} ${byText(trip.mode)}',
                style: AppTextStyles.figure.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                [
                  if (meters != null) '${distanceText(meters)} one way',
                  '${timesAWeekText(trip.perWeek)}, there and back',
                ].join(' · '),
                style: AppTextStyles.caption,
              ),
              Text(
                'Measured with ${measuredByText([trip.mode])}.',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
