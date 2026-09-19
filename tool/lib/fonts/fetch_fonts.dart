import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'font_face.dart';

Future<Uint8List> fetchFont(http.Client client, FontFace face) async {
  final uri = fontUri(face);
  final bytes = (await _get(client, uri)).bodyBytes;
  if (bytes.length != face.length ||
      sha256.convert(bytes).toString() != face.hash) {
    throw http.ClientException(
      '${fontFileName(face)} did not match the pinned length and checksum',
      uri,
    );
  }
  return bytes;
}

Future<String> fetchFontLicense(http.Client client, String family) async =>
    (await _get(client, fontLicenseUri(family))).body;

Future<http.Response> _get(http.Client client, Uri uri) async {
  final response = await client.get(uri);
  if (response.statusCode != 200) {
    throw http.ClientException('$uri returned ${response.statusCode}', uri);
  }
  return response;
}
