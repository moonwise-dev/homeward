import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'gemini_exception.dart';

final class ModelCaps {
  ModelCaps({
    this.skipFor = const Duration(minutes: 1),
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final Duration skipFor;
  final DateTime Function() _now;
  final _capped = <String, ({DateTime until, GeminiQuotaExhausted refusal})>{};

  bool isCapped(String apiKey, String model) =>
      refusalOf(apiKey, model) != null;

  GeminiQuotaExhausted? refusalOf(String apiKey, String model) =>
      switch (_capped[_entry(apiKey, model)]) {
        (:final until, :final refusal) when _now().isBefore(until) => refusal,
        _ => null,
      };

  void cap(String apiKey, String model, GeminiQuotaExhausted refusal) {
    final now = _now();
    _capped
      ..removeWhere((_, capped) => !now.isBefore(capped.until))
      ..[_entry(apiKey, model)] = (until: now.add(skipFor), refusal: refusal);
  }

  static String _entry(String apiKey, String model) =>
      '${sha256.convert(utf8.encode(apiKey))}/$model';
}
