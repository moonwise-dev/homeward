import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/gemini_key_repository.dart';
import '../../../domain/models/app_error.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_loading_indicator.dart';
import '../view_model/app_session.dart';

class StartupScreen extends ConsumerWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = AppTextStyles.of(context);
    final session = ref.watch(appSessionProvider);
    final geminiKey = ref.watch(geminiKeyProvider);
    final error = session.error ?? geminiKey.error;
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
                        ..invalidate(appSessionProvider)
                        ..invalidate(geminiKeyProvider),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
