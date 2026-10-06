import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/probe/anonymous_id_token.dart';
import 'package:homeward_tool/probe/describe_event.dart';
import 'package:homeward_tool/probe/firebase_web_api_key.dart';
import 'package:homeward_tool/probe/gemini_keys.dart';
import 'package:homeward_tool/probe/probe_surfaces.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  final keys = GeminiKeys.fromEnvironment(Platform.environment);
  if (keys == null || arguments.length < 2) {
    stderr.writeln(
      'Usage: probe_turn <server url> '
      '<message, @action {slice overrides}, @pick <option or number>, '
      '@fill <answer> | <answer>, or @tap <action> {added context}>…\n'
      'Gemini keys come from ${GeminiKeys.names.join(' and ')}, '
      'which make reads from .env.',
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
    for (final (index, input) in arguments.skip(1).indexed) {
      if (index > 0 && _pause > Duration.zero) {
        await Future<void>.delayed(_pause);
      }
      final request = _requestFor(input, surfaces);
      if (request == null) {
        stdout.writeln('\nNo surface offers $input; stopping');
        return;
      }
      stdout.writeln('\n> $input');
      if (request case ActionTurnRequest(:final action) when _detail) {
        stdout.writeln('  ${action.name} ${jsonEncode(action.context)}');
      }
      surfaces.nextTurn();
      while (keys.moveOnAfter(
        await _probeTurn(client, sessionId, keys.current, request, surfaces),
      )) {
        stdout.writeln('That Gemini key hit its limit; trying the next key');
      }
    }
  } finally {
    httpClient.close();
  }
}

final _detail = Platform.environment.containsKey('HOMEWARD_PROBE_DETAIL');

final _pause = Duration(
  seconds:
      int.tryParse(
        Platform.environment['HOMEWARD_PROBE_PAUSE_SECONDS'] ?? '',
      ) ??
      0,
);

TurnRequest? _requestFor(String input, ProbeSurfaces surfaces) {
  final separator = input.indexOf(' ');
  if (!input.startsWith('@')) {
    return TurnRequest.text(input);
  }
  final name = input.substring(1, separator == -1 ? null : separator);
  final rest = separator == -1 ? '' : input.substring(separator + 1).trim();
  final tapped = switch (name) {
    'pick' => surfaces.pick(rest),
    'fill' => surfaces.fill([
      for (final answer in rest.split('|')) answer.trim(),
    ]),
    'tap' => switch (rest.indexOf(' ')) {
      -1 => surfaces.actionFor(rest, const {}),
      final space => surfaces.actionFor(
        rest.substring(0, space),
        const {},
        tapped: jsonDecode(rest.substring(space + 1)) as Map<String, Object?>,
      ),
    },
    _ => null,
  };
  if (const {'pick', 'fill', 'tap'}.contains(name)) {
    return switch (tapped) {
      (:final action, :final surfaceData) => TurnRequest.action(
        action,
        surfaceData: surfaceData,
      ),
      null => null,
    };
  }
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

Future<String?> _probeTurn(
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
          if (describeA2uiMessage(message, detail: _detail)
              case final description?) {
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
    return error.code.wireName;
  }
  stdout
    ..writeln('First text after ${firstText?.inMilliseconds} ms')
    ..writeln('Text: $text');
  return null;
}
