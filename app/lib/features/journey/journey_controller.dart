import 'dart:async';

import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/plan_conversation.dart';
import '../../data/models/turn_failure.dart';
import '../../data/repository/agent_repository.dart';
import '../../data/providers/gemini_key_providers.dart';
import '../../data/providers/repository_providers.dart';
import '../../display/quota_reset_message.dart';
import '../../errors/app_error.dart';
import '../../messages/app_message_action.dart';
import '../../navigation/app_router.dart';
import '../../navigation/app_routes.dart';
import '../../riverpod/safe_notifier_state.dart';
import 'journey_state.dart';
import 'opening_example.dart';
import 'opening_message.dart';

part 'journey_controller.g.dart';

@riverpod
class JourneyController extends _$JourneyController
    with SafeNotifierState<JourneyState, JourneyState> {
  @override
  JourneyState build(String sessionId) {
    final agent = ref.watch(agentRepositoryProvider);
    subscribe(agent.watchConversation(sessionId), _onConversation);
    subscribe(agent.watchFailures(sessionId), _onFailure);
    unawaited(_open(agent));
    return const JourneyState();
  }

  void _onConversation(PlanConversation conversation) => setState((current) {
    final next = current.copyWith(conversation: conversation);
    return next.pages.length > current.pages.length
        ? next.copyWith(chosenPage: null)
        : next;
  });

  Future<void> _open(AgentRepository agent) async {
    try {
      await agent.open(sessionId);
    } on Object catch (error, stackTrace) {
      logError(error, stackTrace);
    }
  }

  void updateDraft(String draft) =>
      setState((current) => current.copyWith(draft: draft));

  void pickReason(StoryReason? reason) =>
      setState((current) => current.copyWith(reason: reason));

  void updateOwnReason(String ownReason) =>
      setState((current) => current.copyWith(ownReason: ownReason));

  void updateStory(String story) =>
      setState((current) => current.copyWith(story: story));

  void useExample(OpeningExample example) => setState(
    (current) => current.copyWith(reason: example.reason, story: example.story),
  );

  void showPage(int page) =>
      setState((current) => current.copyWith(chosenPage: page));

  Future<void> start() async {
    if (!state.canStart) {
      return;
    }
    await _sendText(
      openingMessage(
        reason: state.reason,
        ownReason: state.ownReason,
        story: state.story,
      ),
      reason: state.reason,
    );
  }

  Future<void> send() async {
    final text = state.draft.trim();
    if (text.isEmpty || state.conversation.isRunning) {
      return;
    }
    setState((current) => current.copyWith(draft: ''));
    await _sendText(text);
  }

  Future<void> _sendText(String text, {StoryReason? reason}) async {
    ref
        .read(plansRepositoryProvider)
        .recordActivity(sessionId, buyerText: text);
    await ref
        .read(agentRepositoryProvider)
        .sendText(sessionId, text, reason: reason);
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
        showInfoMessage(
          message: quotaResetMessage(retryAfter, DateTime.now()),
        );
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
}
