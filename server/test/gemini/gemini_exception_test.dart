import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:test/test.dart';

void main() {
  final now = DateTime.utc(2026, 9, 24, 12);
  const busy =
      'gemini-3.8-flash is currently experiencing high demand, spikes in '
      'demand are usually temporary. Please try again later.';

  test('high demand is unavailable whatever status carries it', () {
    expect(
      geminiHttpError(
        statusCode: 400,
        body: '{"error":{"message":"$busy","code":"invalid_request"}}',
        model: 'gemini-3.8-flash',
        continuesHistory: false,
        now: now,
      ),
      isA<GeminiUnavailable>(),
    );
    expect(
      geminiStreamError(
        error: {'message': busy, 'code': 'unavailable'},
        model: 'gemini-3.8-flash',
        now: now,
      ),
      isA<GeminiUnavailable>(),
    );
  });

  test('a request the API refuses for its content stays invalid', () {
    expect(
      geminiStreamError(
        error: {'message': 'The tool schema is invalid', 'code': 'invalid'},
        model: 'gemini-3.8-flash',
        now: now,
      ),
      isA<GeminiRequestInvalid>(),
    );
  });
}
