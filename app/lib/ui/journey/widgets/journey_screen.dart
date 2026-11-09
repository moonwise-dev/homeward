import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../catalog/plan_areas.dart';
import '../../../data/repositories/agent_repository.dart';
import '../../../routing/router.dart';
import '../../../routing/routes.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../wire_inspector/widgets/wire_inspector_pane.dart';
import '../view_model/journey_view_model.dart';
import 'appearance_button.dart';
import 'area_view.dart';
import 'assistant_panel.dart';

class JourneyScreen extends HookConsumerWidget {
  const JourneyScreen({required this.sessionId, super.key});

  final String sessionId;

  static const _assistantWidth = 420.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors.of(context);
    final provider = journeyViewModelProvider(sessionId);
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final agent = ref.watch(agentRepositoryProvider);
    final isWide = MediaQuery.sizeOf(context).width >= AppSizes.twoPane;
    final area = useState(PlanArea.overview);
    final onAssistant = useState(true);
    final showsWire = useState(false);
    final wirePane = isWide && showsWire.value;
    final planFocus = useValueNotifier<String?>(null);
    final seen = useState(<PlanArea>{});
    final lastEntry = state.conversation.entries.lastOrNull?.id;
    useEffect(() {
      seen.value = {};
      return null;
    }, [lastEntry]);

    void open(PlanArea opened) {
      area.value = opened;
      onAssistant.value = false;
      seen.value = {...seen.value, opened};
    }

    void showOnPlan(String sectionId) {
      final type = agent
          .surface(sessionId, planSurfaceId)
          .value
          ?.componentsModel
          .get(sectionId)
          ?.type;
      if (type != null) {
        open(PlanArea.of(type));
      }
      planFocus.value = sectionId;
    }

    ref.listen(provider, (previous, next) {
      final finished =
          (previous?.conversation.isRunning ?? false) &&
          !next.conversation.isRunning;
      final sectionId = next.sectionToShow;
      if (finished && isWide && sectionId != null) {
        showOnPlan(sectionId);
      }
    });

    useEffect(() {
      Future.microtask(
        () => ref.read(openPlanProvider.notifier).open(sessionId),
      );
      return null;
    }, [sessionId]);

    final changed = {
      for (final change in state.latestChanges) PlanArea.of(change.type),
    };
    bool hasNews(PlanArea candidate) =>
        changed.contains(candidate) &&
        !seen.value.contains(candidate) &&
        (onAssistant.value || area.value != candidate);
    Widget areaIcon(PlanArea candidate, {bool selected = false}) => Badge(
      isLabelVisible: hasNews(candidate),
      backgroundColor: colors.accent,
      smallSize: 8,
      child: Icon(selected ? candidate.selectedIcon : candidate.icon),
    );

    final assistant = AssistantPanel(
      sessionId: sessionId,
      state: state,
      viewModel: viewModel,
      onShowOnPlan: showOnPlan,
    );
    final areaView = AreaView(
      key: ValueKey(area.value),
      sessionId: sessionId,
      area: area.value,
      state: state,
      focus: planFocus,
    );
    final actions = [
      const AppearanceButton(),
      PopupMenuButton<_MenuChoice>(
        tooltip: 'More',
        icon: const Icon(Icons.more_vert),
        onSelected: (choice) => switch (choice) {
          _MenuChoice.startOver => viewModel.startOver(),
          _MenuChoice.blocks => context.push(AppRoutes.gallery),
          _MenuChoice.underTheHood =>
            isWide
                ? showsWire.value = !showsWire.value
                : showWireInspectorSheet(context, sessionId),
          _MenuChoice.key => context.push(AppRoutes.geminiKey),
        },
        itemBuilder: (context) => [
          for (final choice in _MenuChoice.values)
            PopupMenuItem(
              value: choice,
              child: ListTile(
                leading: Icon(choice.icon),
                title: Text(choice.label),
                contentPadding: EdgeInsets.zero,
              ),
            ),
        ],
      ),
    ];
    final appBar = AppBar(title: const Text('Homeward'), actions: actions);

    if (isWide) {
      return Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NavigationRail(
                selectedIndex: area.value.index,
                onDestinationSelected: (index) => open(PlanArea.values[index]),
                labelType: NavigationRailLabelType.all,
                destinations: [
                  for (final candidate in PlanArea.values)
                    NavigationRailDestination(
                      icon: areaIcon(candidate),
                      selectedIcon: areaIcon(candidate, selected: true),
                      label: Text(candidate.label),
                    ),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(child: areaView),
              const VerticalDivider(width: 1),
              SizedBox(width: _assistantWidth, child: assistant),
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
      appBar: appBar,
      body: SafeArea(child: onAssistant.value ? assistant : areaView),
      bottomNavigationBar: NavigationBar(
        selectedIndex: onAssistant.value ? 0 : area.value.index + 1,
        onDestinationSelected: (index) => index == 0
            ? onAssistant.value = true
            : open(PlanArea.values[index - 1]),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            selectedIcon: Icon(Icons.forum),
            label: 'Assistant',
          ),
          for (final candidate in PlanArea.values)
            NavigationDestination(
              icon: areaIcon(candidate),
              selectedIcon: areaIcon(candidate, selected: true),
              label: candidate.label,
            ),
        ],
      ),
    );
  }
}

enum _MenuChoice {
  startOver('Start over', Icons.restart_alt),
  blocks('Building blocks', Icons.widgets_outlined),
  underTheHood('Under the hood', Icons.data_object),
  key('Gemini key', Icons.key_outlined);

  const _MenuChoice(this.label, this.icon);

  final String label;
  final IconData icon;
}
