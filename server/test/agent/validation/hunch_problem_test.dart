import 'package:homeward_server/agent/validation/hunch_problem.dart';
import 'package:test/test.dart';

void main() {
  Map<String, Object?> hunch(
    String facet,
    List<Map<String, Object?>> options,
  ) => {'id': 'root', 'component': 'Hunch', 'facet': facet, 'options': options};

  test('values that fit their facet pass', () {
    expect(
      hunchProblem(
        hunch('mode', [
          {'label': 'By bike', 'value': 'bike'},
          {'label': 'By metro', 'value': 'transit'},
        ]),
      ),
      isNull,
    );
    expect(
      hunchProblem(
        hunch('place', [
          {'label': 'KTH', 'value': 'KTH'},
          {'label': 'Somewhere else', 'value': '', 'pin': true},
        ]),
      ),
      isNull,
    );
  });

  test('a value outside the facet names what fits', () {
    final problem = hunchProblem(
      hunch('maxMinutes', [
        {'label': 'Half an hour', 'value': 'half an hour'},
      ]),
    );

    expect(problem, contains('Half an hour'));
    expect(problem, contains('5 to 120'));
  });

  test('a button answering who moves carries its facet and story', () {
    Map<String, Object?> button(Map<String, Object?> context) => {
      'id': 'send',
      'component': 'Button',
      'action': {
        'event': {'name': 'answer', 'context': context},
      },
    };

    expect(
      hunchProblem(button({'facet': 'household', 'storyPath': '/story'})),
      isNull,
    );
    expect(hunchProblem(button({})), contains('household'));
  });

  test('other components are not its business', () {
    expect(hunchProblem({'id': 'x', 'component': 'Text'}), isNull);
  });
}
