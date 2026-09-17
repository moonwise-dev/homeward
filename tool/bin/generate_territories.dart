import 'dart:io';

import 'package:homeward_tool/territories/fetch_territories.dart';
import 'package:homeward_tool/territories/render_territories.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  if (arguments.length != 2) {
    stderr.writeln(
      'Usage: generate_territories <countries.dart> <subdivisions.dart>',
    );
    exitCode = 64;
    return;
  }
  final client = http.Client();
  try {
    final territories = await fetchTerritories(client);
    await File(
      arguments[0],
    ).writeAsString(renderNameTable('countryNames', territories.countries));
    await File(arguments[1]).writeAsString(
      renderNameTable('subdivisionNames', territories.subdivisions),
    );
    stdout.writeln(
      'Wrote ${territories.countries.length} countries and '
      '${territories.subdivisions.length} subdivisions from CLDR $cldrVersion',
    );
  } finally {
    client.close();
  }
}
