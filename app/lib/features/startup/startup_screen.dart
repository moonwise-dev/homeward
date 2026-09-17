import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/providers/app_session_providers.dart';
import '../../data/providers/gemini_key_providers.dart';
import '../../errors/app_error.dart';
import '../../ui/app_button.dart';
import '../../ui/app_loading_indicator.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_text_styles.dart';

class StartupScreen extends ConsumerWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      style: AppTextStyles.body,
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
