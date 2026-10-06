import 'dart:io';

import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/auth/app_check_verifier.dart';
import 'package:homeward_server/auth/identity_verifier.dart';
import 'package:homeward_server/config/server_config.dart';
import 'package:homeward_server/data/providers/providers.dart';
import 'package:homeward_server/gemini/gemini_exception.dart';

import '../agent/turn/scripted_interactions.dart';
import 'test_markets.dart';
import 'test_research.dart';

final class TokenIdentityVerifier implements IdentityVerifier {
  const TokenIdentityVerifier(this.uids);

  final Map<String, String> uids;

  @override
  Future<String?> uidFor(String idToken) async => uids[idToken];
}

final class TokenAppCheckVerifier implements AppCheckVerifier {
  const TokenAppCheckVerifier(this.valid);

  final Set<String> valid;

  @override
  Future<bool> verify(String token) async => valid.contains(token);
}

Providers testProviders({
  Map<String, String> environment = const {},
  ScriptedInteractions? script,
}) => Providers(
  config: ServerConfig.fromEnvironment({
    'HOMEWARD_PUBLIC_URL': 'https://homeward.example.run.app',
    'HOMEWARD_MAX_FINISHING_ROUNDS': '0',
    'HOMEWARD_MAX_OVERLOAD_RETRIES': '0',
    ...environment,
  }),
  identity: const TokenIdentityVerifier({'id-token-1': 'uid-1'}),
  appCheck: const TokenAppCheckVerifier({'app-check-1'}),
  createInteraction: (script ?? ScriptedInteractions([])).call,
  verifyKey: (apiKey) async {
    if (apiKey != 'gemini-key-1') {
      throw const GeminiKeyInvalid('API key not valid');
    }
  },
  prompts: PromptAssembler.load(Directory('prompts')),
  markets: testMarkets,
  research: testResearch,
);
