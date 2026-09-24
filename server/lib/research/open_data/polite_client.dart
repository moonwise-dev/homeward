import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'open_data_unavailable.dart';

final class PoliteClient {
  PoliteClient(
    this._client, {
    required this.userAgent,
    this.cacheFor = const Duration(hours: 6),
    this.timeout = const Duration(seconds: 25),
    this.maxEntries = 2000,
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final http.Client _client;
  final String userAgent;
  final Duration cacheFor;
  final Duration timeout;
  final int maxEntries;
  final DateTime Function() _now;
  final _queues = <String, Future<void>>{};
  final _cache = <String, (DateTime, Object?)>{};

  Future<Object?> getJson(Uri uri, {Duration gap = Duration.zero}) =>
      _cached('GET $uri', uri, gap, () => _client.get(uri, headers: _headers));

  Future<Object?> postFormJson(
    Uri uri,
    Map<String, String> body, {
    Duration gap = Duration.zero,
  }) => _cached(
    'POST $uri ${jsonEncode(body)}',
    uri,
    gap,
    () => _client.post(uri, headers: _headers, body: body),
  );

  Map<String, String> get _headers => {
    'user-agent': userAgent,
    'accept': 'application/json',
  };

  Future<Object?> _cached(
    String key,
    Uri uri,
    Duration gap,
    Future<http.Response> Function() send,
  ) async {
    if (_cache[key] case (final expires, final value)
        when expires.isAfter(_now())) {
      return value;
    }
    final response = await _serial(
      uri.host,
      gap,
      () => send().timeout(timeout),
    );
    if (response.statusCode != 200) {
      throw OpenDataUnavailable(
        uri.host,
        'HTTP ${response.statusCode}',
        status: response.statusCode,
      );
    }
    final Object? value;
    try {
      value = jsonDecode(utf8.decode(response.bodyBytes));
    } on FormatException {
      throw OpenDataUnavailable(uri.host, 'not JSON');
    }
    _cache
      ..remove(key)
      ..[key] = (_now().add(cacheFor), value);
    while (_cache.length > maxEntries) {
      _cache.remove(_cache.keys.first);
    }
    return value;
  }

  Future<T> _serial<T>(
    String host,
    Duration gap,
    Future<T> Function() run,
  ) async {
    final previous = _queues[host] ?? Future<void>.value();
    final done = Completer<void>();
    _queues[host] = done.future;
    await previous;
    try {
      return await run();
    } on TimeoutException {
      throw OpenDataUnavailable(host, 'timed out');
    } on http.ClientException catch (error) {
      throw OpenDataUnavailable(host, error.message);
    } finally {
      unawaited(Future<void>.delayed(gap).then((_) => done.complete()));
    }
  }
}
