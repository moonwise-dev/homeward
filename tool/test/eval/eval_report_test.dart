import 'dart:convert';
import 'dart:io';

import 'package:homeward_tool/eval/eval_case.dart';
import 'package:homeward_tool/eval/eval_report.dart';
import 'package:homeward_tool/eval/eval_score.dart';
import 'package:homeward_tool/eval/turn_observation.dart';
import 'package:test/test.dart';

void main() {
  const evalCase = EvalCase(
    id: 'madeira-nonresident',
    turns: [
      EvalTurn(
        input: EvalText('A flat in Funchal'),
        expect: EvalExpectations(market: 'PT-30'),
      ),
    ],
  );

  EvalReport reportOf({required bool passed}) => EvalReport(
    at: DateTime.utc(2026, 9, 19, 8, 30),
    cases: [
      CaseReport(
        evalCase: evalCase,
        turns: [
          TurnReport(
            observed: TurnObservation(
              index: 1,
              messages: const [],
              text: 'Madeira it is.',
              toolsCalled: const ['resolve_market'],
              modelRounds: 1,
              corrections: 0,
              elapsed: const Duration(milliseconds: 4200),
              marketId: passed ? 'PT-30' : 'PT',
              coverage: 'curated',
              bindingConstraint: null,
            ),
            scores: [
              Score('landed on PT-30', passed: passed, detail: 'PT'),
            ],
          ),
        ],
      ),
    ],
  );

  test('a report carries every score and the metrics behind it', () {
    final json = reportOf(passed: true).toJson();

    expect(json['passed'], isTrue);
    expect(
      (json['cases']! as List<Object?>).single,
      containsPair('id', 'madeira-nonresident'),
    );
    final turn =
        ((json['cases']! as List<Object?>).single
                as Map<String, Object?>)['turns']!
            as List<Object?>;
    expect(
      (turn.single as Map<String, Object?>)['metrics'],
      containsPair('latencyMs', 4200),
    );
  });

  test('the summary reads as a list of turns and their scores', () {
    final summary = reportOf(passed: false).summary;

    expect(summary, contains('## madeira-nonresident FAIL'));
    expect(summary, contains('Turn 1: 1 rounds, 0 corrections, 4200 ms'));
    expect(summary, contains('- FAIL landed on PT-30 (PT)'));
  });

  test('a case that changed since the last report is called out', () {
    expect(
      reportOf(
        passed: false,
      ).changesFrom(reportOf(passed: true).toJson()),
      ['madeira-nonresident: pass to FAIL'],
    );
    expect(reportOf(passed: true).changesFrom(const {}), isEmpty);
  });

  test('a report is written as JSON beside its summary', () {
    final directory = Directory.systemTemp.createTempSync('homeward-eval');
    addTearDown(() => directory.deleteSync(recursive: true));

    final file = writeReport(directory, reportOf(passed: true));

    expect(
      jsonDecode(file.readAsStringSync()),
      containsPair('at', '2026-09-19T08:30:00.000Z'),
    );
    expect(
      File(file.path.replaceAll('.json', '.md')).readAsStringSync(),
      startsWith('# Eval 2026-09-19'),
    );
    expect(lastReport(directory), containsPair('passed', true));
  });
}
