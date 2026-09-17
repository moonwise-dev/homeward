import 'dart:async';
import 'dart:convert';

import 'package:common/common.dart';
import 'package:http/http.dart' as http;

import 'gemini_exception.dart';
import 'interaction_cancelled.dart';
import 'interaction_event.dart';
import 'interaction_request.dart';

final class InteractionsClient {
  InteractionsClient({
    required this.httpClient,
    required this.headersDeadline,
    required this.firstStepDeadline,
    Uri? endpoint,
    DateTime Function()? now,
  }) : endpoint = endpoint ?? defaultEndpoint,
       _now = now ?? DateTime.now;

  static final defaultEndpoint = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/interactions?alt=sse',
  );

  final http.Client httpClient;
  final Duration headersDeadline;
  final Duration firstStepDeadline;
  final Uri endpoint;
  final DateTime Function() _now;

  Stream<InteractionEvent> create({
    required String apiKey,
    required String model,
    required InteractionRequest request,
    Future<void>? cancellation,
  }) async* {
    final started = Stopwatch()..start();
    final abort = Completer<void>();
    var cancelled = false;
    final httpRequest =
        http.AbortableRequest(
            'POST',
            endpoint,
            abortTrigger: Future.any([
              abort.future,
              ?cancellation?.whenComplete(() => cancelled = true),
            ]),
          )
          ..headers['content-type'] = 'application/json'
          ..headers['x-goog-api-key'] = apiKey
          ..body = jsonEncode(request.toJson(model: model));
    try {
      final response = await httpClient
          .send(httpRequest)
          .timeout(
            headersDeadline,
            onTimeout: () => throw GeminiUnavailable(
              'No response headers within ${headersDeadline.inSeconds} s',
              model: model,
            ),
          );
      if (response.statusCode != 200) {
        throw geminiHttpError(
          statusCode: response.statusCode,
          body: await response.stream.bytesToString(),
          model: model,
          continuesHistory: request.previousInteractionId != null,
          now: _now(),
        );
      }
      final sse = StreamIterator(decodeSse(response.stream));
      final steps = <int, _StepBuffer>{};
      var sawStep = false;
      try {
        while (await _next(sse, sawStep, started, model)) {
          final json = sse.current.data == '[DONE]'
              ? null
              : jsonDecode(sse.current.data) as Map<String, Object?>;
          if (json == null) {
            break;
          }
          if (json['event_type'] == 'step.start') {
            sawStep = true;
          }
          final event = _eventOf(json, steps, model);
          if (event != null) {
            yield event;
          }
        }
      } finally {
        await sse.cancel();
      }
    } on http.RequestAbortedException {
      if (cancelled) {
        throw const InteractionCancelled();
      }
      throw GeminiUnavailable('Request aborted', model: model);
    } on http.ClientException catch (error) {
      throw GeminiUnavailable(error.message, model: model);
    } finally {
      if (!abort.isCompleted) {
        abort.complete();
      }
    }
  }

  Future<bool> _next(
    StreamIterator<SseEvent> sse,
    bool sawStep,
    Stopwatch started,
    String model,
  ) {
    if (sawStep) {
      return sse.moveNext();
    }
    final remaining = firstStepDeadline - started.elapsed;
    return sse.moveNext().timeout(
      remaining.isNegative ? Duration.zero : remaining,
      onTimeout: () => throw GeminiUnavailable(
        'No model step within ${firstStepDeadline.inSeconds} s',
        model: model,
      ),
    );
  }

  InteractionEvent? _eventOf(
    Map<String, Object?> json,
    Map<int, _StepBuffer> steps,
    String model,
  ) {
    switch (json) {
      case {
        'event_type': 'interaction.created',
        'interaction': {'id': final String id},
      }:
        return InteractionEvent.created(interactionId: id, model: model);
      case {
        'event_type': 'step.start',
        'index': final int index,
        'step': {
          'type': 'function_call',
          'id': final String callId,
          'name': final String name,
        },
      }:
        steps[index] = _StepBuffer(callId, name);
      case {
        'event_type': 'step.delta',
        'delta': {'type': 'text', 'text': final String text},
      }:
        return InteractionEvent.textDelta(text);
      case {
        'event_type': 'step.delta',
        'index': final int index,
        'delta': {'type': 'arguments_delta', 'arguments': final String part},
      }:
        steps[index]?.arguments.write(part);
      case {'event_type': 'step.stop', 'index': final int index}:
        final step = steps.remove(index);
        if (step != null) {
          final arguments = step.arguments.toString();
          return InteractionEvent.functionCall(
            callId: step.callId,
            name: step.name,
            arguments: arguments.isEmpty
                ? const {}
                : jsonDecode(arguments) as Map<String, Object?>,
          );
        }
      case {
        'event_type': 'interaction.completed',
        'interaction': {'id': final String id, 'status': final String status},
      }:
        final interaction = json['interaction']! as Map<String, Object?>;
        return InteractionEvent.completed(
          interactionId: id,
          status: status,
          usage: interaction['usage'] as Map<String, Object?>?,
        );
      case {'event_type': 'error', 'error': final Map<String, Object?> error}:
        throw geminiStreamError(error: error, model: model);
    }
    return null;
  }
}

final class _StepBuffer {
  _StepBuffer(this.callId, this.name);

  final String callId;
  final String name;
  final StringBuffer arguments = StringBuffer();
}
