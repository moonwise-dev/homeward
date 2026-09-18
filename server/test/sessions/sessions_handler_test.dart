import 'dart:convert';

import 'package:common/common.dart';
import 'package:homeward_server/data/repository/in_memory_session_repository.dart';
import 'package:homeward_server/request/request_values.dart';
import 'package:homeward_server/sessions/sessions_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import '../tools/tool_fixtures.dart';

void main() {
  late InMemorySessionRepository sessions;
  late SessionsHandler handler;
  var made = 0;

  setUp(() {
    made = 0;
    sessions = InMemorySessionRepository(newId: () => 's-${++made}');
    handler = SessionsHandler(sessions, realMarkets);
  });

  Request get(String path, {String? uid = 'uid-1'}) {
    final request = Request('GET', Uri.parse('http://localhost$path'));
    return uid == null ? request : request.withCallerUid(uid);
  }

  Future<Object?> dataOf(Response response) async =>
      (jsonDecode(await response.readAsString())
          as Map<String, Object?>)['data'];

  test('creates an empty plan owned by the caller', () async {
    final response = await handler.create(
      Request(
        'POST',
        Uri.parse('http://localhost/api/sessions'),
      ).withCallerUid('uid-1'),
    );

    expect(response.statusCode, 201);
    expect(await dataOf(response), {'sessionId': 's-1'});
    expect((await sessions.find('s-1'))?.ownerUid, 'uid-1');
  });

  test('refuses a caller without a verified identity', () async {
    final response = await handler.create(
      Request('POST', Uri.parse('http://localhost/api/sessions')),
    );

    expect(response.statusCode, 401);
    expect(jsonDecode(await response.readAsString()), {
      'ok': false,
      'error': {
        'code': 'unauthenticated',
        'message': 'Sign in again to continue',
      },
    });
  });

  test('lists the caller own plans with the market each is about', () async {
    final mine = await sessions.create('uid-1');
    await sessions.save(
      mine.copyWith(
        plan: Plan(marketId: MarketId.parse('PT-30')),
        turnCount: 3,
      ),
    );
    await sessions.save((await sessions.create('uid-2')));

    final listed =
        (await dataOf(await handler.list(get('/api/sessions'))))!
            as Map<String, Object?>;

    expect(
      [
        for (final listing in listed['sessions']! as List<Object?>)
          PlanListing.fromJson(listing! as Map<String, Object?>),
      ],
      [
        const PlanListing(
          sessionId: 's-1',
          turnCount: 3,
          marketId: 'PT-30',
          marketName: 'Madeira, Portugal',
        ),
      ],
    );
  });

  test('gives back the turns of a plan with a freshly drawn board', () async {
    final session = await sessions.create('uid-1');
    await sessions.save(
      session.copyWith(
        plan: Plan(marketId: MarketId.parse('SE')),
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
      await dataOf(await handler.transcript(get('/api/sessions/s-1'), 's-1'))
          as Map<String, Object?>,
    );

    expect(transcript.sessionId, 's-1');
    expect(transcript.turns.single.outputText, 'Sweden it is.');
    expect(
      transcript.turns.single.input,
      const RecordedInput.text('I am buying in Stockholm'),
    );
    expect(jsonEncode(transcript.board), contains('"surfaceId":"board"'));
  });

  test('hides a plan owned by somebody else', () async {
    await sessions.create('uid-2');

    final response = await handler.transcript(get('/api/sessions/s-1'), 's-1');

    expect(response.statusCode, 404);
  });
}
