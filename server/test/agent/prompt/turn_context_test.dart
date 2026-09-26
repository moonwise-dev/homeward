import 'package:homeward_server/agent/prompt/turn_context.dart';
import 'package:test/test.dart';

void main() {
  test('the context names the turn and the surfaces already drawn', () {
    expect(turnContext(turn: 3, surfacesUsed: {'t1-story', 't2-week'}), {
      'turn': 3,
      'surfacesUsed': ['t1-story', 't2-week'],
    });
  });
}
