import 'package:homeward_server/agent/prompt/turn_context.dart';
import 'package:test/test.dart';

void main() {
  test('the context names the turn and the screen as it stands', () {
    final screen = [
      {'id': 'root', 'component': 'Text', 'text': 'Your move'},
    ];

    expect(turnContext(turn: 3, screen: screen), {
      'turn': 3,
      'screen': screen,
    });
  });

  test('the screen is empty before anything is drawn', () {
    expect(turnContext(turn: 1, screen: const []), {
      'turn': 1,
      'screen': <Object?>[],
    });
  });
}
