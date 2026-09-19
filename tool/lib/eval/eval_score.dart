import 'eval_case.dart';
import 'turn_observation.dart';

final class Score {
  const Score(this.name, {required this.passed, this.detail});

  final String name;
  final bool passed;
  final String? detail;
}

final _amountInProse = RegExp(
  r'([€$£]\s?\d)|(\d[\d\s.,]*\s?(%|kr\b|sek\b|eur\b|euros?\b|kronor\b))',
  caseSensitive: false,
);

List<Score> scoreTurn(EvalExpectations expect, TurnObservation observed) {
  final components = observed.components;
  final missingTools = [
    for (final tool in expect.toolsCalled)
      if (!observed.toolsRun.contains(tool) &&
          !observed.toolsCalled.contains(tool))
        tool,
  ];
  final allowedTools = {...expect.toolsCalled, ...expect.toolsAllowed};
  final extraTools = [
    for (final tool in observed.toolsCalled.toSet())
      if (!allowedTools.contains(tool)) tool,
  ];
  final missingComponents = [
    for (final component in expect.componentsInclude)
      if (!components.contains(component)) component,
  ];
  final forbiddenComponents = [
    for (final component in expect.componentsExclude)
      if (components.contains(component)) component,
  ];
  final amounts = _amountInProse.firstMatch(observed.text)?.group(0);
  return [
    Score(
      'the turn finished',
      passed: observed.errorCode == null,
      detail: observed.errorCode,
    ),
    Score(
      'validated without a correction',
      passed: observed.corrections == 0,
      detail: observed.rejections.isEmpty
          ? '${observed.corrections} corrections'
          : observed.rejections.first,
    ),
    if (expect.toolsCalled.isNotEmpty) ...[
      Score(
        'called the tools the turn needs',
        passed: missingTools.isEmpty,
        detail: missingTools.join(', '),
      ),
      Score(
        'called no tool it did not need',
        passed: extraTools.isEmpty,
        detail: extraTools.join(', '),
      ),
    ],
    if (expect.market case final market?)
      Score(
        'landed on $market',
        passed: observed.marketId == market,
        detail: observed.marketId,
      ),
    if (expect.coverage case final coverage?)
      Score(
        'reported the market as $coverage',
        passed: observed.coverage == coverage,
        detail: observed.coverage,
      ),
    if (expect.componentsInclude.isNotEmpty)
      Score(
        'drew the components the turn calls for',
        passed: missingComponents.isEmpty,
        detail: missingComponents.join(', '),
      ),
    if (expect.componentsExclude.isNotEmpty)
      Score(
        'left out the components it has no facts for',
        passed: forbiddenComponents.isEmpty,
        detail: forbiddenComponents.join(', '),
      ),
    if (expect.profileFieldsAsked case final asked?)
      Score(
        'asked for the facts the rules need',
        passed: observed.profileFieldsAsked.containsAll(asked.toSet()),
        detail: observed.profileFieldsAsked.join(', '),
      ),
    if (expect.bindingConstraint case final binding?)
      Score(
        'the binding constraint is $binding',
        passed: observed.bindingConstraint == binding,
        detail: observed.bindingConstraint,
      ),
    Score(
      'kept amounts out of the prose',
      passed: amounts == null,
      detail: amounts,
    ),
    Score(
      'stayed within ${expect.maxModelRounds} model rounds',
      passed: observed.modelRounds <= expect.maxModelRounds,
      detail: '${observed.modelRounds} rounds',
    ),
  ];
}
