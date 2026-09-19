sealed class EvalInput {
  const EvalInput();
}

final class EvalText extends EvalInput {
  const EvalText(this.text);

  final String text;
}

final class EvalAction extends EvalInput {
  const EvalAction(this.name, {this.overrides = const {}});

  final String name;
  final Map<String, Object?> overrides;
}

final class EvalExpectations {
  const EvalExpectations({
    this.toolsCalled = const [],
    this.toolsAllowed = const [],
    this.market,
    this.coverage,
    this.componentsInclude = const [],
    this.componentsExclude = const [],
    this.profileFieldsAsked,
    this.bindingConstraint,
    this.maxModelRounds = 2,
  });

  final List<String> toolsCalled;
  final List<String> toolsAllowed;
  final String? market;
  final String? coverage;
  final List<String> componentsInclude;
  final List<String> componentsExclude;
  final List<String>? profileFieldsAsked;
  final String? bindingConstraint;
  final int maxModelRounds;
}

final class EvalTurn {
  const EvalTurn({required this.input, required this.expect});

  final EvalInput input;
  final EvalExpectations expect;
}

final class EvalCase {
  const EvalCase({required this.id, required this.turns, this.persona});

  final String id;
  final String? persona;
  final List<EvalTurn> turns;
}
