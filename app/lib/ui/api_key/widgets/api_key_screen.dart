import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/environment.dart';
import '../../../routing/router.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_page.dart';
import '../../core/ui/app_text_field.dart';
import '../view_model/api_key_view_model.dart';
import 'key_disclosure.dart';

class ApiKeyScreen extends HookConsumerWidget {
  const ApiKeyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = AppTextStyles.of(context);
    final state = ref.watch(apiKeyViewModelProvider);
    final viewModel = ref.read(apiKeyViewModelProvider.notifier);
    final isHidden = useState(true);

    Future<void> submit() async {
      if (await viewModel.verifyAndSave() && context.mounted) {
        context.go(AppRoutes.resuming(ref.read(openPlanProvider)));
      }
    }

    return AppPage(
      title: 'Your Gemini key',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Homeward runs on your own Gemini API key. You can create one for '
            'free in Google AI Studio.',
            style: styles.body,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton(
              label: 'Create a key in Google AI Studio',
              icon: Icons.open_in_new,
              variant: AppButtonVariant.text,
              onPressed: () => launchUrl(Uri.parse(kGeminiKeyUrl)),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: 'Gemini API key',
            value: state.key,
            onChanged: viewModel.updateKey,
            errorText: state.errorText,
            obscureText: isHidden.value,
            enabled: !state.isVerifying,
            autofillHints: const [AutofillHints.password],
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => submit(),
            suffix: IconButton(
              tooltip: isHidden.value ? 'Show key' : 'Hide key',
              icon: Icon(
                isHidden.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: () => isHidden.value = !isHidden.value,
            ),
          ),
          if (state.canForget)
            CheckboxListTile(
              value: state.remember,
              onChanged: (value) => viewModel.updateRemember(value ?? false),
              title: Text('Remember on this device', style: styles.body),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Verify and continue',
            isLoading: state.isVerifying,
            fullWidth: true,
            onPressed: submit,
          ),
          if (state.hasSavedKey) ...[
            const SizedBox(height: AppSpacing.xs),
            AppButton(
              label: 'Remove saved key',
              variant: AppButtonVariant.text,
              fullWidth: true,
              onPressed: viewModel.removeKey,
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          const KeyDisclosure(),
        ],
      ),
    );
  }
}
