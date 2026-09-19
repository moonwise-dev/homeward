import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:homeward_tool/fonts/font_face.dart';
import 'package:test/test.dart';

void main() {
  test('every face the app draws with is vendored as the pinned file', () {
    for (final face in appFontFaces) {
      final file = File('../app/assets/fonts/${fontFileName(face)}');
      expect(
        file.existsSync(),
        isTrue,
        reason: '${fontFileName(face)} is missing: run make fonts',
      );
      final bytes = file.readAsBytesSync();
      expect(bytes.length, face.length, reason: fontFileName(face));
      expect(
        sha256.convert(bytes).toString(),
        face.hash,
        reason: fontFileName(face),
      );
    }
  });

  test('every family keeps its licence beside the faces', () {
    for (final family in appFontFamilies) {
      final file = File('../app/assets/fonts/${fontLicenseFileName(family)}');
      expect(file.existsSync(), isTrue, reason: fontLicenseFileName(family));
      expect(file.readAsStringSync(), contains('SIL OPEN FONT LICENSE'));
    }
  });
}
