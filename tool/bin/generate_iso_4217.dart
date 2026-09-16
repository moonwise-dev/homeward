import 'dart:io';

import 'package:homeward_tool/iso_4217/fetch_iso_4217.dart';
import 'package:homeward_tool/iso_4217/parse_iso_4217.dart';
import 'package:homeward_tool/iso_4217/render_iso_4217.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    stderr.writeln('Usage: generate_iso_4217 <output.dart>');
    exitCode = 64;
    return;
  }
  final client = http.Client();
  try {
    final table = parseIso4217(await fetchIso4217(client));
    await File(arguments.single).writeAsString(renderIso4217(table));
    stdout.writeln(
      'Wrote ${table.minorDigits.length} currencies published ${table.publishedOn}',
    );
  } finally {
    client.close();
  }
}
