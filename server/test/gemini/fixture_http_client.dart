import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

typedef FixtureResponse = ({int status, String body, bool keepOpen});

FixtureResponse fixture(
  String name, {
  int status = 200,
  bool keepOpen = false,
}) => (
  status: status,
  body: File('test/fixtures/interactions/$name').readAsStringSync(),
  keepOpen: keepOpen,
);

FixtureResponse sse(String body) => (status: 200, body: body, keepOpen: false);

final class RecordedRequest {
  RecordedRequest(this.request, this.body);

  final http.BaseRequest request;
  final Map<String, Object?> body;
}

http.Client fixtureClient(
  FixtureResponse? Function(Map<String, Object?> body) respond, {
  List<RecordedRequest>? recorded,
}) => MockClient.streaming((request, bodyStream) async {
  final body =
      jsonDecode(await bodyStream.bytesToString()) as Map<String, Object?>;
  recorded?.add(RecordedRequest(request, body));
  final response = respond(body);
  if (response == null) {
    return Completer<http.StreamedResponse>().future;
  }
  final controller = StreamController<List<int>>()
    ..add(utf8.encode(response.body));
  if (!response.keepOpen) {
    unawaited(controller.close());
  }
  return http.StreamedResponse(controller.stream, response.status);
});
