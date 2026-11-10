import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../view_model/journey_view_model.dart';
import 'tell_more_field.dart';

Future<void> showAskSheet(
  BuildContext context,
  String sessionId, {
  String? draft,
}) {
  if (draft != null) {
    ProviderScope.containerOf(
      context,
      listen: false,
    ).read(journeyViewModelProvider(sessionId).notifier).updateDraft(draft);
  }
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.of(context).surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
    ),
    builder: (context) => _AskSheet(sessionId: sessionId),
  );
}

class _AskSheet extends ConsumerWidget {
  const _AskSheet({required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = AppTextStyles.of(context);
    final colors = AppColors.of(context);
    final provider = journeyViewModelProvider(sessionId);
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpacing.xs,
            children: [
              Text('Tell Homeward', style: styles.title),
              Text(
                'A correction, or more of your story.',
                style: styles.body.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.sm),
              TellMoreField(
                draft: state.draft,
                isRunning: state.conversation.isRunning,
                autofocus: true,
                onChanged: viewModel.updateDraft,
                onSend: () {
                  Navigator.of(context).pop();
                  viewModel.send();
                },
                onStop: viewModel.stop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
