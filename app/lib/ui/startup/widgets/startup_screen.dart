import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/gemini_key_repository.dart';
import '../../../domain/models/app_error.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_loading_indicator.dart';
import '../view_model/new_plan.dart';

class StartupScreen extends ConsumerWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = AppTextStyles.of(context);
    final geminiKey = ref.watch(geminiKeyProvider);
    final plan = geminiKey.value == null ? null : ref.watch(newPlanProvider);
    if (plan != null) {
      ref.listen(newPlanProvider, (_, plan) {
        if (plan.value case final sessionId?) {
          context.go(AppRoutes.planOf(sessionId));
        }
      });
    }
    final error = geminiKey.error ?? plan?.error;
    return Scaffold(
      body: Center(
        child: error == null
            ? const AppLoadingIndicator()
            : Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppError.fromException(error).humanMessage,
                      style: styles.body,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppButton(
                      label: 'Try again',
                      onPressed: () => ref
                        ..invalidate(geminiKeyProvider)
                        ..invalidate(newPlanProvider),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
