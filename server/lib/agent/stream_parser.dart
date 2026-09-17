import 'parsed_output.dart';

const _openingFence = '```a2ui';
const _closingFence = '```';

final class StreamParser {
  final _pending = StringBuffer();
  final _message = StringBuffer();
  var _insideBlock = false;
  var _lineIsProse = false;
  var _depth = 0;
  var _insideString = false;
  var _escaped = false;

  List<ParsedOutput> add(String delta) {
    final outputs = <ParsedOutput>[];
    final lines = '$_pending$delta'.split('\n');
    _pending.clear();
    for (final line in lines.take(lines.length - 1)) {
      _completeLine(line, outputs);
    }
    _holdPartialLine(lines.last, outputs);
    return outputs;
  }

  List<ParsedOutput> close() {
    final rest = _pending.toString();
    _pending.clear();
    if (_insideBlock) {
      final outputs = <ParsedOutput>[];
      final line = rest.trim();
      if (line.isNotEmpty && line != _closingFence) {
        _appendToMessage(line, outputs);
      }
      _endBlock(outputs);
      return outputs;
    }
    return [if (rest.isNotEmpty) ParsedOutput.prose(rest)];
  }

  void _completeLine(String line, List<ParsedOutput> outputs) {
    final trimmed = line.trim();
    if (_insideBlock) {
      if (trimmed == _closingFence) {
        _endBlock(outputs);
      } else if (trimmed.isNotEmpty) {
        _appendToMessage(trimmed, outputs);
      }
    } else if (!_lineIsProse && trimmed == _openingFence) {
      _insideBlock = true;
    } else {
      outputs.add(ParsedOutput.prose('$line\n'));
    }
    _lineIsProse = false;
  }

  void _holdPartialLine(String partial, List<ParsedOutput> outputs) {
    if (partial.isEmpty) {
      return;
    }
    if (_insideBlock ||
        (!_lineIsProse && _openingFence.startsWith(partial.trimLeft()))) {
      _pending.write(partial);
      return;
    }
    outputs.add(ParsedOutput.prose(partial));
    _lineIsProse = true;
  }

  void _appendToMessage(String line, List<ParsedOutput> outputs) {
    if (_message.isNotEmpty) {
      _message.write('\n');
    }
    _message.write(line);
    for (final character in line.split('')) {
      _track(character);
    }
    if (_depth <= 0 && !_insideString) {
      _emitMessage(outputs);
    }
  }

  void _track(String character) {
    if (_insideString) {
      if (_escaped) {
        _escaped = false;
      } else if (character == r'\') {
        _escaped = true;
      } else if (character == '"') {
        _insideString = false;
      }
      return;
    }
    switch (character) {
      case '"':
        _insideString = true;
      case '{' || '[':
        _depth++;
      case '}' || ']':
        _depth--;
    }
  }

  void _endBlock(List<ParsedOutput> outputs) {
    _emitMessage(outputs);
    _insideBlock = false;
  }

  void _emitMessage(List<ParsedOutput> outputs) {
    if (_message.isNotEmpty) {
      outputs.add(ParsedOutput.a2uiMessage(_message.toString()));
    }
    _message.clear();
    _depth = 0;
    _insideString = false;
    _escaped = false;
  }
}
