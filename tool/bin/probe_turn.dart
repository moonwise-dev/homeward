import 'dart:io';

import 'package:homeward_tool/probe/describe_event.dart';
import 'package:homeward_tool/probe/firebase_web_api_key.dart';
import 'package:homeward_tool/probe/probe_gemini_key.dart';
import 'package:homeward_tool/probe/probe_client.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  final geminiKey = probeGeminiKey(Platform.environment);
  if (geminiKey == null || arguments.length < 2) {
    stderr.writeln(
      'Usage: probe_turn <server url> <message>…\n'
      'The Gemini key comes from HOMEWARD_EVAL_GEMINI_KEY or '
      '~/.config/homeward/gemini_key.',
    );
    exitCode = 64;
    return;
  }
  final httpClient = http.Client();
  final probe = ProbeClient(
    httpClient: httpClient,
    server: Uri.parse(
      arguments.first.endsWith('/') ? arguments.first : '${arguments.first}/',
    ),
  );
  try {
    final idToken = await probe.anonymousIdToken(
      firebaseWebApiKey(File('app/lib/firebase_options.dart')),
    );
    final sessionId = await probe.createSession(idToken);
    stdout.writeln('Session $sessionId');
    for (final text in arguments.skip(1)) {
      stdout.writeln('\n> $text');
      final clock = Stopwatch()..start();
      Duration? firstText;
      var finalText = '';
      await for (final event in probe.streamTurn(
        idToken: idToken,
        geminiKey: geminiKey,
        sessionId: sessionId,
        text: text,
      )) {
        switch (event) {
          case {'error': final Map<String, Object?> error}:
            stdout.writeln('[${clock.elapsed.inMilliseconds} ms] error $error');
          case {'result': {'status': final Map<String, Object?> status}}:
            final parts = switch (status) {
              {'message': {'parts': final List<Object?> parts}} => parts,
              _ => const <Object?>[],
            };
            for (final part in parts) {
              switch (part) {
                case {'kind': 'text', 'text': final String partText}:
                  firstText ??= clock.elapsed;
                  finalText = partText;
                case {'kind': 'data', 'data': final Map<String, Object?> data}:
                  if (describeA2uiMessage(data) case final description?) {
                    stdout.writeln(
                      '[${clock.elapsed.inMilliseconds} ms] $description',
                    );
                  }
              }
            }
            if (status['state'] != 'working') {
              stdout.writeln(
                '[${clock.elapsed.inMilliseconds} ms] ${status['state']}',
              );
            }
        }
      }
      stdout
        ..writeln('First text after ${firstText?.inMilliseconds} ms')
        ..writeln('Text: $finalText');
    }
  } finally {
    httpClient.close();
  }
}
