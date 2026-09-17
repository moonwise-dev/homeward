import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../display/relative_time.dart';
import '../../navigation/app_routes.dart';
import '../../ui/app_button.dart';
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
            onPressed: controller.create,
          ),
          const SizedBox(height: AppSpacing.lg),
          if (state.plans.isEmpty)
            Text(
              'Plans you start appear here until you close the app.',
              style: AppTextStyles.caption,
            ),
          for (final plan in state.plans)
            PlanTile(
              title: plan.title ?? 'New plan',
              subtitle: relativeTime(plan.lastActivityAt, now),
            ),
        ],
      ),
    );
  }
}
