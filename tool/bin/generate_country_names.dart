import 'dart:io';

import 'package:homeward_tool/territories/fetch_country_names.dart';
import 'package:homeward_tool/territories/render_name_table.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    stderr.writeln('Usage: generate_country_names <country_names.dart>');
    exitCode = 64;
    return;
  }
  final client = http.Client();
  try {
    final names = await fetchCountryNames(client);
    await File(
      arguments.single,
    ).writeAsString(renderNameTable('countryNames', names));
    stdout.writeln('Wrote ${names.length} countries from CLDR $cldrVersion');
  } finally {
    client.close();
  }
}
