import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui/app_sizes.dart';
import '../../ui/app_spacing.dart';
import '../plan_board/plan_board_pane.dart';
import '../wire_inspector/wire_inspector_pane.dart';
import 'plan_chat_controller.dart';
import 'widgets/chat_composer.dart';
import 'widgets/starter_prompts.dart';
import 'widgets/transcript_view.dart';

class PlanChatScreen extends HookConsumerWidget {
  const PlanChatScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = planChatControllerProvider(sessionId);
    final state = ref.watch(provider);
    final controller = ref.read(provider.notifier);
    final entries = state.conversation.entries;
    final hasBoard = state.conversation.hasBoard;
    final isWide = MediaQuery.sizeOf(context).width >= AppSizes.twoPane;
    final showsWire = useState(false);
    final pane = switch ((isWide, showsWire.value, hasBoard)) {
      (true, true, _) => WireInspectorPane(sessionId: sessionId),
      (true, false, true) => PlanBoardPane(sessionId: sessionId),
      _ => null,
    };
    final chat = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
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
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_vert_outlined),
            tooltip: 'Wire inspector',
            isSelected: pane is WireInspectorPane,
            onPressed: () => isWide
                ? showsWire.value = !showsWire.value
                : showWireInspectorSheet(context, sessionId),
          ),
          if (hasBoard && pane is! PlanBoardPane)
            IconButton(
              icon: const Icon(Icons.dashboard_outlined),
              tooltip: 'Your plan',
              onPressed: () => isWide
                  ? showsWire.value = false
                  : showPlanBoardSheet(context, sessionId),
            ),
        ],
      ),
      body: SafeArea(
        child: pane == null
            ? chat
            : Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: chat),
                  const VerticalDivider(width: 1),
                  SizedBox(width: AppSizes.boardPane, child: pane),
                ],
              ),
      ),
    );
  }
}
