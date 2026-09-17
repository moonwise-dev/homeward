import 'dart:io';

String? probeGeminiKey(Map<String, String> environment) {
  final key = switch (environment['HOMEWARD_EVAL_GEMINI_KEY']) {
    final fromEnvironment? => fromEnvironment,
    null => switch (environment['HOME']) {
      final home? when File('$home/.config/homeward/gemini_key').existsSync() =>
        File('$home/.config/homeward/gemini_key').readAsStringSync(),
      _ => null,
    },
  }?.trim();
  return key == null || key.isEmpty ? null : key;
}
