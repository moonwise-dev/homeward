import 'dart:convert';

const _maxRepairs = 6;

Object? repairedJson(String source) {
  var text = source;
  for (var attempt = 0; attempt < _maxRepairs; attempt++) {
    try {
      return jsonDecode(text);
    } on FormatException catch (error) {
      final repaired = _repairAt(text, error.offset);
      if (repaired == null) {
        return null;
      }
      text = repaired;
    }
  }
  return null;
}

String? _repairAt(String text, int? offset) {
  if (offset == null || offset <= 0 || offset > text.length) {
    return null;
  }
  if (offset == text.length) {
    return switch (_unclosed(text)) {
      final closers? when closers.isNotEmpty => text + closers,
      _ => null,
    };
  }
  final at = text[offset];
  final before = text.substring(0, offset).trimRight();
  if ((at == ',' || at == '}' || at == ']') &&
      (before.endsWith('}') || before.endsWith(']'))) {
    return before.substring(0, before.length - 1) + text.substring(offset);
  }
  if ((at == '}' || at == ']') && before.endsWith(',')) {
    return before.substring(0, before.length - 1) + text.substring(offset);
  }
  if (at == "'") {
    final close = text.indexOf(RegExp(r"'\s*[,}\]:]"), offset + 1);
    if (close == -1) {
      return null;
    }
    return text.substring(0, offset) +
        jsonEncode(text.substring(offset + 1, close)) +
        text.substring(close + 1);
  }
  if (at.isNotEmpty && !_tokenStart.hasMatch(at)) {
    return text.substring(0, offset) + text.substring(offset + 1);
  }
  return null;
}

final _tokenStart = RegExp(r'[\s{}\[\],:"\-0-9tfn]');

String? _unclosed(String text) {
  final closers = <String>[];
  var inString = false;
  var escaped = false;
  for (final char in text.split('')) {
    if (inString) {
      if (escaped) {
        escaped = false;
      } else if (char == '\\') {
        escaped = true;
      } else if (char == '"') {
        inString = false;
      }
    } else if (char == '"') {
      inString = true;
    } else if (char == '{' || char == '[') {
      closers.add(char == '{' ? '}' : ']');
    } else if ((char == '}' || char == ']') && closers.isNotEmpty) {
      closers.removeLast();
    }
  }
  return inString ? null : closers.reversed.join();
}
