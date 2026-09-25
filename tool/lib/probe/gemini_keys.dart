import 'package:common/common.dart';
import 'package:homeward_server/development/gemini_key_names.dart';

final class GeminiKeys {
  GeminiKeys._(this._keys);

  static const names = developmentGeminiKeyNames;

  static GeminiKeys? fromEnvironment(Map<String, String> environment) {
    final keys = {
      for (final name in names)
        if (environment[name]?.trim() case final key? when key.isNotEmpty) key,
    }.toList();
    return keys.isEmpty ? null : GeminiKeys._(keys);
  }

  final List<String> _keys;
  var _current = 0;

  String get current => _keys[_current];

  bool moveOnAfter(String? errorCode) {
    if (errorCode != HomewardErrorCode.geminiQuotaExhausted.wireName ||
        _current == _keys.length - 1) {
      return false;
    }
    _current++;
    return true;
  }
}
