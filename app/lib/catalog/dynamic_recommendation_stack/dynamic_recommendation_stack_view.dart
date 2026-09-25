import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../../ui/core/ui/app_status_tag.dart';
import '../listing_card/listing_card_view.dart';
import '../story_marks.dart';

class DynamicRecommendationStackView extends StatelessWidget {
  const DynamicRecommendationStackView({
    required this.homes,
    this.onChoose,
    super.key,
  });

  final List<AssessedCandidate> homes;
  final ValueChanged<String>? onChoose;

  @override
  Widget build(BuildContext context) {
    Widget card(AssessedCandidate home) {
      final onChoose = this.onChoose == null
          ? null
          : () => this.onChoose!(home.id);
      return switch (home.listing) {
        final listing? => ListingCardView(
          home: home,
          listing: listing,
          showRank: true,
          onChoose: onChoose,
        ),
        null => _HomeCard(home: home, onChoose: onChoose),
      };
    }

    return LayoutBuilder(
      builder: (context, constraints) =>
          constraints.maxWidth >= 860 &&
              homes.length > 1 &&
              homes.every((home) => home.listing != null)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (index, home) in homes.indexed) ...[
                  if (index > 0) const SizedBox(width: AppSpacing.sm),
                  Expanded(child: card(home)),
                ],
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final (index, home) in homes.indexed)
                  Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 0 : AppSpacing.sm,
                    ),
                    child: card(home),
                  ),
              ],
            ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({required this.home, this.onChoose});

  final AssessedCandidate home;
  final VoidCallback? onChoose;

  @override
  Widget build(BuildContext context) {
    final color = homeColor(home.id);
    final best = home.rank == 1;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(
          color: best ? color : AppColors.border,
          width: best ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: color,
                child: Text(
                  '${home.rank}',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.onAccent,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(child: Text(home.label, style: AppTextStyles.title)),
              if (best)
                Text(
                  'Best fit',
                  style: AppTextStyles.label.copyWith(color: color),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Semantics(
            label: 'Fits ${home.score} percent of what matters',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.pill),
              child: LinearProgressIndicator(
                value: home.score / 100,
                minHeight: 6,
                color: color,
                backgroundColor: AppColors.surfaceMuted,
              ),
            ),
          ),
          if (home.missesMustHave)
            const Padding(
              padding: EdgeInsets.only(top: AppSpacing.xs),
              child: AppStatusTag(
                status: AppStatus.fail,
                text: 'Misses a must-have',
              ),
            ),
          const SizedBox(height: AppSpacing.xs),
          for (final line in home.pros)
            AppStatusTag(status: AppStatus.pass, text: line),
          for (final line in home.close)
            AppStatusTag(status: AppStatus.warn, text: line),
          for (final line in home.cons)
            AppStatusTag(status: AppStatus.fail, text: line),
          if (onChoose != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: AppButton(
                label: 'Choose ${home.label}',
                variant: best
                    ? AppButtonVariant.filled
                    : AppButtonVariant.outlined,
                onPressed: onChoose,
              ),
            ),
        ],
      ),
    );
  }
}
