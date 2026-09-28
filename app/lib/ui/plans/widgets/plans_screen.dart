import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/repositories/appearance_repository.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_loading_indicator.dart';
import '../../core/ui/app_page.dart';
import '../view_model/plans_view_model.dart';

class PlansScreen extends ConsumerWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = AppTextStyles.of(context);
    final state = ref.watch(plansViewModelProvider);
    final viewModel = ref.read(plansViewModelProvider.notifier);
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
        const _AppearanceButton(),
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
              if (await viewModel.create() case final plan?
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
                style: styles.caption,
              ),
          for (final plan in state.plans)
            _PlanTile(
              title: plan.title ?? 'New plan',
              subtitle: _relativeTime(plan.lastActivityAt, now),
              onTap: () => context.push(AppRoutes.planOf(plan.id)),
            ),
        ],
      ),
    );
  }
}

class _PlanTile extends StatelessWidget {
  const _PlanTile({
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: styles.body),
      subtitle: Text(subtitle, style: styles.caption),
      trailing: onTap == null ? null : const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

String _relativeTime(DateTime at, DateTime now) {
  final elapsed = now.difference(at);
  return switch (elapsed) {
    Duration(inMinutes: < 1) => 'Just now',
    Duration(inHours: < 1, :final inMinutes) => '$inMinutes min ago',
    Duration(inDays: < 1, :final inHours) => '$inHours h ago',
    _ => DateFormat.MMMd().format(at),
  };
}

class _AppearanceButton extends ConsumerWidget {
  const _AppearanceButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosen = ref.watch(appearanceProvider).value ?? ThemeMode.system;
    return PopupMenuButton<ThemeMode>(
      tooltip: 'Appearance',
      icon: const Icon(Icons.contrast),
      onSelected: ref.read(appearanceProvider.notifier).choose,
      itemBuilder: (context) => [
        for (final mode in ThemeMode.values)
          CheckedPopupMenuItem(
            value: mode,
            checked: mode == chosen,
            child: Text(switch (mode) {
              ThemeMode.system => 'Match the device',
              ThemeMode.light => 'Light',
              ThemeMode.dark => 'Dark',
            }),
          ),
      ],
    );
  }
}
