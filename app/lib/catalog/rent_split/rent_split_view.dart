import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';
import '../rent_text.dart';

class RentSplitView extends HookWidget {
  const RentSplitView({required this.slice, this.onChoose, super.key});

  final RentSplitSlice slice;
  final ValueChanged<SplitRule>? onChoose;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final splits = slice.splits;
    final shown = useState(slice.chosen ?? splits.first.rule);
    final sent = useState<SplitRule?>(null);
    useEffect(() {
      shown.value = slice.chosen ?? splits.first.rule;
      sent.value = null;
      return null;
    }, [slice]);
    final split = splits.firstWhere(
      (split) => split.rule == shown.value,
      orElse: () => splits.first,
    );
    final rules = [for (final split in splits) split.rule];
    final bills = slice.bills;
    final taken = split.rule == slice.chosen || split.rule == sent.value;
    final onChoose = this.onChoose;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Splitting the rent', style: styles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          [
            ?slice.homeName,
            '${moneyText(slice.rent.monthly)} a month'
                '${bills == null ? '' : ', and ${moneyText(bills)} in bills'}',
          ].join(': '),
          style: styles.body,
        ),
        Text(rentBasisText(slice.rent), style: styles.caption),
        const SizedBox(height: AppSpacing.sm),
        if (rules.length > 1)
          SegmentedButton<SplitRule>(
            segments: [
              for (final rule in rules)
                ButtonSegment(value: rule, label: Text(splitRuleLabel(rule))),
            ],
            selected: {split.rule},
            showSelectedIcon: false,
            onSelectionChanged: (selected) => shown.value = selected.first,
          ),
        const SizedBox(height: AppSpacing.xs),
        Text(_how(split.rule, slice), style: styles.caption),
        const SizedBox(height: AppSpacing.xs),
        for (final share in split.shares) _Share(share: share),
        AppFigureRow(
          label: 'Together',
          figure: moneyText(slice.total, exact: true),
          isTotal: true,
        ),
        for (final missing in _missing(rules))
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(missing, style: styles.caption),
          ),
        if (onChoose != null) ...[
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: taken
                ? 'Your split'
                : 'Split ${splitRuleLabel(split.rule).toLowerCase()}',
            variant: AppButtonVariant.outlined,
            onPressed: taken || sent.value != null
                ? null
                : () {
                    sent.value = split.rule;
                    onChoose(split.rule);
                  },
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        Text('An estimate, not advice.', style: styles.caption),
      ],
    );
  }

  static String _how(SplitRule rule, RentSplitSlice slice) {
    final rooms = slice.people.fold(
      0,
      (sum, person) => sum + (person.roomM2 ?? 0),
    );
    final shared = switch (slice.homeM2) {
      final size? when size > rooms => size - rooms,
      _ => null,
    };
    return switch (rule) {
      SplitRule.equal => 'Everyone pays the same.',
      SplitRule.income =>
        'Each pays in proportion to their income, rent and bills alike.',
      SplitRule.room =>
        "Rent follows each room's size${shared == null ? '' : ', with the shared $shared m² split equally'}; "
            'bills are split equally.',
    };
  }

  static List<String> _missing(List<SplitRule> rules) => [
    if (!rules.contains(SplitRule.income))
      "Give each person's income to split by income.",
    if (!rules.contains(SplitRule.room))
      "Give each person's room size to split by room.",
  ];
}

class _Share extends StatelessWidget {
  const _Share({required this.share});

  final PersonShare share;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final bills = share.bills;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppFigureRow(
            label: share.label,
            figure: '${moneyText(share.total, exact: true)} a month',
          ),
          if (bills != null)
            Text(
              'Rent ${moneyText(share.rent, exact: true)}, bills '
              '${moneyText(bills, exact: true)}',
              style: styles.caption.copyWith(
                color: colors.textSecondary,
              ),
            ),
        ],
      ),
    );
  }
}
