import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../catalog/money_text.dart';
import '../../catalog/travel_text.dart';
import '../core/themes/colors.dart';
import '../core/themes/dimens.dart';
import '../core/themes/text_styles.dart';
import '../core/ui/app_button.dart';
import '../core/ui/app_option.dart';

typedef MoneyRange = ({int least, int most, int step});

MoneyRange incomeRange(Currency currency) => currency.code == 'SEK'
    ? (least: 15000, most: 250000, step: 1000)
    : (least: 1000, most: 20000, step: 100);

MoneyRange savingsRange(Currency currency) => currency.code == 'SEK'
    ? (least: 0, most: 5000000, step: 25000)
    : (least: 0, most: 600000, step: 5000);

MoneyRange rentRange(Currency currency) => currency.code == 'SEK'
    ? (least: 5000, most: 40000, step: 500)
    : (least: 500, most: 5000, step: 50);

typedef TripChange = ({int perWeek, TravelMode mode, bool remove});

Future<T?> _showEditor<T>(BuildContext context, Widget editor) =>
    showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(maxWidth: 520),
      backgroundColor: AppColors.of(context).surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: editor,
      ),
    );

Future<int?> editCount(
  BuildContext context, {
  required String title,
  required int value,
  required int least,
  required int most,
  required String Function(int count) words,
}) => _showEditor(
  context,
  _CountEditor(
    title: title,
    value: value,
    least: least,
    most: most,
    words: words,
  ),
);

Future<int?> editMoney(
  BuildContext context, {
  required String title,
  required String meaning,
  required Currency currency,
  required int? value,
  required MoneyRange range,
}) => _showEditor(
  context,
  _MoneyEditor(
    title: title,
    meaning: meaning,
    currency: currency,
    value: value,
    range: range,
  ),
);

Future<TripChange?> editTrip(BuildContext context, MapPlace place) =>
    _showEditor(context, _TripEditor(place: place));

class _CountEditor extends HookWidget {
  const _CountEditor({
    required this.title,
    required this.value,
    required this.least,
    required this.most,
    required this.words,
  });

  final String title;
  final int value;
  final int least;
  final int most;
  final String Function(int count) words;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final count = useState(value.clamp(least, most));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.md,
      children: [
        Text(title, style: styles.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.lg,
          children: [
            IconButton.outlined(
              tooltip: 'Fewer',
              onPressed: count.value > least ? () => count.value-- : null,
              icon: const Icon(Icons.remove_rounded),
            ),
            SizedBox(
              width: 140,
              child: Text(
                words(count.value),
                textAlign: TextAlign.center,
                style: styles.figureLarge,
              ),
            ),
            IconButton.outlined(
              tooltip: 'More',
              onPressed: count.value < most ? () => count.value++ : null,
              icon: const Icon(Icons.add_rounded),
            ),
          ],
        ),
        AppButton(
          label: 'Update the map',
          icon: Icons.check_rounded,
          fullWidth: true,
          onPressed: () => Navigator.of(context).pop(count.value),
        ),
      ],
    );
  }
}

class _MoneyEditor extends HookWidget {
  const _MoneyEditor({
    required this.title,
    required this.meaning,
    required this.currency,
    required this.value,
    required this.range,
  });

  final String title;
  final String meaning;
  final Currency currency;
  final int? value;
  final MoneyRange range;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final most = value == null || value! <= range.most
        ? range.most
        : ((value! ~/ range.step) + 1) * range.step;
    final start = value ?? (range.least + range.most) ~/ 4;
    final amount = useState(
      ((start / range.step).round() * range.step).clamp(range.least, most),
    );
    Money money(int major) =>
        Money(minorUnits: major * currency.majorUnit, currency: currency);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.sm,
      children: [
        Text(title, style: styles.title),
        Text(meaning, style: styles.body.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.xs),
        Row(
          spacing: AppSpacing.sm,
          children: [
            IconButton.outlined(
              tooltip: 'Less',
              onPressed: amount.value > range.least
                  ? () => amount.value -= range.step
                  : null,
              icon: const Icon(Icons.remove_rounded),
            ),
            Expanded(
              child: Text(
                moneyText(money(amount.value)),
                textAlign: TextAlign.center,
                style: styles.figureLarge,
              ),
            ),
            IconButton.outlined(
              tooltip: 'More',
              onPressed: amount.value < most
                  ? () => amount.value += range.step
                  : null,
              icon: const Icon(Icons.add_rounded),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: colors.accent,
            thumbColor: colors.accent,
            inactiveTrackColor: colors.surfaceMuted,
          ),
          child: Slider(
            min: range.least.toDouble(),
            max: most.toDouble(),
            divisions: (most - range.least) ~/ range.step,
            value: amount.value.toDouble(),
            onChanged: (picked) =>
                amount.value = (picked / range.step).round() * range.step,
          ),
        ),
        AppButton(
          label: 'Update the map',
          icon: Icons.check_rounded,
          fullWidth: true,
          onPressed: () => Navigator.of(context).pop(amount.value),
        ),
      ],
    );
  }
}

class _TripEditor extends HookWidget {
  const _TripEditor({required this.place});

  final MapPlace place;

  static const _times = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final perWeek = useState(place.perWeek.clamp(1, 7));
    final mode = useState(place.mode);
    String modeLabel(TravelMode mode) => switch (mode) {
      TravelMode.transit => 'Transit',
      TravelMode.bike => 'Bike',
      TravelMode.car => 'Car',
      TravelMode.walk => 'On foot',
    };
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.sm,
      children: [
        Text(place.name, style: styles.title),
        Text(
          'How often you go there and back, and how.',
          style: styles.body.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text('Times a week', style: styles.label),
        AppOptionPills(
          labels: [for (final times in _times) '$times×'],
          selected: '${perWeek.value}×',
          onSelect: (picked) =>
              perWeek.value = int.parse(picked.replaceAll('×', '')),
        ),
        Text('How', style: styles.label),
        AppOptionPills(
          labels: [for (final option in TravelMode.values) modeLabel(option)],
          selected: modeLabel(mode.value),
          onSelect: (picked) => mode.value = TravelMode.values.firstWhere(
            (option) => modeLabel(option) == picked,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        AppButton(
          label: 'Update the map',
          icon: modeIcon(mode.value),
          fullWidth: true,
          onPressed: () => Navigator.of(
            context,
          ).pop((perWeek: perWeek.value, mode: mode.value, remove: false)),
        ),
        AppButton(
          label: 'Remove ${place.name}',
          icon: Icons.delete_outline_rounded,
          variant: AppButtonVariant.text,
          fullWidth: true,
          onPressed: () => Navigator.of(
            context,
          ).pop((perWeek: perWeek.value, mode: mode.value, remove: true)),
        ),
      ],
    );
  }
}
