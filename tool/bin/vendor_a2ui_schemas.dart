import 'dart:io';

import 'package:homeward_tool/a2ui_schemas/fetch_a2ui_schemas.dart';
import 'package:homeward_tool/a2ui_schemas/render_a2ui_schemas.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    stderr.writeln('Usage: vendor_a2ui_schemas <output.dart>');
    exitCode = 64;
    return;
  }
  final client = http.Client();
  try {
    final contents = await fetchA2uiSchemas(client);
    await File(arguments.single).writeAsString(renderA2uiSchemas(contents));
    stdout.writeln(
      'Wrote ${contents.length} A2UI v0.9 schemas at $a2uiSpecCommit',
    );
  } finally {
    client.close();
  }
}
