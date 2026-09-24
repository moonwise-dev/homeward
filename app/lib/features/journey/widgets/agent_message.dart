import 'package:flutter/material.dart';

import '../../../data/models/agent_turn_status.dart';
import '../../../ui/app_button.dart';
import '../../../ui/app_button_variant.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/app_spacing.dart';
import '../../../ui/app_status_line.dart';
import '../../../ui/app_text_styles.dart';

class AgentMessage extends StatelessWidget {
  const AgentMessage({
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
