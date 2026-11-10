import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../catalog/money_text.dart';
import '../../catalog/travel_text.dart';
import '../core/themes/colors.dart';
import '../core/themes/dimens.dart';
import '../core/themes/motion.dart';
import '../core/themes/text_styles.dart';
import '../core/ui/app_pressable.dart';
import '../core/ui/app_shimmer.dart';
import '../journey/widgets/generated_frame.dart';
import 'story_editor.dart';

enum ChipKind { stated, assumed, missing, add, worked }

typedef StoryEdit = Map<String, Object?>;

class StoryPanel extends StatelessWidget {
  const StoryPanel({
    required this.homes,
    required this.isWaiting,
    required this.mustHaves,
    required this.onEdit,
    required this.onTell,
    super.key,
  });

  final CityHomes? homes;
  final bool isWaiting;
  final Widget mustHaves;
  final ValueChanged<StoryEdit> onEdit;
  final ValueChanged<String> onTell;

  @override
  Widget build(BuildContext context) {
    final homes = this.homes;
    if (homes == null) {
      return isWaiting ? const _StorySkeleton() : const SizedBox.shrink();
    }
    final currency = homes.homes.isEmpty
        ? null
        : homes.homes.first.price.currency;
    final household = homes.household;
    final assumed = household?.assumed ?? const <ProfileAssumption>{};
    final adults = household?.adults;
    final children = household?.childAges ?? const <int>[];

    Future<void> editAdults() async {
      final picked = await editCount(
        context,
        title: 'Adults who will live in the home',
        value: adults ?? 2,
        least: 1,
        most: 6,
        words: (count) => '$count ${count == 1 ? 'adult' : 'adults'}',
      );
      if (picked != null) {
        onEdit({
          'adults': picked,
          'label': '$picked ${picked == 1 ? 'adult' : 'adults'}',
        });
      }
    }

    Future<void> editAmount(
      String key,
      String title,
      String meaning,
      Money? value,
      MoneyRange Function(Currency currency) range,
      String Function(Money money) label,
    ) async {
      final unit = value?.currency ?? currency;
      if (unit == null) {
        return;
      }
      final picked = await editMoney(
        context,
        title: title,
        meaning: meaning,
        currency: unit,
        value: value == null ? null : value.minorUnits ~/ unit.majorUnit,
        range: range(unit),
      );
      if (picked != null) {
        onEdit({
          key: picked,
          'label': label(
            Money(minorUnits: picked * unit.majorUnit, currency: unit),
          ),
        });
      }
    }

    Future<void> editPlace(MapPlace place) async {
      final change = await editTrip(context, place);
      if (change == null) {
        return;
      }
      onEdit(
        change.remove
            ? {
                'removePlace': [place.id],
                'label': 'Remove ${place.name}',
              }
            : {
                'trip': {
                  'place': place.id,
                  'perWeek': change.perWeek,
                  'mode': change.mode.name,
                },
                'label':
                    '${place.name}, ${timesAWeekText(change.perWeek)} '
                    '${byText(change.mode)}',
              },
      );
    }

    final income = household?.grossMonthlyIncome;
    final savings = household?.savings;
    final rent = household?.maxRent;
    String incomeLabel(Money money) => '${moneyText(money)} a month';
    String savingsLabel(Money money) => '${moneyText(money)} saved';
    String rentLabel(Money money) => 'Rent up to ${moneyText(money)}';

    return GeneratedFrame(
      label: 'Read from your words by Gemini',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.xs,
        children: [
          _Slot(
            icon: Icons.group_rounded,
            title: 'Who',
            chips: [
              if (adults == null)
                _StoryChip(
                  label: 'Who moves',
                  kind: ChipKind.missing,
                  onTap: editAdults,
                )
              else
                _StoryChip(
                  label: '$adults ${adults == 1 ? 'adult' : 'adults'}',
                  kind: assumed.contains(ProfileAssumption.adults)
                      ? ChipKind.assumed
                      : ChipKind.stated,
                  onTap: editAdults,
                ),
              if (children.isNotEmpty)
                _StoryChip(
                  label: _childrenText(children),
                  kind: assumed.contains(ProfileAssumption.children)
                      ? ChipKind.assumed
                      : ChipKind.stated,
                  onTap: () => onTell('Our children are '),
                )
              else if (assumed.contains(ProfileAssumption.children) ||
                  adults != null)
                _StoryChip(
                  label: 'No children',
                  kind: assumed.contains(ProfileAssumption.children)
                      ? ChipKind.assumed
                      : ChipKind.stated,
                  onTap: () => onTell('We have children aged '),
                ),
            ],
          ),
          _Slot(
            icon: Icons.account_balance_wallet_rounded,
            title: 'Money',
            chips: homes.renting
                ? [
                    _StoryChip(
                      label: rent == null
                          ? 'The rent you can pay'
                          : rentLabel(rent),
                      kind: rent == null ? ChipKind.missing : ChipKind.stated,
                      onTap: () => editAmount(
                        'maxRent',
                        'The most rent a month',
                        'Together, for the whole home.',
                        rent,
                        rentRange,
                        rentLabel,
                      ),
                    ),
                  ]
                : [
                    _StoryChip(
                      label: income == null
                          ? 'What you earn'
                          : incomeLabel(income),
                      kind: income == null ? ChipKind.missing : ChipKind.stated,
                      onTap: () => editAmount(
                        'grossMonthlyIncome',
                        'What you earn',
                        'A month before tax, together.',
                        income,
                        incomeRange,
                        incomeLabel,
                      ),
                    ),
                    _StoryChip(
                      label: savings == null
                          ? "What you've saved"
                          : savingsLabel(savings),
                      kind: savings == null
                          ? ChipKind.missing
                          : ChipKind.stated,
                      onTap: () => editAmount(
                        'savings',
                        "What you've saved",
                        'For the down payment and the costs on the day.',
                        savings,
                        savingsRange,
                        savingsLabel,
                      ),
                    ),
                    if (homes.highestPrice case final highest?)
                      _StoryChip(
                        label: 'Up to ${moneyText(highest)}',
                        kind: ChipKind.worked,
                      ),
                  ],
          ),
          _Slot(
            icon: Icons.route_rounded,
            title: 'Week',
            chips: [
              for (final place in homes.places)
                _StoryChip(
                  label: '${place.name} · ${place.perWeek}×',
                  icon: modeIcon(place.mode),
                  kind: place.assumed ? ChipKind.assumed : ChipKind.stated,
                  onTap: () => editPlace(place),
                ),
              _StoryChip(
                label: homes.places.isEmpty
                    ? 'A place you go each week'
                    : 'A place',
                kind: homes.places.isEmpty ? ChipKind.missing : ChipKind.add,
                onTap: () => onTell('Every week we also go to '),
              ),
            ],
          ),
          _Slot(
            icon: Icons.checklist_rounded,
            title: 'Must-haves',
            hint: 'Tap to narrow',
            body: mustHaves,
          ),
        ],
      ),
    );
  }

  static String _childrenText(List<int> ages) {
    final count = ages.length == 1 ? '1 child' : '${ages.length} children';
    final sorted = [...ages]..sort();
    final aged = switch (sorted.length) {
      1 => '${sorted.single}',
      _ => '${sorted.take(sorted.length - 1).join(', ')} and ${sorted.last}',
    };
    return '$count, $aged';
  }
}

class _Slot extends StatelessWidget {
  const _Slot({
    required this.icon,
    required this.title,
    this.chips = const [],
    this.body,
    this.hint,
  });

  final IconData icon;
  final String title;
  final List<_StoryChip> chips;
  final Widget? body;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final missing = chips.where((chip) => chip.kind == ChipKind.missing);
    final assumed = chips.where((chip) => chip.kind == ChipKind.assumed);
    final (status, tone) = switch ((missing.length, assumed.length)) {
      (final count, _) when count > 0 => ('$count missing', colors.alert),
      (_, final count) when count > 0 => (
        '$count assumed',
        colors.textTertiary,
      ),
      _ => (hint ?? '', colors.textTertiary),
    };
    return AnimatedContainer(
      duration: AppMotion.of(context, AppMotion.surface),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.sm,
        AppSpacing.xs + 2,
        AppSpacing.sm,
        AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.xs,
        children: [
          Row(
            spacing: AppSpacing.xs,
            children: [
              Icon(icon, size: 16, color: colors.textSecondary),
              Text(
                title,
                style: styles.label.copyWith(color: colors.textSecondary),
              ),
              const Spacer(),
              Text(status, style: styles.caption.copyWith(color: tone)),
            ],
          ),
          if (body case final body?)
            body
          else
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: chips,
            ),
        ],
      ),
    );
  }
}

class _StoryChip extends StatelessWidget {
  const _StoryChip({
    required this.label,
    required this.kind,
    this.icon,
    this.onTap,
  });

  final String label;
  final ChipKind kind;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final (fill, ink, border) = switch (kind) {
      ChipKind.stated => (
        colors.surfaceMuted,
        colors.text,
        colors.surfaceMuted,
      ),
      ChipKind.assumed => (colors.surface, colors.text, colors.textTertiary),
      ChipKind.missing => (colors.surface, colors.alert, colors.alert),
      ChipKind.add => (colors.surface, colors.accent, colors.border),
      ChipKind.worked => (colors.accentSoft, colors.accent, colors.accentSoft),
    };
    final leading = switch (kind) {
      ChipKind.missing || ChipKind.add => Icons.add_rounded,
      _ => icon,
    };
    final chip = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs - 2,
      ),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.xxs + 1,
        children: [
          if (leading != null) Icon(leading, size: 15, color: ink),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: styles.label.copyWith(color: ink),
            ),
          ),
          if (kind == ChipKind.assumed)
            Text(
              'assumed',
              style: styles.caption.copyWith(color: colors.textTertiary),
            ),
        ],
      ),
    );
    final onTap = this.onTap;
    return onTap == null
        ? chip
        : AppPressable(
            label: switch (kind) {
              ChipKind.missing || ChipKind.add => 'Add $label',
              _ => 'Change $label',
            },
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppRadii.pill),
            child: chip,
          );
  }
}

class _StorySkeleton extends StatelessWidget {
  const _StorySkeleton();

  @override
  Widget build(BuildContext context) => AppShimmer(
    child: Column(
      spacing: AppSpacing.xs,
      children: [
        for (final widths in const [
          [90.0, 110.0],
          [170.0, 140.0],
          [150.0],
          [130.0, 120.0],
        ])
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.of(context).border),
              borderRadius: BorderRadius.circular(AppRadii.lg),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.xs,
              children: [
                const AppSkeleton(width: 70, height: 12),
                Wrap(
                  spacing: AppSpacing.xs,
                  children: [
                    for (final width in widths)
                      AppSkeleton(
                        width: width,
                        height: 30,
                        radius: AppRadii.pill,
                      ),
                  ],
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
