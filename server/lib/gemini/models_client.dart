import 'dart:async';

import 'package:http/http.dart' as http;

import 'gemini_exception.dart';

final class ModelsClient {
  ModelsClient({
    required this.httpClient,
    required this.deadline,
    Uri? endpoint,
    DateTime Function()? now,
  }) : endpoint = endpoint ?? defaultEndpoint,
       _now = now ?? DateTime.now;

  static final defaultEndpoint = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/',
  );

  final http.Client httpClient;
  final Duration deadline;
  final Uri endpoint;
  final DateTime Function() _now;

  Future<void> ensureAvailable({
    required String apiKey,
    required String model,
  }) async {
    final abort = Completer<void>();
    final timer = Timer(deadline, abort.complete);
    final request = http.AbortableRequest(
      'GET',
      endpoint.resolve(model),
      abortTrigger: abort.future,
    )..headers['x-goog-api-key'] = apiKey;
    try {
      final response = await http.Response.fromStream(
        await httpClient.send(request),
      );
      if (response.statusCode != 200) {
        throw geminiHttpError(
          statusCode: response.statusCode,
          body: response.body,
          model: model,
          continuesHistory: false,
          now: _now(),
        );
      }
    } on http.RequestAbortedException {
      throw GeminiUnavailable(
        'No model lookup response within ${deadline.inSeconds} s',
        model: model,
      );
    } on http.ClientException catch (error) {
      throw GeminiUnavailable(error.message, model: model);
    } finally {
      timer.cancel();
    }
  }
}
