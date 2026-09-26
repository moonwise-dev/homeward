import 'package:homeward_server/agent/validation/json_repair.dart';
import 'package:test/test.dart';

void main() {
  test('drops a closing brace too many', () {
    expect(
      repairedJson('{"list":[{"a":{"b":1}}},{"c":2}]}'),
      {
        'list': [
          {
            'a': {'b': 1},
          },
          {'c': 2},
        ],
      },
    );
  });

  test('turns single-quoted strings into JSON strings', () {
    expect(
      repairedJson(
        '{"segments":[{"type":"text","text":\', with two children\'}]}',
      ),
      {
        'segments': [
          {'type': 'text', 'text': ', with two children'},
        ],
      },
    );
  });

  test('leaves what it cannot mend', () {
    expect(repairedJson('{"a": nope}'), isNull);
  });
}
