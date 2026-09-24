import 'dart:convert';

import 'output_parser.dart';
import 'parsed_output.dart';

final class JsonReplyParser implements OutputParser {
  final _reply = StringBuffer();

  @override
  List<ParsedOutput> add(String delta) {
    _reply.write(delta);
    return const [];
  }

  @override
  List<ParsedOutput> close() {
    final source = _reply.toString();
    return switch (_decoded(source)) {
      {'messages': final List<Object?> messages} => [
        for (final message in messages)
          ParsedOutput.a2uiMessage(jsonEncode(message)),
      ],
      _ => [ParsedOutput.a2uiMessage(source)],
    };
  }

  Object? _decoded(String source) {
    try {
      return jsonDecode(source);
    } on FormatException {
      return null;
    }
  }
}
