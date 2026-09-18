import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../display/relative_time.dart';
import '../../navigation/app_routes.dart';
import '../../ui/app_button.dart';
import '../../ui/app_loading_indicator.dart';
import '../../ui/app_page.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_text_styles.dart';
import 'plans_controller.dart';
import 'widgets/plan_tile.dart';

class PlansScreen extends ConsumerWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(plansControllerProvider);
    final controller = ref.read(plansControllerProvider.notifier);
    final now = DateTime.now();
    return AppPage(
      title: 'Plans',
      actions: [
        IconButton(
          tooltip: 'Catalog gallery',
          icon: const Icon(Icons.widgets_outlined),
          onPressed: () => context.push(AppRoutes.gallery),
        ),
        IconButton(
          tooltip: 'Gemini key',
          icon: const Icon(Icons.key_outlined),
          onPressed: () => context.push(AppRoutes.geminiKey),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppButton(
            label: 'New plan',
            icon: Icons.add,
            isLoading: state.isCreating,
            fullWidth: true,
            onPressed: () async {
              if (await controller.create() case final plan?
                  when context.mounted) {
                await context.push(AppRoutes.planOf(plan.id));
              }
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          if (state.plans.isEmpty)
            if (state.isLoading)
              const Center(child: AppLoadingIndicator())
            else
              Text(
                'Plans you start appear here.',
                style: AppTextStyles.caption,
              ),
          for (final plan in state.plans)
            PlanTile(
              title: plan.title ?? 'New plan',
              subtitle: [
                ?plan.marketName,
                relativeTime(plan.lastActivityAt, now),
              ].join(' · '),
              onTap: () => context.push(AppRoutes.planOf(plan.id)),
            ),
        ],
      ),
    );
  }
}
