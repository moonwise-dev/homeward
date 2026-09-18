import 'dart:async';

import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
import 'plan_chat_state.dart';

part 'plan_chat_controller.g.dart';

@riverpod
class PlanChatController extends _$PlanChatController
    with SafeNotifierState<PlanChatState, PlanChatState> {
  @override
  PlanChatState build(String sessionId) {
    final agent = ref.watch(agentRepositoryProvider);
    subscribe(
      agent.watchConversation(sessionId),
      (conversation) =>
          setState((current) => current.copyWith(conversation: conversation)),
    );
    subscribe(agent.watchFailures(sessionId), _onFailure);
    unawaited(_open(agent));
    return const PlanChatState();
  }

  Future<void> _open(AgentRepository agent) async {
    try {
      await agent.open(sessionId);
    } on Object catch (error, stackTrace) {
      logError(error, stackTrace);
    }
  }

  void updateDraft(String draft) =>
      setState((current) => current.copyWith(draft: draft));

  Future<void> send([String? starter]) async {
    final text = (starter ?? state.draft).trim();
    final agent = ref.read(agentRepositoryProvider);
    final plans = ref.read(plansRepositoryProvider);
    if (text.isEmpty || state.conversation.isRunning) {
      return;
    }
    setState((current) => current.copyWith(draft: ''));
    plans.recordActivity(sessionId, buyerText: text);
    await agent.sendText(sessionId, text);
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
