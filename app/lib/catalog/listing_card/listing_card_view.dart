import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../../ui/core/ui/app_status_tag.dart';
import '../sample_prices.dart';
import '../story_marks.dart';
import 'photo_carousel.dart';
import 'reason_list.dart';

class ListingCardView extends StatelessWidget {
  const ListingCardView({
    required this.home,
    required this.listing,
    this.showRank = false,
    this.onChoose,
    super.key,
  });

  final AssessedCandidate home;
  final Listing listing;
  final bool showRank;
  final VoidCallback? onChoose;

  @override
  Widget build(BuildContext context) {
    final color = homeColor(home.id);
    final best = showRank && home.rank == 1;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(
          color: best ? color : AppColors.border,
          width: best ? 1.5 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotoCarousel(
              photos: listing.photos,
              label: listing.title,
              credit: listing.photoCredit,
              tag: 'Sample listing',
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                if (showRank) ...[
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: color,
                    child: Text(
                      '${home.rank}',
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.onAccent,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
                Expanded(
                  child: Text(
                    '${listing.areaName} · ${listing.address}',
                    style: AppTextStyles.label,
                  ),
                ),
                if (best)
                  Text(
                    'Best fit',
                    style: AppTextStyles.label.copyWith(color: color),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(listing.title, style: AppTextStyles.title),
            const SizedBox(height: AppSpacing.xs),
            Text(formatSampleMoney(listing.price), style: AppTextStyles.figure),
            Text(
              [
                homeLine(listing.homeType, listing.rooms, listing.sizeM2),
                if (listing.floor case final floor?) 'floor $floor',
                if (listing.yearBuilt case final year?) 'built $year',
              ].join(' · '),
              style: AppTextStyles.label,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              '${perSquareMetre(listing.pricePerM2)} · ${againstArea(listing)}',
              style: AppTextStyles.caption,
            ),
            Text(
              'Area figure: ${listing.priceSource}',
              style: AppTextStyles.caption,
            ),
            if (home.weeklyMinutes case final minutes?) ...[
              const SizedBox(height: AppSpacing.xxs),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your week in travel ',
                      style: AppTextStyles.label,
                    ),
                    TextSpan(
                      text: weekPhrase(minutes),
                      style: AppTextStyles.label.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '  Measured',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.xs),
            Text(listing.blurb, style: AppTextStyles.body),
            if (home.missesMustHave)
              const Padding(
                padding: EdgeInsets.only(top: AppSpacing.xs),
                child: AppStatusTag(
                  status: AppStatus.fail,
                  text: 'Misses a must-have',
                ),
              ),
            ReasonList(
              title: 'Why it fits',
              reasons: home.why,
              description: listing.description,
            ),
            ReasonList(
              title: 'Where it falls short',
              reasons: home.shortfalls,
              description: listing.description,
            ),
            if (onChoose != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.sm),
                child: AppButton(
                  label: 'Choose ${listing.name}',
                  variant: best
                      ? AppButtonVariant.filled
                      : AppButtonVariant.outlined,
                  onPressed: onChoose,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
