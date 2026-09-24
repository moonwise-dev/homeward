import 'dart:io';

import 'package:homeward_server/config/server_config.dart';
import 'package:homeward_tool/eval/eval_report.dart';
import 'package:homeward_tool/eval/eval_runner.dart';
import 'package:homeward_tool/eval/eval_score.dart';
import 'package:homeward_tool/eval/eval_server.dart';
import 'package:homeward_tool/eval/load_cases.dart';
import 'package:homeward_tool/eval/turn_log.dart';
import 'package:homeward_tool/probe/gemini_keys.dart';

Future<void> main(List<String> arguments) async {
  final keys = GeminiKeys.fromEnvironment(Platform.environment);
  if (keys == null) {
    stderr.writeln(
      'Usage: eval [case id]…\n'
      'Gemini keys come from ${GeminiKeys.names.join(' and ')}, '
      'which make reads from .env.',
    );
    exitCode = 64;
    return;
  }
  final cases = loadCases(Directory('tool/eval/cases'), only: arguments);
  if (cases.isEmpty) {
    stderr.writeln('No cases matched ${arguments.join(', ')}');
    exitCode = 64;
    return;
  }
  final server = EvalServer.start(
    ServerConfig.fromEnvironment(Platform.environment),
  );
  final log = TurnLog();
  final runner = EvalRunner(server, log);
  final reports = <CaseReport>[];
  try {
    for (final evalCase in cases) {
      stdout.writeln('==> ${evalCase.id}');
      if (reports.isNotEmpty) {
        await Future<void>.delayed(const Duration(seconds: 20));
      }
      final observations = await runner.run(evalCase, keys: keys);
      reports.add(
        CaseReport(
          evalCase: evalCase,
          turns: [
            for (final (index, observed) in observations.indexed)
              TurnReport(
                observed: observed,
                scores: scoreTurn(evalCase.turns[index].expect, observed),
              ),
          ],
        ),
      );
    }
  } finally {
    await log.close();
    server.close();
  }
  final directory = Directory('tool/eval/reports');
  final previous = lastReport(directory);
  final report = EvalReport(at: DateTime.now(), cases: reports);
  final file = writeReport(directory, report);
  stdout
    ..writeln(report.summary)
    ..writeln('Report ${file.path}');
  if (previous != null) {
    for (final change in report.changesFrom(previous)) {
      stdout.writeln('Changed since the last report: $change');
    }
  }
  exitCode = report.passed ? 0 : 1;
}
