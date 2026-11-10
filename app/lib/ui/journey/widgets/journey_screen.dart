import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/router.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';
import '../../wire_inspector/widgets/wire_inspector_pane.dart';
import '../view_model/journey_view_model.dart';
import 'appearance_button.dart';
import 'ask_sheet.dart';
import '../../explore/explore_screen.dart';
import 'generated_frame.dart';

class JourneyScreen extends HookConsumerWidget {
  const JourneyScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = journeyViewModelProvider(sessionId);
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final isWide = MediaQuery.sizeOf(context).width >= AppSizes.twoPane;
    final showsWire = useState(false);
    final showsGenerated = useState(false);

    useEffect(() {
      Future.microtask(
        () => ref.read(openPlanProvider.notifier).open(sessionId),
      );
      return null;
    }, [sessionId]);

    final isRunning = state.conversation.isRunning;

    void ask() => showAskSheet(context, sessionId);

    final menu = PopupMenuButton<_MenuChoice>(
      tooltip: 'More',
      icon: const Icon(Icons.more_horiz_rounded),
      onSelected: (choice) => switch (choice) {
        _MenuChoice.startOver => viewModel.startOver(),
        _MenuChoice.generated => showsGenerated.value = !showsGenerated.value,
        _MenuChoice.blocks => context.push(AppRoutes.gallery),
        _MenuChoice.underTheHood =>
          isWide
              ? showsWire.value = !showsWire.value
              : showWireInspectorSheet(context, sessionId),
        _MenuChoice.key => context.push(AppRoutes.geminiKey),
      },
      itemBuilder: (context) => [
        for (final choice in _MenuChoice.values)
          if (choice == _MenuChoice.generated)
            CheckedPopupMenuItem(
              value: choice,
              checked: showsGenerated.value,
              child: Text(choice.label),
            )
          else
            PopupMenuItem(
              value: choice,
              child: Row(
                spacing: AppSpacing.sm,
                children: [Icon(choice.icon, size: 20), Text(choice.label)],
              ),
            ),
      ],
    );

    final started = state.conversation.entries.isNotEmpty;
    final main = GeneratedOutline(
      isShown: showsGenerated.value,
      child: ExploreScreen(sessionId: sessionId),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homeward'),
        actions: [
          if (started && !isRunning)
            IconButton(
              tooltip: 'Tell Homeward',
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              onPressed: ask,
            ),
          const AppearanceButton(),
          menu,
        ],
      ),
      body: SafeArea(
        child: isWide && showsWire.value
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: main),
                  const VerticalDivider(width: 1),
                  SizedBox(
                    width: AppSizes.sidePane,
                    child: WireInspectorPane(sessionId: sessionId),
                  ),
                ],
              )
            : main,
      ),
    );
  }
}

enum _MenuChoice {
  startOver('Start over', Icons.restart_alt_rounded),
  generated('Show what Gemini made', Icons.auto_awesome_outlined),
  blocks('Building blocks', Icons.widgets_outlined),
  underTheHood('Under the hood', Icons.data_object_rounded),
  key('Gemini key', Icons.key_rounded);

  const _MenuChoice(this.label, this.icon);

  final String label;
  final IconData icon;
}
