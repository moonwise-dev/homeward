import 'package:common/common.dart';

import '../../data/repository/session_repository.dart';
import '../prompt/prompt_assembler.dart';
import 'create_interaction.dart';
import 'read_interaction.dart';
import 'tool_belt.dart';
import 'turn_event.dart';
import 'turn_input.dart';
import '../../errors/homeward_failure.dart';
import 'turn_run.dart';
import 'turn_settings.dart';

final class TurnOrchestrator {
  TurnOrchestrator({
    required this.sessions,
    required this.createInteraction,
    required this.prompts,
    required this.tools,
    required this.catalog,
    this.readInteraction,
    this.settings = const TurnSettings(),
    DateTime Function()? now,
  }) : now = now ?? DateTime.now;

  final SessionRepository sessions;
  final CreateInteraction createInteraction;
  final PromptAssembler prompts;
  final ToolBelt tools;
  final CatalogValidator catalog;
  final ReadInteraction? readInteraction;
  final TurnSettings settings;
  final DateTime Function() now;

  Stream<TurnEvent> run({
    required String sessionId,
    required String uid,
    required TurnInput input,
    required String apiKey,
    Future<void>? cancellation,
  }) async* {
    final session = await sessions.find(sessionId);
    if (session == null || session.ownerUid != uid) {
      yield const TurnEvent.failed(HomewardFailure.sessionNotFound);
      return;
    }
    if (!await sessions.lease(sessionId)) {
      yield const TurnEvent.failed(HomewardFailure.turnInProgress);
      return;
    }
    final run = TurnRun(
      session: session,
      createInteraction: createInteraction,
      prompts: prompts,
      tools: tools,
      catalog: catalog,
      readInteraction: readInteraction,
      settings: settings,
      now: now,
    );
    try {
      yield const TurnEvent.working();
      yield* run.execute(
        turnInput: input,
        apiKey: apiKey,
        cancellation: cancellation,
      );
    } finally {
      await sessions.save(run.session);
      await sessions.release(sessionId);
    }
  }
}
