import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/probe/describe_event.dart';
import 'package:homeward_tool/probe/firebase_web_api_key.dart';
import 'package:homeward_tool/probe/probe_client.dart';
import 'package:homeward_tool/probe/probe_gemini_key.dart';
import 'package:homeward_tool/probe/probe_surfaces.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  final geminiKey = probeGeminiKey(Platform.environment);
  if (geminiKey == null || arguments.length < 2) {
    stderr.writeln(
      'Usage: probe_turn <server url> <message or @action {slice overrides}>…\n'
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
  final surfaces = ProbeSurfaces();
  try {
    final idToken = await probe.anonymousIdToken(
      firebaseWebApiKey(File('app/lib/firebase_options.dart')),
    );
    final sessionId = await probe.createSession(idToken);
    stdout.writeln('Session $sessionId');
    for (final input in arguments.skip(1)) {
      final List<A2aPart> parts;
      Map<String, Object?>? metadata;
      if (input.startsWith('@')) {
        final separator = input.indexOf(' ');
        final name = input.substring(1, separator == -1 ? null : separator);
        final overrides = separator == -1
            ? const <String, Object?>{}
            : jsonDecode(input.substring(separator + 1))
                  as Map<String, Object?>;
        final found = surfaces.actionFor(name, overrides);
        if (found == null) {
          stdout.writeln('\nNo surface offers $name; stopping');
          return;
        }
        parts = [
          A2aPart.data(
            data: {
              'version': A2uiExtension.version,
              'action': found.action.toJson(),
            },
          ),
        ];
        metadata = {
          'a2uiClientDataModel': {
            'version': A2uiExtension.version,
            'surfaces': {found.action.surfaceId: found.surfaceData},
          },
        };
        stdout.writeln('\n> $name from ${found.action.surfaceId}');
      } else {
        parts = [A2aPart.text(text: input)];
        stdout.writeln('\n> $input');
      }
      final clock = Stopwatch()..start();
      Duration? firstText;
      var finalText = '';
      await for (final event in probe.streamTurn(
        idToken: idToken,
        geminiKey: geminiKey,
        sessionId: sessionId,
        parts: parts,
        metadata: metadata,
      )) {
        switch (event) {
          case {'error': final Map<String, Object?> error}:
            stdout.writeln('[${clock.elapsed.inMilliseconds} ms] error $error');
          case {'result': {'status': final Map<String, Object?> status}}:
            final eventParts = switch (status) {
              {'message': {'parts': final List<Object?> list}} => list,
              _ => const <Object?>[],
            };
            for (final part in eventParts) {
              switch (part) {
                case {'kind': 'text', 'text': final String partText}:
                  firstText ??= clock.elapsed;
                  finalText = partText;
                case {'kind': 'data', 'data': final Map<String, Object?> data}:
                  surfaces.record(data);
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
