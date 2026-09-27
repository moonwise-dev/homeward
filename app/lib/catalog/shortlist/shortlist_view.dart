import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_photo.dart';
import '../home_text.dart';
import '../money_text.dart';

class ShortlistView extends HookWidget {
  const ShortlistView({
    required this.homes,
    this.onChoose,
    this.onDrop,
    super.key,
  });

  final List<PricedHome> homes;
  final ValueChanged<PricedHome>? onChoose;
  final ValueChanged<PricedHome>? onDrop;

  @override
  Widget build(BuildContext context) {
    final sent = useState(false);
    useEffect(() {
      sent.value = false;
      return null;
    }, homes);
    final kept = [
      for (final home in homes)
        if (home.kept) home,
    ];
    ValueChanged<PricedHome>? once(ValueChanged<PricedHome>? action) =>
        action == null || sent.value
        ? null
        : (home) {
            sent.value = true;
            action(home);
          };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Your shortlist', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        if (kept.isEmpty)
          Text(
            'Nothing kept yet. Keep a home to see it here.',
            style: AppTextStyles.caption,
          )
        else ...[
          Text(
            '${kept.length} home${kept.length == 1 ? '' : 's'} kept',
            style: AppTextStyles.caption,
          ),
          const SizedBox(height: AppSpacing.xs),
          for (final home in kept)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: _Row(
                home: home,
                onChoose: once(onChoose),
                onDrop: once(onDrop),
              ),
            ),
          Text(
            'Sample listings, not for sale. An estimate, not advice.',
            style: AppTextStyles.caption,
          ),
        ],
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.home, this.onChoose, this.onDrop});

  final PricedHome home;
  final ValueChanged<PricedHome>? onChoose;
  final ValueChanged<PricedHome>? onDrop;

  @override
  Widget build(BuildContext context) {
    final listing = home.listing;
    final cost = home.cost;
    final onChoose = this.onChoose;
    final onDrop = this.onDrop;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.sm),
              child: SizedBox(
                width: 96,
                height: 72,
                child: AppPhoto(id: listing.photos.first),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${listing.areaName} · ${listing.address}',
                    style: AppTextStyles.label,
                  ),
                  Text(
                    '${moneyText(listing.price)} · ${listing.rooms} rooms · '
                    '${listing.sizeM2} m²',
                    style: AppTextStyles.caption,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  if (cost == null)
                    Text(
                      'Not worked out for you yet',
                      style: AppTextStyles.caption,
                    )
                  else ...[
                    Text(
                      '${moneyText(cost.monthly.totalWithFee)} a month',
                      style: AppTextStyles.figure.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      reachText(cost),
                      style: AppTextStyles.caption.copyWith(
                        color: cost.withinReach
                            ? AppColors.positive
                            : AppColors.danger,
                      ),
                    ),
                  ],
                  Wrap(
                    children: [
                      if (onChoose != null)
                        TextButton(
                          onPressed: () => onChoose(home),
                          child: const Text('Work out'),
                        ),
                      if (onDrop != null)
                        TextButton(
                          onPressed: () => onDrop(home),
                          child: const Text('Drop'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
