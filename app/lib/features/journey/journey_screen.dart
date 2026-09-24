import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui/app_motion.dart';
import '../../ui/app_sizes.dart';
import '../../ui/app_spacing.dart';
import '../plan_board/plan_board_pane.dart';
import '../wire_inspector/wire_inspector_pane.dart';
import 'journey_controller.dart';
import 'journey_side.dart';
import 'widgets/history_view.dart';
import 'widgets/journey_page_view.dart';
import 'widgets/opening_page.dart';
import 'widgets/step_pager.dart';
import 'widgets/tell_more_field.dart';
import 'widgets/turn_overlay.dart';

class JourneyScreen extends HookConsumerWidget {
  const JourneyScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = journeyControllerProvider(sessionId);
    final state = ref.watch(provider);
    final controller = ref.read(provider.notifier);
    final conversation = state.conversation;
    final pages = state.pages;
    final isWide = MediaQuery.sizeOf(context).width >= AppSizes.twoPane;
    final side = useState<JourneySide?>(null);
    final pane = isWide ? side.value : null;

    void toggle(JourneySide target, Future<void> Function() sheet) =>
        isWide ? side.value = side.value == target ? null : target : sheet();

    final current = pages.isEmpty
        ? OpeningPage(
            key: const ValueKey('opening'),
            reason: state.reason,
            ownReason: state.ownReason,
            story: state.story,
            canStart: state.canStart,
            onReason: controller.pickReason,
            onOwnReason: controller.updateOwnReason,
            onStory: controller.updateStory,
            onExample: controller.useExample,
            onStart: controller.start,
          )
        : JourneyPageView(
            key: ValueKey(pages[state.page].id),
            sessionId: sessionId,
            entry: pages[state.page],
            onRetry: () => controller.retry(pages[state.page].id),
          );
    final journey = Column(
      children: [
        if (pages.length > 1)
          StepPager(
            page: state.page,
            count: pages.length,
            onChanged: controller.showPage,
          ),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: AppMotion.of(context, AppMotion.page),
                  switchInCurve: AppMotion.curve,
                  layoutBuilder: (current, previous) => Stack(
                    alignment: Alignment.topCenter,
                    children: [...previous, ?current],
                  ),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween(
                        begin: const Offset(0, 0.03),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: current,
                ),
              ),
              if (state.pending case final pending?)
                Positioned.fill(
                  child: TurnOverlay(entry: pending, onStop: controller.stop),
                ),
            ],
          ),
        ),
        if (pages.isNotEmpty)
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.contentWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: TellMoreField(
                  draft: state.draft,
                  isRunning: conversation.isRunning,
                  onChanged: controller.updateDraft,
                  onSend: controller.send,
                  onStop: controller.stop,
                ),
              ),
            ),
          ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homeward'),
        actions: [
          if (conversation.entries.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.history),
              tooltip: 'History',
              onPressed: () => showHistorySheet(context, sessionId),
            ),
          if (conversation.hasBoard)
            IconButton(
              icon: const Icon(Icons.dashboard_outlined),
              tooltip: 'Your plan',
              isSelected: pane == JourneySide.board,
              onPressed: () => toggle(
                JourneySide.board,
                () => showPlanBoardSheet(context, sessionId),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.swap_vert_outlined),
            tooltip: 'Wire inspector',
            isSelected: pane == JourneySide.wire,
            onPressed: () => toggle(
              JourneySide.wire,
              () => showWireInspectorSheet(context, sessionId),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: switch (pane) {
          null => journey,
          final side => Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: journey),
              const VerticalDivider(width: 1),
              SizedBox(
                width: AppSizes.boardPane,
                child: switch (side) {
                  JourneySide.board => PlanBoardPane(sessionId: sessionId),
                  JourneySide.wire => WireInspectorPane(sessionId: sessionId),
                },
              ),
            ],
          ),
        },
      ),
    );
  }
}
