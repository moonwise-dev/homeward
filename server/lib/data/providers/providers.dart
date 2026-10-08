import 'dart:io';

import 'package:common/common.dart';
import 'package:http/http.dart' as http;

import '../../a2a/task_registry.dart';
import '../../agent/prompt/prompt_assembler.dart';
import '../../agent/turn/create_interaction.dart';
import '../../agent/turn/read_interaction.dart';
import '../../agent/turn/tool_belt.dart';
import '../../agent/turn/turn_orchestrator.dart';
import '../../agent/turn/turn_settings.dart';
import '../../config/server_config.dart';
import '../../gemini/create_with_fallback.dart';
import '../../gemini/interactions_client.dart';
import '../../gemini/model_caps.dart';
import '../../gemini/model_circuits.dart';
import '../../gemini/models_client.dart';
import '../../keys/verify_gemini_key.dart';
import '../../markets/finding.dart';
import '../../markets/load_markets.dart';
import '../../markets/market_directory.dart';
import '../../research/research.dart';
import '../../tools/homeward_tools.dart';
import '../repository/session_repository.dart';

String homewardUserAgent(ServerConfig config) =>
    'Homeward/0.1 (+${config.publicUrl})';

final class Providers {
  factory Providers({
    required ServerConfig config,
    required CreateInteraction createInteraction,
    required VerifyGeminiKey verifyKey,
    required PromptAssembler prompts,
    required MarketDirectory markets,
    required Research research,
    ReadInteraction? readInteraction,
    SessionRepository? sessions,
    DateTime Function()? now,
  }) {
    final repository = sessions ?? SessionRepository();
    return Providers._(
      config: config,
      verifyKey: verifyKey,
      sessions: repository,
      tasks: TaskRegistry(),
      turns: TurnOrchestrator(
        sessions: repository,
        createInteraction: createInteraction,
        prompts: prompts,
        tools: ToolBelt(homewardTools(markets, research)),
        catalog: CatalogValidator(homewardCatalogDocument()),
        readInteraction: readInteraction,
        settings: TurnSettings(
          maxCorrections: config.maxCorrections,
          maxFinishingRounds: config.maxFinishingRounds,
          maxOverloadRetries: config.maxOverloadRetries,
          overloadWait: config.overloadWait,
          thinkingLevel: config.thinkingLevel,
        ),
        now: now,
      ),
    );
  }

  const Providers._({
    required this.config,
    required this.verifyKey,
    required this.sessions,
    required this.tasks,
    required this.turns,
  });

  factory Providers.production(ServerConfig config, http.Client httpClient) {
    final marketsData = loadMarkets(Directory(config.marketsDirectory));
    final errors = [
      for (final finding in marketsData.loadFindings)
        if (finding.severity == FindingSeverity.error)
          '${finding.subject}: ${finding.message}',
    ];
    if (errors.isNotEmpty) {
      throw StateError('Markets failed to load: ${errors.join('; ')}');
    }
    final client = InteractionsClient(
      httpClient: httpClient,
      headersDeadline: config.headersDeadline,
      firstStepDeadline: config.firstStepDeadline,
    );
    final models = ModelsClient(
      httpClient: httpClient,
      deadline: config.headersDeadline,
    );
    final circuits = ModelCircuits(
      models: config.turnModels,
      cooldown: config.modelCooldown,
    );
    final caps = ModelCaps();
    return Providers(
      config: config,
      createInteraction:
          ({
            required apiKey,
            required request,
            required canFallBack,
            Future<void>? cancellation,
          }) => createWithFallback(
            client: client,
            circuits: circuits,
            caps: caps,
            apiKey: apiKey,
            request: request,
            canFallBack: canFallBack,
            cancellation: cancellation,
          ),
      readInteraction: client.read,
      verifyKey: (apiKey) => models.ensureAvailable(
        apiKey: apiKey,
        model: config.turnModels.first,
      ),
      prompts: PromptAssembler.load(Directory(config.promptsDirectory)),
      markets: MarketDirectory(marketsData),
      research: Research.open(httpClient, userAgent: homewardUserAgent(config)),
    );
  }

  final ServerConfig config;
  final VerifyGeminiKey verifyKey;
  final SessionRepository sessions;
  final TaskRegistry tasks;
  final TurnOrchestrator turns;
}
