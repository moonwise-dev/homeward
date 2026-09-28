import 'dart:convert';

import 'package:crypto/crypto.dart';

final class ModelCaps {
  ModelCaps({
    this.skipFor = const Duration(minutes: 1),
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final Duration skipFor;
  final DateTime Function() _now;
  final _cappedUntil = <String, DateTime>{};

  bool isCapped(String apiKey, String model) => switch (_cappedUntil[_entry(
    apiKey,
    model,
  )]) {
    final until? => _now().isBefore(until),
    null => false,
  };

  void cap(String apiKey, String model) {
    final now = _now();
    _cappedUntil
      ..removeWhere((_, until) => !now.isBefore(until))
      ..[_entry(apiKey, model)] = now.add(skipFor);
  }

  static String _entry(String apiKey, String model) =>
      '${sha256.convert(utf8.encode(apiKey))}/$model';
}
