import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/motion.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../sample_prices.dart';

class TradeOffView extends HookWidget {
  const TradeOffView({required this.options, required this.onPick, super.key});

  final List<AreaOption> options;
  final ValueChanged<AreaOption> onPick;

  @override
  Widget build(BuildContext context) {
    final picked = useState<String?>(null);
    Widget card(AreaOption option, {bool fillsHeight = false}) => _OptionCard(
      option: option,
      fillsHeight: fillsHeight,
      isPicked: picked.value == option.id,
      isDimmed: picked.value != null && picked.value != option.id,
      onPick: picked.value == null
          ? () {
              picked.value = option.id;
              onPick(option);
            }
          : null,
    );
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth >= 560
          ? IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final (index, option) in options.indexed) ...[
                    if (index > 0) const SizedBox(width: AppSpacing.sm),
                    Expanded(child: card(option, fillsHeight: true)),
                  ],
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final (index, option) in options.indexed) ...[
                  if (index > 0) const SizedBox(height: AppSpacing.sm),
                  card(option),
                ],
              ],
            ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.option,
    required this.isPicked,
    required this.isDimmed,
    this.fillsHeight = false,
    this.onPick,
  });

  final AreaOption option;
  final bool fillsHeight;
  final bool isPicked;
  final bool isDimmed;
  final VoidCallback? onPick;

  @override
  Widget build(BuildContext context) {
    final minutes = option.minutes;
    return AnimatedOpacity(
      opacity: isDimmed ? 0.45 : 1,
      duration: AppMotion.of(context, AppMotion.surface),
      child: AnimatedContainer(
        duration: AppMotion.of(context, AppMotion.surface),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isPicked ? AppColors.accentSoft : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadii.md),
          border: Border.all(
            color: isPicked ? AppColors.accent : AppColors.border,
            width: isPicked ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(option.areaName, style: AppTextStyles.title),
            const SizedBox(height: AppSpacing.xxs),
            Text(option.character, style: AppTextStyles.caption),
            const SizedBox(height: AppSpacing.sm),
            Text(
              homeLine(option.homeType, option.rooms, option.sizeM2),
              style: AppTextStyles.label,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              'About ${formatSampleMoney(option.price)}',
              style: AppTextStyles.figure,
            ),
            if (minutes != null && option.anchorLabel != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xxs),
                child: Row(
                  children: [
                    const Icon(
                      Icons.route_outlined,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: AppSpacing.xxs),
                    Flexible(
                      child: Text(
                        '$minutes min ${option.mode?.phrase ?? ''} to '
                        '${option.anchorLabel}',
                        style: AppTextStyles.label,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${perSquareMetre(option.pricePerM2)} in ${option.areaName} · '
              '${option.priceSource}',
              style: AppTextStyles.caption,
            ),
            if (fillsHeight) const Spacer(),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: isPicked ? 'Picked' : 'This one',
              icon: isPicked ? Icons.check : null,
              variant: isPicked
                  ? AppButtonVariant.filled
                  : AppButtonVariant.outlined,
              fullWidth: true,
              onPressed: onPick ?? (isPicked ? () {} : null),
            ),
          ],
        ),
      ),
    );
  }
}
