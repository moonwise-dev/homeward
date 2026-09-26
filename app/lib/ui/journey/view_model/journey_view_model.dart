import 'dart:async';

import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/agent_repository.dart';
import '../../../data/repositories/gemini_key_repository.dart';
import '../../../data/repositories/plans_repository.dart';
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
    await _sendText(text);
  }

  Future<void> _sendText(String text) async {
    ref
        .read(plansRepositoryProvider)
        .recordActivity(sessionId, buyerText: text);
    await ref.read(agentRepositoryProvider).sendText(sessionId, text);
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
      case ServerAppError(
        code: HomewardErrorCode.geminiQuotaExhausted,
        :final retryAfter,
      ):
        unawaited(_onQuotaExhausted(failure.entryId, retryAfter));
      case ServerAppError(code: HomewardErrorCode.geminiCreditsDepleted):
        showErrorMessage(
          error: failure.error,
          action: AppMessageAction(
            label: 'Change key',
            onPressed: () =>
                ref.read(appRouterProvider).push(AppRoutes.geminiKey),
          ),
        );
      case final error:
        showErrorMessage(
          error: error,
          action: AppMessageAction(
            label: 'Retry',
            onPressed: () => retry(failure.entryId),
          ),
        );
    }
  }

  Future<void> _onQuotaExhausted(String entryId, Duration? retryAfter) async {
    final agent = ref.read(agentRepositoryProvider);
    if (await ref.read(geminiKeyRepositoryProvider).useNextKey()) {
      showInfoMessage(
        message: 'That Gemini key hit its limit; trying your next key.',
      );
      await agent.retry(sessionId, entryId);
      return;
    }
    showInfoMessage(message: _quotaResetMessage(retryAfter, DateTime.now()));
  }
}

@freezed
abstract class JourneyState with _$JourneyState {
  const factory JourneyState({
    @Default(PlanConversation()) PlanConversation conversation,
    @Default('') String draft,
  }) = _JourneyState;

  const JourneyState._();

  AgentEntry? get latest =>
      conversation.entries.whereType<AgentEntry>().lastOrNull;

  TranscriptEntry? get latestPrompt {
    final entries = conversation.entries;
    final index = entries.lastIndexWhere((entry) => entry is AgentEntry);
    return switch (entries.elementAtOrNull(index - 1)) {
      final BuyerEntry prompt => prompt,
      final BuyerActionEntry prompt => prompt,
      _ => null,
    };
  }

  bool get hasScreen => conversation.entries.any(
    (entry) => entry is AgentEntry && entry.surfaceIds.contains(planSurfaceId),
  );

  AgentEntry? get pending => switch (latest) {
    final AgentEntry entry when entry.status == AgentTurnStatus.streaming =>
      entry,
    _ => null,
  };
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
