import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/probe/anonymous_id_token.dart';
import 'package:homeward_tool/probe/describe_event.dart';
import 'package:homeward_tool/probe/firebase_web_api_key.dart';
import 'package:homeward_tool/probe/probe_gemini_key.dart';
import 'package:homeward_tool/probe/probe_surfaces.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  final geminiKey = probeGeminiKey(Platform.environment);
  if (geminiKey == null || arguments.length < 2) {
    stderr.writeln(
      'Usage: probe_turn <server url> '
      '<message, #reason message, or @action {slice overrides}>…\n'
      'The Gemini key comes from HOMEWARD_EVAL_GEMINI_KEY or '
      '~/.config/homeward/gemini_key.',
    );
    exitCode = 64;
    return;
  }
  final httpClient = http.Client();
  try {
    final idToken = await anonymousIdToken(
      httpClient,
      firebaseWebApiKey(File('app/lib/firebase_options.dart')),
    );
    final client = HomewardClient(
      httpClient: httpClient,
      server: Uri.parse(arguments.first),
      credentials: () async => RequestCredentials(idToken: idToken),
    );
    final sessionId = await client.createSession();
    stdout.writeln('Session $sessionId');
    final surfaces = ProbeSurfaces();
    for (final input in arguments.skip(1)) {
      final request = _requestFor(input, surfaces);
      if (request == null) {
        stdout.writeln('\nNo surface offers $input; stopping');
        return;
      }
      stdout.writeln('\n> $input');
      await _probeTurn(client, sessionId, geminiKey, request, surfaces);
    }
  } finally {
    httpClient.close();
  }
}

TurnRequest? _requestFor(String input, ProbeSurfaces surfaces) {
  final separator = input.indexOf(' ');
  if (input.startsWith('#') && separator != -1) {
    return TurnRequest.text(
      input.substring(separator + 1),
      reason: StoryReason.values.byName(input.substring(1, separator)),
    );
  }
  if (!input.startsWith('@')) {
    return TurnRequest.text(input);
  }
  final name = input.substring(1, separator == -1 ? null : separator);
  final overrides = separator == -1
      ? const <String, Object?>{}
      : jsonDecode(input.substring(separator + 1)) as Map<String, Object?>;
  return switch (surfaces.actionFor(name, overrides)) {
    (:final action, :final surfaceData) => TurnRequest.action(
      action,
      surfaceData: surfaceData,
    ),
    null => null,
  };
}

Future<void> _probeTurn(
  HomewardClient client,
  String sessionId,
  String geminiKey,
  TurnRequest request,
  ProbeSurfaces surfaces,
) async {
  final clock = Stopwatch()..start();
  void log(String line) =>
      stdout.writeln('[${clock.elapsed.inMilliseconds} ms] $line');
  Duration? firstText;
  var text = '';
  try {
    await for (final event in client.send(
      sessionId: sessionId,
      geminiKey: geminiKey,
      request: request,
    )) {
      switch (event) {
        case AgentStarted(:final taskId):
          log('task $taskId');
        case AgentText(text: final latest):
          firstText ??= clock.elapsed;
          text = latest;
        case AgentA2ui(:final message):
          surfaces.record(message);
          if (describeA2uiMessage(message) case final description?) {
            log(description);
          }
        case AgentProgress(:final progress):
          log(
            [
              for (final step in progress.steps)
                '${step.state.name}: ${step.label}',
            ].join(' · '),
          );
        case AgentCompleted(text: final latest):
          text = latest;
          log('completed');
        case AgentCanceled():
          log('canceled');
      }
    }
  } on HomewardApiException catch (error) {
    log('error ${error.code.wireName}: ${error.message}');
  }
  stdout
    ..writeln('First text after ${firstText?.inMilliseconds} ms')
    ..writeln('Text: $text');
}
