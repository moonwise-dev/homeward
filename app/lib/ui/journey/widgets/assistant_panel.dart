import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../view_model/journey_view_model.dart';
import 'action_label.dart';
import 'conversation_thread.dart';
import 'starter_prompts.dart';
import 'tell_more_field.dart';

class AssistantPanel extends StatelessWidget {
  const AssistantPanel({
    required this.sessionId,
    required this.state,
    required this.viewModel,
    required this.onShowOnPlan,
    super.key,
  });

  final String sessionId;
  final JourneyState state;
  final JourneyViewModel viewModel;
  final ValueChanged<String> onShowOnPlan;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: state.sections.isEmpty && state.pending == null
            ? _Welcome(onStart: viewModel.start)
            : ConversationThread(
                sessionId: sessionId,
                sections: state.sections,
                pending: state.pending,
                pendingPrompt: promptText(state.pendingPrompt),
                onRetry: viewModel.retry,
                onStop: viewModel.stop,
                onShowOnPlan: onShowOnPlan,
              ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: TellMoreField(
              draft: state.draft,
              isRunning: state.conversation.isRunning,
              onChanged: viewModel.updateDraft,
              onSend: viewModel.send,
              onStop: viewModel.stop,
            ),
          ),
        ),
      ),
    ],
  );
}

class _Welcome extends StatelessWidget {
  const _Welcome({required this.onStart});

  final ValueChanged<String> onStart;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpacing.sm,
            children: [
              Text(
                'Tell Homeward about your move and your money.',
                style: styles.title,
                textAlign: TextAlign.center,
              ),
              Text(
                'Or start from one of these',
                style: styles.caption.copyWith(color: colors.textTertiary),
                textAlign: TextAlign.center,
              ),
              StarterPrompts(onSend: onStart),
            ],
          ),
        ),
      ),
    );
  }
}
