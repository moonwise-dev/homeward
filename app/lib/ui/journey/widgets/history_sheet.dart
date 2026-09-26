import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_chat_bubble.dart';
import '../../core/ui/app_status_line.dart';
import '../view_model/journey_view_model.dart';
import 'action_label.dart';

Future<void> showHistorySheet(BuildContext context, String sessionId) =>
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.background,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.85,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text('History', style: AppTextStyles.title),
              ),
              Expanded(child: _HistoryView(sessionId: sessionId)),
            ],
          ),
        ),
      ),
    );

class _HistoryView extends ConsumerWidget {
  const _HistoryView({required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = journeyViewModelProvider(sessionId);
    final entries = ref.watch(provider).conversation.entries;
    final viewModel = ref.read(provider.notifier);
    return ListView.separated(
      reverse: true,
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: entries.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.md),
      itemBuilder: (context, index) =>
          switch (entries[entries.length - 1 - index]) {
            BuyerEntry(:final id, :final text) => AppChatBubble(
              key: ValueKey(id),
              text: text,
            ),
            BuyerActionEntry(:final id, :final actionName, :final label) =>
              _BuyerActionNote(
                key: ValueKey(id),
                label: label ?? actionLabel(actionName),
              ),
            AgentEntry(:final id, :final text, :final status, :final error) =>
              _AgentMessage(
                key: ValueKey(id),
                text: text,
                status: status,
                errorText: error?.humanMessage,
                onRetry: () => viewModel.retry(id),
              ),
          },
    );
  }
}

class _AgentMessage extends StatelessWidget {
  const _AgentMessage({
    required this.text,
    required this.status,
    required this.onRetry,
    this.errorText,
    super.key,
  });

  final String text;
  final AgentTurnStatus status;
  final String? errorText;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (text.isNotEmpty) SelectableText(text, style: AppTextStyles.body),
      Padding(
        padding: const EdgeInsets.only(top: AppSpacing.xs),
        child: switch (status) {
          AgentTurnStatus.streaming when text.isEmpty => const AppStatusLine(
            text: 'Thinking',
            isBusy: true,
          ),
          AgentTurnStatus.streaming ||
          AgentTurnStatus.completed => const SizedBox.shrink(),
          AgentTurnStatus.canceled => const AppStatusLine(
            text: 'Stopped',
            icon: Icons.stop_circle_outlined,
          ),
          AgentTurnStatus.failed => Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.xs,
            children: [
              AppStatusLine(
                text: errorText ?? 'This answer failed',
                icon: Icons.error_outline,
                color: AppColors.danger,
              ),
              AppButton(
                label: 'Retry',
                icon: Icons.refresh,
                variant: AppButtonVariant.text,
                onPressed: onRetry,
              ),
            ],
          ),
        },
      ),
    ],
  );
}

class _BuyerActionNote extends StatelessWidget {
  const _BuyerActionNote({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: AppStatusLine(text: label, icon: Icons.check_circle_outline),
  );
}
