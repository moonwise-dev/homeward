import 'dart:convert';
import 'dart:io';

import 'eval_case.dart';
import 'eval_score.dart';
import 'turn_observation.dart';

final class TurnReport {
  const TurnReport({required this.observed, required this.scores});

  final TurnObservation observed;
  final List<Score> scores;

  bool get passed => scores.every((score) => score.passed);

  Map<String, Object?> toJson() => {
    'turn': observed.index,
    'passed': passed,
    'scores': [
      for (final score in scores)
        {
          'name': score.name,
          'passed': score.passed,
          if (score.detail case final detail? when detail.isNotEmpty)
            'detail': detail,
        },
    ],
    'metrics': {
      'toolsCalled': observed.toolsCalled,
      'toolsRun': observed.toolsRun.toList(),
      'rejections': observed.rejections,
      'failure': ?observed.failure,
      'components': observed.components,
      'profileFieldsAsked': observed.profileFieldsAsked.toList(),
      'modelRounds': observed.modelRounds,
      'corrections': observed.corrections,
      'latencyMs': observed.elapsed.inMilliseconds,
      'marketId': observed.marketId,
      'bindingConstraint': observed.bindingConstraint,
    },
  };
}

final class CaseReport {
  const CaseReport({required this.evalCase, required this.turns});

  final EvalCase evalCase;
  final List<TurnReport> turns;

  bool get passed =>
      turns.length == evalCase.turns.length &&
      turns.every((turn) => turn.passed);

  Map<String, Object?> toJson() => {
    'id': evalCase.id,
    'passed': passed,
    'turns': [for (final turn in turns) turn.toJson()],
  };
}

final class EvalReport {
  const EvalReport({required this.at, required this.cases});

  final DateTime at;
  final List<CaseReport> cases;

  bool get passed => cases.every((report) => report.passed);

  Map<String, Object?> toJson() => {
    'at': at.toIso8601String(),
    'passed': passed,
    'cases': [for (final report in cases) report.toJson()],
  };

  String get summary {
    final lines = StringBuffer('# Eval ${at.toIso8601String()}\n');
    for (final report in cases) {
      lines.writeln('\n## ${report.evalCase.id} ${_mark(report.passed)}');
      for (final turn in report.turns) {
        lines.writeln(
          '\nTurn ${turn.observed.index}: '
          '${turn.observed.modelRounds} rounds, '
          '${turn.observed.corrections} corrections, '
          '${turn.observed.elapsed.inMilliseconds} ms',
        );
        for (final score in turn.scores) {
          final detail = score.detail;
          lines.writeln(
            '- ${_mark(score.passed)} ${score.name}'
            '${detail == null || detail.isEmpty ? '' : ' ($detail)'}',
          );
        }
      }
    }
    return lines.toString();
  }

  List<String> changesFrom(Map<String, Object?> previous) {
    final before = {
      for (final report
          in (previous['cases'] as List<Object?>? ?? const [])
              .cast<Map<String, Object?>>())
        report['id']! as String: report['passed']! as bool,
    };
    return [
      for (final report in cases)
        if (before[report.evalCase.id] case final was?
            when was != report.passed)
          '${report.evalCase.id}: ${_mark(was)} to ${_mark(report.passed)}',
    ];
  }

  static String _mark(bool passed) => passed ? 'pass' : 'FAIL';
}

File writeReport(Directory directory, EvalReport report) {
  directory.createSync(recursive: true);
  final stamp = report.at.toIso8601String().replaceAll(':', '-');
  File('${directory.path}/$stamp.md').writeAsStringSync(report.summary);
  return File('${directory.path}/$stamp.json')..writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(report.toJson()),
  );
}

Map<String, Object?>? lastReport(Directory directory) {
  if (!directory.existsSync()) {
    return null;
  }
  final reports =
      directory
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.json'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));
  return reports.isEmpty
      ? null
      : jsonDecode(reports.last.readAsStringSync()) as Map<String, Object?>;
}
