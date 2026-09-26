import 'package:homeward_server/agent/prompt/turn_context.dart';
import 'package:test/test.dart';

void main() {
  test('the context names the turn, the screen, and the brief', () {
    final screen = [
      {'id': 'root', 'component': 'Text', 'text': 'Your move'},
    ];
    final brief = {
      'city': {'id': 'city', 'kind': 'place', 'text': 'Stockholm'},
    };

    expect(turnContext(turn: 3, screen: screen, brief: brief), {
      'turn': 3,
      'screen': screen,
      'brief': brief,
    });
  });

  test('the screen and brief are empty before anything is drawn', () {
    expect(turnContext(turn: 1, screen: const [], brief: const {}), {
      'turn': 1,
      'screen': <Object?>[],
      'brief': <String, Object?>{},
    });
  });
}
