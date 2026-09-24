import 'dart:io';

import 'package:homeward_tool/eval/eval_case.dart';
import 'package:homeward_tool/eval/load_cases.dart';
import 'package:test/test.dart';

void main() {
  final cases = loadCases(Directory('eval/cases'));

  test('every case the recording depends on loads', () {
    expect(cases.map((evalCase) => evalCase.id), [
      'azores-uncovered',
      'change-down-payment',
      'lisbon-city-only',
      'madeira-nonresident',
      'madeira-resident-contrast',
      'stockholm-family',
      'stockholm-first-time',
    ]);
  });

  test('a tapped home travels with the action', () {
    final choose = cases
        .singleWhere((evalCase) => evalCase.id == 'stockholm-family')
        .turns
        .map((turn) => turn.input)
        .whereType<EvalAction>()
        .singleWhere((action) => action.name == 'choose_home');

    expect(choose.tapped, {'candidateId': 'c1'});
  });

  test('a case runs to only the ids it names', () {
    expect(
      loadCases(
        Directory('eval/cases'),
        only: ['madeira-nonresident'],
      ).single.id,
      'madeira-nonresident',
    );
  });

  test('a turn is text or an action with the data the form holds', () {
    final hero = cases.firstWhere(
      (evalCase) => evalCase.id == 'madeira-nonresident',
    );

    expect(hero.persona, 'cross-border');
    expect(hero.turns.first.input, isA<EvalText>());
    expect(
      hero.turns.first.expect.toolsCalled,
      ['resolve_market', 'load_market'],
    );
    expect(
      hero.turns.first.expect.componentsExclude,
      contains('StressTestChart'),
    );
    expect(
      hero.turns.last.input,
      isA<EvalAction>()
          .having((action) => action.name, 'name', 'commit_profile')
          .having(
            (action) => (action.overrides['profile']! as Map)['age'],
            'age',
            42,
          ),
    );
    expect(hero.turns.last.expect.componentsInclude, contains('AmountSlider'));
  });
}
