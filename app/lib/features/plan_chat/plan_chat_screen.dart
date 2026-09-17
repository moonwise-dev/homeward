import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui/app_sizes.dart';
import '../../ui/app_spacing.dart';
import 'plan_chat_controller.dart';
import 'widgets/chat_composer.dart';
import 'widgets/starter_prompts.dart';
import 'widgets/transcript_view.dart';

class PlanChatScreen extends ConsumerWidget {
  const PlanChatScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = planChatControllerProvider(sessionId);
    final state = ref.watch(provider);
    final controller = ref.read(provider.notifier);
    final entries = state.conversation.entries;
    return Scaffold(
      appBar: AppBar(title: const Text('Plan')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSizes.contentWidth,
            ),
            child: Column(
              children: [
                Expanded(
                  child: entries.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: StarterPrompts(onSelected: controller.send),
                          ),
                        )
                      : TranscriptView(
                          sessionId: sessionId,
                          entries: entries,
                          onRetry: controller.retry,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: ChatComposer(
                    draft: state.draft,
                    isRunning: state.conversation.isRunning,
                    onChanged: controller.updateDraft,
                    onSend: controller.send,
                    onStop: controller.stop,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
