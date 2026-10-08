import 'dart:convert';

import 'package:common/common.dart';
import 'package:homeward_server/data/repository/session_repository.dart';
import 'package:homeward_server/sessions/sessions_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  late SessionRepository sessions;
  late SessionsHandler handler;
  var made = 0;

  setUp(() {
    made = 0;
    sessions = SessionRepository(newId: () => 's-${++made}');
    handler = SessionsHandler(sessions);
  });

  Request get(String path) =>
      Request('GET', Uri.parse('http://localhost$path'));

  Future<Object?> dataOf(Response response) async =>
      (jsonDecode(await response.readAsString())
          as Map<String, Object?>)['data'];

  test('creates an empty plan', () async {
    final response = handler.create(
      Request('POST', Uri.parse('http://localhost/api/sessions')),
    );

    expect(response.statusCode, 201);
    expect(await dataOf(response), {'sessionId': 's-1'});
    expect(sessions.find('s-1')?.turns, isEmpty);
  });

  test('gives back the turns of a plan', () async {
    final session = sessions.create();
    sessions.save(
      session.copyWith(
        turnCount: 1,
        turns: [
          const TurnRecord(
            index: 1,
            input: RecordedInput.text('I am buying in Stockholm'),
            outputText: 'Sweden it is.',
            status: TurnStatus.completed,
            messages: [
              {'version': 'v0.9'},
            ],
          ),
        ],
      ),
    );

    final transcript = PlanTranscript.fromJson(
      await dataOf(handler.transcript(get('/api/sessions/s-1'), 's-1'))
          as Map<String, Object?>,
    );

    expect(transcript.sessionId, 's-1');
    expect(transcript.turns.single.outputText, 'Sweden it is.');
    expect(
      transcript.turns.single.input,
      const RecordedInput.text('I am buying in Stockholm'),
    );
  });

  test('has nothing for a plan it does not hold', () {
    final response = handler.transcript(get('/api/sessions/s-9'), 's-9');

    expect(response.statusCode, 404);
  });
}
