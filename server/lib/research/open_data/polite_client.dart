import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'open_data_unavailable.dart';
import 'research_cache.dart';

final class PoliteClient {
  PoliteClient(
    this._client, {
    required this.userAgent,
    this.cacheFor = const Duration(hours: 6),
    this.timeout = const Duration(seconds: 25),
    this.maxEntries = 2000,
    this.failFor = const Duration(minutes: 1),
    this.store = const NoResearchCache(),
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final http.Client _client;
  final String userAgent;
  final Duration cacheFor;
  final Duration timeout;
  final int maxEntries;
  final Duration failFor;
  final ResearchCache store;
  final DateTime Function() _now;
  final _failures = <String, (DateTime, OpenDataUnavailable)>{};
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
    if (_failures[key] case (final until, final failure)
        when until.isAfter(_now())) {
      throw failure;
    }
    if (await store.read(key) case final stored?) {
      _remember(key, stored);
      return stored;
    }
    try {
      final value = await _fetch(uri, gap, send);
      _remember(key, value);
      if (value != null) {
        unawaited(store.write(key, value));
      }
      return value;
    } on OpenDataUnavailable catch (failure) {
      if (!failure.isBusy) {
        _failures[key] = (_now().add(failFor), failure);
      }
      rethrow;
    }
  }

  Future<Object?> _fetch(
    Uri uri,
    Duration gap,
    Future<http.Response> Function() send,
  ) async {
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
    try {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } on FormatException {
      throw OpenDataUnavailable(uri.host, 'not JSON');
    }
  }

  void _remember(String key, Object? value) {
    _cache
      ..remove(key)
      ..[key] = (_now().add(cacheFor), value);
    while (_cache.length > maxEntries) {
      _cache.remove(_cache.keys.first);
    }
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
