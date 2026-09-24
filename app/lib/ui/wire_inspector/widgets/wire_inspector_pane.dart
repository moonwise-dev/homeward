import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/services/wire_log.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';
import '../../core/ui/app_figure_row.dart';
import '../../core/ui/app_select_field.dart';
import '../../core/ui/app_status_line.dart';
import '../../journey/view_model/journey_view_model.dart';
import 'surface_data_view.dart';
import 'wire_frame_row.dart';

class WireInspectorPane extends HookConsumerWidget {
  const WireInspectorPane({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final log = ref.watch(wireLogProvider);
    final entries = ref.watch(wireEntriesProvider).value ?? log.entries;
    final opened = useMemoized(
      () => (frames: log.frames, recomputes: log.recomputes),
    );
    final surfaces = _surfacesOf(
      ref.watch(journeyViewModelProvider(sessionId)).conversation,
    );
    final surfaceId = useState<String?>(null);
    final selected = surfaces.contains(surfaceId.value)
        ? surfaceId.value
        : surfaces.firstOrNull;
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.xs,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text('Wire inspector', style: AppTextStyles.title),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Clear',
                  onPressed: log.clear,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Column(
              children: [
                AppFigureRow(
                  label: 'Frames over the network',
                  figure: '${log.frames - opened.frames}',
                ),
                AppFigureRow(
                  label: 'Recomputed on the device',
                  figure: '${log.recomputes - opened.recomputes}',
                  color: AppColors.accent,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Since this panel opened',
                    style: AppTextStyles.caption,
                  ),
                ),
              ],
            ),
          ),
          const TabBar(
            tabs: [
              Tab(text: 'Frames'),
              Tab(text: 'Data'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _Frames(entries: entries),
                _Data(
                  sessionId: sessionId,
                  surfaces: surfaces,
                  selected: selected,
                  onSelected: (id) => surfaceId.value = id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> _surfacesOf(PlanConversation conversation) => [
    for (final entry in conversation.entries)
      if (entry case AgentEntry(:final surfaceIds)) ...surfaceIds,
  ];
}

class _Frames extends StatelessWidget {
  const _Frames({required this.entries});

  final List<WireEntry> entries;

  @override
  Widget build(BuildContext context) => entries.isEmpty
      ? const Center(child: AppStatusLine(text: 'No traffic yet'))
      : ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(AppSpacing.md),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final at = entries.length - 1 - index;
            return WireFrameRow(
              entry: entries[at],
              since: at == 0
                  ? null
                  : entries[at].at.difference(entries[at - 1].at),
            );
          },
        );
}

class _Data extends StatelessWidget {
  const _Data({
    required this.sessionId,
    required this.surfaces,
    required this.selected,
    required this.onSelected,
  });

  final String sessionId;
  final List<String> surfaces;
  final String? selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) => selected == null
      ? const Center(child: AppStatusLine(text: 'No surfaces yet'))
      : ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            AppSelectField(
              label: 'Surface',
              value: selected,
              options: [
                for (final surface in surfaces)
                  AppSelectOption(value: surface, label: surface),
              ],
              onChanged: onSelected,
            ),
            const SizedBox(height: AppSpacing.sm),
            SurfaceDataView(sessionId: sessionId, surfaceId: selected!),
          ],
        );
}

Future<void> showWireInspectorSheet(BuildContext context, String sessionId) =>
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.background,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.85,
        child: SafeArea(child: WireInspectorPane(sessionId: sessionId)),
      ),
    );
