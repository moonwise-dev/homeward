import 'dart:io';

import 'package:common/common.dart';
import 'package:firebase_admin_sdk/firebase_admin_sdk.dart';
import 'package:http/http.dart' as http;

import '../../a2a/task_registry.dart';
import '../../agent/prompt/prompt_assembler.dart';
import '../../agent/turn/create_interaction.dart';
import '../../agent/turn/tool_belt.dart';
import '../../agent/turn/turn_orchestrator.dart';
import '../../agent/turn/turn_settings.dart';
import '../../auth/app_check_verifier.dart';
import '../../auth/firebase_app_check_verifier.dart';
import '../../auth/firebase_identity_verifier.dart';
import '../../auth/identity_verifier.dart';
import '../../config/server_config.dart';
import '../../config/session_store.dart';
import '../../gemini/create_with_fallback.dart';
import '../../gemini/interactions_client.dart';
import '../../gemini/model_caps.dart';
import '../../gemini/model_circuits.dart';
import '../../gemini/models_client.dart';
import '../../keys/verify_gemini_key.dart';
import '../../markets/finding.dart';
import '../../markets/load_markets.dart';
import '../../markets/market_directory.dart';
import '../../rate_limit/fixed_window_limiter.dart';
import '../../research/research.dart';
import '../../tools/homeward_tools.dart';
import '../repository/firestore_session_repository.dart';
import '../repository/in_memory_session_repository.dart';
import '../repository/session_repository.dart';

String homewardUserAgent(ServerConfig config) =>
    'Homeward/0.1 (+${config.publicUrl})';

final class Providers {
  factory Providers({
    required ServerConfig config,
    required IdentityVerifier identity,
    required AppCheckVerifier appCheck,
    required CreateInteraction createInteraction,
    required VerifyGeminiKey verifyKey,
    required MarketDirectory markets,
    required PromptAssembler prompts,
    SessionRepository? sessions,
    Research? research,
    DateTime Function()? now,
  }) {
    final repository = sessions ?? InMemorySessionRepository();
    return Providers._(
      config: config,
      identity: identity,
      appCheck: appCheck,
      verifyKey: verifyKey,
      sessions: repository,
      markets: markets,
      tasks: TaskRegistry(),
      turnLimiter: FixedWindowLimiter(
        limit: 30,
        window: const Duration(minutes: 10),
        now: now,
      ),
      turns: TurnOrchestrator(
        sessions: repository,
        createInteraction: createInteraction,
        prompts: prompts,
        tools: ToolBelt(
          tools: switch (research) {
            final research? => allTools(research),
            null => homewardTools,
          },
          markets: markets,
        ),
        catalog: CatalogValidator(homewardCatalogDocument()),
        settings: TurnSettings(
          maxCorrections: config.maxCorrections,
          thinkingLevel: config.thinkingLevel,
        ),
        now: now,
      ),
    );
  }

  const Providers._({
    required this.config,
    required this.identity,
    required this.appCheck,
    required this.verifyKey,
    required this.sessions,
    required this.markets,
    required this.tasks,
    required this.turnLimiter,
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
    final firebase = FirebaseApp.initializeApp(
      options: AppOptions(projectId: config.projectId),
    );
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
      sessions: switch (config.sessionStore) {
        SessionStore.firestore => FirestoreSessionRepository(
          firebase.firestore(),
        ),
        SessionStore.memory => null,
      },
      identity: FirebaseIdentityVerifier(firebase.auth()),
      appCheck: FirebaseAppCheckVerifier(firebase.appCheck()),
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
      verifyKey: (apiKey) => models.ensureAvailable(
        apiKey: apiKey,
        model: config.turnModels.first,
      ),
      markets: MarketDirectory(marketsData),
      prompts: PromptAssembler.load(Directory(config.promptsDirectory)),
      research: Research.open(httpClient, userAgent: homewardUserAgent(config)),
    );
  }

  final ServerConfig config;
  final IdentityVerifier identity;
  final AppCheckVerifier appCheck;
  final VerifyGeminiKey verifyKey;
  final SessionRepository sessions;
  final MarketDirectory markets;
  final TaskRegistry tasks;
  final FixedWindowLimiter turnLimiter;
  final TurnOrchestrator turns;
}
