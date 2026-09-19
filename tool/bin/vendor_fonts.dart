import 'dart:io';

import 'package:homeward_tool/fonts/fetch_fonts.dart';
import 'package:homeward_tool/fonts/font_face.dart';
import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1) {
    stderr.writeln('Usage: vendor_fonts <output directory>');
    exitCode = 64;
    return;
  }
  final directory = await Directory(arguments.single).create(recursive: true);
  final client = http.Client();
  try {
    for (final face in appFontFaces) {
      await File(
        '${directory.path}/${fontFileName(face)}',
      ).writeAsBytes(await fetchFont(client, face));
    }
    for (final family in appFontFamilies) {
      await File(
        '${directory.path}/${fontLicenseFileName(family)}',
      ).writeAsString(await fetchFontLicense(client, family));
    }
    stdout.writeln(
      'Wrote ${appFontFaces.length} faces and '
      '${appFontFamilies.length} licenses to ${directory.path}',
    );
  } finally {
    client.close();
  }
}
