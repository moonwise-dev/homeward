import 'package:freezed_annotation/freezed_annotation.dart';

import '../progress/research_progress.dart';

part 'agent_event.freezed.dart';

@freezed
sealed class AgentEvent with _$AgentEvent {
  const factory AgentEvent.started({required String taskId}) = AgentStarted;

  const factory AgentEvent.text(String text) = AgentText;

  const factory AgentEvent.a2ui(Map<String, Object?> message) = AgentA2ui;

  const factory AgentEvent.progress(ResearchProgress progress) = AgentProgress;

  const factory AgentEvent.completed(String text) = AgentCompleted;

  const factory AgentEvent.canceled() = AgentCanceled;
}
