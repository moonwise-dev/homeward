import 'dart:io';

import 'package:homeward_tool/catalog/catalog_outputs.dart';

void main(List<String> arguments) {
  final root = arguments.isEmpty ? '.' : arguments.single;
  for (final MapEntry(key: path, value: content) in catalogOutputs().entries) {
    File('$root/$path')
      ..parent.createSync(recursive: true)
      ..writeAsStringSync(content);
    stdout.writeln('Wrote $path');
  }
}
