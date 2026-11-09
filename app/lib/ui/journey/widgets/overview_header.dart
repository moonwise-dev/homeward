import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../catalog/bindings/binding_parsers.dart';
import '../../../catalog/money_text.dart';
import '../../../data/repositories/agent_repository.dart';
import '../../../data/repositories/renderer_surfaces.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_stat_tiles.dart';

class OverviewHeader extends HookConsumerWidget {
  const OverviewHeader({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agent = ref.watch(agentRepositoryProvider);
    final surface = useValueListenable<RendererSurface?>(
      useMemoized(
        () => agent.surface(sessionId, planSurfaceId),
        [sessionId],
      ),
    );
    final data = useState<Object?>(null);
    useEffect(
      () => surface?.dataModel
          .watch<Object?>('/')
          .subscribe((value) => data.value = value),
      [surface],
    );
    final slices = switch (data.value) {
      final Map<String, Object?> slices => slices,
      _ => const <String, Object?>{},
    };
    final affordability = jsonModelOf(
      slices['affordability'],
      AffordabilitySlice.fromJson,
    );
    final rent = jsonModelOf(slices['rentSplit'], RentSplitSlice.fromJson);
    if (affordability == null && rent == null) {
      return const SizedBox.shrink();
    }
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.sm,
        children: [
          Text(
            'Your numbers',
            style: styles.label.copyWith(color: colors.textSecondary),
          ),
          if (affordability != null)
            AppStatTiles(
              stats: _affordabilityStats(affordability),
              filled: false,
            ),
          if (rent != null)
            AppStatTiles(stats: _rentStats(rent), filled: false),
          Text(
            affordability != null
                ? 'Worked out with sample rules and rates for '
                      '${affordability.marketName}. An estimate, not advice.'
                : 'Rents are estimates from the area median. Not advice.',
            style: styles.caption.copyWith(color: colors.textTertiary),
          ),
        ],
      ),
    );
  }

  List<AppStat> _affordabilityStats(AffordabilitySlice slice) => [
    appStat('You can borrow', moneyText(slice.maxLoan)),
    if (slice.maxPrice case final maxPrice?)
      appStat('Highest price', moneyText(maxPrice)),
    if (slice.savings case final savings?)
      appStat('Your savings', moneyText(savings)),
    appStat(
      'A month at ${percentText(slice.annualRate)}',
      moneyText(slice.monthly.total),
    ),
  ];

  List<AppStat> _rentStats(RentSplitSlice slice) => [
    appStat('Rent a month', moneyText(slice.rent.monthly)),
    appStat('Sharing', '${slice.people.length} people'),
    if (slice.homeName case final home?) appStat('The flat', home),
  ];
}
