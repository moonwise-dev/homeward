import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/themes/dimens.dart';
import '../../core/themes/motion.dart';
import '../../core/themes/text_styles.dart';
import '../../wire_inspector/widgets/wire_inspector_pane.dart';
import '../view_model/journey_view_model.dart';
import 'history_sheet.dart';
import 'journey_story.dart';
import 'tell_more_field.dart';
import 'turn_overlay.dart';

class JourneyScreen extends HookConsumerWidget {
  const JourneyScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = journeyViewModelProvider(sessionId);
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final conversation = state.conversation;
    final sections = state.sections;
    final isWide = MediaQuery.sizeOf(context).width >= AppSizes.twoPane;
    final showsWire = useState(false);
    final wirePane = isWide && showsWire.value;

    final current = sections.isEmpty
        ? const _EmptyJourney(key: ValueKey('empty'))
        : JourneyStory(
            key: const ValueKey('story'),
            sessionId: sessionId,
            sections: sections,
            pending: state.pending,
            onRetry: viewModel.retry,
            onStop: viewModel.stop,
          );
    final journey = Column(
      children: [
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
              if (sections.isEmpty)
                if (state.pending case final pending?)
                  Positioned.fill(
                    child: TurnOverlay(entry: pending, onStop: viewModel.stop),
                  ),
            ],
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
          IconButton(
            icon: const Icon(Icons.swap_vert_outlined),
            tooltip: 'Wire inspector',
            isSelected: wirePane,
            onPressed: () => isWide
                ? showsWire.value = !showsWire.value
                : showWireInspectorSheet(context, sessionId),
          ),
        ],
      ),
      body: SafeArea(
        child: wirePane
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: journey),
                  const VerticalDivider(width: 1),
                  SizedBox(
                    width: AppSizes.sidePane,
                    child: WireInspectorPane(sessionId: sessionId),
                  ),
                ],
              )
            : journey,
      ),
    );
  }
}

class _EmptyJourney extends StatelessWidget {
  const _EmptyJourney({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Text(
        'Tell Homeward about your move.',
        style: AppTextStyles.title,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
