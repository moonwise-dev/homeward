final _assignment = RegExp(r'^([A-Za-z_][A-Za-z0-9_]*)=(.*)$');

Map<String, String> parseDotenv(String source) => {
  for (final line in source.split('\n'))
    if (_assignment.firstMatch(line.trim()) case final match?)
      match.group(1)!: _unquoted(match.group(2)!.trim()),
};

String _unquoted(String value) {
  final quoted =
      value.length >= 2 &&
      (value.startsWith('"') || value.startsWith("'")) &&
      value.endsWith(value[0]);
  return quoted ? value.substring(1, value.length - 1) : value;
}
