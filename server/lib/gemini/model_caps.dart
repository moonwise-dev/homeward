import 'dart:convert';

import 'package:crypto/crypto.dart';

final class ModelCaps {
  ModelCaps({DateTime Function()? now}) : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final _cappedUntil = <String, DateTime>{};

  List<String> uncapped(String apiKey, List<String> models) {
    final now = _now();
    _cappedUntil.removeWhere((_, until) => !now.isBefore(until));
    final uncapped = [
      for (final model in models)
        if (!_cappedUntil.containsKey(_entry(apiKey, model))) model,
    ];
    return uncapped.isEmpty ? models : uncapped;
  }

  void cap(String apiKey, String model, {required DateTime until}) =>
      _cappedUntil[_entry(apiKey, model)] = until;

  static String _entry(String apiKey, String model) =>
      '${sha256.convert(utf8.encode(apiKey))}/$model';
}
