import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/plan_conversation.dart';

part 'plan_chat_state.freezed.dart';

@freezed
abstract class PlanChatState with _$PlanChatState {
  const factory PlanChatState({
    @Default(PlanConversation()) PlanConversation conversation,
    @Default('') String draft,
  }) = _PlanChatState;
}
