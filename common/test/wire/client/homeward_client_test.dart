import 'dart:async';
import 'dart:convert';

import 'package:common/common.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  final server = Uri.parse('https://homeward.example.run.app');
  late List<http.Request> requests;

  setUp(() => requests = []);

  HomewardClient clientFor(
    Future<http.StreamedResponse> Function(http.BaseRequest request) respond,
  ) => HomewardClient(
    httpClient: MockClient.streaming((request, body) async {
      requests.add(
        http.Request(request.method, request.url)
          ..headers.addAll(request.headers)
          ..body = await body.bytesToString(),
      );
      return respond(request);
    }),
    server: server,
    credentials: () async =>
        const RequestCredentials(idToken: 'id-token', appCheckToken: 'check'),
    newMessageId: () => 'm-1',
  );

  http.StreamedResponse json(int status, Object body) => http.StreamedResponse(
    Stream.value(utf8.encode(jsonEncode(body))),
    status,
    headers: {'content-type': 'application/json'},
  );

  http.StreamedResponse events(List<JsonRpcResponse> responses) =>
      http.StreamedResponse(
        Stream.fromIterable([
          for (final response in responses)
            utf8.encode('data: ${jsonEncode(response.toJson())}\n\n'),
        ]),
        200,
        headers: {'content-type': 'text/event-stream'},
      );

  JsonRpcResponse status(
    TaskState state, {
    List<A2aPart> parts = const [],
    bool isFinal = false,
  }) => JsonRpcResult(
    id: 1,
    result: A2aStreamEvent.statusUpdate(
      taskId: 't-1',
      contextId: 's-1',
      status: TaskStatus(
        state: state,
        message: parts.isEmpty
            ? null
            : A2aMessage(role: A2aRole.agent, parts: parts, messageId: 'a'),
      ),
      isFinal: isFinal,
    ).toJson(),
  );

  final submitted = JsonRpcResult(
    id: 1,
    result: const A2aStreamEvent.task(
      id: 't-1',
      contextId: 's-1',
      status: TaskStatus(state: TaskState.submitted),
    ).toJson(),
  );

  const createSurface = {
    'version': 'v0.9',
    'createSurface': {'surfaceId': 't1-profile', 'catalogId': 'c'},
  };

  test('creates a session with the caller credentials', () async {
    final client = clientFor(
      (_) async => json(201, {
        'ok': true,
        'data': {'sessionId': 's-1'},
      }),
    );

    expect(await client.createSession(), 's-1');
    final request = requests.single;
    expect(request.url, server.resolve('api/sessions'));
    expect(request.headers['authorization'], 'Bearer id-token');
    expect(request.headers[HomewardHeaders.appCheck], 'check');
    expect(request.headers[HomewardHeaders.geminiKey], isNull);
  });

  test('reads the plan list and a plan transcript back', () async {
    final listing = clientFor(
      (_) async => json(200, {
        'ok': true,
        'data': {
          'sessions': [
            {
              'sessionId': 's-1',
              'turnCount': 2,
              'marketId': 'PT-30',
              'marketName': 'Madeira, Portugal',
            },
          ],
        },
      }),
    );

    expect(await listing.plans(), [
      const PlanListing(
        sessionId: 's-1',
        turnCount: 2,
        marketId: 'PT-30',
        marketName: 'Madeira, Portugal',
      ),
    ]);
    expect(requests.single.method, 'GET');
    expect(requests.single.url, server.resolve('api/sessions'));

    requests.clear();
    final transcript = clientFor(
      (_) async => json(200, {
        'ok': true,
        'data': {
          'sessionId': 's-1',
          'turns': [
            {
              'index': 1,
              'input': {'runtimeType': 'text', 'text': 'Hi'},
              'outputText': 'Sweden it is.',
              'status': 'completed',
              'messages': [createSurface],
            },
          ],
          'board': [createSurface],
        },
      }),
    );

    final plan = await transcript.transcript('s-1');

    expect(plan.turns.single.input, const RecordedInput.text('Hi'));
    expect(plan.turns.single.messages, [createSurface]);
    expect(plan.board, [createSurface]);
    expect(requests.single.url, server.resolve('api/sessions/s-1'));
  });

  test('verifies a key and reports the server error code', () async {
    final client = clientFor(
      (_) async => json(422, {
        'ok': false,
        'error': {
          'code': 'gemini_key_invalid',
          'message': 'Gemini did not accept your API key',
        },
      }),
    );

    await expectLater(
      client.verifyKey('AQ.key'),
      throwsA(
        const HomewardApiException(
          code: HomewardErrorCode.geminiKeyInvalid,
          message: 'Gemini did not accept your API key',
        ),
      ),
    );
    expect(requests.single.url, server.resolve('api/keys/verify'));
    expect(requests.single.headers[HomewardHeaders.geminiKey], 'AQ.key');
  });

  test('streams a text turn as typed agent events', () async {
    final client = clientFor(
      (_) async => events([
        submitted,
        status(TaskState.working),
        status(TaskState.working, parts: [const A2aPart.text(text: 'Swe')]),
        status(TaskState.working, parts: [const A2aPart.text(text: 'Sweden')]),
        status(
          TaskState.working,
          parts: [
            const A2aPart.data(
              data: createSurface,
              metadata: {'mimeType': A2uiExtension.mimeType},
            ),
          ],
        ),
        status(
          TaskState.completed,
          parts: [const A2aPart.text(text: 'Sweden it is.')],
          isFinal: true,
        ),
      ]),
    );

    final received = await client
        .send(
          sessionId: 's-1',
          geminiKey: 'AQ.key',
          request: const TurnRequest.text('A flat in Södermalm'),
        )
        .toList();

    expect(received, const [
      AgentEvent.started(taskId: 't-1'),
      AgentEvent.text('Swe'),
      AgentEvent.text('Sweden'),
      AgentEvent.a2ui(createSurface),
      AgentEvent.completed('Sweden it is.'),
    ]);
    final request = requests.single;
    expect(request.url, server.resolve('a2a'));
    expect(request.headers[A2uiExtension.header], A2uiExtension.uri);
    expect(request.headers[HomewardHeaders.geminiKey], 'AQ.key');
    expect(request.headers['accept'], 'text/event-stream');
    expect(jsonDecode(request.body), {
      'jsonrpc': '2.0',
      'id': 1,
      'method': 'message/stream',
      'params': {
        'message': {
          'role': 'user',
          'parts': [
            {'kind': 'text', 'text': 'A flat in Södermalm'},
          ],
          'messageId': 'm-1',
          'contextId': 's-1',
          'metadata': {
            'a2uiClientCapabilities': {
              'v0.9': {
                'supportedCatalogIds': [homewardCatalogId],
              },
            },
          },
          'kind': 'message',
        },
      },
    });
  });

  test('sends an action with its surface data model', () async {
    final client = clientFor((_) async => events([submitted]));
    const action = ClientAction(
      name: 'commit_profile',
      surfaceId: 't1-profile',
      sourceComponentId: 'save',
      context: {'profilePath': '/profile'},
    );

    await client
        .send(
          sessionId: 's-1',
          geminiKey: 'AQ.key',
          request: const TurnRequest.action(
            action,
            surfaceData: {
              'profile': {'adults': 2},
            },
          ),
        )
        .drain<void>();

    final message = switch (jsonDecode(requests.single.body)) {
      {'params': {'message': final Map<String, Object?> message}} => message,
      _ => fail('No message in the request'),
    };
    expect(message['parts'], [
      {
        'kind': 'data',
        'data': {'version': 'v0.9', 'action': action.toJson()},
      },
    ]);
    expect(
      message['metadata'],
      containsPair('a2uiClientDataModel', {
        'version': 'v0.9',
        'surfaces': {
          't1-profile': {
            'profile': {'adults': 2},
          },
        },
      }),
    );
  });

  test('fails the stream with a failed turn error code', () async {
    final client = clientFor(
      (_) async => events([
        submitted,
        const JsonRpcErrorResponse(
          id: 1,
          error: JsonRpcError(
            code: A2aErrorCodes.homeward,
            message: 'Your Gemini key has reached a request limit',
            data: {'code': 'gemini_quota_exhausted', 'retryAfterSeconds': 40},
          ),
        ),
      ]),
    );

    final received = <AgentEvent>[];
    await expectLater(
      client
          .send(
            sessionId: 's-1',
            geminiKey: 'AQ.key',
            request: const TurnRequest.text('Hi'),
          )
          .forEach(received.add),
      throwsA(
        const HomewardApiException(
          code: HomewardErrorCode.geminiQuotaExhausted,
          message: 'Your Gemini key has reached a request limit',
          retryAfter: Duration(seconds: 40),
        ),
      ),
    );
    expect(received, const [AgentEvent.started(taskId: 't-1')]);
  });

  test(
    'fails the stream when the server refuses it before streaming',
    () async {
      final client = clientFor(
        (_) async => json(401, {
          'jsonrpc': '2.0',
          'error': {
            'code': -32000,
            'message': 'Sign in again to continue',
            'data': {'code': 'unauthenticated'},
          },
        }),
      );

      await expectLater(
        client
            .send(
              sessionId: 's-1',
              geminiKey: 'AQ.key',
              request: const TurnRequest.text('Hi'),
            )
            .drain<void>(),
        throwsA(
          isA<HomewardApiException>().having(
            (error) => error.code,
            'code',
            HomewardErrorCode.unauthenticated,
          ),
        ),
      );
    },
  );

  test('aborts the request when the listener cancels', () async {
    final aborted = Completer<void>();
    final client = clientFor((request) async {
      final trigger = (request as http.Abortable).abortTrigger!;
      final body = StreamController<List<int>>()
        ..add(utf8.encode('data: ${jsonEncode(submitted.toJson())}\n\n'));
      unawaited(
        trigger.whenComplete(() {
          body.addError(http.RequestAbortedException(request.url));
          unawaited(body.close());
          aborted.complete();
        }),
      );
      return http.StreamedResponse(
        body.stream,
        200,
        headers: {'content-type': 'text/event-stream'},
      );
    });

    final events = StreamIterator(
      client.send(
        sessionId: 's-1',
        geminiKey: 'AQ.key',
        request: const TurnRequest.text('Hi'),
      ),
    );
    expect(await events.moveNext(), isTrue);
    await events.cancel();

    await aborted.future.timeout(const Duration(seconds: 1));
  });

  test('cancels a task and tolerates one that already ended', () async {
    var ended = false;
    final client = clientFor(
      (_) async => ended
          ? json(200, {
              'jsonrpc': '2.0',
              'id': 2,
              'error': {
                'code': A2aErrorCodes.taskNotCancelable,
                'message': 'Task can no longer be canceled',
              },
            })
          : json(200, submitted.toJson()),
    );

    await client.cancelTask('t-1');
    ended = true;
    await client.cancelTask('t-1');

    expect(jsonDecode(requests.first.body), {
      'jsonrpc': '2.0',
      'id': 1,
      'method': 'tasks/cancel',
      'params': {'id': 't-1'},
    });
    expect(requests.first.headers[HomewardHeaders.geminiKey], isNull);
  });
}
