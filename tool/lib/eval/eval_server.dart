import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/agent/turn/tool_belt.dart';
import 'package:homeward_server/agent/turn/turn_orchestrator.dart';
import 'package:homeward_server/agent/turn/turn_settings.dart';
import 'package:homeward_server/config/server_config.dart';
import 'package:homeward_server/data/providers/providers.dart';
import 'package:homeward_server/data/repository/in_memory_session_repository.dart';
import 'package:homeward_server/gemini/create_with_fallback.dart';
import 'package:homeward_server/gemini/interactions_client.dart';
import 'package:homeward_server/gemini/model_caps.dart';
import 'package:homeward_server/gemini/model_circuits.dart';
import 'package:homeward_server/markets/finding.dart';
import 'package:homeward_server/markets/load_markets.dart';
import 'package:homeward_server/markets/market_directory.dart';
import 'package:homeward_server/research/research.dart';
import 'package:homeward_server/tools/homeward_tools.dart';
import 'package:http/http.dart' as http;

final class EvalServer {
  const EvalServer._({
    required this.orchestrator,
    required this.sessions,
    required this.markets,
    required this.client,
  });

  factory EvalServer.start(ServerConfig config) {
    final data = loadMarkets(Directory(config.marketsDirectory));
    final errors = [
      for (final finding in data.loadFindings)
        if (finding.severity == FindingSeverity.error)
          '${finding.subject}: ${finding.message}',
    ];
    if (errors.isNotEmpty) {
      throw StateError('Markets failed to load: ${errors.join('; ')}');
    }
    final markets = MarketDirectory(data);
    final httpClient = http.Client();
    final client = InteractionsClient(
      httpClient: httpClient,
      headersDeadline: config.headersDeadline,
      firstStepDeadline: config.firstStepDeadline,
    );
    final circuits = ModelCircuits(
      models: config.turnModels,
      cooldown: config.modelCooldown,
    );
    final caps = ModelCaps();
    final sessions = InMemorySessionRepository();
    return EvalServer._(
      orchestrator: TurnOrchestrator(
        sessions: sessions,
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
        prompts: PromptAssembler.load(
          Directory(config.promptsDirectory),
          deal: config.deal,
        ),
        tools: ToolBelt(
          tools: switch (Research.open(
            httpClient,
            userAgent: homewardUserAgent(config),
          )) {
            final research when config.deal => allTools(research),
            final research => storyTools(research),
          },
          markets: markets,
        ),
        catalog: CatalogValidator(homewardCatalogDocument()),
        settings: TurnSettings(
          maxCorrections: config.maxCorrections,
          thinkingLevel: config.thinkingLevel,
          deal: config.deal,
        ),
      ),
      sessions: sessions,
      markets: markets,
      client: httpClient,
    );
  }

  final TurnOrchestrator orchestrator;
  final InMemorySessionRepository sessions;
  final MarketDirectory markets;
  final http.Client client;

  void close() => client.close();
}
