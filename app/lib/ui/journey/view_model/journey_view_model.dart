import 'dart:async';

import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/agent_repository.dart';
import '../../../data/repositories/gemini_key_repository.dart';
import '../../../domain/models/app_error.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../../routing/router.dart';
import '../../../routing/routes.dart';
import '../../../utils/safe_notifier_state.dart';
import '../../core/messages/app_message.dart';

part 'journey_view_model.freezed.dart';
part 'journey_view_model.g.dart';

@riverpod
class JourneyViewModel extends _$JourneyViewModel
    with SafeNotifierState<JourneyState, JourneyState> {
  @override
  JourneyState build(String sessionId) {
    final agent = ref.watch(agentRepositoryProvider);
    subscribe(agent.watchConversation(sessionId), _onConversation);
    subscribe(agent.watchFailures(sessionId), _onFailure);
    unawaited(_open(agent));
    return const JourneyState();
  }

  void _onConversation(PlanConversation conversation) =>
      setState((current) => current.copyWith(conversation: conversation));

  Future<void> _open(AgentRepository agent) async {
    try {
      await agent.open(sessionId);
    } on ServerAppError catch (error, stackTrace) {
      logError(error, stackTrace);
      if (error.code == HomewardErrorCode.sessionNotFound && ref.mounted) {
        ref.read(appRouterProvider).go(AppRoutes.startup);
      }
    } on Object catch (error, stackTrace) {
      logError(error, stackTrace);
    }
  }

  void updateDraft(String draft) =>
      setState((current) => current.copyWith(draft: draft));

  Future<void> send() async {
    final text = state.draft.trim();
    if (text.isEmpty || state.conversation.isRunning) {
      return;
    }
    setState((current) => current.copyWith(draft: ''));
    await ref.read(agentRepositoryProvider).sendText(sessionId, text);
  }

  Future<void> startOver() async {
    final router = ref.read(appRouterProvider);
    if (state.conversation.isRunning) {
      await stop();
    }
    router.go(AppRoutes.startup);
  }

  Future<void> stop() async {
    final agent = ref.read(agentRepositoryProvider);
    try {
      await agent.stop(sessionId);
    } on Object catch (error, stackTrace) {
      logError(error, stackTrace);
      showErrorMessage(error: error);
    }
  }

  Future<void> retry(String entryId) =>
      ref.read(agentRepositoryProvider).retry(sessionId, entryId);

  void _onFailure(TurnFailure failure) {
    switch (failure.error) {
      case ServerAppError(code: HomewardErrorCode.geminiKeyInvalid):
        showErrorMessage(error: failure.error);
        ref.read(geminiKeyProvider.notifier).remove();
      case ServerAppError(code: HomewardErrorCode.geminiCreditsDepleted):
        showErrorMessage(
          error: failure.error,
          action: AppMessageAction(
            label: 'Change key',
            onPressed: () =>
                ref.read(appRouterProvider).push(AppRoutes.geminiKey),
          ),
        );
      case _:
        break;
    }
  }
}

String failureText(AppError? error, DateTime now) => switch (error) {
  ServerAppError(
    code: HomewardErrorCode.geminiQuotaExhausted,
    :final retryAfter,
  ) =>
    _quotaResetMessage(retryAfter, now),
  final error? => error.humanMessage,
  null => 'This step did not finish.',
};

@freezed
abstract class JourneyState with _$JourneyState {
  const factory JourneyState({
    @Default(PlanConversation()) PlanConversation conversation,
    @Default('') String draft,
  }) = _JourneyState;

  const JourneyState._();

  List<JourneySection> get sections => [
    for (final (index, entry) in conversation.entries.indexed)
      if (entry case final AgentEntry agent
          when agent.status != AgentTurnStatus.streaming ||
              inlineSurfaceIds(agent).isNotEmpty)
        JourneySection(
          entry: agent,
          prompt: switch (conversation.entries.elementAtOrNull(index - 1)) {
            final BuyerEntry prompt => prompt,
            final BuyerActionEntry prompt => prompt,
            _ => null,
          },
        ),
  ];

  AgentEntry? get pending => switch (conversation.entries.lastOrNull) {
    final AgentEntry entry
        when entry.status == AgentTurnStatus.streaming &&
            inlineSurfaceIds(entry).isEmpty =>
      entry,
    _ => null,
  };

  TranscriptEntry? get pendingPrompt => pending == null
      ? null
      : switch (conversation.entries.elementAtOrNull(
          conversation.entries.length - 2,
        )) {
          final BuyerEntry prompt => prompt,
          final BuyerActionEntry prompt => prompt,
          _ => null,
        };

  bool get hasPlan => conversation.entries.any(
    (entry) => entry is AgentEntry && entry.surfaceIds.contains(planSurfaceId),
  );

  List<PlanChange> get latestChanges =>
      switch (conversation.entries.lastOrNull) {
        AgentEntry(:final planChanges) => planChanges,
        _ => const [],
      };

  String? get sectionToShow =>
      (latestChanges.where((change) => change.isNew).firstOrNull ??
              latestChanges.where(_isWorthNaming).firstOrNull)
          ?.sectionId;
}

List<PlanChange> receiptChanges(AgentEntry entry) => [
  for (final change in entry.planChanges)
    if (_isWorthNaming(change)) change,
];

bool _isWorthNaming(PlanChange change) =>
    change.isNew || change.type != 'PlanOverview';

List<String> inlineSurfaceIds(AgentEntry entry) => [
  for (final surfaceId in entry.surfaceIds)
    if (surfaceId != planSurfaceId) surfaceId,
];

final class JourneySection {
  const JourneySection({required this.entry, this.prompt});

  final AgentEntry entry;
  final TranscriptEntry? prompt;
}

String _quotaResetMessage(Duration? retryAfter, DateTime now) {
  const limited =
      'Your free Gemini key has hit a request limit. Try again in a minute; '
      'if it persists, the daily limit';
  if (retryAfter == null) {
    return '$limited resets at midnight Pacific time.';
  }
  final resetsAt = DateFormat.jm().format(now.add(retryAfter));
  return '$limited resets at $resetsAt.';
}
