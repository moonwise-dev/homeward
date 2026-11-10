import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../catalog/bindings/binding_parsers.dart';
import '../../data/repositories/agent_repository.dart';
import '../../data/repositories/renderer_surfaces.dart';
import '../../domain/models/plan_conversation.dart';
import '../core/themes/colors.dart';
import '../core/themes/dimens.dart';
import '../core/themes/motion.dart';
import '../core/themes/text_styles.dart';
import '../core/ui/app_button.dart';
import '../core/ui/app_card.dart';
import '../core/ui/app_pressable.dart';
import '../core/ui/app_shimmer.dart';
import '../journey/view_model/journey_view_model.dart';
import '../journey/widgets/ask_sheet.dart';
import '../journey/widgets/generated_frame.dart';
import '../journey/widgets/starter_prompts.dart';
import 'explore_parts.dart';
import 'explore_scope.dart';
import 'home_sheet.dart';
import 'map_canvas.dart';
import 'story_panel.dart';

class ExploreScreen extends HookConsumerWidget {
  const ExploreScreen({required this.sessionId, super.key});

  final String sessionId;

  static const _panelWidth = 440.0;
  static const _listed = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors.of(context);
    final provider = journeyViewModelProvider(sessionId);
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final agent = ref.watch(agentRepositoryProvider);
    final isWide = MediaQuery.sizeOf(context).width >= AppSizes.twoPane;
    final slices = usePlanData(ref, sessionId);
    final homes = jsonModelOf(slices[mapSlice.name], CityHomes.fromJson);
    final narrowing = useState(const Narrowing());
    final kept = useState(<String>{});
    final selected = useState<String?>(null);
    final showsAll = useState(false);
    final conversation = state.conversation;
    final started = conversation.entries.isNotEmpty;
    final isRunning = conversation.isRunning;
    final firstWords = switch (conversation.entries.firstOrNull) {
      final BuyerEntry entry => entry.text,
      _ => '',
    };
    final asking = _askingEntry(state);
    final askSurfaces = asking == null
        ? const <String>[]
        : inlineSurfaceIds(asking);
    final askKey = askSurfaces.join(',');
    final keptNotifier = useMemoized(() => ValueNotifier(<String>{}));
    useEffect(() {
      void sync() => kept.value = keptNotifier.value;
      keptNotifier.addListener(sync);
      return () => keptNotifier.removeListener(sync);
    }, [keptNotifier]);
    useEffect(() {
      narrowing.value = Narrowing(maxMinutes: narrowing.value.maxMinutes);
      return null;
    }, [askKey]);
    useEffect(() {
      narrowing.value = const Narrowing();
      keptNotifier.value = {};
      selected.value = null;
      return null;
    }, [homes?.cityId]);

    final narrowed = homes == null
        ? const <MapHome>[]
        : homes.narrowed(narrowing.value);
    final narrowedIds = {for (final home in narrowed) home.listing.id};
    final pinStates = <String, PinState>{
      if (homes != null)
        for (final home in homes.homes)
          home.listing.id: switch (home) {
            _ when home.withinBudget == false => PinState.overBudget,
            _ when home.listing.id == selected.value => PinState.selected,
            _ when kept.value.contains(home.listing.id) => PinState.kept,
            _ when !narrowedIds.contains(home.listing.id) =>
              PinState.narrowedOut,
            _ => PinState.left,
          },
    };
    final routeAreas = homes == null
        ? const <String>{}
        : switch ((selected.value, kept.value)) {
            (final id?, _) when homes.home(id) != null => {
              homes.home(id)!.listing.areaId,
            },
            (_, final keptIds) when keptIds.isNotEmpty => {
              for (final id in keptIds) ?homes.home(id)?.listing.areaId,
            },
            _ => {for (final home in narrowed.take(3)) home.listing.areaId},
          };

    void openHome(String id) {
      final home = homes?.home(id);
      if (homes == null || home == null) {
        return;
      }
      selected.value = id;
      keptNotifier.value = kept.value;
      showHomeSheet(
        context,
        homes: homes,
        home: home,
        kept: keptNotifier,
      ).whenComplete(() {
        if (context.mounted && selected.value == id) {
          selected.value = null;
        }
      });
    }

    void keep(String id) => keptNotifier.value = kept.value.contains(id)
        ? ({...kept.value}..remove(id))
        : {...kept.value, id};

    final isEditing = state.isEditing;
    final line = _GeminiLine(
      entry: state.latestLine,
      isRunning: isRunning && !isEditing,
      onRetry: viewModel.retry,
    );
    Widget asks({required bool rows}) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final surfaceId in askSurfaces)
          _AskSurface(
            surface: agent.surface(sessionId, surfaceId),
            rows: rows,
            isBusy: isRunning,
          ),
      ],
    );
    final mustHaves = isRunning && !isEditing && askSurfaces.isEmpty
        ? const _OptionSkeletons()
        : asks(rows: true);
    final panel = <Widget>[
      AnimatedOpacity(
        opacity: isEditing ? 1 : 0,
        duration: AppMotion.of(context, AppMotion.surface),
        child: const LinearProgressIndicator(minHeight: 2),
      ),
      const SizedBox(height: AppSpacing.xs),
      line,
      const SizedBox(height: AppSpacing.sm),
      asks(rows: false),
      StoryPanel(
        homes: homes,
        isWaiting: isRunning,
        mustHaves: mustHaves,
        onEdit: viewModel.editStory,
        onTell: (draft) => showAskSheet(context, sessionId, draft: draft),
      ),
      const SizedBox(height: AppSpacing.sm),
      if (homes != null) ...[
        TravelLimit(
          homes: homes,
          maxMinutes: narrowing.value.maxMinutes,
          onChanged: (minutes) =>
              narrowing.value = narrowing.value.withLimit(minutes),
        ),
        if (kept.value.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            child: AppButton(
              label: kept.value.length == 1
                  ? 'Keep one more to compare'
                  : 'Compare the ${kept.value.length} you kept',
              icon: Icons.compare_arrows_rounded,
              fullWidth: true,
              onPressed: kept.value.length < 2
                  ? null
                  : () => showKeptComparison(
                      context,
                      homes: homes,
                      kept: [
                        for (final id in kept.value) ?homes.home(id),
                      ],
                      onOpen: openHome,
                    ),
            ),
          ),
        const SizedBox(height: AppSpacing.xs),
        if (narrowed.isEmpty)
          _NothingFits(
            hasMustHaves: narrowing.value.mustHaves.isNotEmpty,
            hasLimit: narrowing.value.maxMinutes != null,
            onLoosen: () => narrowing.value = const Narrowing(),
            onTell: () => showAskSheet(context, sessionId),
          )
        else ...[
          for (final home in showsAll.value ? narrowed : narrowed.take(_listed))
            AnimatedOpacity(
              key: ValueKey(home.listing.id),
              opacity: isEditing ? 0.45 : 1,
              duration: AppMotion.of(context, AppMotion.surface),
              child: HomeRow(
                home: home,
                homes: homes,
                isKept: kept.value.contains(home.listing.id),
                isSelected: selected.value == home.listing.id,
                onOpen: () => openHome(home.listing.id),
                onKeep: () => keep(home.listing.id),
              ),
            ),
          if (narrowed.length > _listed && !showsAll.value)
            TextButton(
              onPressed: () => showsAll.value = true,
              child: Text('Show all ${narrowed.length}'),
            ),
        ],
      ] else if (isRunning)
        const AppShimmer(
          child: Column(
            children: [HomeRowSkeleton(), HomeRowSkeleton(), HomeRowSkeleton()],
          ),
        ),
      const SizedBox(height: AppSpacing.md),
      _TellTile(onTap: () => showAskSheet(context, sessionId)),
    ];

    final map = MapCanvas(
      homes: homes,
      pinStates: pinStates,
      routeAreas: routeAreas,
      onTapHome: openHome,
      waitingFor: started ? cityViewIn(firstWords) ?? europeView : null,
      padding: isWide
          ? const EdgeInsets.fromLTRB(_panelWidth + 56, 120, 56, 56)
          : EdgeInsets.fromLTRB(
              32,
              120,
              32,
              MediaQuery.sizeOf(context).height * 0.45,
            ),
    );
    final counter = homes == null
        ? null
        : FunnelCounter(homes: homes, narrowing: narrowing.value);
    final showsPanel = homes != null || (started && !isRunning);

    return ExploreScope(
      homes: homes,
      narrowing: narrowing.value,
      onToggle: (rule) => narrowing.value = narrowing.value.toggled(rule),
      child: Stack(
        children: [
          Positioned.fill(child: map),
          if (isWide)
            AnimatedPositioned(
              duration: AppMotion.of(
                context,
                const Duration(milliseconds: 600),
              ),
              curve: Curves.easeOutCubic,
              left: showsPanel ? AppSpacing.md : -_panelWidth - 40,
              top: AppSpacing.md,
              bottom: AppSpacing.md,
              width: _panelWidth,
              child: _Panel(children: panel),
            )
          else if (showsPanel)
            DraggableScrollableSheet(
              initialChildSize: 0.45,
              minChildSize: 0.2,
              maxChildSize: 0.92,
              builder: (context, scroll) => _Panel(
                scroll: scroll,
                isSheet: true,
                children: panel,
              ),
            ),
          if (counter != null)
            Positioned(
              top: AppSpacing.md,
              left: isWide ? _panelWidth + AppSpacing.xl : AppSpacing.md,
              child: counter,
            ),
          Positioned.fill(
            child: IgnorePointer(
              ignoring: started,
              child: AnimatedSwitcher(
                duration: AppMotion.of(
                  context,
                  const Duration(milliseconds: 700),
                ),
                child: !started
                    ? _Opening(
                        key: const ValueKey('opening'),
                        onStart: viewModel.start,
                      )
                    : homes == null && isRunning
                    ? _Veil(
                        key: const ValueKey('veil'),
                        city: cityViewIn(firstWords) == null
                            ? null
                            : _cityName(firstWords),
                        color: colors.background,
                      )
                    : const SizedBox.expand(key: ValueKey('none')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static AgentEntry? _askingEntry(JourneyState state) {
    for (final entry in state.conversation.entries.reversed) {
      if (entry is AgentEntry && inlineSurfaceIds(entry).isNotEmpty) {
        return entry;
      }
    }
    return null;
  }

  static String _cityName(String words) =>
      words.toLowerCase().contains('stockholm') ? 'Stockholm' : 'Lisbon';
}

Map<String, Object?> usePlanData(WidgetRef ref, String sessionId) {
  final agent = ref.watch(agentRepositoryProvider);
  final surface = useValueListenable<RendererSurface?>(
    useMemoized(() => agent.surface(sessionId, planSurfaceId), [sessionId]),
  );
  final data = useState<Object?>(null);
  useEffect(
    () => surface?.dataModel
        .watch<Object?>('/')
        .subscribe((value) => data.value = value),
    [surface],
  );
  return switch (data.value) {
    final Map<String, Object?> slices => slices,
    _ => const <String, Object?>{},
  };
}

class _Panel extends StatelessWidget {
  const _Panel({required this.children, this.scroll, this.isSheet = false});

  final List<Widget> children;
  final ScrollController? scroll;
  final bool isSheet;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Material(
      color: colors.surface,
      elevation: 0,
      shadowColor: colors.shadow,
      borderRadius: isSheet
          ? const BorderRadius.vertical(top: Radius.circular(AppRadii.xl))
          : BorderRadius.circular(AppRadii.xl),
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: colors.shadow, blurRadius: 24)],
        ),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: PointerDeviceKind.values.toSet(),
          ),
          child: ListView(
            controller: scroll,
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            children: [
              if (isSheet)
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: colors.border,
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                    ),
                  ),
                ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

class _GeminiLine extends StatelessWidget {
  const _GeminiLine({
    required this.entry,
    required this.isRunning,
    required this.onRetry,
  });

  final AgentEntry? entry;
  final bool isRunning;
  final ValueChanged<String> onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final entry = this.entry;
    if (isRunning) {
      return const AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.xs,
          children: [
            AppSkeleton(width: 300, height: 20),
            AppSkeleton(width: 180, height: 20),
          ],
        ),
      );
    }
    if (entry == null) {
      return const SizedBox.shrink();
    }
    if (entry.status == AgentTurnStatus.failed) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.xs,
        children: [
          Text(
            failureText(entry.error, DateTime.now()),
            style: styles.body.copyWith(color: colors.textSecondary),
          ),
          AppButton(
            label: 'Try again',
            icon: Icons.refresh_rounded,
            variant: AppButtonVariant.outlined,
            onPressed: () => onRetry(entry.id),
          ),
        ],
      );
    }
    final text = entry.text.trim();
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }
    return GeneratedFrame(
      label: 'Written by Gemini',
      child: Text(text, style: styles.lead.copyWith(color: colors.text)),
    );
  }
}

class _OptionSkeletons extends StatelessWidget {
  const _OptionSkeletons();

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.only(bottom: AppSpacing.sm),
    child: AppShimmer(
      child: Wrap(
        spacing: AppSpacing.xs,
        runSpacing: AppSpacing.xs,
        children: [
          AppSkeleton(width: 150, height: 36, radius: AppRadii.pill),
          AppSkeleton(width: 120, height: 36, radius: AppRadii.pill),
          AppSkeleton(width: 140, height: 36, radius: AppRadii.pill),
        ],
      ),
    ),
  );
}

class _NothingFits extends StatelessWidget {
  const _NothingFits({
    required this.hasMustHaves,
    required this.hasLimit,
    required this.onLoosen,
    required this.onTell,
  });

  final bool hasMustHaves;
  final bool hasLimit;
  final VoidCallback onLoosen;
  final VoidCallback onTell;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final narrowedByYou = hasMustHaves || hasLimit;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.sm,
        children: [
          Text(
            narrowedByYou
                ? 'No home has all of that.'
                : 'No sample home is within this budget.',
            style: styles.title,
          ),
          Text(
            narrowedByYou
                ? 'Loosen one, and the homes come back.'
                : 'Renting, a larger budget, or a longer ride would change it.',
            style: styles.body.copyWith(color: colors.textSecondary),
          ),
          if (narrowedByYou)
            AppButton(
              label: 'Show every home in budget',
              icon: Icons.filter_alt_off_rounded,
              variant: AppButtonVariant.outlined,
              onPressed: onLoosen,
            )
          else
            AppButton(
              label: 'Tell Homeward',
              icon: Icons.chat_bubble_outline_rounded,
              variant: AppButtonVariant.outlined,
              onPressed: onTell,
            ),
        ],
      ),
    );
  }
}

class _TellTile extends StatelessWidget {
  const _TellTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return AppPressable(
      label: 'Tell Homeward more',
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadii.pill),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: colors.surfaceMuted,
          borderRadius: BorderRadius.circular(AppRadii.pill),
        ),
        child: Row(
          spacing: AppSpacing.sm,
          children: [
            Icon(
              Icons.chat_bubble_outline_rounded,
              size: 18,
              color: colors.textSecondary,
            ),
            Expanded(
              child: Text(
                'Tell Homeward more',
                style: styles.body.copyWith(color: colors.textSecondary),
              ),
            ),
            Icon(Icons.arrow_upward_rounded, size: 18, color: colors.accent),
          ],
        ),
      ),
    );
  }
}

class _Opening extends HookWidget {
  const _Opening({required this.onStart, super.key});

  final ValueChanged<String> onStart;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final words = useTextEditingController();
    final text = useValueListenable(words).text.trim();
    void send() {
      if (text.isNotEmpty) {
        onStart(text);
      }
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colors.background.withValues(alpha: 0.55),
            colors.background.withValues(alpha: 0.92),
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSpacing.md,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 52,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colors.brand,
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                    ),
                    child: Icon(
                      Icons.home_rounded,
                      color: colors.onBrand,
                      size: 30,
                    ),
                  ),
                ),
                Text('Where are you moving?', style: styles.display),
                Text(
                  'Tell me about your move. The map narrows to the homes '
                  'worth a visit.',
                  style: styles.lead.copyWith(color: colors.textSecondary),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    border: Border.all(color: colors.borderStrong),
                    boxShadow: [
                      BoxShadow(color: colors.shadow, blurRadius: 24),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md,
                      AppSpacing.xs,
                      AppSpacing.xs,
                      AppSpacing.xs,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: words,
                            minLines: 2,
                            maxLines: 5,
                            style: styles.body,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => send(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: false,
                              hintText:
                                  'Two of us, moving to Stockholm for a job '
                                  'at KTH…',
                            ),
                          ),
                        ),
                        IconButton.filled(
                          tooltip: 'Start',
                          onPressed: text.isEmpty ? null : send,
                          style: IconButton.styleFrom(
                            backgroundColor: colors.brand,
                            foregroundColor: colors.onBrand,
                          ),
                          icon: const Icon(Icons.arrow_upward_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    for (final prompt in starterPrompts)
                      ActionChip(
                        avatar: Icon(
                          Icons.auto_awesome_rounded,
                          size: 16,
                          color: colors.accent,
                        ),
                        label: Text(prompt.title),
                        onPressed: () => onStart(prompt.message),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Veil extends HookWidget {
  const _Veil({required this.city, required this.color, super.key});

  final String? city;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final city = this.city;
    final pulse = useAnimationController(
      duration: const Duration(milliseconds: 1600),
    );
    final still = MediaQuery.disableAnimationsOf(context);
    useEffect(() {
      if (!still) {
        pulse.repeat();
      }
      return null;
    }, [still]);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.withValues(alpha: 0),
            color.withValues(alpha: 0.2),
            color.withValues(alpha: 0.85),
          ],
          stops: const [0, 0.55, 1],
        ),
      ),
      child: Align(
        alignment: const Alignment(0, 0.72),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.md,
          children: [
            AnimatedBuilder(
              animation: pulse,
              builder: (context, _) => Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 22 + 46 * pulse.value,
                    height: 22 + 46 * pulse.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.brand.withValues(
                        alpha: 0.35 * (1 - pulse.value),
                      ),
                    ),
                  ),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.brand,
                      border: Border.all(color: colors.surface, width: 3),
                    ),
                  ),
                ],
              ),
            ),
            if (city != null)
              Text(
                city,
                style: styles.display.copyWith(
                  fontSize: 44,
                  letterSpacing: -1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AskSurface extends StatefulWidget {
  const _AskSurface({
    required this.surface,
    required this.rows,
    required this.isBusy,
  });

  final ValueListenable<RendererSurface?> surface;
  final bool rows;
  final bool isBusy;

  @override
  State<_AskSurface> createState() => _AskSurfaceState();
}

class _AskSurfaceState extends State<_AskSurface> {
  Subscription? _created;
  RendererSurface? _watching;

  void _watch(RendererSurface? surface) {
    if (identical(surface, _watching)) {
      return;
    }
    _created?.unsubscribe();
    _watching = surface;
    _created = surface?.componentsModel.onCreated.subscribe(
      (ComponentModel component) {
        if (component.id == 'root' && mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    _created?.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: widget.surface,
    builder: (context, surface, _) {
      _watch(surface);
      final type = surface?.componentsModel.get('root')?.type;
      if (surface == null || type == null || (type == 'Row') != widget.rows) {
        return const SizedBox.shrink();
      }
      final shown = IgnorePointer(
        ignoring: widget.isBusy,
        child: AnimatedOpacity(
          opacity: widget.isBusy ? 0.5 : 1,
          duration: AppMotion.of(context, AppMotion.surface),
          child: GeneratedFrame(
            child: A2uiSurface(key: ObjectKey(surface), surface: surface),
          ),
        ),
      );
      return widget.rows
          ? shown
          : Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: AppCard(
                outlined: true,
                padding: const EdgeInsets.all(AppSpacing.md),
                child: shown,
              ),
            );
    },
  );
}
