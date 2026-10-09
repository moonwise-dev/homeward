import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/router.dart';
import '../../../routing/routes.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../wire_inspector/widgets/wire_inspector_pane.dart';
import '../view_model/journey_view_model.dart';
import 'action_label.dart';
import 'appearance_button.dart';
import 'conversation_thread.dart';
import 'plan_panel.dart';
import 'starter_prompts.dart';
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
    final planFocus = useValueNotifier<String?>(null);
    ref.listen(provider, (previous, next) {
      final finished =
          (previous?.conversation.isRunning ?? false) &&
          !next.conversation.isRunning;
      if (finished && isWide && next.latestChanges.isNotEmpty) {
        planFocus.value = next.sectionToShow;
      }
    });
    void showOnPlan(String sectionId) => planFocus.value = sectionId;

    useEffect(() {
      Future.microtask(
        () => ref.read(openPlanProvider.notifier).open(sessionId),
      );
      return null;
    }, [sessionId]);

    final talk = Column(
      children: [
        Expanded(
          child: state.sections.isEmpty && state.pending == null
              ? _EmptyJourney(onStart: viewModel.start)
              : ConversationThread(
                  sessionId: sessionId,
                  sections: state.sections,
                  pending: state.pending,
                  pendingPrompt: promptText(state.pendingPrompt),
                  onRetry: viewModel.retry,
                  onStop: viewModel.stop,
                  onShowOnPlan: showOnPlan,
                  plan: isWide || !state.hasPlan
                      ? null
                      : InlinePlan(
                          sessionId: sessionId,
                          isRunning: conversation.isRunning,
                          changes: state.latestChanges,
                          focus: planFocus,
                        ),
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
        changes: state.latestChanges,
        focus: planFocus,
      ),
    );
    final actions = [
      IconButton(
        icon: const Icon(Icons.restart_alt),
        tooltip: 'Start over',
        onPressed: viewModel.startOver,
      ),
      IconButton(
        icon: const Icon(Icons.widgets_outlined),
        tooltip: 'Catalog gallery',
        onPressed: () => context.push(AppRoutes.gallery),
      ),
      IconButton(
        icon: const Icon(Icons.swap_vert_outlined),
        tooltip: 'Wire inspector',
        isSelected: wirePane,
        onPressed: () => isWide
            ? showsWire.value = !showsWire.value
            : showWireInspectorSheet(context, sessionId),
      ),
      IconButton(
        icon: const Icon(Icons.key_outlined),
        tooltip: 'Gemini key',
        onPressed: () => context.push(AppRoutes.geminiKey),
      ),
      const AppearanceButton(),
    ];

    if (isWide) {
      return Scaffold(
        appBar: AppBar(title: const Text('Homeward'), actions: actions),
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
    return Scaffold(
      appBar: AppBar(title: const Text('Homeward'), actions: actions),
      body: SafeArea(child: talk),
    );
  }
}

class _EmptyJourney extends StatelessWidget {
  const _EmptyJourney({required this.onStart});

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
