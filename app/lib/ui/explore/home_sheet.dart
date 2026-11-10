import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../catalog/money_text.dart';
import '../../catalog/travel_text.dart';
import '../core/themes/colors.dart';
import '../core/themes/dimens.dart';
import '../core/themes/text_styles.dart';
import '../core/ui/app_button.dart';
import '../core/ui/app_photo.dart';
import 'explore_parts.dart';

Future<void> showHomeSheet(
  BuildContext context, {
  required CityHomes homes,
  required MapHome home,
  required ValueNotifier<Set<String>> kept,
}) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  constraints: const BoxConstraints(maxWidth: 560),
  backgroundColor: AppColors.of(context).surface,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
  ),
  builder: (context) => DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.86,
    maxChildSize: 0.95,
    minChildSize: 0.4,
    builder: (context, scroll) => ValueListenableBuilder(
      valueListenable: kept,
      builder: (context, value, _) => _HomeSheet(
        homes: homes,
        home: home,
        isKept: value.contains(home.listing.id),
        onKeep: () => kept.value = value.contains(home.listing.id)
            ? ({...value}..remove(home.listing.id))
            : {...value, home.listing.id},
        scroll: scroll,
      ),
    ),
  ),
);

class _HomeSheet extends HookWidget {
  const _HomeSheet({
    required this.homes,
    required this.home,
    required this.isKept,
    required this.onKeep,
    required this.scroll,
  });

  final CityHomes homes;
  final MapHome home;
  final bool isKept;
  final VoidCallback onKeep;
  final ScrollController scroll;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final listing = home.listing;
    final page = useState(0);
    final cost = home.cost;
    final rent = home.rent;
    final area = homes.areaOf(home);
    final figures = <(String, Money, String?)>[
      if (home.monthly case final monthly?)
        (
          rent == null ? 'A month for you' : 'Rent a month, estimated',
          monthly,
          rent == null ? 'Loan, interest, and fee' : rent.source,
        ),
      if (cost?.cashNeeded case final cash?)
        ('Cash on the day', cash, 'Down payment and costs'),
      if (home.ifRatesRise case final stressed?)
        ('If rates rise', stressed, 'A month at the stress rate'),
      if (rent == null) ('Price', listing.price, listing.priceSource),
    ];
    return ListView(
      controller: scroll,
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 240,
              child: PageView(
                onPageChanged: (index) => page.value = index,
                children: [
                  for (final photo in listing.photos)
                    AppPhoto(id: photo, semanticLabel: listing.title),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: AppSpacing.sm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  for (var index = 0; index < listing.photos.length; index++)
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: index == page.value
                            ? colors.onPhoto
                            : colors.onPhoto.withValues(alpha: 0.45),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              top: AppSpacing.sm,
              left: AppSpacing.sm,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: colors.text.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                child: Text(
                  'Sample home',
                  style: styles.caption.copyWith(color: colors.surface),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpacing.md,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.xxs,
                children: [
                  Text(listing.title, style: styles.title),
                  Text(
                    '${listing.address}, ${listing.areaName}',
                    style: styles.body.copyWith(color: colors.textSecondary),
                  ),
                  if (home.why case final why?) WhyText(why: why),
                ],
              ),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  for (final (label, money, source) in figures)
                    _Figure(label: label, money: money, source: source),
                ],
              ),
              if (homes.places.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AppSpacing.xs,
                  children: [
                    Text('Your week from here', style: styles.label),
                    for (final place in homes.places)
                      Row(
                        spacing: AppSpacing.sm,
                        children: [
                          Icon(
                            modeIcon(place.mode),
                            size: 20,
                            color: colors.accent,
                          ),
                          Expanded(
                            child: Text(
                              '${place.name}, ${timesAWeekText(place.perWeek)}',
                              style: styles.body,
                            ),
                          ),
                          Text(
                            switch (homes.minutesTo(home, place.id)) {
                              final minutes? => durationText(minutes),
                              null => 'not measured',
                            },
                            style: styles.figure,
                          ),
                        ],
                      ),
                    if (homes.weeklyMinutes(home) case final weekly?)
                      Text(
                        '${durationText(weekly)} a week there and back, '
                        'from the centre of ${area?.areaName ?? listing.areaName}, '
                        'measured by open routing.',
                        style: styles.caption.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                  ],
                ),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final fact in [
                    '${listing.rooms} rooms',
                    '${listing.bedrooms} '
                        '${listing.bedrooms == 1 ? 'bedroom' : 'bedrooms'}',
                    '${listing.sizeM2} m²',
                    if (listing.floor case final floor?) 'Floor $floor',
                    if (listing.lift case final lift?)
                      lift ? 'Lift' : 'No lift',
                    if (listing.outdoor != OutdoorSpace.none)
                      _capitalized(listing.outdoor.phrase),
                    if (listing.yearBuilt case final year?) 'Built $year',
                  ])
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xxs,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceMuted,
                        borderRadius: BorderRadius.circular(AppRadii.pill),
                      ),
                      child: Text(fact, style: styles.label),
                    ),
                ],
              ),
              Text(listing.blurb, style: styles.body),
              AppButton(
                label: isKept ? 'Kept' : 'Keep this home',
                icon: isKept
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                variant: isKept
                    ? AppButtonVariant.outlined
                    : AppButtonVariant.filled,
                fullWidth: true,
                onPressed: onKeep,
              ),
              Text(
                [
                  'A labelled sample, not a listing for sale.',
                  if (listing.photoCredit case final credit?) '$credit.',
                ].join(' '),
                style: styles.caption.copyWith(color: colors.textTertiary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Figure extends StatelessWidget {
  const _Figure({required this.label, required this.money, this.source});

  final String label;
  final Money money;
  final String? source;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Container(
      width: 236,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: colors.surfaceMuted,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Text(
            label,
            style: styles.caption.copyWith(color: colors.textSecondary),
          ),
          Text(moneyText(money), style: styles.figure),
          if (source case final source?)
            Text(
              source,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: styles.caption.copyWith(color: colors.textTertiary),
            ),
        ],
      ),
    );
  }
}

Future<void> showKeptComparison(
  BuildContext context, {
  required CityHomes homes,
  required List<MapHome> kept,
  required ValueChanged<String> onOpen,
}) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  constraints: const BoxConstraints(maxWidth: 900),
  backgroundColor: AppColors.of(context).surface,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
  ),
  builder: (context) => _KeptComparison(
    homes: homes,
    kept: kept,
    onOpen: (id) {
      Navigator.of(context).pop();
      onOpen(id);
    },
  ),
);

class _KeptComparison extends StatelessWidget {
  const _KeptComparison({
    required this.homes,
    required this.kept,
    required this.onOpen,
  });

  final CityHomes homes;
  final List<MapHome> kept;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final ranked = homes.ranked(kept);
    String? weekly(MapHome home) => switch (homes.weeklyMinutes(home)) {
      final minutes? => '${durationText(minutes)} a week',
      null => null,
    };
    final rows = <(String, String? Function(MapHome home))>[
      (
        homes.renting ? 'Rent a month' : 'A month for you',
        (home) => switch (home.monthly) {
          final money? => moneyText(money),
          null => null,
        },
      ),
      (
        'Cash on the day',
        (home) => switch (home.cost?.cashNeeded) {
          final money? => moneyText(money),
          null => null,
        },
      ),
      ('Travel', weekly),
      (
        'Rooms',
        (home) =>
            '${home.listing.bedrooms} '
            '${home.listing.bedrooms == 1 ? 'bedroom' : 'bedrooms'}, '
            '${home.listing.sizeM2} m²',
      ),
      (
        'Outside',
        (home) => home.listing.outdoor == OutdoorSpace.none
            ? 'None'
            : _capitalized(home.listing.outdoor.phrase),
      ),
      ('Why', (home) => home.why),
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.md,
        children: [
          Text(
            '${ranked.length} homes worth a visit',
            style: styles.title,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.md,
              children: [
                for (final (index, home) in ranked.indexed)
                  SizedBox(
                    width: 250,
                    child: InkWell(
                      onTap: () => onOpen(home.listing.id),
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: AppSpacing.xs,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadii.lg),
                            child: AspectRatio(
                              aspectRatio: 4 / 3,
                              child: AppPhoto(id: home.listing.photos.first),
                            ),
                          ),
                          Row(
                            spacing: AppSpacing.xs,
                            children: [
                              if (index == 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.xs,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colors.brand,
                                    borderRadius: BorderRadius.circular(
                                      AppRadii.pill,
                                    ),
                                  ),
                                  child: Text(
                                    'Nearest',
                                    style: styles.caption.copyWith(
                                      color: colors.onBrand,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  home.listing.areaName,
                                  style: styles.label,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            home.listing.address,
                            style: styles.body.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                          for (final (label, value) in rows)
                            if (value(home) case final text?)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    label,
                                    style: styles.caption.copyWith(
                                      color: colors.textTertiary,
                                    ),
                                  ),
                                  Text(
                                    text,
                                    style: label == 'Why'
                                        ? styles.label.copyWith(
                                            color: colors.accent,
                                          )
                                        : styles.figure,
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _capitalized(String phrase) {
  final words = phrase.startsWith('a ') ? phrase.substring(2) : phrase;
  return '${words[0].toUpperCase()}${words.substring(1)}';
}
