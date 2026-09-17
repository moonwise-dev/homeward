import 'dart:convert';

import 'fetch_a2ui_schemas.dart';

String renderA2uiSchemas(Map<A2uiSchemaFile, String> contents) {
  final buffer = StringBuffer()
    ..writeln("const a2uiSpecCommit = '$a2uiSpecCommit';");
  for (final MapEntry(key: file, value: json) in contents.entries) {
    final canonical = const JsonEncoder.withIndent('  ')
        .convert(jsonDecode(json));
    if (canonical.contains("'''")) {
      throw FormatException(
        'Schema contains a raw string delimiter',
        file.path,
      );
    }
    buffer
      ..writeln()
      ..writeln("const ${file.constant} = r'''")
      ..writeln(canonical)
      ..writeln("''';");
  }
  return buffer.toString();
}
