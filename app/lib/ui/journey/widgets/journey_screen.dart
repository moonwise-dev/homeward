import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../wire_inspector/widgets/wire_inspector_pane.dart';
import '../view_model/journey_view_model.dart';
import 'conversation_thread.dart';
import 'plan_panel.dart';
import 'tell_more_field.dart';

class JourneyScreen extends HookConsumerWidget {
  const JourneyScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors.of(context);
    final provider = journeyViewModelProvider(sessionId);
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final conversation = state.conversation;
    final isWide = MediaQuery.sizeOf(context).width >= AppSizes.twoPane;
    final showsWire = useState(false);
    final wirePane = isWide && showsWire.value;

    final talk = Column(
      children: [
        Expanded(
          child: state.sections.isEmpty && state.pending == null
              ? const _EmptyJourney()
              : ConversationThread(
                  sessionId: sessionId,
                  sections: state.sections,
                  pending: state.pending,
                  onRetry: viewModel.retry,
                  onStop: viewModel.stop,
                ),
        ),
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
                onChanged: viewModel.updateDraft,
                onSend: viewModel.send,
                onStop: viewModel.stop,
              ),
            ),
          ),
        ),
      ],
    );
    final plan = ColoredBox(
      color: colors.surfaceMuted,
      child: PlanPanel(
        sessionId: sessionId,
        hasPlan: state.hasPlan,
        isRunning: conversation.isRunning,
      ),
    );
    final wireButton = IconButton(
      icon: const Icon(Icons.swap_vert_outlined),
      tooltip: 'Wire inspector',
      isSelected: wirePane,
      onPressed: () => isWide
          ? showsWire.value = !showsWire.value
          : showWireInspectorSheet(context, sessionId),
    );

    if (isWide) {
      return Scaffold(
        appBar: AppBar(title: const Text('Homeward'), actions: [wireButton]),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: talk),
              const VerticalDivider(width: 1),
              Expanded(child: plan),
              if (wirePane) ...[
                const VerticalDivider(width: 1),
                SizedBox(
                  width: AppSizes.sidePane,
                  child: WireInspectorPane(sessionId: sessionId),
                ),
              ],
            ],
          ),
        ),
      );
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homeward'),
          actions: [wireButton],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Conversation'),
              Tab(text: 'Plan'),
            ],
          ),
        ),
        body: SafeArea(child: TabBarView(children: [talk, plan])),
      ),
    );
  }
}

class _EmptyJourney extends StatelessWidget {
  const _EmptyJourney();

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Text(
          'Tell Homeward about your move.',
          style: styles.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
