import 'parsed_output.dart';

const _openingFence = '```a2ui';
const _closingFence = '```';

final class StreamParser {
  final _pending = StringBuffer();
  var _insideBlock = false;
  var _lineIsProse = false;

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
      _insideBlock = false;
      final line = rest.trim();
      return [
        if (line.isNotEmpty && line != _closingFence)
          ParsedOutput.a2uiLine(line),
      ];
    }
    return [if (rest.isNotEmpty) ParsedOutput.prose(rest)];
  }

  void _completeLine(String line, List<ParsedOutput> outputs) {
    final trimmed = line.trim();
    if (_insideBlock) {
      if (trimmed == _closingFence) {
        _insideBlock = false;
      } else if (trimmed.isNotEmpty) {
        outputs.add(ParsedOutput.a2uiLine(trimmed));
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
}
