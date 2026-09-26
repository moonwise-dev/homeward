import 'package:common/common.dart';
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

  test('other components are not its business', () {
    expect(hunchProblem({'id': 'x', 'component': 'Text'}), isNull);
  });

  test('needs are named needs, or none', () {
    expect(
      hunchProblem(
        hunch('needs', [
          {
            'label': 'Step-free, and a shower',
            'value': 'stepFree,entryLevelShower',
          },
          {'label': 'Stairs are fine', 'value': 'none'},
        ]),
      ),
      isNull,
    );
    expect(
      hunchProblem(
        hunch('needs', [
          {'label': 'A sauna', 'value': 'sauna'},
          {'label': 'Stairs are fine', 'value': 'none'},
        ]),
      ),
      isNotNull,
    );
  });

  test('a question the case does not still need is sent back', () {
    const mustAsk = {CaseFacet.needs, CaseFacet.routine};

    expect(
      caseQuestionProblem(hunch('mode', const []), mustAsk),
      allOf(contains('needs, routine'), contains('not mode')),
    );
    expect(caseQuestionProblem(hunch('needs', const []), mustAsk), isNull);
    expect(
      caseQuestionProblem({
        'id': 'week',
        'component': 'Routine',
      }, mustAsk),
      isNull,
    );
    expect(caseQuestionProblem(hunch('mode', const []), const {}), isNull);
    expect(
      caseQuestionProblem({'id': 'draft', 'component': 'StoryDraft'}, mustAsk),
      contains('the case summary comes once they are answered'),
    );
  });
}
