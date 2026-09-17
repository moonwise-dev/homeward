import 'fetch_territories.dart';

String renderNameTable(String constant, Map<String, String> names) {
  final buffer = StringBuffer()
    ..writeln("const cldrVersion = '$cldrVersion';")
    ..writeln()
    ..writeln('const $constant = <String, String>{');
  for (final key in names.keys.toList()..sort()) {
    buffer.writeln('  ${_dartString(key)}: ${_dartString(names[key]!)},');
  }
  buffer.writeln('};');
  return buffer.toString();
}

String _dartString(String value) =>
    "'${value.replaceAll(r'\', r'\\').replaceAll("'", r"\'").replaceAll(r'$', r'\$')}'";
